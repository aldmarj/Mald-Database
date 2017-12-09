USE EmployeeManagementv2;

SELECT Location.locationId, postcode, description FROM Location 
LEFT JOIN LocationOwnertoLocation ON Location.locationId = LocationOwnertoLocation.locationId
LEFT JOIN LocationOwner ON LocationOwnertoLocation.locationOwnerId = LocationOwner.locationOwnerId
WHERE LocationOwner.locationOwnerId = 1;

