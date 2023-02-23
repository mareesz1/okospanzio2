<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
        <router-link :to="{name: 'home'}">Home page</router-link>
      </li>
      <li class="nav-item">
        <router-link :to="{name: 'login'}">Login page</router-link>
      </li>
      <li class="nav-item">
        <router-link :to="{name: 'newuser'}">New User</router-link>
      </li>
      <li class="nav-item" v-if="isLoggedIn.roles == 'admin'">
        <router-link :to="{name: 'admin'}">Admin Page</router-link>
      </li>
    </ul>
    <div class="mx-auto" v-if="isLoggedIn.roles">
      Logged in as: {{ isLoggedIn.roles }}
    </div>
  </div>
</nav>
</template>

<script setup>
import {storeToRefs} from 'pinia';
import {useUsersStore} from '../stores/index';

let {isLoggedIn} = storeToRefs(useUsersStore());
</script>

<style lang="css" scoped>
    a {
        text-decoration: none;
        color: black;
        font-size: 2em;
        margin: 1em;
    }
</style>