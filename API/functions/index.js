const functions = require("firebase-functions");
const express = require("express");
const app = express();

app.get("/asking", (request, response)=>{
  const _response = [];

  const questions = [{"question": "BMW",
    "correct": 2},
  {"question": "Toyota",
    "correct": 3},
  {"question": "Mini",
    "correct": 0},
  {"question": "General Motors",
    "correct": 1},
  {"question": "Rolls-Royce",
    "correct": 0}];

  for (let i = 4; i >= 0; i--) {
    const min = Math.ceil(0);
    const max = Math.floor(i);

    const indexSelect = Math.floor(Math.random() * (max - min + 1)) + min;
    _response.push(questions[indexSelect]);
    questions.splice(indexSelect, 1);
  }

  response.send(_response);
});

exports.app = functions.https.onRequest(app);

