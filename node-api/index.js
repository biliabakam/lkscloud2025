const express = require('express');
const axios = require('axios');
const app = express();

app.use(express.json());

app.post('/ask', async (req, res) => {
    const { prompt } = req.body;
    try {
        const response = await axios.post('http://ml-service:5000/generate', { prompt });
        res.json(response.data);
    } catch (err) {
        res.status(500).send(err.message);
    }
});

app.listen(3000, () => console.log('API running on port 3000'));