<template>
    <div>
        <div class="">
            <login-form/>
        </div>
    </div>

</template>

<script setup>

    import LoginForm from '../components/LoginFormComponent.vue';

    import { useUsersStore } from '../stores';

    const {getCsrfCookie} = useUsersStore();
    if (!$cookies.get('XSRF-TOKEN')){
        getCsrfCookie();
    } 
</script>

<style lang="css" scoped>

</style>