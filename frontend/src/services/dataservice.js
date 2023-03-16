import Axios from 'axios';

const api = Axios.create({
    baseURL: 'http://localhost:8000/api/',
    withCredentials: true,
    headers: {
        'Content-type': 'application/json',
        
    },

});

const cookie = Axios.create({
    baseURL: 'http://localhost:8000/',
    headers: {
        'Content-type': 'application/json',

    },
});

export {api, cookie};