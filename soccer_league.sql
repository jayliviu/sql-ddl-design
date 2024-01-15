DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE seasons (
   id SERIAL PRIMARY KEY,

   start_date DATE NOT NULL,
   end_date DATE NOT NULL
);

CREATE TABLE teams (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   city TEXT NOT NULL
);

CREATE TABLE players (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   birthday DATE NOT NULL,
   height FLOAT NOT NULL,
   current_team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE referees (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL
);

CREATE TABLE matches (
   id SERIAL PRIMARY KEY,
   home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
   away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
   location TEXT NOT NULL,
   game_date DATE NOT NULL,
   start_time TIME NOT NULL,
   season_id INTEGER REFERENCES seasons ON DELETE CASCADE,
   head_referee_id INTEGER REFERENCES referees ON DELETE CASCADE,
   assistant_referee_1_id INTEGER REFERENCES referees ON DELETE CASCADE,   
   assistant_referee_2_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE results(
   id SERIAL PRIMARY KEY,
   team_id INTEGER REFERENCES teams ON DELETE CASCADE,
   match_id INTEGER REFERENCES teams ON DELETE CASCADE,
   result TEXT NOT NULL
);

CREATE TABLE goals (
   id SERIAL PRIMARY KEY,
   player_id INTEGER REFERENCES players ON DELETE CASCADE,
   match_id INTEGER REFERENCES matches ON DELETE CASCADE 
);

CREATE TABLE lineups (
   id SERIAL PRIMARY KEY,
   player_id INTEGER REFERENCES players ON DELETE CASCADE,
   match_id INTEGER REFERENCES matches ON DELETE CASCADE,
   team_id INTEGER REFERENCES teams ON DELETE CASCADE
);


INSERT INTO seasons
   (start_date, end_date)
VALUES
   ('2023-01-01', '2023-04-01'),
   ('2023-07-01', '2023-10-01'),
   ('2024-01-01', '2024-04-01');

INSERT INTO teams
   (name, city)
VALUES
   ('American River', 'Folsom'),
   ('Synergy', 'Folsom'),
   ('Ethos', 'EL Dorado Hills'),
   ('Placer United', 'Placerville'),
   ('Bulldogs', 'Vacaville'),
   ('Turlock', 'Toronto'),
   ('UFC Davis', 'Davis'),
   ('Earth Quakes', 'San Jose');

INSERT INTO players
   (name, birthday, height, current_team_id)
VALUES
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1),
   ('Johnny', '2002-09-29', 5.75, 1);

INSERT INTO referees
   (name)
VALUES
   ('Bill Bellacheck'),
   ('Bill Bellacheck'),
   ('Bill Bellacheck'),
   ('Bill Bellacheck');

INSERT INTO matches
   (home_team_id, away_team_id, location, game_date, start_time, season_id, head_referee_id, assistant_referee_1_id, assistant_referee_2_id)
VALUES
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3),
   (1, 2, '111 soccer lane', '2023-02-15','12:30:00pm', 1, 1, 2, 3);

INSERT INTO results
   (team_id, match_id, result)
VALUES
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win'),
   (1, 2, 'Win');

INSERT INTO goals
   (player_id, match_id)
VALUES 
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4),
   (1, 4);

INSERT INTO lineups
   (player_id, match_id, team_id)
VALUES
   (2, 5, 3),
   (2, 5, 3),
   (2, 5, 3),
   (2, 5, 3),
   (2, 5, 3),
   (2, 5, 3),
   (2, 5, 3);
