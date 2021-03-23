CREATE TABLE counter(id SERIAL PRIMARY KEY, count integer);
INSERT INTO counter (count) VALUES (0);

-- When having count_manager selected
CREATE TABLE time(id SERIAL PRIMARY KEY, hour int, minute int, second int);
