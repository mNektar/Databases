const express = require('express');
const userController = require('../controllers/userController');
const path = require("path");
const router = express.Router();



router.get('/',userController.welcome)

router.post('/auth',userController.login);

router.get('/register',(req, res) => {
  res.sendFile(path.join(__dirname, '/register.html')); });

router.post('/sign-up',userController.signUp);

router.get('/homePage',userController.homePage);

module.exports = router;