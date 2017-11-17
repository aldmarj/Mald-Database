DROP TABLE IF EXISTS WorkLog;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS BusinessClient;

DROP TABLE IF EXISTS Business;
DROP TABLE IF EXISTS Account;

CREATE TABLE Account (
    userName varchar(255),
    userPassword varchar(255) NOT NULL,
	businessTag varchar(255) NOT NULL,
    email varchar(255),
    PRIMARY KEY (userName, businessTag)
);

CREATE TABLE Business (
    businessTag varchar(255),
    businessName varchar(255) NOT NULL,
    PRIMARY KEY (businessTag)
);

CREATE TABLE Employee (
    userName varchar(255),
    firstName varchar(255) NOT NULL,
    surName varchar(255) NOT NULL,
    businessTag varchar(255) NOT NULL,
    parentUser varchar(255),
    jobRole varchar(255),
    PRIMARY KEY (userName, businessTag),
    CONSTRAINT fk_Employee_Account_uNBT FOREIGN KEY (userName, businessTag) REFERENCES Account(userName, businessTag),
	CONSTRAINT fk_Employee_Business_businessTag FOREIGN KEY (businessTag) REFERENCES Business(businessTag),
    CONSTRAINT fk_Employee_Employee_employeeId FOREIGN KEY (parentUser) REFERENCES Employee(userName)
);

CREATE TABLE BusinessClient (
	clientId int AUTO_INCREMENT,
    clientName varchar(255) NOT NULL,
    businessTag varchar(255) NOT NULL,
    PRIMARY KEY (clientId),
    CONSTRAINT fk_BusinessClient_Business_businessTag FOREIGN KEY (businessTag) REFERENCES Business(businessTag)
);

CREATE TABLE WorkLog (
	workLogId int AUTO_INCREMENT,
    user varchar(255) NOT NULL,
    clientId int NOT NULL,
    startTime long NOT NULL,
    endTime long NOT NULL,
    description varchar(255),
    PRIMARY KEY (workLogId),
    CONSTRAINT fk_WorkLog_Employee_userName FOREIGN KEY (user) REFERENCES Employee(userName),
    FOREIGN KEY (clientId) REFERENCES BusinessClient(clientId)
);