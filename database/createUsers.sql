CREATE TABLE okospanzio.users (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  firstName varchar(50) NOT NULL,
  lastName varchar(50) NOT NULL,
  gender varchar(25) NOT NULL,
  email varchar(100) NOT NULL,
  phone varchar(16) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  passwordHash varchar(255) DEFAULT NULL,
  roles varchar(20) DEFAULT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;