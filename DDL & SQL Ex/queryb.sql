SELECT DISTINCT hname
FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum
WHERE (age >= 12 and age <= 19) 
ORDER BY hname;