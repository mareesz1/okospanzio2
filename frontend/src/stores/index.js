import {defineStore} from "pinia";
import {api, cookie} from '../services/dataservice';
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
            auth: false,
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
            Axios.get('/user')
            .then((resp) => {
                this.users = resp.data;
            })
            .catch((err) => {
                console.log(err);
            })
        },
        getAllRooms() {
            Axios.get('/room')
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
            // this.errors = {
            //     firstName: null,
            //     lastName: null,
            //     gender: null,
            //     email: null,
            //     phone: null,
            //     passwordHash: null,
            //     status: null,
            // };
            return Axios.post('/user', this.user)
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
            this.user.passwordHash = sha512(this.user.password);
            cookie.get('/sanctum/csrf-cookie')
            .then(
                console.log("valami visszajott")
            )
            api.post('/login', {
                email: this.user.email,
                password: this.user.passwordHash,
            })
            .then((resp) => {
                console.log(resp);
            }).catch((err) => console.log(err))
                // const loginData = JSON.parse(localStorage.getItem("login"));
                // console.log(resp);
            //     if (resp.data.message == "Email not found") {
            //         // Email not found
            //         this.isLoggedIn.auth = false;
            //         this.isLoggedIn.email = this.user.email;
            //         this.isLoggedIn.loginTime = null;
            //         this.isLoggedIn.message = resp.data.message;
            //         // localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
            //     }
            //     else if (resp.data.auth || loginData.auth) {
            //         // belép
            //         this.isLoggedIn.email = resp.data.email;
            //         this.isLoggedIn.auth = true;
            //         this.isLoggedIn.loginTime = resp.data.loginTime;
            //         this.isLoggedIn.roles = resp.data.roles;
            //         this.isLoggedIn.message = null;
            //         localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
            //         // console.log(JSON.parse(localStorage.getItem("login")));
            //     } else {
            //         // nem lép be
            //         this.isLoggedIn.auth = false;
            //         this.isLoggedIn.email = this.user.email;
            //         this.isLoggedIn.loginTime = null;
            //         this.isLoggedIn.message = null;
            //         localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
            //     }
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
            return Axios.delete(`/user/${id}`, id)
            .then((resp) => {
                return console.log(resp);
            })
            .catch((err) => {
                return console.log(err);
            })
        },
        deleteRoom(id) {
            return Axios.delete(`/room/${id}`, id)
            .then((resp) => {
                return console.log(resp);
            })
            .catch((err) => {
                return console.log(err);
            })
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
            Axios.get('/orders/all')
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
            Axios.post(`/orders/state/${orderId}`, {status: status})
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