SELECT pname
FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum
WHERE hname = 'Cooking' 
INTERSECT
SELECT pname
FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum
WHERE hname = 'Volleyball'
ORDER BY pname;