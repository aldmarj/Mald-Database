USE EmployeeManagementv2_1;

DROP TABLE IF EXISTS LocationOwnertoLocation;
DROP TABLE IF EXISTS WorkLog;
DROP TABLE IF EXISTS BusinessClient;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS LocationOwner;
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

CREATE TABLE LocationOwner (
    locationOwnerId int AUTO_INCREMENT,
    PRIMARY KEY (locationOwnerId)
);

CREATE TABLE Location (
    locationId int AUTO_INCREMENT,
    postcode varchar(255) NOT NULL,
    description varchar(255),
    PRIMARY KEY (locationId)
);

CREATE TABLE Employee (
    userName varchar(255),
    firstName varchar(255) NOT NULL,
    surName varchar(255) NOT NULL,
    businessTag varchar(255) NOT NULL,
    parentUser varchar(255),
    jobRole varchar(255),
    PRIMARY KEY (userName, businessTag),
    CONSTRAINT fk_Employee_Account_uNBT FOREIGN KEY (userName, businessTag) 
		REFERENCES Account(userName, businessTag),
	CONSTRAINT fk_Employee_Business_businessTag FOREIGN KEY (businessTag) REFERENCES Business(businessTag),
    CONSTRAINT fk_Employee_Employee_employeeId FOREIGN KEY (parentUser) REFERENCES Employee(userName)
);

CREATE TABLE BusinessClient (
	clientId int AUTO_INCREMENT,
    clientName varchar(255) NOT NULL,
    businessTag varchar(255) NOT NULL,
    locationOwnerId int,
    PRIMARY KEY (clientId),
    CONSTRAINT fk_BusinessClient_Business_businessTag FOREIGN KEY (businessTag) REFERENCES Business(businessTag),
	CONSTRAINT fk_BusinessClient_LocationOwner_LocationOwnerId 
		FOREIGN KEY (locationOwnerId) REFERENCES LocationOwner(locationOwnerId)
);

CREATE TABLE WorkLog (
	workLogId int AUTO_INCREMENT,
    userName varchar(255),
    businessTag varchar(255),
    clientId int NOT NULL,
    startTime long NOT NULL,
    endTime long NOT NULL,
    description varchar(255),
    locationOwnerId int,
    PRIMARY KEY (workLogId),
    CONSTRAINT fk_WorkLog_Employee_uNBT FOREIGN KEY (userName, businessTag) 
		REFERENCES Employee(userName, businessTag),
    CONSTRAINT fk_WorkLog_BusinessClient_clientId FOREIGN KEY (clientId) REFERENCES BusinessClient(clientId),
	CONSTRAINT fk_WorkLog_LocationOwner_LocationOwnerId 
		FOREIGN KEY (locationOwnerId) REFERENCES LocationOwner(locationOwnerId)
);

CREATE TABLE LocationOwnertoLocation (
    locationOwnerId int,
    locationId int,
    PRIMARY KEY (locationOwnerId, locationId),
	CONSTRAINT fk_LocationOwnertoLocation_LocationOwner_locationOwnerId 
		FOREIGN KEY (locationOwnerId) REFERENCES LocationOwner(locationOwnerId),
	CONSTRAINT fk_LocationOwnertoLocation_Location_locationId 
		FOREIGN KEY (locationId) REFERENCES Location(locationId)
);
