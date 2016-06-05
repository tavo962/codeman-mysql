DROP SCHEMA IF EXISTS kuetspali;
CREATE SCHEMA kuetspali;

USE kuetspali;

SET NAMES utf8;

-- ---------------------------------------------------------

DROP TABLE IF EXISTS kuetspali.users;
CREATE TABLE kuetspali.users(
	id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR( 40 ) NOT NULL,
	last_name VARCHAR( 50 ) NOT NULL,
	username VARCHAR( 15 ) NOT NULL,
	email VARCHAR( 60 ) NOT NULL,
	password CHAR( 40 ) BINARY NOT NULL,
	token VARCHAR( 255 ) BINARY NOT NULL,
	status BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'TRUE -> Active, FALSE -> Inactive',

	UNIQUE( username ),
	UNIQUE( email ),
	UNIQUE( token ),

	PRIMARY KEY( id_user )
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- ---------------------------------------------------------

DROP TABLE IF EXISTS kuetspali.roles;
CREATE TABLE kuetspali.roles(
	id_rol INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR( 100 ) NOT NULL,
	description VARCHAR( 255 ) NOT NULL,
	status BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'TRUE -> Active, FALSE -> Inactive',

	UNIQUE( name ),

	PRIMARY KEY( id_rol )
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- ---------------------------------------------------------

DROP TABLE IF EXISTS kuetspali.users_roles;
CREATE TABLE kuetspali.users_roles(
	id_user INT UNSIGNED NOT NULL,
	id_rol INT UNSIGNED NOT NULL,

	PRIMARY KEY( id_user, id_rol ),

	FOREIGN KEY( id_user ) REFERENCES users( id_user )
	ON DELETE NO ACTION ON UPDATE CASCADE,

	FOREIGN KEY( id_rol ) REFERENCES roles( id_rol )
	ON DELETE NO ACTION ON UPDATE CASCADE
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- ---------------------------------------------------------