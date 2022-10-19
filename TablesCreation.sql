CREATE TABLE movies(
   id        integer      PRIMARY KEY,
   title     varchar(255) NOT NULL UNIQUE,
   year      integer);

CREATE TABLE people(
   id        integer      PRIMARY KEY,
   name      varchar(255) NOT NULL UNIQUE,
   gender    varchar(10));

CREATE TABLE credits(
   person_id integer      NOT NULL REFERENCES people (id),
   movie_id  integer      NOT NULL REFERENCES movies (id),
   type      varchar(20)  NOT NULL,
   note      varchar(255),
   characte varchar(255),
   position  integer,
   line_order     integer,
   group_order    integer,
   subgroup_order integer,
   UNIQUE (person_id, movie_id, type));

CREATE TABLE certificates(
   movie_id    integer      NOT NULL REFERENCES movies (id),
   country     varchar(20)  NOT NULL,
   certificate varchar(20)  NOT NULL,
   note        varchar(255));

CREATE TABLE genres(
   movie_id  integer      NOT NULL REFERENCES movies (id),
   genre     varchar(25)  NOT NULL);
-- Increase the genre large by modifying the column's attributes
ALTER TABLE genres MODIFY COLUMN genre varchar (50);

CREATE TABLE keywords(
   movie_id  integer      NOT NULL REFERENCES movies (id),
   keyword   varchar(127) NOT NULL);

CREATE TABLE languages(
   movie_id  integer      NOT NULL REFERENCES movies (id),
   language  varchar(35)  NOT NULL,
   note      varchar(255));

CREATE TABLE locations(
   movie_id  integer      NOT NULL REFERENCES movies (id),
   location  varchar(255) NOT NULL,
   note      varchar(511));

CREATE TABLE release_dates(
   movie_id     integer      NOT NULL REFERENCES movies (id),
   country      varchar(40)  NOT NULL,
   release_date integer  NOT NULL,
   note         varchar(255));
