-- Creating table actor
CREATE TABLE actor (
    actor_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1)
);
-- Creating table movie
CREATE TABLE movie (
    movie_id INT PRIMARY KEY IDENTITY(1,1),
    title VARCHAR(100) NOT NULL,
    release_year SMALLINT NOT NULL,
    genre VARCHAR(50),
	director VARCHAR(100)
);
-- Creating table actors_in_movie
CREATE TABLE actors_in_movie
(
	movie_id INT NOT NULL,
	actor_id INT NOT NULL,
	role VARCHAR(100)
	PRIMARY KEY (movie_id, actor_id, role)
);

-- Adding foreign key to the actors_in_movie table, referring to the actor table
ALTER TABLE actors_in_movie
ADD CONSTRAINT FK_ActorID FOREIGN KEY (actor_id) REFERENCES actor(actor_id);

-- Adding foreign key to the actors_in_movie table, referring to the movie table
ALTER TABLE actors_in_movie
ADD CONSTRAINT FK_MovieID FOREIGN KEY (movie_id) REFERENCES movie(movie_id);


-- inserting records to tables
-- Adding records to the actor table
INSERT INTO actor (first_name, last_name, gender) VALUES
('Tom', 'Hanks', 'M'),
('Meryl', 'Streep', 'F'),
('Leonardo', 'DiCaprio', 'M'),
('Scarlett', 'Johansson', 'F'),
('Denzel', 'Washington', 'M');

-- Adding records to the movie table
INSERT INTO movie (title, release_year, genre, director) VALUES
('Forrest Gump', 1994, 'Drama', 'Robert Zemeckis'),
('The Devil Wears Prada', 2006, 'Comedy-Drama', 'David Frankel'),
('Titanic', 1997, 'Romance-Drama', 'James Cameron'),
('Lost in Translation', 2003, 'Drama', 'Sofia Coppola'),
('Training Day', 2001, 'Crime-Drama', 'Antoine Fuqua');

-- Adding entries to the actors_in_movie table
INSERT INTO actors_in_movie (movie_id, actor_id, role) VALUES
(1, 1, 'Forrest Gump'),
(1, 2, 'Jenny Curran'),
(2, 2, 'Miranda Priestly'),
(2, 1, 'Andy Sachs'),
(3, 3, 'Jack Dawson'),
(3, 4, 'Rose DeWitt Bukater'),
(4, 4, 'Charlotte'),
(4, 5, 'Bob Harris'),
(5, 5, 'Alonzo Harris'),
(5, 3, 'Jake Hoyt');

-- Query to display all actors and their roles in the movie Titanic. (JOIN 3 TABLES)
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor, aim.role
FROM actor a
JOIN actors_in_movie aim ON a.actor_id = aim.actor_id
JOIN movie m ON aim.movie_id = m.movie_id
WHERE m.title = 'Titanic';