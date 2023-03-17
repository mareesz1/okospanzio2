<template>
    <div class="sticky-top"><navbar/></div>
    <div class="">
        <p class="display-1 text-center">Registration</p>
        <reg-component/>
        <footer-component/>
    </div>
</template>

<script setup>
import navbar from '../components/NavbarComponent.vue';
import RegComponent from '../components/RegistrationComponent.vue';
import FooterComponent from '../components/FooterComponent.vue';
</script>

<style lang="scss" scoped>

</style>