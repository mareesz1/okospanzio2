<template>
  <div class="display-3 text-center p-2">Szobafoglalás</div>

  <div class="reservation-bar row">
  <div class="container">
    <div class="my-3">
      
      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="start_date">Érkezés időpontja:</label>
      <input
        type="date"
        class="mx-2 form-control py-3"
        name="start_date"
        id="start_date"
      />
      </div>

      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="end_date">Távozás időpontja:</label>
      <input
        type="date"
        class="mx-2 form-control py-3"
        name="end_date"
        id="end_date"
        v-model="reservation.start"
      />
      </div>
      
      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
      <label for="select_vendeg">Vendégek száma:</label>
        <select class="form-select mx-3 py-3" id="select_vendeg" aria-label="Default select example" v-model="reservation.beds">
          <option selected>Válasszon</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
      </select>
      </div>

      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="select_szoba">Szoba felszereltsége:</label>
        <select class="form-select mx-3 py-3" id="select_szoba" aria-label="Default select example" v-model="reservation.type">
          <option selected>Válasszon</option>
          <option value="normal">Normal</option>
          <option value="superior">Superior</option>
          <option value="vip">VIP</option>
          <option value="penthouse">Penthouse</option>
          <option value="grand">Grand</option>
      </select>
      </div>
  
    </div>

    <div class="d-flex justify-content-center pb-2" >
      <label class="checkbox-btn mx-2" v-for="service in services">
        <label for="checkbox_szauna">{{ service.name }}</label>
        <input id="checkbox_szauna" type="checkbox" />
        <span class="checkmark"></span>
      </label>
    </div>
  </div>
 
  </div>

  <div class="justify-content-center d-flex pt-2">
    <button class="btn w-25">Szobák keresése</button>
  </div>
   
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '../stores';

const {reservation, services} = storeToRefs(useUsersStore());
</script>

<style lang="scss" scoped>
#start_date,
#end_date,
#select_vendeg,
#select_szoba {
  width: 75%;
}

.col-12{
  vertical-align: middle;
}
.col-12 input{
  vertical-align:middle;
}
.btn {
  display: inline-block;
  padding: 12px 24px;
  border: 1px solid #4f4f4f;
  border-radius: 4px;
  transition: all 0.2s ease-in;
  position: relative;
  overflow: hidden;
  font-size: 19px;
  color: black;
  z-index: 1;
}

.btn:before {
  content: "";
  position: absolute;
  left: 50%;
  transform: translateX(-50%) scaleY(1) scaleX(1.25);
  top: 100%;
  width: 140%;
  height: 180%;
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 50%;
  display: block;
  transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
  z-index: -1;
}

.btn:after {
  content: "";
  position: absolute;
  left: 55%;
  transform: translateX(-50%) scaleY(1) scaleX(1.45);
  top: 180%;
  width: 160%;
  height: 190%;
  background-color: #39bda7;
  border-radius: 50%;
  display: block;
  transition: all 0.5s 0.1s cubic-bezier(0.55, 0, 0.1, 1);
  z-index: -1;
}

.btn:hover {
  color: #ffffff;
  border: 1px solid #39bda7;
}

.btn:hover:before {
  top: -35%;
  background-color: #39bda7;
  transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
}

.btn:hover:after {
  top: -45%;
  background-color: #39bda7;
  transform: translateX(-50%) scaleY(1.3) scaleX(0.8);
}
//gomb vége

/* Customize the label (the checkbox-btn) */
.checkbox-btn {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 10px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.checkbox-btn input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.checkbox-btn label {
  cursor: pointer;
  font-size: 18px;
}
/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  border: 2.5px solid #ffffff;
  transition: 0.2s linear;
}
.checkbox-btn input:checked ~ .checkmark {
  background-color: transparent;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  visibility: hidden;
  opacity: 0;
  left: 50%;
  top: 40%;
  width: 10px;
  height: 14px;
  border: 2px solid #0ea021;
  filter: drop-shadow(0px 0px 10px #0ea021);
  border-width: 0 2.5px 2.5px 0;
  transition: 0.2s linear;
  transform: translate(-50%, -50%) rotate(-90deg) scale(0.2);
}

/* Show the checkmark when checked */
.checkbox-btn input:checked ~ .checkmark:after {
  visibility: visible;
  opacity: 1;
  transform: translate(-50%, -50%) rotate(0deg) scale(1);
  animation: pulse 1s ease-in;
}

.checkbox-btn input:checked ~ .checkmark {
  transform: rotate(45deg);
  border: none;
}

@keyframes pulse {
  0%,
  100% {
    transform: translate(-50%, -50%) rotate(0deg) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) rotate(0deg) scale(1.6);
  }
}

//checkbox vége

.reservation-bar {
  background: linear-gradient(-45deg, #84f4dd, #b1d6f8, #98f8c0, #18ddf7);
  background-size: 400% 400%;
  animation: gradient 20s ease infinite;
  height: fit-content;
  margin-bottom: 1vw;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.reservation-bar label {
  color: white;
}
</style>
