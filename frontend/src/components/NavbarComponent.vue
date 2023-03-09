<template>
    <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <router-link to="/">Home page</router-link>
        </li>
        <li class="nav-item">
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
    <div class="mx-auto" v-if="isLoggedIn.roles">
      Logged in as: {{ isLoggedIn.roles }}
    </div>
  </div>
</nav>

</template>

<script setup>
import {storeToRefs} from 'pinia';
import {useUsersStore} from '../stores/index';
import UsersTableComponent from './UsersTableComponent.vue';

let {isLoggedIn} = storeToRefs(useUsersStore());
const loginData = JSON.parse(localStorage.getItem("login"));
if (loginData.auth) {
  console.log("already authenticated");
  isLoggedIn = loginData;
}
</script>

<style lang="css" scoped>
    a {
        text-decoration: none;
        color: black;
        font-size: 2em;
        margin-left: 1em;
    }
</style>