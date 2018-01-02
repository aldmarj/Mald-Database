SELECT Employee.userName, firstName, surName, Employee.businessTag, parentUser, jobRole,
SUM(WorkLog.endTime - WorkLog.startTime) as hoursWorked
FROM Employee 
LEFT JOIN WorkLog ON Employee.userName = WorkLog.userName AND Employee.businessTag = WorkLog.businessTag 
AND WorkLog.startTime >= 2 AND WorkLog.endTime <= 20
WHERE Employee.businessTag = "cibusinesstag"
GROUP BY Employee.userName
ORDER BY hoursWorked DESC
LIMIT 10 OFFSET 0;