<template>
    <div>
        <div class="col-12" v-if="errors.orderState">
            <p class="display-4 text-center mt-0 mx-3 pb-1" id="ordersErrorDisplay">{{ errors.orderState }}</p>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-auto col-md-auto col-sm-auto" v-for="order in orders">
                    <order-cards :order="order" />
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useRestaurantStore } from '../../stores';
import OrderCards from '../../components/restaurant/OrderCard.vue';

const { orders, errors } = storeToRefs(useRestaurantStore());
const { getAllOrders } = useRestaurantStore();

getAllOrders();
</script>

<style lang="css" scoped>
#ordersErrorDisplay {
    color: red;
    background-color: #ffafaf;
    border-radius: 0.7em;
}
</style>