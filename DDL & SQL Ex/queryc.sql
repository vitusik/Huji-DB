SELECT P.pname
FROM Person P
WHERE NOT EXISTS
				(
					SELECT *
					FROM 
						(
							SELECT H.hnum
							FROM (Person inner join Hobbies on Person.pid = Hobbies.pid) as H
							WHERE H.pname = 'Idan'
						) AS  IdanHob
					WHERE IdanHob.hnum NOT IN
										(
											SELECT H.hnum
											FROM Hobbies H
											WHERE P.pid = H.pid
										)
				)
ORDER BY pname;
