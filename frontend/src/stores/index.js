import {defineStore} from "pinia";
import Axios from '../services/dataservice';
import {sha512} from 'js-sha512';
import router from '../router';

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
                const loginData = JSON.parse(localStorage.getItem("login"));
                // console.log(resp);
                if (resp.data.message == "Email not found") {
                    // Email not found
                    this.isLoggedIn.auth = false;
                    this.isLoggedIn.email = this.user.email;
                    this.isLoggedIn.loginTime = null;
                    this.isLoggedIn.message = resp.data.message;
                    // localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
                }
                else if (resp.data.auth || loginData.auth) {
                    // belép
                    this.isLoggedIn.email = resp.data.email;
                    this.isLoggedIn.auth = true;
                    this.isLoggedIn.loginTime = resp.data.loginTime;
                    this.isLoggedIn.roles = resp.data.roles;
                    this.isLoggedIn.message = null;
                    localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
                    // console.log(JSON.parse(localStorage.getItem("login")));
                } else {
                    // nem lép be
                    this.isLoggedIn.auth = false;
                    this.isLoggedIn.email = this.user.email;
                    this.isLoggedIn.loginTime = null;
                    this.isLoggedIn.message = null;
                    localStorage.setItem("login", JSON.stringify(this.isLoggedIn));
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
    }
});