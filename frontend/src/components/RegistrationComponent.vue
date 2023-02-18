<template>

    <div class="justify-content-between border">
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">First Name</span>
            </div>
            <input id="firstname" name="firstname" v-model="firstName" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Last Name</span>
            </div>
            <input id="username" name="lastname" v-model="lastName" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <span class="input-group-text" id="inputGroup-sizing-default">Gender</span>
                <select name="genderselect" id="genderselect" v-model="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            </div>
            <input id="username" name="email" v-model="email" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Phone Number</span>
            </div>
            <input id="username" name="phone" v-model="phone" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="username" name="password" v-model="password" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Confirm password</span>
            </div>
            <input id="username" name="passwordConfirmed" v-model="passwordConfirmed" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <button type="submit" @click="register(password)" class="btn btn-primary mx-auto w-50">Register</button>
        </div>
    </div>
    {{ passwordHash }}
</template>

<script setup>
    import {ref} from 'vue';
    import {sha512} from 'js-sha512';
    import {storeToRefs} from 'pinia';
    import {useUsersStore} from '../stores/index';
    
    let {user} = storeToRefs(useUsersStore());
    const {postNewRegistration} = useUsersStore();

    let firstName = ref();
    let lastName = ref();
    let gender = ref();
    let email = ref();
    let phone = ref();
    let password = ref();
    let passwordConfirmed = ref();
    let passwordHash = ref();

    function register(input) {
        passwordHash = sha512(input);
        console.log(passwordHash);
        user = {
            firstName: firstName.value,
            lastName: lastName.value,
            gender: gender.value,
            email: email.value,
            phone: phone.value,
            passwordHash: passwordHash,
        }
        console.log(user);
        postNewRegistration(user);
    }
</script>

<style lang="css" scoped>
    span {
        width: 200px !important;
    }

    input {
        width: 200px !important;
    }
</style>