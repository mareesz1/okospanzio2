<template>
    <div>
        <p class="display-1 text-center mb-3" id="fooldalTitle">Okospanzió Főoldal</p>
        <navbar/>
    </div>
</template>

<script setup>
    import {storeToRefs} from 'pinia';
    import navbar from '../components/NavbarComponent.vue';
    import {useUsersStore} from '../stores/index';

    const {getAllUsers} = useUsersStore();
    getAllUsers();
</script>

<style lang="css" scoped>
/* #fooldalTitle{
    font-size: 9em;
} */
</style>