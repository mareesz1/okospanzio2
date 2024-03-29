import { defineStore } from "pinia";
import { api, cookie } from '../services/dataservice';
import router from '../router';

export const useUsersStore = defineStore('usersStore', {
    state: () => ({
        users: [],
        rooms: [],
        FreeRooms: [],
        FreeRoomId: [],
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
            remember: false,
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
            istrue: false,
        },
        services: [],
        reservation: {
            roomId: 0,
            start: '',
            end: '',
            beds: 2,
            type: 'normal',
            services: [],
            mainUserId: '',
            users:1,
        },
        reserved: {
            roomId: 0,
            start: '',
            end: '',
            mainUserId: '',
            users:1,
            balance: 500,
        }
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
                this.user.code = 0;
            }
            this.user.password = pwHash;
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
                        firstName: err.response.data.firstName || null,
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
                console.log('nincs csrf cookie');
                this.getCsrfCookie();
            }
            if (this.user.roles == 'guest') {
                this.user.code = 0;
            }
            api.post('/login', this.user, {
                'Content-type': 'application/json',
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
                        router.push({ path: '/', replace: true });
                        console.log(resp.data.message);
                    }
                }).catch((err) => {
                    console.log(err);
                })


        },
        getCsrfCookie() {
            cookie.get('/sanctum/csrf-cookie').then((resp) => { console.log("got cookie"); }).catch((err) => { console.log(err); });
        },
        logout() {
            api.delete('/login').then((resp) => {
                this.isLoggedIn = {
                    email: null,
                    auth: null,
                    loginTime: null,
                    roles: null,
                    message: 'logged out',
                };
                sessionStorage.setItem("isLoggedIn", JSON.stringify(this.isLoggedIn));
                router.push({ path: '/', replace: true });
                $cookies.remove('XSRF-TOKEN');
            }).catch((err) => { console.log(err) })
        },
        deleteUser(id) {
            return api.delete(`/user/${id}`, id)
                .then((resp) => {
                    return
                })
                .catch((err) => {
                    return console.log(err);
                })
        },
        deleteRoom(id) {
            return api.delete(`/room/${id}`, id)
                .then((resp) => {
                    return
                })
                .catch((err) => {
                    return console.log(err);
                })
        },
        isAuthenticated() {
            if (!$cookies.get('XSRF-TOKEN')) {
                console.log('nincs csrf cookie');
                this.getCsrfCookie();
            }
            try {
                const isLoggedIn = JSON.parse(sessionStorage.getItem('isLoggedIn'));
                if (isLoggedIn.auth == true) {
                    api.get('/login/get').then((resp) => {
                        let user = resp.data.user;
                        if (resp.data) {
                            if (isLoggedIn.email == user.email && isLoggedIn.roles == user.roles) {
                                this.isLoggedIn = isLoggedIn;
                            }
                        } else {
                            this.isLoggedIn.message = 'unauthenticated';
                            this.isLoggedIn.auth = false;
                            sessionStorage.setItem('isLoggedIn', JSON.stringify(this.isLoggedIn));
                        }
                    }).catch((err) => { console.log(err); })
                }
            } catch (err) {
                this.isLoggedIn.message = 'unauthenticated';
                this.isLoggedIn.auth = false;
                sessionStorage.setItem('isLoggedIn', JSON.stringify(this.isLoggedIn));
            }
        },
        reserveFromRoomCard(r) {
            this.reservation.roomId = r.id
            this.reservation.type = r.type
            this.reservation.beds = r.beds
            router.push('/reserve')
        },
        reserve() {
            console.log(this.FreeRoomId)
            this.FreeRooms = [];
            api.post('/notOccupied', this.reservation)
                .then((resp) => {
                    let index = 0;
                    resp.data.forEach(id => {
                        this.FreeRoomId[index] = id.roomId;
                        index++;
                    })
                    for (let index = 0; index < this.FreeRoomId.length; index++) {

                        api.get(`/roomId/${this.FreeRoomId[index]}`).then((resp) => {
                            console.log(resp.data);
                            this.FreeRooms[index] = resp.data;
                        }).catch((err) => {
                            console.log(err);
                        })
                        
                    }
                    this.FreeRooms = [];
                })
                .catch((err) => {
                    console.log(err);
                })
        },
        ReserveRoom(r) {
            const isLoggedIn = JSON.parse(sessionStorage.getItem('isLoggedIn'));
            api.get('/login/get').then((resp) => {
                if (this.isLoggedIn = isLoggedIn)
                {
                    let user = resp.data
                    this.reserved.start = this.reservation.start
                    this.reserved.end = this.reservation.end
                    this.reserved.roomId = r[0].id
                    this.reserved.mainUserId = user.user.id
                    this.reserved.users= 1
                    api.post('/postNewReservation',this.reserved)
                    // console.log(this.reserved);
                }
                else{
                    router.push('/login')
                }
            })
        },
        getAllServices() {
            api.get('/services').then((resp) => {
                this.services = resp.data
            }).catch((err) => {
                console.log(err);
            })
        }
    }
});

export const useRestaurantStore = defineStore('restaurantStore', {
    state: () => ({
        orders: [],
        tables: [],
        menus: [],
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
            api.post(`/orders/state/${orderId}`, { status: status })
                .then((resp) => {
                    if (resp.data.message) {
                        return this.errors.orderState = resp.data.message;
                    }
                    this.getAllOrders();
                })
                .catch((err) => {
                    console.log(err);
                })

        },
        getAllTables() {
            api.get('/tables')
                .then((resp) => {
                    this.tables = resp.data;
                })
                .catch((err) => {
                    console.log(err);
                })
        },
        getAllMenus() {
            api.get('/menu')
                .then((resp) => {
                    this.menus = resp.data;
                    return resp.data;
                })
                .catch((err) => {
                    console.log(err);
                })
        },

    }
})