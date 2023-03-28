<template>
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link to="/">Home page</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/rooms">Rooms</router-link>
          </li>
          <li class="nav-item" v-if="!isLoggedIn.auth">
            <router-link to="/login">Login page</router-link>
          </li>
          <li class="nav-item">
            <router-link to="/register">New User</router-link>
          </li>
          <li class="nav-item" v-if="isLoggedIn.roles == 'admin'">
            <router-link to="/admin">Admin Page</router-link>
          </li>
          <li class="nav-item" v-if="isLoggedIn.roles == 'admin' || isLoggedIn.roles == 'restaurant'">
            <router-link to="/restaurant">Restaurant</router-link>
          </li>
        </ul>

      </div>
      <div class="mx-auto" v-if="isLoggedIn.auth == true">
            Logged in as: {{ isLoggedIn.roles }}
         <button class="btn btn-warning ms-5" @click="logout">Logout</button>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '../stores/index';

let {isLoggedIn} = storeToRefs(useUsersStore());
const {logout} = useUsersStore();
</script>

<style lang="css" scoped>
/* a {
        text-decoration: none;
        color: black;
        font-size: 2em;
        margin-left: 1em;
    } */
@import url('https://fonts.googleapis.com/css?family=Titillium+Web:400,600');

body {
  background: #212121;
  padding: 50px 0;
}

.nav-item {
  font-family: 'Titillium Web';
  text-transform: uppercase;
  text-align: center;
  font-weight: 600;
}

.nav-item * {
  box-sizing: border-box;
  transition: all .35s ease;
}

.nav-item li {
  display: inline-block;
  list-style: outside none none;
  margin: .5em 1em;
  padding: 0;
}

.nav-item a {
  padding: .5em .8em;
  color: rgba(0, 0, 0, 0.5);
  position: relative;
  text-decoration: none;
  font-size: 20px;
}

.nav-item a::before,
.nav-item a::after {
  content: '';
  height: 14px;
  width: 14px;
  position: absolute;
  transition: all .35s ease;
  opacity: 0;
}

.nav-item a::before {
  content: '';
  right: 0;
  top: 0;
  border-top: 3px solid #00c3ff;
  border-right: 3px solid #00c3ff;
  transform: translate(-100%, 50%);
}

.nav-itemv a:after {
  content: '';
  left: 0;
  bottom: 0;
  border-bottom: 3px solid #00c3ff;
  border-left: 3px solid #00c3ff;
  transform: translate(100%, -50%)
}

.nav-item a:hover:before,
.nav-item a:hover:after {
  transform: translate(0, 0);
  opacity: 1;
}

.nav-item a:hover {
  color: #00c3ff;
}

ul li {
    display:inline;
    list-style-type:none;
}
</style>