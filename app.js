const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.write('Hello, World! Pela Web!');
  res.end();
}
);

app.listen(8080);