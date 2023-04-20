<template>
       <img src="https://wallup.net/wp-content/uploads/2019/09/46190-hotel-malvivy-pool-interior-ocean-sea-houses-buildings-sky-sunset-5.jpg" class="image" alt="">


    <div class="">
    <div class="d-flex justify-content-center">
        <div class="form justify-content-center my-5">
        <div class="header">Regisztráció</div>
        <div class="inputs">
        <div class="input-group ">
            <input id="firstname" :class="{'is-invalid': errors.firstName != null}" name="firstname" v-model="user.firstName" v-on:keyup.enter="register(password)" type="text" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Keresztnév">
            <div class="invalid-feedback" v-for="f in errors.firstName" id="titleFeedback">{{ f }}</div>
        </div>



        <div class="input-group">
            <input id="lastname" name="lastname" :class="{'is-invalid': errors.lastName != null}" v-model="user.lastName" v-on:keyup.enter="register(password)" type="text" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Vezetéknév">
            <div class="invalid-feedback" v-for="l in errors.lastName" id="titleFeedback">{{ l }}</div>
        </div>



        <div class="input-group ">
                <select class="w-25 text-center form-control input" name="genderselect" id="genderselect" v-model="user.gender" v-on:keyup.enter="register(password)">
                <!-- <select name="genderselect" id="genderselect" v-model="gender"> -->
                    <option value="male">Férfi</option>
                    <option value="female">Nő</option>
                </select>
                <div class="invalid-feedback" v-for="g in errors.gender" id="titleFeedback">{{ g }}</div>
        </div>



        <div class="input-group ">
            <input id="email" :class="{'is-invalid': errors.email != null}" name="email" v-model="user.email" v-on:keyup.enter="register(password)" type="email" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Email">
            <div class="invalid-feedback" v-for="e in errors.email" id="titleFeedback">{{ e }}</div>
        </div>


        <div class="input-group ">
            <input id="phone" name="phone" :class="{'is-invalid': errors.phone != null}" v-model="user.phone" v-on:keyup.enter="register(password)" type="tel" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Telefonszám">
            <div class="invalid-feedback" v-for="p in errors.phone" id="titleFeedback">{{ p }}</div>
        </div>


        <div class="input-group ">
            <input id="password" name="password" :class="{'is-invalid': errors.passwordHash != null}" v-model="password" v-on:keyup.enter="register(password)" type="password" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Jelszó">
            <div class="invalid-feedback" v-for="pw in errors.passwordHash" id="titleFeedback">{{ pw }}</div>
        </div>


        <div class="input-group ">
            <input id="passwordConfirmed" name="passwordConfirmed" v-model="passwordConfirmed" v-on:keyup.enter="register(password)" type="password" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Jelszó mégegyszer">
        </div>
        <label for="passwordConfirmed" id="passwordError" v-if="!(password === passwordConfirmed)">A jelszavaknak egyeznie kell</label>



        <div class="input-group ">
                <select class="w-25 text-center form-control input" name="roleselect" id="roleselect" v-model="user.roles" v-on:keyup.enter="register(password)">
                <!-- <select name="genderselect" id="genderselect" v-model="gender"> -->
                    <option value="guest">Vendég</option>
                    <option value="employee">Alkalmazott</option>
                    <option value="admin">Admin</option>
                </select>
        </div>
        <!-- <div class="input-group mx-auto my-3 w-25">
            <button type="submit" @click="register(password)" class="btn btn-primary mx-auto w-50">Register</button>
        </div> -->
        <!-- <p class="text-center display-3" v-if="passwordError">Passwords dont match</p> -->
        <div class="input-group " v-if="user.roles != 'guest'">
            <input id="code" name="code" :class="{'is-invalid': errors.code != null}" v-model="user.code" v-on:keyup.enter="register(password)" type="password" class="form-control input" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Kód">
            <div class="invalid-feedback" v-for="c in errors.code" id="titleFeedback">{{ c }}</div>
        </div>


        <div v-if="user.registrationSuccessful" class="text-center my-auto mt-4" id="regComplete">
            <label class="display-5" for="">Registration successful!</label>
        </div>


        <button class="sigin-btn" @click="register(password)">Regisztrálok</button>
        <p class="signup-link">Van már fiókod?<router-link to="/login">Jelentkezz be</router-link></p>
    </div>
    </div>
     </div>
    </div>
</template>

<script setup>
import RegisterButton from '../components/RegisterButtonComponent.vue';
    import {ref} from 'vue';
    import {sha512} from 'js-sha512';
    import {storeToRefs} from 'pinia';
    import {useUsersStore} from '../stores/index';
    
    const {user, errors} = storeToRefs(useUsersStore());
    const {postNewRegistration} = useUsersStore();

    let password = ref();
    let passwordConfirmed = ref();
    let passwordHash = ref();
    let passwordError = ref();

    passwordError.value = false;

    function register(input) { // password encryption and post request
        if (password.value == passwordConfirmed.value) {
            passwordError.value = false;
            passwordHash = sha512(input);
            try {
                // user.passwordHash = passwordHash;
                postNewRegistration(passwordHash);
                } catch (error) {
                    console.log(error);
                }
            }
            else {
                passwordError = true;
            }
    }
</script>

<style lang="css" scoped>
    /* span {
        width: 200px !important;
    }

    input {
        width: 200px !important;
    } */
    #passwordError{
        color: red;
        font-size: small;
    }
    #regComplete{
        color: green;
    }

    @media (max-width: 767px)
    {
        .image{
            display: none;
        }
    }

    .image {
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  background-size: cover;
  position: fixed;
  z-index: -4;
  filter: blur(15%);
  filter: brightness(40%);
}
    .form {
  position: relative;
  display: flex;
  flex-direction: column;
  border-radius: 0.75rem;
  background-color: #fff;
  color: rgb(97 97 97);
  box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.05);
  width: 25rem;
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