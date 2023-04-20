<template>

    <div>
        <p class="display-1 text-center mb-3">Rooms</p>
    </div>
    <div class="container my-3">
        <div class="row">
            <room-component/>
        </div>
    </div>

</template>

<script setup>

import RoomComponent from '../components/RoomComponent.vue';
import FooterComponent from '../components/FooterComponent.vue';
import { useUsersStore } from '../stores';

const {getAllServices} = useUsersStore();
getAllServices();

</script>

<style lang="scss" scoped>

</style>