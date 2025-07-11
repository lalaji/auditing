import ballerina/io;
import ballerina/sql;


// Function to read JSON from file and extract log message
public function readLogFromFile(string filePath) returns LogInput|error {
    json jsonContent = check io:fileReadJson(path = filePath);
    LogInput logInput = check jsonContent.cloneWithType(LogInput);
    return logInput;
}

// Function to insert log entry into MySQL database
public function insertLogToDatabase(LogInput logInput) returns error? {
    string currentTime = "2025-07-11 09:01:54";
    string? levelValue = logInput?.level;
    string logLevel = levelValue ?: "INFO";
    
    sql:ParameterizedQuery insertQuery = `
        INSERT INTO logs (id,log_message, log_level, created_at) 
        VALUES (1,${logInput.message}, ${logLevel}, ${currentTime})
    `;
    
    sql:ExecutionResult result = check mysqlClient->execute(sqlQuery = insertQuery);
    io:println("Log inserted successfully with ID: ", result.lastInsertId);
}

// Function to process log from file to database
public function processLogFromFileToDatabase(string filePath) returns error? {
    LogInput logInput = check readLogFromFile(filePath = filePath);
    check insertLogToDatabase(logInput = logInput);
    io:println("Successfully processed log from file: ", filePath);
}