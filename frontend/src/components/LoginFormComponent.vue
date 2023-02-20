<template>
    <form>
        <div class="input-group mx-5 my-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            </div>
            <input id="email" name="email" v-model="email" type="email" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user@email.com">
        </div>
        <div class="input-group mx-5 mb-3 w-25">
            <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            </div>
            <input id="password" name="password" v-model="password" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
        </div>
        <button type="submit" class="btn btn-primary mx-5 mb-3">Login</button>
    </form>
    <div>
        <p id="encrypted"></p>
    </div>
</template>

<script setup>
    import {ref} from 'vue';
    import {sha512} from 'js-sha512';

    
    const email = ref();
    const password = ref();
</script>

<style lang="css" scoped>
    span {
        width: 100px !important;
    }
</style>