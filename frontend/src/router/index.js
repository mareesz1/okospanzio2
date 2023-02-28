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
        const status = useUsersStore(); // a useUsersStore()-t csak fgvn belül lehet meghívni különben meghal a program
        // console.log(to.name);
        // console.log(status.isLoggedIn.roles);
          if (status.isLoggedIn.roles !== 'admin' ) { // ha van admin role akkor mindenképp be van lépve
            // next();
            return false;
          } else {
            // next('/login');
          }
        }
      },
        ]
      });
      
      // router.beforeEach((to,from,next)=>{
        //   const publicPage = ['/','/login','/register'];
        //   const autRequired = !publicPage.includes(to.path);
        //   if (autRequired && !isLoggedIn.auth){
          //     return next('/login');
          //   } else{
            //     next();
            //   }
            // });
            
            export default router;