<template>
    <div>
    <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80" class="image" alt="">
    <p class="display-1 text-center" style="color:white">Étterem</p>
    </div>
    <div>
        <p class="display-1 text-center">LEÍRÁS PLACEHOLDER</p>
    </div>
    <menu-component/>
</template>

<script setup>
import MenuComponent from '../../components/restaurant/MenuComponent.vue';
() => {
window.scrollTo(0,0);
}
</script>

<style lang="scss" scoped>
.image {
background-repeat: no-repeat;
background-attachment: fixed;
background-position: center center;
background-size: cover;
object-fit: cover;
max-height: 100vh;
width: 100%;
position: fixed;
z-index: -4;
filter: blur(15%);
filter: brightness(25%);
}
</style>