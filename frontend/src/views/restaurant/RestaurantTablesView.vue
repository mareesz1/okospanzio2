<template>
    <div>
    <!-- {{ users }} -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <td>Occupied</td>
                </tr>
            </thead>
            <tbody>
                <tr v-for="table in tables">
                    <table-table-component :table="table"/>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import {storeToRefs} from 'pinia';
import {useRouter} from 'vue-router';
import { useRestaurantStore } from '../../stores';

import TableTableComponent from '../../components/restaurant/TableTableComponent.vue';
// const router = useRouter();

const {tables} = storeToRefs(useRestaurantStore());
const {getAllTables} = useRestaurantStore();

getAllTables();
</script>

<style lang="css" scoped>
.table{
    color: white;
}
</style>