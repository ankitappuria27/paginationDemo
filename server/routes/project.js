let express = require('express');
let router = express.Router();
const { getProjectDetails } = require('../handlers/project.handler');

/* GET project list. */
router.get('/', getProjectDetails);

module.exports = router;