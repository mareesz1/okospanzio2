import {defineStore} from "pinia";
import Axios from '../services/dataservice';

export const useUsersStore = defineStore('usersStore', {
    state: () => ({
        users: [],
        user: {
            firstName: null,
            lastName: null,
            gender: null,
            email: null,
            phone: null,
            passwordHash: null
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
            auth: false,
            loginTime: null,
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
        
        postNewRegistration(user) {
            this.errors = {
                firstName: null,
                lastName: null,
                gender: null,
                email: null,
                phone: null,
                passwordHash: null,
                status: null,
            };
            Axios.post('/user', {
                firstName: user.firstName,
                lastName: user.lastName,
                gender: user.gender,
                email: user.email,
                phone: user.phone,
                passwordHash: user.passwordHash
              })
              .then(function (response) {
                console.log(response);
                // console.log(user);
              })
              .catch(function (error) {
                console.log(error);
              });
        },
        authenticate(email, password) {
            
        },
    }
});