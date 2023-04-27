<template>
    <p class="display-1 text-center mt-5">QR kód Teszt</p>
    <div class="row ">
    <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="text-center my-3">
                <strong>Value: </strong>
                <input type="text w-100" v-model="value">
            </div>
            <div class="text-center my-3">
                <strong>Size: </strong>
                <input type="text" v-model="size">
            </div>
            <div class="text-center my-3">
                <qrcode-vue :value="value" :size="Number(size)" level="H" />
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
    
</template>

<script setup>
import { ref } from 'vue';
import QrcodeVue from 'qrcode.vue'

let value = ref();
let size = ref();

size.value = 300;
value.value = "https://okospanzio.com/menu";
</script>

<style lang="scss" scoped>

</style>