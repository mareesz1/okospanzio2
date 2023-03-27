<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { useUsersStore } from './stores';

const {authenticate} = useUsersStore();
// authenticate();
</script>

<template>
  <div id="background" class="">
    <RouterView/>
  </div>
</template>

<style scoped>
  
</style>
