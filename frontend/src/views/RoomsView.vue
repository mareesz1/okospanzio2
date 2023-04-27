<template>
    <div class="bg"></div>
    <div>
        <p class="display-1 text-center mb-3" style="color:white">Szobák</p>
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
.bg{
    background-image: linear-gradient(to top right, #fff, #636262);
    position: fixed;
    height: 100%;
    width: 100%;
    z-index: -2;
}
</style>