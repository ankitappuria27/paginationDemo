var express = require('express');
var router = express.Router();

/* GET home page. */

router.all('/*',(req,res)=> {
    res.send({status:404,message:'Not found'});
});

module.exports = router;
