<template>
    <form>
    <div class="justify-content-between border">
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">First Name</span>
            </div>
            <input id="firstname" name="firstname" v-model="firstname" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Last Name</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Phone Number</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password confirmation</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-auto my-3 w-25">
            <button type="submit" @click="encrypt(password)" class="btn btn-primary mx-auto w-50">Register</button>
        </div>
    </div>
    </form>
</template>

<script setup>
    import {ref} from 'vue';
    import {sha512} from 'js-sha512';

    const password = ref();

    const encrypt = (input) => {
        const encryptedMessage = sha512(input);
        document.getElementById("encrypted").innerHTML = encryptedMessage;
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