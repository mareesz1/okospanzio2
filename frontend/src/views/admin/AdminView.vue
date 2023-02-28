<template>
    <div>
        <p class="display-1 text-center mb-3" id="fooldalTitle">Admin</p>
        <navbar/>
        <button class="btn btn-primary mx-3 my-3" @click="showUsersPlus">Show users</button>
        <button class="btn btn-primary mx-3 my-3" @click="anythingElse">Show anything else</button>
        <users-table v-if="showUsers" class="mx-3 my-2"/>
    </div>
</template>

<script setup>
import navbar from '../../components/NavbarComponent.vue';
import UsersTable from '../../components/UsersTableComponent.vue';
import {ref} from 'vue';
import {storeToRefs} from 'pinia';
import {useUsersStore} from '../../stores/index';

const showUsers = ref();
showUsers.value = false;


function showUsersPlus () {
    showUsers.value = true;
}

function anythingElse() {
    showUsers.value = false;
}

// const {isLoggedIn} = storeToRefs(useUsersStore());
</script>

<style lang="scss" scoped>

</style>