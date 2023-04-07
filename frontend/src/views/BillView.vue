<template>
    <div class="sticky-top"><navbar/></div>
    <div>
        <bill-component/>
    </div>

    <div><footer-component/></div>
</template>

<script setup>
import navbar from '../components/NavbarComponent.vue';
import BillComponent from '../components/BillComponent.vue';
import FooterComponent from '../components/FooterComponent.vue';
</script>

<style lang="scss" scoped>

</style>