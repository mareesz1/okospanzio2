<template>
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid z-100">
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto">
          <li class="nav-item p-2">
            <router-link to="/">Főoldal</router-link>
          </li>
          <li class="nav-item p-2">
            <router-link to="/rooms">Szobák</router-link>
          </li>
          <li class="nav-item p-2">
            <router-link to="/reserve">Foglalás</router-link>
          </li>
          <li
            class="nav-item p-2"
            v-if="
              isLoggedIn.roles == 'admin' || isLoggedIn.roles == 'restaurant'
            "
          >
            <router-link to="/restaurant">Étterem</router-link>
          </li>
        </ul>
      </div>

      <div class="mx-auto alias" v-if="isLoggedIn.auth == true">
        Bejelentkezve, mint: {{ isLoggedIn.roles }}
      </div>

          <div class="nav-item p-2" id="login" v-if="!isLoggedIn.auth">
            <router-link to="/login">Bejelentkezés</router-link>
          </div>
          <!-- <div class="nav-item p-2" v-if="!isLoggedIn.auth">
            <router-link to="/register">Regisztráció</router-link>
          </div> -->

      <div class="btn-group dropstart nav-item mx-3" id="profil" v-show="isLoggedIn.auth">
        <button
          class="btn "
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          <svg
            fill="#6b7173"
            version="1.1"
            id="Layer_1"
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            width="2rem"
            height="2rem"
            viewBox="796 796 200 200"
            enable-background="new 796 796 200 200"
            xml:space="preserve"
          >
            <path
              d="M896,796c-55.14,0-99.999,44.86-99.999,100c0,55.141,44.859,100,99.999,100c55.141,0,99.999-44.859,99.999-100
	C995.999,840.86,951.141,796,896,796z M896.639,827.425c20.538,0,37.189,19.66,37.189,43.921c0,24.257-16.651,43.924-37.189,43.924
	s-37.187-19.667-37.187-43.924C859.452,847.085,876.101,827.425,896.639,827.425z M896,983.86
	c-24.692,0-47.038-10.239-63.016-26.695c-2.266-2.335-2.984-5.775-1.84-8.82c5.47-14.556,15.718-26.762,28.817-34.761
	c2.828-1.728,6.449-1.393,8.91,0.828c7.706,6.958,17.316,11.114,27.767,11.114c10.249,0,19.69-4.001,27.318-10.719
	c2.488-2.191,6.128-2.479,8.932-0.711c12.697,8.004,22.618,20.005,27.967,34.253c1.144,3.047,0.425,6.482-1.842,8.817
	C943.037,973.621,920.691,983.86,896,983.86z"
            />
          </svg>
        </button>

        <ul class="dropdown-menu px-2">
          <li><a class="dropdown-item" href="/bills">Számláim</a></li>
          <li>
            <a class="dropdown-item" href="/myservices">Szolgáltatásaim</a>
          </li>
          <li class="dropdown-item" v-if="isLoggedIn.roles == 'admin'">
            <router-link to="/admin" class="dropdown-item">Admin felület</router-link>
          </li>
          <li><hr class="dropdown-divider" /></li>
          <li>
            
            <a class="dropdown-item" type="button" @click="logout"
              >Kijelentkezés</a
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { storeToRefs } from "pinia";
import { useUsersStore } from "../stores/index";

let { isLoggedIn } = storeToRefs(useUsersStore());
const { logout } = useUsersStore();


</script>

<style lang="css" scoped>
/* a {
        text-decoration: none;
        color: black;
        font-size: 2em;
        margin-left: 1em;
    } */
@import url("https://fonts.googleapis.com/css?family=Titillium+Web:400,600");


body {
  background: #212121;
  padding: 50px 0;
}

@media (max-width: 767px) {
  #login{
    margin: auto;
  }

  .alias{
    display: none;
  }
}

.dropdown-menu {
  font-size: 1%;
}
.icon {
  width: 2rem;
  height: 2rem;
}

.nav-item {
  font-family: "Titillium Web";
  text-transform: uppercase;
  text-align: center;
  font-weight: 600;
}

.nav-item * {
  box-sizing: border-box;
  transition: all 0.35s ease;
}

.nav-item li {
  display: inline-block;
  list-style: outside none none;
  margin: 0.5em 1em;
  padding: 0;
}

.nav-item a {
  padding: 0.5em 0.8em;
  color: rgba(0, 0, 0, 0.5);
  position: relative;
  text-decoration: none;
  font-size: 20px;
}

.nav-item a::before,
.nav-item a::after {
  content: "";
  height: 14px;
  width: 14px;
  position: absolute;
  transition: all 0.35s ease;
  opacity: 0;
}

.nav-item a::before {
  content: "";
  right: 0;
  top: 0;
  border-top: 3px solid #00c3ff;
  border-right: 3px solid #00c3ff;
  transform: translate(-100%, 50%);
}

.nav-itemv a:after {
  content: "";
  left: 0;
  bottom: 0;
  border-bottom: 3px solid #00c3ff;
  border-left: 3px solid #00c3ff;
  transform: translate(100%, -50%);
}

.nav-item a:hover:before,
.nav-item a:hover:after {
  transform: translate(0, 0);
  opacity: 1;
}

.nav-item a:hover {
  color: #00c3ff;
}

ul li {
  display: inline;
  list-style-type: none;
}
</style>
