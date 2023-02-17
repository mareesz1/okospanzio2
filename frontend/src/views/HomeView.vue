<template>
    <div>
        <p class="display-1 text-center">Okospanzió home</p>
        <navbar/>
        {{ users }}
    </div>
</template>

<script setup>
    import {storeToRefs} from 'pinia';
    import navbar from '../components/NavbarComponent.vue';
    import {useUsersStore} from '../stores/index';

    const {getAllUsers} = useUsersStore();
    const {users} = storeToRefs(useUsersStore());
    getAllUsers();
</script>

<style lang="scss" scoped>
</style>