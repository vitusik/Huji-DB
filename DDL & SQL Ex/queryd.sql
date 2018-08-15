SELECT H2.hname
FROM 
(
	(
		SELECT hname, Hobbies.hnum
		FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum 
		EXCEPT
		SELECT hname, Hobbies.hnum
		FROM Person inner join Hobbies on Person.pid = Hobbies.pid inner join Hobby on Hobbies.hnum = Hobby.hnum 
		WHERE frequency <  3
	)
	UNION ALL
	(
		SELECT hname,Hobby.hnum
		FROM
		(
			Hobby 
			inner join
			(
				SELECT hnum
				FROM Hobby 
				EXCEPT 
				SELECT hnum
				FROM Hobbies
			) AS H on Hobby.hnum = H.hnum
		)
	) 
)as H2
ORDER BY hname;
	