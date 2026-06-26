const express = require("express");

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from simple SaaS-style AWS EC2 platform",
    app: "simple-saas-ec2",
    environment: process.env.APP_ENV || "dev"
  });
});

app.get("/health", (req, res) => {
  res.json({
    status: "healthy"
  });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});