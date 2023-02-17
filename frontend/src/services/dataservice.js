import Axios from 'axios';

const instance = Axios.create({
    baseURL: 'http://localhost:8000/api',
    headers: {
        'Content-type': 'application/json',
        
    },

});

export default instance;