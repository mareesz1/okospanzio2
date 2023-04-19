<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { useUsersStore } from './stores';
import NavbarComponent from './components/NavbarComponent.vue';
import FooterComponent from './components/FooterComponent.vue';

const {isAuthenticated} = useUsersStore();
isAuthenticated();
</script>

<template>
  <div class="sticky-top"><navbar-component/></div>
  <div id="background" class="body">
    <RouterView/>
  </div>
  <div class=""><footer-component/></div>
</template>

<style scoped>
  .body{
    min-height: 100vh;
  }
</style>
