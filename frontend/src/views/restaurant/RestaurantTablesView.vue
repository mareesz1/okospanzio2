<template>
    <div>
    <!-- {{ users }} -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Occupied</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="table in tables">
                <!-- {{ user }} -->
                        <td>{{ table.tableId }}</td>
                        <td v-if="table.isOccupied== 1">&#9989;</td>
                        <td v-else-if="table.isOccupied==0">&#10060;</td>
                        <td>
                            <!-- <router-link :to="`/modify/${t.id}`" class="btn btn-warning">Modify</router-link> -->
                        </td>
                        <!-- <td>
                            <router-link :to="`/admin/modifyuser/${user.id}`" class="btn btn-warning">Modify</router-link>
                        </td> -->
                        
                    </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import {storeToRefs} from 'pinia';
import {useRouter} from 'vue-router';
import { useRestaurantStore } from '../../stores';
// const router = useRouter();

const {tables} = storeToRefs(useRestaurantStore());
const {getAllTables} = useRestaurantStore();

getAllTables();
</script>

<style lang="scss" scoped>

</style>