<template>
    <div class="row">
    <div class="col-12">Orders</div>
    <!-- <div > -->
    <div class="col-12 col-md-3" v-for="order in orders">
        <!-- {{ orders }} -->
            <order-cards :order="order"/>
        </div>
    </div>
    <!-- </div> -->
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useRestaurantStore } from '../../stores';
import OrderCards from '../../components/restaurant/OrderCard.vue';

const {orders} = storeToRefs(useRestaurantStore());
const {getAllOrders} = useRestaurantStore();

getAllOrders();
</script>

<style lang="scss" scoped>

</style>