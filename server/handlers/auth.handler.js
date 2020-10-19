const authController = require('../controllers/auth.contoller');
const login = (req, res) => {
    console.log('inside auth hadler:::');
  
    if(!req.body.userName){
        res.status(400);
        return res.send({
            success: false,
            message: 'userName is required',
        });
    }

    if(!req.body.password){
        res.status(400);
        return res.send({
            success: false,
            message: 'password is required',
        });
    }

    authController.login(req.body)
        .then((loginRes) => {
            req.session.user = loginRes.data;
            res.status(200);
            res.send(loginRes);
        })
        .catch((error) => {
            console.log(' Error occured while login user.', error);
            res.status(400);
            res.send({
                success: false,
                message: 'Please enter correct email or password.',
                full_message: error
            });
        });
};

module.exports = { login };