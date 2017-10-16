CREATE TABLE Account (
	accountId int AUTO_INCREMENT,
    userName varchar(255) NOT NULL,
    userPassword varchar(255) NOT NULL,
    PRIMARY KEY (accountId)
);

CREATE TABLE Business (
	businessId int AUTO_INCREMENT,
    businessName varchar(255) NOT NULL,
    businessTag varchar(255),
    PRIMARY KEY (businessId)
);

CREATE TABLE Employee (
	employeeId int AUTO_INCREMENT,
    accountId int,
    firstName varchar(255) NOT NULL,
    surName varchar(255) NOT NULL,
    businessId int,
    parentId int,
    jobRole varchar(255),
    PRIMARY KEY (employeeId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
	FOREIGN KEY (businessId) REFERENCES Business(businessId),
    FOREIGN KEY (parentId) REFERENCES Employee(employeeId)
);

CREATE TABLE BusinessClient (
	clientId int AUTO_INCREMENT,
    clientName varchar(255) NOT NULL,
    businessId int,
    PRIMARY KEY (clientId),
    FOREIGN KEY (businessId) REFERENCES Business(businessId)
);

CREATE TABLE WorkLog (
	workLogId int AUTO_INCREMENT,
    employeeId int,
    clientId int,
    startTime long NOT NULL,
    endTime long NOT NULL,
    description varchar(255),
    PRIMARY KEY (workLogId),
    FOREIGN KEY (employeeId) REFERENCES Employee(employeeId),
    FOREIGN KEY (clientId) REFERENCES BusinessClient(clientId)
)