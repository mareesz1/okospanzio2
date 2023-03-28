<template>
    <div class="sticky-top"><navbar/></div>
    <div>
        <p class="display-1 text-center">Login page</p>
        
        <div class="container">
            <login-form/>
        </div>
    </div>
    <div class=""><footer-component/></div>
</template>

<script setup>
    import navbar from '../components/NavbarComponent.vue';
    import LoginForm from '../components/LoginFormComponent.vue';
    import FooterComponent from '../components/FooterComponent.vue';
    import { useUsersStore } from '../stores';

    const {getCsrfCookie} = useUsersStore();
    if (!$cookies.get('XSRF-TOKEN')){
        getCsrfCookie();
    } 
</script>

<style lang="css" scoped>

</style>