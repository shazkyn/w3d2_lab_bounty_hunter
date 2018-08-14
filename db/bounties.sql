DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  last_known_location VARCHAR(255),
  homeworld VARCHAR(255) NOT NULL,
  bounty_value INT2
);
