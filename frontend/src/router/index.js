import { storeToRefs } from 'pinia';
import {useUsersStore} from '../stores/index';
import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import RoomView from '../views/RoomsView.vue'
import ReservationView from '../views/ReservationView.vue';
import BillView from '../views/BillView.vue';
import LoginView from '../views/LoginView.vue';
import NewUserView from '../views/RegistrationView.vue';
import GymView from '../views/GymView.vue';
import SaunaView from '../views/SaunaView.vue';
import PoolView from '../views/PoolView.vue';
import AdminView from '../views/admin/AdminView.vue';
import AUsersTableView from '../views/admin/AdminUsersTableView.vue';
import ARoomsView from '../views/admin/AdminRoomsView.vue';
import RestaurantView from '../views/restaurant/RestaurantView.vue';
import RestaurantOrdersView from '../views/restaurant/RestaurantOrdersView.vue';
import RestaurantTablesView from '../views/restaurant/RestaurantTablesView.vue';
import RestaurantMenuView from '../views/restaurant/RestaurantMenuView.vue';
import RestaurantGuestView from '../views/restaurant/RestaurantGuestView.vue';
import RestaurantNavbar from '../components/restaurant/RestaurantNavbar.vue';
import MenuComponent from '../components/restaurant/MenuComponent.vue';
import AdminMenuComponent from '../components/restaurant/AdminMenuComponent.vue'

// import {storeToRefs} from 'pinia';

// const valtozo = useUsersStore();

// console.log(useUsersStore.state);

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  scrollBehavior(to, from, savedPosition) {
    // always scroll to top
    return { top: 0 }
  },
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: {title: 'Home'},
    },
    {
      path: '/rooms',
      name: 'room',
      component: RoomView,
      meta: {title: 'Rooms'},

    },
    {
      path: '/reserve',
      name: 'reservation',
      component: ReservationView,
      meta: {title: 'Reservation'},

    },
    {
      path: '/bills',
      name: 'bills',
      component: BillView,
      meta: {title: 'Bills'},

    },
    {
      path: '/gym',
      name: 'gym',
      component: GymView,
      meta: {title: 'Gym'},

    },
    {
      path: '/pool',
      name: 'pool',
      component: PoolView,
      meta: {title: 'Pool'},

    },
    {
      path: '/sauna',
      name: 'sauna',
      component: SaunaView,
      meta: {title: 'Sauna'},

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
        // const loginData = JSON.parse(localStorage.getItem("login"));
        // if (loginData.roles !== "admin" || !loginData.auth) {
        //   return false;
        // } else {
        //   // 
        // }
        const {isLoggedIn} = storeToRefs(useUsersStore());
        if (isLoggedIn.value.auth && isLoggedIn.value.roles == 'admin') {
          return true;
        } else {
          return {name: 'home'};
        }
      },
      children: [
        {
          path: 'users',
          component: AUsersTableView,
        },
        {
          path: 'rooms',
          component: ARoomsView,
        },
        {
          path: 'restaurant',
          component: RestaurantNavbar,
          meta: {title: 'Restaurant'},
          beforeEnter: (to, from) => {
            const {isLoggedIn} = storeToRefs(useUsersStore());
            // const loginData = JSON.parse(localStorage.getItem("login"));
            // if ((loginData.roles == "admin" || loginData.roles == "restaurant") && loginData.auth) {
            //   return true;
            // } else {
            //   return false;
            // }
            if (isLoggedIn.value.auth && (isLoggedIn.value.roles == 'admin' || isLoggedIn.value.roles == 'restaurant')) {
              return true;
            } else {
              return {name: 'home'};
            }
          },
          children: [
            {
              path: 'orders',
              component: RestaurantOrdersView,
            },
            {
              path: 'tables',
              component: RestaurantTablesView,
            },
            {
              path: 'menu',
              component: AdminMenuComponent,
            },
          ]
        }
        
      ]
    }, {
      path: '/restaurant',
      name: 'Restaurant',
      component: RestaurantGuestView,
      children: [
        {
          path: 'orders',
          component: RestaurantOrdersView,
        },
        {
          path: 'tables',
          component: RestaurantTablesView,
        },
        {
          path: 'menu',
          component: RestaurantMenuView,
        },
      ]
    }
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

// router.beforeEach((to) => {
//   console.log('asd');
//   const useUsersStore = useUsersStore();
//   console.log('isLoggedIn.roles:  ' + useUsersStore.isLoggedIn.roles);
//   console.log('isLoggedIn.auth:  ' + useUsersStore.isLoggedIn.auth);
//   if (isLoggedIn.auth && isLoggedIn.roles == 'admin') {
//     console.log('router: true');
//     return to;
//   } else {
//     return '/login';
//   }
// })

export default router;