CREATE TABLE location (
  locid SERIAL primary key,
  name character varying(30) NOT NULL
);

CREATE TABLE player (
  pid SERIAL primary key,
  firstname varchar NOT NULL,
  lastname varchar NOT NULL,
  nickname varchar NOT NULL,
  rating integer DEFAULT 0 NOT NULL,
  inactive smallint DEFAULT 0 NOT NULL
);

CREATE TABLE match (
  matchid SERIAL primary key,
  winnerId integer references player(pid) NOT NULL,
  loserId integer references player(pid) NOT NULL,
  WinnerScore integer,
  LoserScore integer,
  locationid integer NOT NULL,
  time timestamp without time zone NOT NULL,
  CHECK (((WinnerScore is NULL) and (LoserScore is NULL)) or (((WinnerScore is not NULL) and (LoserScore is not NULL) and WinnerScore > LoserScore)))
);

CREATE TABLE top (
  pid integer references player(pid) NOT NULL
);
