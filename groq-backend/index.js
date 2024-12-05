const express = require('express');
const Groq = require('groq-sdk');

const app = express();
const port = 3000;

const groq = new Groq({ apiKey: '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', dangerouslyAllowBrowser: true });

app.use(express.json());

app.post('/symptom-checker', async (req, res) => {
    const { symptoms } = req.body;

    const fullPrompt = `
    You are an AI-powered symptom checker assistant. Analyze the symptoms provided: ${symptoms}
    `;

    try {
        const response = await groq.chat.completions.create({
            messages: [{ role: 'user', content: fullPrompt }],
            model: 'llama3-8b-8192',
            temperature: 0.2,
            max_tokens: 1024,
            top_p: 1,
            stream: false,
            stop: null,
        });
        res.json(response);
    } catch (err) {
        res.status(500).json({ error: 'Error fetching symptom analysis', details: err.message });
    }
});

app.listen(port, () => {
    console.log(`Groq API backend running at http://localhost:${port}`);
});
