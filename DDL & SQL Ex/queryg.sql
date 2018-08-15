SELECT ol.hnum, oldest, youngest
FROM
	(
		SELECT hnum ,pname as oldest
		FROM (Person inner join Hobbies on Person.pid = Hobbies.pid ) as T
		WHERE age >=
					(
						SELECT max(age)
						FROM Person inner join Hobbies on Person.pid = Hobbies.pid
						WHERE T.hnum = hnum
					)
		and
			T.pname = (
						SELECT min(pname) 
						FROM Person inner join Hobbies on Person.pid = Hobbies.pid and T.hnum = hnum
						WHERE age >= 
									(
										SELECT max(age) 
										FROM Person inner join Hobbies on Person.pid = Hobbies.pid and T.hnum = hnum
									)
			)
	)as ol
	inner join 
	(
		SELECT hnum ,pname as youngest
		FROM (Person inner join Hobbies on Person.pid = Hobbies.pid ) as T
		WHERE age <=
					(
						SELECT min(age)
						FROM Person inner join Hobbies on Person.pid = Hobbies.pid
						WHERE T.hnum = hnum
					)
		and
			T.pname = 
					(
						SELECT min(pname) 
						FROM Person inner join Hobbies on Person.pid = Hobbies.pid and T.hnum = hnum
						WHERE age <= 
									(
										SELECT min(age) 
										FROM Person inner join Hobbies on Person.pid = Hobbies.pid and T.hnum = hnum
									)
					)		
	)as yo 
	on ol.hnum = yo.hnum
ORDER BY ol.hnum;
 
