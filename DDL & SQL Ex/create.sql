create TABLE Trip(
	tnum INTEGER PRIMARY KEY,
	location VARCHAR NOT NULL,
	duration INTEGER NOT NULL CHECK(duration >= 3),
	difficulty  INTEGER DEFAULT(5) CHECK(difficulty >= 1 AND difficulty <= 7),
	CHECK(duration > 6 and difficulty >= 3)
);

create TABLE Company(
	cid INTEGER PRIMARY KEY,
	name VARCHAR NOT NULL,
	estYear INTEGER NOT NULL
);

create TABLE Offer(
	tnum INTEGER,
	cid INTEGER,
	FOREIGN KEY (tnum) REFERENCES Trip(tnum) ON DELETE CASCADE ,
	FOREIGN KEY (cid) REFERENCES Company(cid) ON DELETE CASCADE 
);