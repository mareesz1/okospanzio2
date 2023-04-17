<template>
    <div class="">
    <div class="d-inline-flex ">
    <img src="https://free4kwallpapers.com/uploads/originals/2015/06/16/hotel-in-santorini.jpg" class="image" alt="" id="image">
        <div class="form mt-5 justify-content-center">
        <form class="">
            <div class="header ">Bejelentkezés</div>
            <div class="inputs">
            <div class="input-group ">
                <input id="email" name="email" v-model="user.email" v-on:keyup.enter="authenticate()" type="email" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Email">
            </div>


            <div class="input-group">
                <input id="password" name="password" v-model="user.password" v-on:keyup.enter="authenticate()" type="password" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Jelszó">
            </div>


            <div class="input-group ">
                <select class="form-control text-center input" v-model="user.roles">
                    <option value="guest">Vendég</option>
                    <option value="staff">Alkalmazott</option>
                    <option value="admin">Admin</option>
                    <option value="restaurant">Éttermi alkalmazott</option>
                </select>
            </div>


            <div class="input-group " v-if="user.roles != 'guest'">
                <input id="code" name="code" :class="{'is-invalid': errors.code != null}" v-model="user.code" v-on:keyup.enter="authenticate()" type="password" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Kód">
            <div class="invalid-feedback" v-for="c in errors.code" id="titleFeedback">{{ c }}</div>
        </div>

        <button class="sigin-btn" @click="authenticate()">Bejelentkezek</button>
        <p class="signup-link mt-2">Még nincs fiókod?<router-link to="/register">Regisztrálj</router-link></p>
    </div>

        </form>
    </div>
    </div>
        </div>


       
        <!-- {{ email }}
        {{ password }} -->
        <!-- {{ isLoggedIn }} -->
        <div v-if="isLoggedIn.auth == false">
            <p>Login failed</p>
            <p v-if="isLoggedIn.message">{{ isLoggedIn.message }}</p>
        </div>
   
</template>

<script setup>
    import {storeToRefs} from 'pinia';
    import {useUsersStore} from '../stores/index';
    
    const {isLoggedIn, user, errors} = storeToRefs(useUsersStore());
    const {authenticate, logout} = useUsersStore();

</script>

<style lang="css" scoped>
    span {
        width: 100px !important;
    }

    .center {
        margin-left: auto;
        margin-right: auto;
    }

    @media (max-width: 767px)
    {
        .image{
            display: none;
        }
    }

    .image{
      width: 75%;
      aspect-ratio: 40/22;
    }
    .form {
  position: relative;
  display: flex;
  flex-direction: column;
  border-radius: 0.75rem;
  background-color: #fff;
  color: rgb(97 97 97);
  box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.05);
  width: 100%;
  background-clip: border-box;
}

.header {
  position: relative;
  background-clip: border-box;
  background-color: #1e88e5;
  background-image: linear-gradient(to top right, #51b7df, #16a4e6);
  margin: 10px;
  overflow: hidden;
  color: #fff;
  box-shadow: 0 0 #0000, 0 0 #0000, 0 0 #0000, 0 0 #0000,
    rgba(33, 150, 243, 0.4);
  height: 7rem;
  letter-spacing: 0;
  line-height: 1.375;
  font-weight: 600;
  font-size: 1.9rem;
  font-family: Roboto, sans-serif;
  display: flex;
  align-items: center;
  justify-content: center;
}

.inputs {
  padding: 1.5rem;
  gap: 1rem;
  display: flex;
  flex-direction: column;
}

.input-container {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  min-width: 200px;
  width: 100%;
  height: 2.75rem;
  position: relative;
}

.input {
  border: 1px solid rgba(128, 128, 128, 0.61);
  outline: 0;
  color: rgb(69 90 100);
  font-weight: 400;
  font-size: 0.9rem;
  line-height: 1.25rem;
  padding: 0.75rem;
  background-color: transparent;
  border-radius: 0.375rem;
  width: 100%;
  height: 100%;
}

.input:focus {
  border: 1px solid #1e88e5;
}



.sigin-btn {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 0.75rem;
  line-height: 1rem;
  text-align: center;
  padding: 0.75rem 1.5rem;
  background-color: #1e88e5;
  background-image: linear-gradient(to top right, #51b7df, #16a4e6);
  border-radius: 0.5rem;
  width: 100%;
  outline: 0;
  border: 0;
  color: #fff;
}
.sigin-btn:hover {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 0.75rem;
  line-height: 1rem;
  text-align: center;
  padding: 0.75rem 1.5rem;
  background-color: #b9deff;
  background-image: linear-gradient(to top right, #103cff, #577ef2);
  border-radius: 0.5rem;
  width: 100%;
  outline: 0;
  border: 0;
  color: #ffffff;
}

.signup-link {
  line-height: 1.5;
  font-weight: 300;
  font-size: 0.875rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.signup-link a{
  line-height: 1.5;
  font-weight: 700;
  font-size: 0.875rem;
  margin-left: 0.25rem;
  color: #28aed0;
}

</style>