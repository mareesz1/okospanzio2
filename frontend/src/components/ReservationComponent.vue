<template>
  <div class="reservation-bar row">
    <div class="display-3 text-center p-2" style="color:white">Szobafoglalás</div>
    <div class="container">
      <div class="my-3">

        <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex align-items-center">
          <label class="" for="start_date">Érkezés:</label>
          <input type="date" class="mx-2 form-control py-3" name="start_date" id="start_date"
            v-model="reservation.start" />
        </div>

        <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex align-items-center">
          <label class="align-middle" for="end_date">Távozás:</label>
          <input type="date" class="mx-2 form-control py-3" name="end_date" id="end_date" v-model="reservation.end" />
        </div>

        <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
          <label for="select_vendeg">Vendégek száma:</label>
          <select class="form-select mx-3 py-3" id="select_vendeg" aria-label="Default select example"
            v-model="reservation.beds">
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
          <select class="form-select mx-3 py-3" id="select_szoba" aria-label="Default select example"
            v-model="reservation.type">
            <option selected>Válasszon</option>
            <option value="normal">Normal</option>
            <option value="superior">Superior</option>
            <option value="vip">VIP</option>
            <option value="penthouse">Penthouse</option>
            <option value="grand">Grand</option>
          </select>
        </div>

      </div>

      <div class="container justify-content-center">
        <div class="row d-flex">
          <label class="checkbox-btn col-lg-4 col-md-4 col-auto mb-5" v-for="service in services">

            <label class="ck" for="checkbox_szauna">{{ service.name }}</label>
            <input id="checkbox_szauna" type="checkbox" v-model="reservation.services" :value="service.id" />
            <span class="checkmark"></span>
          </label>
        </div>
      </div>
    </div>
    <div class="justify-content-center d-flex p-2">
      <button class="btn w-25" @click="reserve()">Szobák keresése</button>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-xl-4 col-lg-6 col-md-12 text-center align-middle" v-for="r in FreeRooms">
        <div class="card my-3 ms-3">
          <img class="card__background" v-bind:src="r[0].IMG " width="1920" height="2193" />
          <div class="card__content | flow ">
            <div class="card__content--container | flow text-center">
              <h2 class="card__title text-uppercase">{{ r[0].type }} {{ r[0].number }}</h2>
            </div>
            <div class="text-center" id="adatok">
              <p class="card__description">
              <ul class="list-group">
                <li class=" text-uppercase"><strong>Férőhely: {{ r[0].beds }}</strong></li>
                <li class=" text-uppercase"><strong>Ár: {{ r[0].price }} Ft</strong></li>
              </ul>
              </p>
            </div>


            <button @click="ReserveRoom(r)" to="/reserve" class="card__button text-uppercase">Reserve
              now!</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '../stores';


const { FreeRooms } = storeToRefs(useUsersStore());;

const { getAllServices, reserve, ReserveRoom } = useUsersStore();

const { reservation, services } = storeToRefs(useUsersStore());

getAllServices();

</script>

<style lang="scss" scoped>
#start_date,
#end_date,
#select_vendeg,
#select_szoba {
  width: 75%;
}


.col-12 {
  vertical-align: middle;
}

.col-12 input {
  vertical-align: middle;
}

.btn {
  display: inline-block;
  padding: 12px 24px;
  border: 1px solid #00000086;
  border-radius: 4px;
  transition: all 0.2s ease-in;
  position: relative;
  overflow: hidden;
  font-size: 19px;
  color: rgb(0, 0, 0);
  z-index: 1;
  background-color: white;
  filter: brightness(95%);
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

.checkbox-btn input:checked~.checkmark {
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
.checkbox-btn input:checked~.checkmark:after {
  visibility: visible;
  opacity: 1;
  transform: translate(-50%, -50%) rotate(0deg) scale(1);
  animation: pulse 1s ease-in;
}

.checkbox-btn input:checked~.checkmark {
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

@media (max-width: 767px) {
  .ck {
    align-items: center;
    margin-right: 100px;

    padding: 0;
  }

  .checkbox-btn {
    margin-left: 30px;
    margin-right: 0px;
    transform: scale(1.3);
  }
}

:root {
  /* Colors */
  --brand-color: hsl(46, 100%, 50%);
  --black: hsl(0, 0%, 0%);
  --white: hsl(0, 0%, 100%);
  /* Fonts */
  --font-title: "Montserrat", sans-serif;
  --font-text: "Lato", sans-serif;
}

/* RESET */

/* Box sizing rules */
*,
*::before,
*::after {
  box-sizing: border-box;
}

/* Remove default margin */
body,
h2,
p {
  margin: 0;
}

/* GLOBAL STYLES */
body {
  display: grid;
  place-items: center;
  height: 100vh;
}

h2 {
  font-size: 2.25rem;
  font-family: var(--font-title);
  color: var(--white);
  line-height: 1.1;
}

p {
  font-family: var(--font-text);
  font-size: 1rem;
  line-height: 1.5;
  color: var(--white);
}

li {
  list-style: none;
}

#adatok {
  color: white;
}

.flow>*+* {
  margin-top: var(--flow-space, 1em);
}

/* CARD COMPONENT */

.card {
  display: grid;
  place-items: center;
  width: 80vw;
  max-width: 21.875rem;
  height: 28.125rem;
  overflow: hidden;
  border-radius: 0.625rem;
  box-shadow: 0.25rem 0.25rem 0.5rem rgba(0, 0, 0, 0.25);
}

.card>* {
  grid-column: 1 / 2;
  grid-row: 1 / 2;
}

.card__background {
  object-fit: cover;
  max-width: 100%;
  height: 100%;
  background-color: black;
}

.card__content {
  --flow-space: 0.9375rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-self: flex-end;
  align-items: center;
  height: 55%;
  padding: 12% 1.25rem 1.875rem;
  background: linear-gradient(180deg,
      hsla(0, 0%, 0%, 0) 0%,
      hsla(0, 0%, 0%, 0.3) 10%,
      hsl(0, 0%, 0%) 100%);
}

.card__content--container {
  --flow-space: 1.25rem;
  color: white;
}

.card__title {
  position: relative;
  width: fit-content;
  text-align: center;
  width: -moz-fit-content;
  /* Prefijo necesario para Firefox  */
}

.card__title::after {
  content: "";
  position: absolute;
  height: 0.3125rem;
  width: calc(100% + 1.25rem);
  bottom: calc((1.25rem - 0.5rem) * -1);
  left: -1.25rem;
  background-color: var(--brand-color);
}

.card__button {
  padding: 0.75em 1.6em;
  width: fit-content;
  width: -moz-fit-content;
  /* Prefijo necesario para Firefox  */
  font-variant: small-caps;
  font-weight: bold;
  border-radius: 0.45em;
  border: none;
  background-color: var(--brand-color);
  font-family: var(--font-title);
  font-size: 1.125rem;
  color: var(--white);
  color: white;
  text-decoration: none;
}

.card__button:focus {
  outline: 2px solid black;
  outline-offset: -5px;
}

@media (any-hover: hover) and (any-pointer: fine) {
  .card__content {
    transform: translateY(62%);
    transition: transform 500ms ease-out;
    transition-delay: 500ms;
  }

  .card__title::after {
    opacity: 0;
    transform: scaleX(0);
    transition: opacity 1000ms ease-in, transform 500ms ease-out;
    transition-delay: 500ms;
    transform-origin: right;
  }

  .card__background {
    transition: transform 500ms ease-in;
  }

  .card__content--container> :not(.card__title),
  .card__button {
    opacity: 0;
    transition: transform 500ms ease-out, opacity 500ms ease-out;
  }

  .card:hover,
  .card:focus-within {
    transform: scale(1.05);
    transition: transform 500ms ease-in;
  }

  .card {
    transform: scale(1);
    transition: transform 500ms ease-out;
  }

  .card:hover .card__content,
  .card:focus-within .card__content {
    transform: translateY(0);
    transition: transform 500ms ease-in;
  }

  .card:focus-within .card__content {
    transition-duration: 0ms;
  }

  .card:hover .card__background,
  .card:focus-within .card__background {
    transform: scale(1.3);
  }

  .card:hover .card__content--container> :not(.card__title),
  .card:hover .card__button,
  .card:focus-within .card__content--container> :not(.card__title),
  .card:focus-within .card__button {
    opacity: 1;
    transition: opacity 500ms ease-in;
    transition-delay: 1000ms;
  }

  .card:hover .card__title::after,
  .card:focus-within .card__title::after {
    opacity: 1;
    transform: scaleX(1);
    transform-origin: left;
    transition: opacity 500ms ease-in, transform 500ms ease-in;
    transition-delay: 500ms;
  }
}
</style>
