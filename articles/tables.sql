CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`login` varchar(50) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `articles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`title` varchar(100) NOT NULL,
	`txt` TEXT NOT NULL,
	`date` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `articles` ADD CONSTRAINT `articles_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

