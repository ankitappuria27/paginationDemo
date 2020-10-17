let express = require('express');
let router = express.Router();
const {getProjectDetails} = require('../handlers/project.handler') 
/* GET users listing. */
router.get('/', getProjectDetails);

module.exports = router;