import {defineStore} from "pinia";
import Axios from '../services/dataservice';
import {sha512} from 'js-sha512';

export const useUsersStore = defineStore('usersStore', {
    state: () => ({
        users: [],
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
            Axios.get('/user')
            .then((resp) => {
                this.users = resp.data;
            })
            .catch((err) => {
                console.log(err);
            })
        },
        postNewRegistration(pwHash) {
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
                this.registrationSuccessful = true;
                return console.log(response);
              })
              .catch((err) => {
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
            Axios.post('/login', {
                email: this.user.email,
                passwordHash: this.user.passwordHash,
            })
            .then((resp) => {
                console.log(resp);
                // if (resp.data == '') {
                //     this.isLoggedIn.auth = false;
                //     this.isLoggedIn.email = email;
                //     this.isLoggedIn.LoginTime = null;
                //     console.log(`${this.isLoggedIn.email} login failed`);
                // }
                if (resp.data.message == "Email not found") {
                    this.isLoggedIn.auth = false;
                    this.isLoggedIn.email = this.user.email;
                    this.isLoggedIn.LoginTime = null;
                    this.isLoggedIn.message = resp.data.message;
                }
                else if (resp.data.auth) {
                    this.isLoggedIn.email = resp.data.auth;
                    this.isLoggedIn.auth = true;
                    this.isLoggedIn.loginTime = resp.data.loginTime;
                    this.isLoggedIn.roles = resp.data.roles;
                    this.isLoggedIn.message = null;
                } else {
                    this.isLoggedIn.auth = false;
                    this.isLoggedIn.email = this.user.email;
                    this.isLoggedIn.LoginTime = null;
                    this.isLoggedIn.message = null;
                }
            })
            .catch()
        },
        logout() {
            this.isLoggedIn.email = null;
            this.isLoggedIn.auth = null;
            this.isLoggedIn.loginTime = null;
            this.isLoggedIn.roles = null;
            this.isLoggedIn.message = null;
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
    }
});