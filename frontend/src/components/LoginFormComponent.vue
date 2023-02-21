<template>
    <div class="row justify-content-md-center">
    <div class="col-lg-6">
        <form>
            <div class="input-group mt-5">
                <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                </div>
                <input id="email" name="email" v-model="email" type="email" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user@email.com">
            </div>
            <div class="input-group mt-3 mb-4">
                <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
                </div>
                <input id="password" name="password" v-model="password" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
            </div>
        </form>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-md-3 text-center">
                <button class="btn btn-primary" @click="authenticate(email, password)">Login</button>
            </div>
            <div class="col-12 col-md-3 text-center">
                <button class="btn btn-warning">Logout</button>
            </div>
        </div>
        {{ email }}
        {{ password }}
    </div>
</template>

<script setup>
    import {ref} from 'vue';
    import {useUsersStore} from '../stores/index';
    
    const email = ref();
    const password = ref();
    const {authenticate} = useUsersStore();

</script>

<style lang="css" scoped>
    span {
        width: 100px !important;
    }
</style>