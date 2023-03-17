<template>
  <div class="container col-12 col-md-4 w-75 my-3"  v-for="r in rooms">
    <div class="card mb-3">
      <img src="https://www.businesshotelfenyves.hu/media/k2/items/cache/245effadf41c6129f4fe7accc564ef86_XL.jpg" class="card-img-top " alt="..." />
      <div class="card-body">
        <h5 class="card-title">Room number: {{ r.number }}</h5>
        <p class="card-text">
          {{ r.description }}
        </p>
        <p class="card-text">
          <small>{{ r.price }} Ft</small>
        </p>
        <button class="btn btn-info">Reserve now!</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '../stores';


const {rooms} = storeToRefs(useUsersStore());;
const {getAllRooms, } = useUsersStore();
getAllRooms();
</script>

<style lang="scss" scoped></style>
