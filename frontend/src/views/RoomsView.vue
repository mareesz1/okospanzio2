<template>
   <div class="sticky-top"><navbar/></div>
    <div>
        <p class="display-1 text-center mb-3">Rooms</p>
    </div>
    <div class="container my-3">
        <room-component/>
    </div>
    <div><footer-component/></div>
</template>

<script setup>
import navbar from '../components/NavbarComponent.vue';
import RoomComponent from '../components/RoomComponent.vue';
import FooterComponent from '../components/FooterComponent.vue';

</script>

<style lang="scss" scoped>

</style>