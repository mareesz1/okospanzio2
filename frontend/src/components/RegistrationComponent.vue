<template>

    <div class="justify-content-between">
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">First Name</span>
            </div>
            <input id="firstname" name="firstname" v-model="user.firstName" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="Kovács">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Last Name</span>
            </div>
            <input id="lastname" name="lastname" v-model="user.lastName" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="János">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <span class="input-group-text" id="inputGroup-sizing-default">Gender</span>
                <select class="w-25 text-center form-control" name="genderselect" id="genderselect" v-model="user.gender">
                <!-- <select name="genderselect" id="genderselect" v-model="gender"> -->
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="deer">Deer</option>
                    <option value="helicopter">Helicopter</option>
                </select>
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            </div>
            <input id="email" name="email" v-model="user.email" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="kovacsjanos@mailprovider.com">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Phone Number</span>
            </div>
            <input id="phone" name="phone" v-model="user.phone" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="+36 20 407 7736">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="password" name="password" v-model="password" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Confirm password</span>
            </div>
            <input id="passwordConfirmed" name="passwordConfirmed" v-model="passwordConfirmed" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <span class="input-group-text" id="inputGroup-sizing-default">Role</span>
                <select class="w-25 text-center form-control" name="roleselect" id="roleselect" v-model="user.roles">
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
        <div class="input-group mx-auto my-3 w-25" v-if="user.roles != 'guest'">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Employee/admin code</span>
            </div>
            <input id="code" name="code" v-model="user.code" type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="****">
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
    
    const {user} = storeToRefs(useUsersStore());
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
                postNewRegistration(user, passwordHash);
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
    span {
        width: 200px !important;
    }

    input {
        width: 200px !important;
    }
    #passwordError{
        color: red;
        font-weight: bolder;
    }
</style>