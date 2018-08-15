SELECT DISTINCT hname
FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum 
GROUP BY Hobby.hnum
HAVING AVG(age) <= ALL(SELECT AVG(age)
                       FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum 
                       GROUP BY Hobby.hnum)
ORDER BY hname;