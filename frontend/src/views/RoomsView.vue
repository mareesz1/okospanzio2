<template>
<div >
  <img class="bg" src="https://cdn.businesstraveller.com/wp-content/uploads/fly-images/823330/Hotel-key-card-e1503040010815-916x515.jpg" alt="">
  </div>
    <div>
        <p class="display-1 text-center mb-3">Szobáink</p>
    </div>
    <div class="container my-3">
        <div class="row">
            <room-component/>
        </div>
    </div>

</template>

<script setup>

import RoomComponent from '../components/RoomComponent.vue';


</script>

<style lang="scss" scoped>
.bg {
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center center;
  background-size: cover;
  object-fit: cover;
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: -4;
  filter: blur(15%);
  filter: brightness(35%);
}


.text-center{
    color: white;
}
</style>