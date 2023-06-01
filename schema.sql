-- Create Item Table--
CREATE TABLE Item (
  id INT PRIMARY KEY,
  genre VARCHAR(200),
  author VARCHAR(200),
  source VARCHAR(200),
  label VARCHAR(200),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  can_be_archived BOOLEAN,
  move_to_archive BOOLEAN,
  add_genre INT REFERENCES Genre(id),
  add_source INT REFERENCES Source(id),
  add_author INT REFERENCES Author(id),
  add_label INT REFERENCES Label(id)
);

--Create games table--
CREATE TABLE game(
  id INT GENERATED ALWAYS AS
  IDENTITY PRIMARY KEY,
  publish_date DATE,
  multiplayer VARCHAR(200),
  last_played_at DATE
  author_id INT REFERENCES
  author(id),
);

--Create authors table--
CREATE TABLE author(
  id INT GENERATED ALWAYS AS
  IDENTITY PRIMARY KEY,
  first_name VARCHAR(200),
  last_name VARCHAR(200)
);

CREATE INDEX idx_games_author_id ON games (author_id);