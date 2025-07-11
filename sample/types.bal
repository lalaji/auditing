// Record to represent the JSON structure from input file
public type LogInput record {|
    string message;
    string? level?;
    string? timestamp?;
|};

// Record to represent log entry for database
public type LogEntry record {|
    string logMessage;
    string logLevel;
    string createdAt;
|};