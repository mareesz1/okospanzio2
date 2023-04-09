<template>
        <div class="sticky-top"><navbar/></div>
        <p class="display-1 text-center">Étterem</p>
        <restaurant-navbar/>
        <router-view/>
</template>

<script setup>
import Navbar from '../../components/NavbarComponent.vue';
import RestaurantNavbar from '../../components/restaurant/RestaurantNavbar.vue';
</script>

<style lang="scss" scoped>

</style>