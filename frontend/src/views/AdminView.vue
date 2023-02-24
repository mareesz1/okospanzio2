<template>
    <div>
        <p class="display-1 text-center mb-3" id="fooldalTitle">Admin</p>
        <navbar/>
        <admin-component v-if="isLoggedIn.auth"/>
    </div>
</template>

<script setup>
import navbar from '../components/NavbarComponent.vue';
import AdminComponent from '../components/AdminComponent.vue';
import {storeToRefs} from 'pinia';
import {useUsersStore} from '../stores/index';

const {isLoggedIn} = storeToRefs(useUsersStore());
</script>

<style lang="scss" scoped>

</style>