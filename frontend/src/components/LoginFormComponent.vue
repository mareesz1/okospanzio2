<template>
    <div class="row justify-content-md-center">
    <div class="col-lg-6">
        <form>
            <div class="input-group mt-5">
                <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                </div>
                <input id="email" name="email" v-model="user.email" v-on:keyup.enter="authenticate()" type="email" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="user@email.com">
            </div>
            <div class="input-group mt-3 mb-4">
                <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
                </div>
                <input id="password" name="password" v-model="user.password" v-on:keyup.enter="authenticate()" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="********">
            </div>
            <div class="input-group mt-3 mb-4 w-50 center">
                <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">Role</span>
                </div>
                <select class="form-control text-center" v-model="user.roles">
                    <option value="guest">Guest</option>
                    <option value="employee">Employee</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <div class="input-group mx-auto my-3 w-50 center" v-if="user.roles != 'guest'">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">Code</span>
                </div>
                <input id="code" name="code" :class="{'is-invalid': errors.code != null}" v-model="user.code" v-on:keyup.enter="authenticate()" type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="****">
            <div class="invalid-feedback" v-for="c in errors.code" id="titleFeedback">{{ c }}</div>
        </div>
        </form>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-md-3 text-center">
                <button class="btn btn-primary" @click="authenticate()">Login</button>
            </div>
        </div>
        <!-- {{ email }}
        {{ password }} -->
        <!-- {{ isLoggedIn }} -->
        <div v-if="isLoggedIn.auth">
            <p>Login successful</p>
            <p>login time: {{ isLoggedIn.loginTime }}</p>
        </div>
        <div v-if="isLoggedIn.auth == false">
            <p>Login failed</p>
            <p v-if="isLoggedIn.message">{{ isLoggedIn.message }}</p>
        </div>
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
</style>