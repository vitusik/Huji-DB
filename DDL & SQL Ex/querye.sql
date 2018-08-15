SELECT DISTINCT pname
FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum 
GROUP BY Person.pid
HAVING COUNT(*) >=2
ORDER BY pname;