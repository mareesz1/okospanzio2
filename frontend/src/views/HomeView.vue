<template>
    
    <div>

        <div >
        <p class="display-1 text-center mb-3 sticky-top" id="fooldalTitle">Okospanzió</p>
        </div>
        
        <div class="slider"><slider-component/></div>
        <div><home-page-component/></div>

    </div>
</template>

<script setup>
    import {storeToRefs} from 'pinia';
    import SliderComponent from '../components/SliderComponent.vue';
    import HomePageComponent from '../components/HomePageComponent.vue'
</script>

<style lang="css" scoped>
/* #fooldalTitle{
    font-size: 9em;
} */
#fooldalTitle{
    color: white;
    padding-bottom: 1vw;
    text-transform: uppercase;
    z-index: 2;
    box-shadow: 0px 70px 50px black inset;
    
    

    
}
.slider{
    position: relative;
    /* top: 0; */
    bottom: 8em;
    
}


</style>