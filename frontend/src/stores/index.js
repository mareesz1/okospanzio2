import {defineStore} from "pinia";
import {api, cookie} from '../services/dataservice'; // ket axios instance
import {sha512} from 'js-sha512';
import router from '../router';
import axios from "axios";

export const useUsersStore = defineStore('usersStore', {
    state: () => ({
        users: [],
        rooms: [],
        user: {
            firstName: null,
            lastName: null,
            gender: 'male',
            email: null,
            phone: null,
            password: null,
            passwordHash: null,
            roles: 'guest',
            code: null,
            registrationSuccessful: false,
        },
        errors: {
            firstName: null,
            lastName: null,
            gender: null,
            email: null,
            phone: null,
            passwordHash: null,
            status: null,
            code: null,
        },
        isLoggedIn: {
            email: null,
            auth: null,
            loginTime: null,
            roles: null,
            message: null,
        },
    }),
    getters: {},
    actions: {
        getAllUsers() {
            this.errors = {
                firstName: null,
                lastName: null,
                gender: null,
                email: null,
                phone: null,
                passwordHash: null,
                status: null,
            };
            api.get('/user')
            .then((resp) => {
                this.users = resp.data;
            })
            .catch((err) => {
                console.log(err);
            })
        },
        getAllRooms() {
            api.get('/room')
            .then((resp) => {
                this.rooms = resp.data;
            })
            .catch((err) => {
                console.log(err);
            })
        },
        postNewRegistration(pwHash) {
            if (this.user.roles == 'guest') {
                this.user.code = null;
            }
            this.user.passwordHash = pwHash;
            return api.post('/user', this.user)
              .then((response) => {
                if (response.status == 201) {
                    this.user.registrationSuccessful = true;
                    this.errors = {
                        firstName: null,
                        lastName: null,
                        gender: null,
                        email: null,
                        phone: null,
                        passwordHash: null,
                        status: null,
                        code: null,
                    };
                    return console.log(response);
                }
                this.user.registrationSuccessful = false;
                return console.log(response);
              })
              .catch((err) => {
                this.user.registrationSuccessful = false;
                console.log(err);
                this.errors = {
                    firstName: err.response.data.firstName ||null,
                    lastName: err.response.data.lastName || null,
                    gender: err.response.data.gender || null,
                    email: err.response.data.email || null,
                    phone: err.response.data.phone || null,
                    passwordHash: err.response.data.passwordHash || null,
                    status: err.response.status || null,
                    code: err.response.data.code || null,
                }
                return Promise.reject(err);
              });
        },
        authenticate() {
            if (!$cookies.get('XSRF-TOKEN')) {
                console.log('nincs xsrf cookie');
                this.getCsrfCookie();
            }
                api.post('/login', this.user, {
                    'Content-type': 'application/json',
                    // 'Authorization': $cookies.get('token')
                })
                .then((resp) => {
                    if (resp.data.success) {
                        this.isLoggedIn = {
                            email: this.user.email,
                            auth: true,
                            loginTime: Date.now(),
                            roles: this.user.roles,
                            message: null,
                        };
                        if (resp.data.token) {
                            $cookies.set('token', resp.data.token, '7d');
                            console.log($cookies.get('token'));
                        }
                        sessionStorage.setItem('isLoggedIn', JSON.stringify(this.isLoggedIn));
                        console.log(resp.data.message);

                    if (resp.status == 419) {
                        $cookies.remove('XSRF-TOKEN');
                    }


                //         //OLD VERSION
                // const loginData = JSON.parse(localStorage.getItem("login"));
                // console.log(resp);
                // if (resp.data.message == "Email not found") {
                //     // Email not found
                //     this.isLoggedIn.auth = false;
                //     this.isLoggedIn.email = this.user.email;
                //     this.isLoggedIn.loginTime = null;
                //     this.isLoggedIn.message = resp.data.message;
                //     // localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
                // }
                // else if (resp.data.auth || loginData.auth) {
                //     // belép
                //     this.isLoggedIn.email = resp.data.email;
                //     this.isLoggedIn.auth = true;
                //     this.isLoggedIn.loginTime = resp.data.loginTime;
                //     this.isLoggedIn.roles = resp.data.roles;
                //     this.isLoggedIn.message = null;
                //     localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
                //     // console.log(JSON.parse(localStorage.getItem("login")));
                // } else {
                //     // nem lép be
                //     this.isLoggedIn.auth = false;
                //     this.isLoggedIn.email = this.user.email;
                //     this.isLoggedIn.loginTime = null;
                //     this.isLoggedIn.message = null;
                //     localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
                // }
                //          // END OF OLD VERSION


                    }
                }).catch((err) => {
                    console.log(err);
                })

                
        },
        getCsrfCookie() {
            cookie.get('/sanctum/csrf-cookie').then().catch((err) => {console.log(err);});
        },
        logout() {
            this.isLoggedIn.email = null;
            this.isLoggedIn.auth = null;
            this.isLoggedIn.loginTime = null;
            this.isLoggedIn.roles = null;
            this.isLoggedIn.message = null;
            localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
            router.go();

        },
        deleteUser(id) {
            return api.delete(`/user/${id}`, id)
            .then((resp) => {
                return console.log(resp);
            })
            .catch((err) => {
                return console.log(err);
            })
        },
        deleteRoom(id) {
            return api.delete(`/room/${id}`, id)
            .then((resp) => {
                return console.log(resp);
            })
            .catch((err) => {
                return console.log(err);
            })
        },
        isAuthenticated() {
            try {
                const isLoggedIn = JSON.parse(sessionStorage.getItem('isLoggedIn'));
                if (isLoggedIn.auth == true) {
                    api.get('/login/get').then((resp) => {
                        // console.log(resp.data.user);
                        let user = resp.data.user;
                        if (isLoggedIn.email == user.email && isLoggedIn.roles == user.roles) {
                            // console.log('siker');
                            this.isLoggedIn = isLoggedIn;
                        }
                    }).catch((err) => {console.log(err);})
                }
            } catch (err) {
                this.isLoggedIn.message = 'unauthenticated';
                this.isLoggedIn.auth = false;
            }
        },
        testSanctum() {
            api.get('/login/get').then((resp) => {
                return resp.data;
            }).catch((err) => {console.log(err);})
        },
    }
});

export const useRestaurantStore = defineStore('restaurantStore', {
    state: () => ({
        orders: [],
        errors: {
            orderState: null,
        },
        windowLocation: null,
    }),
    getters: {},
    actions: {
        getAllOrders() {
            api.get('/orders/all')
            .then((resp) => {
                this.orders = resp.data;
            })
            .catch((err) => {
                console.log(err);
            })
        },
        setOrderStatus(orderId, status) {
            this.errors.orderState = null;
            console.log(orderId + ' ' + status);
            api.post(`/orders/state/${orderId}`, {status: status})
            .then((resp) => {
                // console.log(resp);
                if (resp.data.message) {
                    return this.errors.orderState = resp.data.message;
                }
                this.getAllOrders();
            })
            .catch((err) => {
                console.log(err);
            })
            
        },      
    }
})