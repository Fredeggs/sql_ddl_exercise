-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries (id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines (id) NOT NULL,
  from_city_id INTEGER REFERENCES cities (id) NOT NULL,
  to_city_id INTEGER REFERENCES cities (id) NOT NULL
);

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

INSERT INTO cities
  (name, country_id)
VALUES
  ('Seattle', 1),
  ('London', 6),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Casablanca', 8),
  ('Beijing', 9),
  ('Charlotte', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Santiago', 10),
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Paris', 3),
  ('Dubai', 4),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Sao Paolo', 5);

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 11, 1),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 12, 2),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 13, 3),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 1, 4),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 14, 5),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 15, 6),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 16, 7),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 17, 8),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 7, 9),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 18, 10);