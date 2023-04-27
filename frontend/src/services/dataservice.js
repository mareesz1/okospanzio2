import Axios from 'axios';

const api = Axios.create({
    // baseURL: 'http://bgs.jedlik.eu/mm/szakdoga_api/api/',
    baseURL: 'http://localhost:8000/api/',
    xsrfCookieName: 'XSRF-TOKEN',
    headers: {
        'Content-type': 'application/json',
        // 'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        // 'Access-Control-Allow-Origin': true,
    },

});
api.defaults.withCredentials = true;

const cookie = Axios.create({
    // baseURL: 'http://bgs.jedlik.eu/mm/szakdoga_api/',
    baseURL: 'http://localhost:8000/',
    headers: {
        'Content-type': 'application/json',
        // 'Accept': 'application/json',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': true,
    },
});
cookie.defaults.withCredentials = true;

export {api, cookie};