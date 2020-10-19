
// all requires on the top of the file
const app = require('./express-app');
const server = require('http').createServer(app);
const { mysqlDB } = require('./models/db');

function init() {


    mysqlDB.connectDB()
        .then(() => {
            console.log('Connected to mysql db ******');
            const port = process.env.PORT || 3005;
            server.listen(port, (serverErr) => {
                if (serverErr) {
                    console.error(serverErr);
                } else {
                    console.log('Server has started on PORT: %s', port);
                }
            });

        })
        .catch((err) => {
            console.log('err connection  mysqlDd', err);
            process.exit(1);
        });



}

module.exports = {
    init
};
