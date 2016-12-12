-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


create table player (id SERIAL PRIMARY KEY, name TEXT);

CREATE TABLE matches(id SERIAL PRIMARY KEY, winner INT, loser INT);

CREATE VIEW wins AS SELECT player.id, player.name, count(matches.winner) as win FROM player LEFT JOIN matches ON player.id = matches.winner
GROUP BY player.id ORDER BY win DESC;

CREATE VIEW total AS SELECT player.id, count(matches.id) as matches from player LEFT JOIN matches on player.id = matches.winner or player.id = matches.loser
GROUP BY player.id ORDER BY matches;