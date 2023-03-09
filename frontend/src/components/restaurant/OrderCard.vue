<template>
    <!-- {{ orders }} -->
    <!-- <div v-for="order in orders"> -->
        <div class="card my-3 mx-3" style="width: 22rem;">
            <h5 class="card-header">Order #{{ order.orderId }}</h5>
            <div class="card-body">
                <div class="row g-0">
                    <div class="col-md-8">
                        <p class="card-text my-1">Quantity: <strong class="">{{ order.quantity }}</strong></p>
                        <p class="card-text my-1">Status: {{ order.status }}</p>
                        <p class="card-text my-1">Table no.: {{ order.tableId }}</p>
                        <p class="card-text mb-3">{{ order.name }}</p>
                    </div>
                    <div class="col-md-4">
                        <a href="#" class="btn btn-primary my-2 w-100">Cooking</a>
                        <a href="#" class="btn btn-primary my-2 w-100">Waiting</a>
                        <a href="#" class="btn btn-primary my-2 w-100">Out</a>
                    </div>
                </div>
            </div>
        </div>
    <!-- </div> -->
</template>

<script setup>
const props = defineProps(['order']);
</script>

<style lang="css" scoped>
p.card-text{
    font-size: 1.5em !important;
}
</style>