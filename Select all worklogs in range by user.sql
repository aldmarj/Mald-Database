SELECT workLogId, user, clientId, startTime, endTime, description 
FROM WorkLog 
WHERE startTime >= 1000 AND endTime <= 2000 AND user = "tuser"
ORDER BY starttime DESC limit 10;