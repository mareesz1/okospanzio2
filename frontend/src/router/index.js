import { createRouter, createWebHistory } from 'vue-router'
import {useUsersStore} from '../stores/index';
import {piniaStore} from '../main';
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue';
import NewUserView from '../views/RegistrationView.vue';
import AdminView from '../views/admin/AdminView.vue';
// import {storeToRefs} from 'pinia';

// const valtozo = useUsersStore();

// console.log(useUsersStore.state);

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: {title: 'Home'},
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
      meta: {title: 'Login'},
    },
    {
      path: '/register',
      name: 'register',
      component: NewUserView,
      meta: {title: 'Register'},
    },
    {
      path: '/admin',
      name: 'admin',
      component: AdminView,
      meta: {title: 'Admin'},
      beforeEnter: (to, from) => {
        const loginData = JSON.parse(localStorage.getItem("login"));
        if (loginData.roles !== "admin" || !loginData.auth) {
          return false;
        } else {
          // 
        }
      }
    },
    // {
    //   path: '/admin/modifyuser/:id',
    //   name: 'modifyUser',
    //   component: ModifyUser,
    //   meta: {title: 'Modify User'},
    //   beforeEnter: (to, from) => {
    //     const loginData = JSON.parse(localStorage.getItem("login"));
    //     if (loginData.roles !== "admin" || !loginData.auth) {
    //       return false;
    //     } else {
    //       // 
    //     }
    //   }
    // },
]});
export default router;