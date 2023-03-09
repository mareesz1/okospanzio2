<template>

    <div class="col-12 col-md-8 justify-content-between">
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">First Name</span>
            </div>
            <input id="firstname" :class="{'is-invalid': errors.firstName != null}" name="firstname" v-model="user.firstName" v-on:keyup.enter="register(password)" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Kovács">
            <div class="invalid-feedback" v-for="f in errors.firstName" id="titleFeedback">{{ f }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Last Name</span>
            </div>
            <input id="lastname" name="lastname" :class="{'is-invalid': errors.lastName != null}" v-model="user.lastName" v-on:keyup.enter="register(password)" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="János">
            <div class="invalid-feedback" v-for="l in errors.lastName" id="titleFeedback">{{ l }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <span class="input-group-text" id="inputGroup-sizing-default">Gender</span>
                <select class="w-25 text-center form-control" name="genderselect" id="genderselect" v-model="user.gender" v-on:keyup.enter="register(password)">
                <!-- <select name="genderselect" id="genderselect" v-model="gender"> -->
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="deer">Deer</option>
                    <option value="helicopter">Helicopter</option>
                </select>
                <div class="invalid-feedback" v-for="g in errors.gender" id="titleFeedback">{{ g }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            </div>
            <input id="email" :class="{'is-invalid': errors.email != null}" name="email" v-model="user.email" v-on:keyup.enter="register(password)" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="kovacsjanos@mailprovider.com">
            <div class="invalid-feedback" v-for="e in errors.email" id="titleFeedback">{{ e }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Phone Number</span>
            </div>
            <input id="phone" name="phone" :class="{'is-invalid': errors.phone != null}" v-model="user.phone" v-on:keyup.enter="register(password)" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="+36 20 407 7736">
            <div class="invalid-feedback" v-for="p in errors.phone" id="titleFeedback">{{ p }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="password" name="password" :class="{'is-invalid': errors.passwordHash != null}" v-model="password" v-on:keyup.enter="register(password)" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
            <div class="invalid-feedback" v-for="pw in errors.passwordHash" id="titleFeedback">{{ pw }}</div>
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Confirm password</span>
            </div>
            <input id="passwordConfirmed" name="passwordConfirmed" v-model="passwordConfirmed" v-on:keyup.enter="register(password)" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
        </div>
        <div class="input-group mx-auto my-3 w-50">
            <span class="input-group-text" id="inputGroup-sizing-default">Role</span>
                <select class="w-25 text-center form-control" name="roleselect" id="roleselect" v-model="user.roles" v-on:keyup.enter="register(password)">
                <!-- <select name="genderselect" id="genderselect" v-model="gender"> -->
                    <option value="guest">Guest</option>
                    <option value="employee">Employee</option>
                    <option value="admin">Admin</option>
                </select>
        </div>
        <!-- <div class="input-group mx-auto my-3 w-25">
            <button type="submit" @click="register(password)" class="btn btn-primary mx-auto w-50">Register</button>
        </div> -->
        <!-- <p class="text-center display-3" v-if="passwordError">Passwords dont match</p> -->
        <p id="passwordError" class="display-5" v-if="!(password === passwordConfirmed)">PASSWORD ERROR</p>
        <div class="input-group mx-auto my-3 w-50" v-if="user.roles != 'guest'">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Employee/admin code</span>
            </div>
            <input id="code" name="code" :class="{'is-invalid': errors.code != null}" v-model="user.code" v-on:keyup.enter="register(password)" type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="****">
            <div class="invalid-feedback" v-for="c in errors.code" id="titleFeedback">{{ c }}</div>
        </div>
        <div v-if="user.registrationSuccessful" class="text-center my-auto mt-4" id="regComplete">
            <label class="display-5" for="">Registration successful!</label>
        </div>
        <register-button @click="register(password)"/>
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
        font-weight: bolder;
    }
    #regComplete{
        color: green;
    }
</style>