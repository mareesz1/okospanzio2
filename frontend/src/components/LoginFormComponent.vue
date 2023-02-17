<template>
    <form>
        <div class="input-group mx-5 my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Username</span>
            </div>
            <input id="username" name="username" v-model="username" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user1234">
        </div>
        <div class="input-group mx-5 mb-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="password" name="password" v-model="password" type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
        </div>
        <button type="submit" @click="encrypt(password)" class="btn btn-primary mx-5 mb-3">Login</button>
    </form>
    <div>
        <p id="encrypted"></p>
    </div>
</template>

<script setup>
    import {ref} from 'vue';
    import {sha512} from 'js-sha512';

    const encrypt = (input) => {
        const encryptedMessage = sha512(input);
        document.getElementById("encrypted").innerHTML = encryptedMessage;
    }

    const username = ref();
    const password = ref();
</script>

<style lang="css" scoped>
    span {
        width: 100px !important;
    }
</style>