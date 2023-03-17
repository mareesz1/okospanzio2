<template>
    
    <div>
        <div class="sticky-top"><navbar/></div>
        <div >
        <p class="display-1 text-center mb-3 sticky-top" id="fooldalTitle">Okospanzió</p>
        </div>
        
        <div class="slider"><slider-component/></div>
        <div><home-page-component/></div>
        <footer-component/>
    </div>
</template>

<script setup>
    import {storeToRefs} from 'pinia';
    import navbar from '../components/NavbarComponent.vue';
    import FooterComponent from '../components/FooterComponent.vue';
    import SliderComponent from '../components/SliderComponent.vue';
    import HomePageComponent from '../components/HomePageComponent.vue'
    import {useUsersStore} from '../stores/index';

    const {getAllUsers} = useUsersStore();
    getAllUsers();
</script>

<style lang="css" scoped>
/* #fooldalTitle{
    font-size: 9em;
} */
#fooldalTitle{
    color: white;
    padding-bottom: 1vw;
    text-transform: uppercase;
    box-shadow: inset -70px 80px 80px  rgba(0,0,0,0.6);
    

    
}
.slider{
    position: relative;
    /* top: 0; */
    bottom: 8em;
    
}


</style>