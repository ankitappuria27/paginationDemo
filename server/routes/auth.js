let express = require('express');
let router = express.Router();
const { login } = require('../handlers/auth.handler');

router.post('/login', login);

module.exports = router;