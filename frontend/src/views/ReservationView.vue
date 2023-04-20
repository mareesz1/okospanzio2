<template>


    <div class="container-fluid"><reservation-component/></div>


    <div class="fixed-bottom"><footer-component/></div>
</template>

<script setup>

import ReservationComponent from '../components/ReservationComponent.vue';
import { useUsersStore } from '../stores';

const {getAllServices} = useUsersStore();
getAllServices();
</script>

<style lang="scss" scoped>

</style>
