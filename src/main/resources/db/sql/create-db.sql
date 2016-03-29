--DROP TABLE users IF EXISTS;

CREATE TABLE users (
  id INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 100, INCREMENT BY 1) PRIMARY KEY,
  name VARCHAR(30),
  email  VARCHAR(50),
  address VARCHAR(255),
  password VARCHAR(20),
  newsletter BOOLEAN,
  framework VARCHAR(500),
  sex VARCHAR(1),
  NUMBER INTEGER,
  COUNTRY VARCHAR(10),
  SKILL VARCHAR(500),
  BIRTHDATE VARCHAR(15)
);