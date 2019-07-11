SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `user11` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `user11`;

CREATE TABLE IF NOT EXISTS `b_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `room_id` int(11) NOT NULL,
  `recurent_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `b_events_fk0` (`user_id`),
  KEY `b_events_fk1` (`room_id`),
  KEY `b_events_fk2` (`recurent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

INSERT INTO `b_events` (`id`, `user_id`, `name`, `created`, `start_time`, `end_time`, `room_id`, `recurent_id`, `description`) VALUES
(2, 2, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 'sdasdasd');

CREATE TABLE IF NOT EXISTS `b_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO `b_rooms` (`id`, `name`) VALUES
(1, 'room1'),
(2, 'room2'),
(3, 'room3');

CREATE TABLE IF NOT EXISTS `b_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `email` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

INSERT INTO `b_users` (`id`, `name`, `password`, `token`, `status`, `role`, `email`, `lastname`) VALUES
(1, 'admin', 'admin', '', 1, 'admin', 'admin@gmail.com', 'admin'),
(2, 'test@gmail.com', '1aedb8d9dc4751e229a335e371db8058', 'YjInmPQTQ.lB.', 1, 'user', 'test@gmail.com', 'test@gmail.com');


ALTER TABLE `b_events`
  ADD CONSTRAINT `b_events_fk0` FOREIGN KEY (`user_id`) REFERENCES `b_users` (`id`),
  ADD CONSTRAINT `b_events_fk1` FOREIGN KEY (`room_id`) REFERENCES `b_rooms` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
