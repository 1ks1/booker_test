CREATE TABLE `b_users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`token` varchar(255) NOT NULL,
	`status` INT(11) NOT NULL,
	`role` enum('user','admin') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `b_events` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`created` TIMESTAMP NOT NULL,
	`start` TIMESTAMP NOT NULL,
	`end` TIMESTAMP NOT NULL,
	`room_id` INT(11) NOT NULL,
	`recurent_id` INT(11) NOT NULL,
	`description` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `b_rooms` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` INT(11) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `b_events` ADD CONSTRAINT `b_events_fk0` FOREIGN KEY (`user_id`) REFERENCES `b_users`(`id`);

ALTER TABLE `b_events` ADD CONSTRAINT `b_events_fk1` FOREIGN KEY (`room_id`) REFERENCES `b_rooms`(`id`);

ALTER TABLE `b_events` ADD CONSTRAINT `b_events_fk2` FOREIGN KEY (`recurent_id`) REFERENCES `b_events`(`id`);

