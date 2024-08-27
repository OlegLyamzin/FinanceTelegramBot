CREATE TABLE IF NOT EXISTS `User` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`TgId` varchar(30) NOT NULL UNIQUE,
	`Username` varchar(255),
	`Name` varchar(255),
	`Lastname` int,
	`CreatedOn` datetime NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Transaction` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`UserId` int NOT NULL,
	`Amount` double NOT NULL,
	`CreatedOn` datetime NOT NULL,
	`CategoryId` int NOT NULL,
	`AccountId` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Category` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Name` varchar(255) NOT NULL,
	`UserId` int NOT NULL,
	`TypeId` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `CategoryType` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Account` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Name` varchar(255) NOT NULL,
	`Currency` int NOT NULL,
	`UserId` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Currency` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Name` varchar(255) NOT NULL,
	`UserId` int NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `Transactions` ADD CONSTRAINT `Transactions_fk1` FOREIGN KEY (`UserId`) REFERENCES `User`(`id`);

ALTER TABLE `Transactions` ADD CONSTRAINT `Transactions_fk4` FOREIGN KEY (`CategoryId`) REFERENCES `Category`(`id`);

ALTER TABLE `Transactions` ADD CONSTRAINT `Transactions_fk5` FOREIGN KEY (`AccountId`) REFERENCES `Account`(`id`);
ALTER TABLE `Category` ADD CONSTRAINT `Category_fk2` FOREIGN KEY (`UserId`) REFERENCES `User`(`id`);

ALTER TABLE `Category` ADD CONSTRAINT `Category_fk3` FOREIGN KEY (`TypeId`) REFERENCES `CategotyType`(`id`);

ALTER TABLE `Account` ADD CONSTRAINT `Account_fk2` FOREIGN KEY (`Currency`) REFERENCES `Currency`(`id`);

ALTER TABLE `Account` ADD CONSTRAINT `Account_fk3` FOREIGN KEY (`UserId`) REFERENCES `User`(`id`);
ALTER TABLE `Currency` ADD CONSTRAINT `Currency_fk3` FOREIGN KEY (`UserId`) REFERENCES `User`(`id`);
