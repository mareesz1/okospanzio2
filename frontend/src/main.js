import { createApp } from 'vue'
import App from './App.vue'
import {createPinia} from 'pinia';
import router from './router';

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.bundle.js';

const app = createApp(App);

app.use(createPinia());
app.use(router);

export const piniaStore = createPinia();

app.mount('#app');
