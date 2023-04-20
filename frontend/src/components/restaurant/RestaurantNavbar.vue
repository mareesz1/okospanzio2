<template>
    <!-- <router-link to="/restaurant/orders" class="btn mx-3 my-3" :class="(window.location.pathname == '/restaurant/orders') ? 'btn-success' : 'btn-primary'" @click="getLocation">Orders</router-link>
    <router-link to="/restaurant/tables" class="btn mx-3 my-3" :class="(window.location.pathname == '/restaurant/tables') ? 'btn-success' : 'btn-primary'" @click="getLocation">Tables</router-link> -->
    <router-link to="/admin/restaurant/orders" class="btn mx-3 my-3" :class="($route.path == '/restaurant/orders') ? 'btn-success' : 'btn-primary'">Rendelések</router-link>
    <router-link to="/admin/restaurant/tables" class="btn mx-3 my-3" :class="($route.path == '/restaurant/tables') ? 'btn-success' : 'btn-primary'">Asztalok</router-link>
    <router-link to="/admin/restaurant/menu" class="btn mx-3 my-3" :class="($route.path == '/restaurant/menu') ? 'btn-success' : 'btn-primary'">Menü</router-link>
    <router-view/>
</template>

<script setup>

</script>

<style lang="scss" scoped>

</style>