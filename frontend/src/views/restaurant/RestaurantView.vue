<template>
        <p class="display-1 text-center">Restaurant</p>
        <navbar/>
        <restaurant-navbar/>
        <router-view/>
</template>

<script setup>
import Navbar from '../../components/NavbarComponent.vue';
import RestaurantNavbar from '../../components/restaurant/RestaurantNavbar.vue';
</script>

<style lang="scss" scoped>

</style>