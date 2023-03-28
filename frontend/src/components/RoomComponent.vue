<template>
  <div class="col" v-for="r in rooms">
    <div class="card mb-3">
      <div class="card-body text-center">
      <label >
        <input type="checkbox" />
        <div class="flip-card ">
          <h5 class="card-title front-h5">{{r.type}}</h5>
          <div class="front rounded ">
            <img v-bind:src="r.IMG"
              class="card-img-top rounded " alt="..." />
          </div>
          <div class="back border border-dark rounded">
            <h5 class="card-title">{{r.type}} {{ r.number }}</h5>
            <div class="text-success border-2">
              <hr>
            </div>
            <p class="card-text">
             <strong>Beds:</strong>  {{ r.beds }}
            </p>
            <p class="card-text">
              {{ r.description }}
            </p>
            <hr class="hr2">
            <p class="card-text">
             <strong>Ár:</strong> <small>{{ r.price }} Ft</small>
            </p>
            <button class="btn btn-info mt-3">Reserve now!</button>
          </div>
        </div>
      </label>
      </div>
    </div>
    

  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '../stores';

const { rooms } = storeToRefs(useUsersStore());;
const { getAllRooms, } = useUsersStore();
getAllRooms();
</script>

<style lang="css" scoped>

.card{
  border: 0;
}
label {
  
  width: fit-content;
  perspective: 1000px;
  transform-style: preserve-3d;
  cursor: pointer;
}

.flip-card {
 
  min-width: 30vw;
  min-height: 15vw;
  transform-style: preserve-3d;
  transition: all 0.5s ease-in-out;
  z-index: 1;
}


.flip-card .front,
.flip-card .back {
 
  position: absolute;
  width: 30vw;
  height: 15vw;
  text-align: center;
  background: #fff;
  backface-visibility: hidden;
}

.flip-card .back {
  transform: rotateY(180deg);

}
label:hover .flip-card {
  
  box-shadow: 0 20px 20px rgba(50, 60, 60, 0.2);
}

input {
  display: none;
}

:checked+.flip-card {
  transform: rotateY(180deg);
}

label:hover :checked+.flip-card {
  
  box-shadow: 0 20px 20px rgba(255, 255, 255, 0.2);
}

.front img {
  width: 30vw;
  height: 15vw;
  
}


hr {
  color: #3bc2eb;
  width: 15rem;
  
  margin: 1em auto 1em auto;
}
.hr2{
  width: 8rem;
}
.back h5 {
  color: #3bc2eb;
  text-align: center;
  margin: 0 auto;
}
.back p{
  text-align: center;
  margin: 0 auto;
}
.front-h5{
  visibility: hidden;
  position: absolute;
}


</style>
