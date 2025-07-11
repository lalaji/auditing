import ballerinax/mysql;
import ballerinax/mysql.driver as _;

// MySQL client initialization with SSL configuration
final mysql:Client mysqlClient = check new (
    host = dbHost,
    user = dbUser,
    password = dbPassword,
    database = dbName,
    port = dbPort,
    options = {
        ssl: {
            mode: mysql:SSL_REQUIRED,
            cert: {
                path: caCertPath,
                password: caCertPassword
            }
        }
    }
);