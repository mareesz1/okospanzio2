<template>
    <div>
        <p class="display-1 text-center mb-3">Rooms</p>
        <navbar/>
    </div>
    <div class="container my-3">
        <room-component/>
    </div>
</template>

<script setup>
import navbar from '../components/NavbarComponent.vue';
import RoomComponent from '../components/RoomComponent.vue';

</script>

<style lang="scss" scoped>

</style>