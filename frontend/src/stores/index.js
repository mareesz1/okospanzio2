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
            passwordHash: null,
            roles: 'guest',
            code: null,
        },
        errors: {
            firstName: null,
            lastName: null,
            gender: null,
            email: null,
            phone: null,
            passwordHash: null,
            status: null,
        },
        isLoggedIn: {
            email: null,
            passwordHash: null,
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
        
        postNewRegistration(user, pwHash) {
            this.user.passwordHash = pwHash;
            this.errors = {
                firstName: null,
                lastName: null,
                gender: null,
                email: null,
                phone: null,
                passwordHash: null,
                status: null,
            };
            Axios.post('/user', 
            this.user
            // {firstName: user.firstName,
            //     lastName: user.lastName,
            //     gender: user.gender,
            //     email: user.email,
            //     phone: user.phone,
            //     passwordHash: user.passwordHash,
            //     roles: user.roles,}
                )
              .then(function (response) {
                console.log(user);
                console.log(response);
                // console.log(user);
              })
              .catch(function (error) {
                console.log(error);
              });
        },
        authenticate(email, password) {
            let passwordHash = sha512(password);
            Axios.post('/login', {
                email: email,
                passwordHash: passwordHash,
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
                    this.isLoggedIn.email = email;
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
                    this.isLoggedIn.email = email;
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
    }
});