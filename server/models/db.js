

const mysql = require('mysql');
let mySQLConnection;
const config = require('../../config/config');
const { host, port, userName, password, dataBaseName } = config.dataBase;


const mysqlDB = {
    connectDB:()=>{
        return new Promise((resolve, reject) => {
            let connectionStr = mysql.createConnection({ host, port, user: userName, password, database: dataBaseName });
            connectionStr.connect((err, sqlConnection) => {
    
                if (err) {
                    console.log('Error connecting DB', err);
                    return reject(err);
                }
                mySQLConnection = connectionStr;
                return resolve(sqlConnection);
            });
        });
    
    },
    query: (queryString) => {
        return new Promise((resolve, reject) => {
            mySQLConnection.query(queryString, (err, result) => {
                if (err) {
                    return reject(err);
                }

                return resolve(result);

            });
        });
    }
};

module.exports = {
    
    mysqlDB
};

