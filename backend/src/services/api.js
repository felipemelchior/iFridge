import axios from 'axios';

require('dotenv/config');

const api = axios.create({
  baseURL: 'https://nominatim.openstreetmap.org/search?format=json&q=',
});

export default api;
