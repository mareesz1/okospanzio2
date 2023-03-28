<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { useUsersStore } from './stores';

const {isAuthenticated} = useUsersStore();
isAuthenticated();
</script>

<template>
  <div id="background" class="">
    <RouterView/>
  </div>
</template>

<style scoped>
  
</style>
