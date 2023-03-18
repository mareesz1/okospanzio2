<template>
    <div>
        <div class="sticky-top"><navbar/></div>
        <p class="display-1 text-center mb-3" id="fooldalTitle">Admin</p>
        <!-- <button class="btn btn-primary mx-3 my-3" @click="showUsersF">Show users</button> -->
        <!-- <router-link :to="{name: 'usersTable'}">Show users</router-link> -->
        <!-- <button class="btn btn-primary mx-3 my-3" @click="showRoomsF">Show rooms</button> -->
        <!-- <users-table v-if="showUsers" class="mx-3 my-2"/> -->
        <admin-navbar/>
        <router-view/>
    </div>
</template>

<script setup>
import { RouterView } from 'vue-router'
import navbar from '../../components/NavbarComponent.vue';
import AdminNavbar from '../../components/AdminNavbarComponent.vue';
import {ref} from 'vue';
import {storeToRefs} from 'pinia';
import {useUsersStore} from '../../stores/index';

// const showUsers = ref();
// const showRooms = ref();
// showUsers.value = false;


// function showUsersF () {
//     showUsers.value = true;
// }

// function showRoomsF () {
//     showUsers.value = false;
// }

// const {isLoggedIn} = storeToRefs(useUsersStore());
</script>

<style lang="scss" scoped>

</style>