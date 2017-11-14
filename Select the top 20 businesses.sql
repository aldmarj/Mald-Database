SELECT Business.businessName, Business.businessTag, COUNT(Employee.userName) employees
FROM Business
LEFT JOIN Employee ON Business.businessTag = Employee.BusinessTag
ORDER BY employees LIMIT 20;