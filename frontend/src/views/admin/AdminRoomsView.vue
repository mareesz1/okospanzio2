<template>
    <div>
        <table class="table">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Number</td>
                    <td>type</td>
                    <td>beds</td>
                    <td>price</td>
                    <td>description</td>
                    <td>qrcode</td>
                    <td>created_at</td>
                    <td>updated_at</td>
                </tr>
            </thead>
            <tbody>
                <tr v-for="room in rooms">
                    <td>{{ room.id }}</td>
                    <td>{{ room.number }}</td>
                    <td>{{ room.type }}</td>
                    <td>{{ room.beds }}</td>
                    <td>{{ room.price }}</td>
                    <td>{{ room.description }}</td>
                    <td>{{ room.qrcode }}</td>
                    <td>{{ room.created_at }}</td>
                    <td>{{ room.updated_at }}</td>
                    <td>
                        <button class="btn btn-danger" @click="deleteRoomComponent(room.id)">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import {storeToRefs} from 'pinia';
import { useUsersStore } from '../../stores';

const {rooms} = storeToRefs(useUsersStore());
const {getAllRooms, deleteRoom} = useUsersStore();
getAllRooms();

function deleteRoomComponent(id) {
    deleteRoom(id);
}
</script>

<style lang="scss" scoped>

</style>