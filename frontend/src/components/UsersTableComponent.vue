<template>
    <div>
    <!-- {{ users }} -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Gender</th>
                    <th>CreatedAt</th>
                    <th>UpdatedAt</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="user in users">
                <!-- {{ user }} -->
                        <td>{{ user.id }}</td>
                        <td>{{ user.firstName }}</td>
                        <td>{{ user.lastName }}</td>
                        <td>{{ user.email }}</td>
                        <td>{{ user.phone }}</td>
                        <td>{{ user.gender }}</td>
                        <td>{{ user.created_at }}</td>
                        <td>{{ user.updated_at }}</td>
                        <td>
                            <!-- <router-link :to="`/modify/${t.id}`" class="btn btn-warning">Modify</router-link> -->
                        </td>
                        <!-- <td>
                            <router-link :to="`/admin/modifyuser/${user.id}`" class="btn btn-warning">Modify</router-link>
                        </td> -->
                        <td>
                            <button class="btn btn-danger" @click="deleteUserComponent(user.id)">Delete</button>
                        </td>
                    </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import {storeToRefs} from 'pinia';
import {useRouter} from 'vue-router';
import { useUsersStore } from '../stores';
// const router = useRouter();

const {users} = storeToRefs(useUsersStore());
const {getAllUsers, deleteUser} = useUsersStore();
getAllUsers();

function deleteUserComponent(id) {
    deleteUser(id).then(() => {
        // router.go(0);
    });
}
</script>

<style lang="scss" scoped>

</style>