import ballerina/io;

public function main() returns error? {
    io:println("Starting log processing from file to MySQL database...");
    
    // Process log from input file to database
    error? result = processLogFromFileToDatabase(filePath = inputFilePath);
    
    if result is error {
        io:println("Error processing log: ", result.message());
        return result;
    }
    
    io:println("Log processing completed successfully!");
}