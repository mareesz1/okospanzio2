<template>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <div class="col" v-for="m in menus">
        <div class="card h-100">
          <img v-bind:src=" m.pictureURL" class="card-img-top" alt="..." />
          <div class="card-body">
            <h5 class="card-title">{{ m.name }}</h5>
            <p class="card-text">
              {{ m.type }}
            </p>    
          </div>
          <div class="card-footer">
            <small class="text-muted">{{ m.price }} Ft</small>
            <button class="btn btn-secondary mx-3">Megrendelem</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRestaurantStore } from "../../stores";
import {storeToRefs} from 'pinia';

const props = defineProps(['menus']);
const {getAllMenus} = useRestaurantStore();
const {menus} = storeToRefs(useRestaurantStore());

getAllMenus();
</script>

<style lang="scss" scoped>


</style>
