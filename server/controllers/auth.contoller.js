const { mysqlDB } = require('../models/db');
const config = require('../../config/config');
const md5 = require('md5');

const authController = {};
authController.login = (body) => new Promise((resolve, reject) => {
    console.log("inside authContoller login:");
    let { userName, password } = body;
    const userQuery = `SELECT ilance_users.user_id, ilance_users.username,ilance_users.salt,ilance_users.password FROM ilance_users WHERE username = '${userName}';`;
    mysqlDB.query(userQuery).
        then((userQuery) => {
            password = md5(md5(password) + userQuery[0].salt);
            if (userQuery && userQuery[0] && userQuery[0].password == password) {
                let data = {
                    user_id: userQuery[0].user_id,
                    username: userQuery[0].username
                }
                return resolve({
                    success: true,
                    message: 'Logged in successfully!',
                    data: data
                });
            } else {
                return reject({
                    success: false,
                    message: 'Please enter valid email or password.',
                });
            }

        }).catch((err) => {
            return reject(err);
        });

});

module.exports = authController;