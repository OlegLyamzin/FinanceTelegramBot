DELIMITER //

CREATE PROCEDURE CreateUser(
    IN p_TgId VARCHAR(30),
    IN p_Username VARCHAR(255),
    IN p_Name VARCHAR(255),
    IN p_Lastname VARCHAR(255),
    IN p_CreatedOn DATETIME
)
BEGIN
    INSERT INTO `User` (TgId, Username, Name, Lastname, CreatedOn)
    VALUES (p_TgId, p_Username, p_Name, p_Lastname, p_CreatedOn);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE GetUser(
    IN p_id INT
)
BEGIN
    SELECT * FROM `User` WHERE id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE UpdateUser(
    IN p_id INT,
    IN p_TgId VARCHAR(30),
    IN p_Username VARCHAR(255),
    IN p_Name VARCHAR(255),
    IN p_Lastname VARCHAR(255)
)
BEGIN
    UPDATE `User`
    SET TgId = p_TgId,
        Username = p_Username,
        Name = p_Name,
        Lastname = p_Lastname
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteUser(
    IN p_id INT
)
BEGIN
    DELETE FROM `User` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateTransaction(
    IN p_UserId INT,
    IN p_Amount DOUBLE,
    IN p_CreatedOn DATETIME,
    IN p_CategoryId INT,
    IN p_AccountId INT
)
BEGIN
    INSERT INTO `Transactions` (UserId, Amount, CreatedOn, CategoryId, AccountId)
    VALUES (p_UserId, p_Amount, p_CreatedOn, p_CategoryId, p_AccountId);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetTransaction(
    IN p_id INT
)
BEGIN
    SELECT * FROM `Transactions` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateTransaction(
    IN p_id INT,
    IN p_UserId INT,
    IN p_Amount DOUBLE,
    IN p_CreatedOn DATETIME,
    IN p_CategoryId INT,
    IN p_AccountId INT
)
BEGIN
    UPDATE `Transactions`
    SET UserId = p_UserId,
        Amount = p_Amount,
        CreatedOn = p_CreatedOn,
        CategoryId = p_CategoryId,
        AccountId = p_AccountId
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteTransaction(
    IN p_id INT
)
BEGIN
    DELETE FROM `Transactions` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCategory(
    IN p_Name VARCHAR(255),
    IN p_UserId INT,
    IN p_TypeId INT
)
BEGIN
    INSERT INTO `Category` (Name, UserId, TypeId)
    VALUES (p_Name, p_UserId, p_TypeId);
END //


DELIMITER //

CREATE PROCEDURE GetCategory(
    IN p_id INT
)
BEGIN
    SELECT * FROM `Category` WHERE id = p_id;
END //


DELIMITER //

CREATE PROCEDURE UpdateCategory(
    IN p_id INT,
    IN p_Name VARCHAR(255),
    IN p_UserId INT,
    IN p_TypeId INT
)
BEGIN
    UPDATE `Category`
    SET Name = p_Name,
        UserId = p_UserId,
        TypeId = p_TypeId
    WHERE id = p_id;
END //

DELIMITER //

CREATE PROCEDURE DeleteCategory(
    IN p_id INT
)
BEGIN
    DELETE FROM `Category` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCategoryType(
    IN p_Name VARCHAR(255)
)
BEGIN
    INSERT INTO `CategotyType` (Name)
    VALUES (p_Name);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetCategoryType(
    IN p_id INT
)
BEGIN
    SELECT * FROM `CategotyType` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateCategoryType(
    IN p_id INT,
    IN p_Name VARCHAR(255)
)
BEGIN
    UPDATE `CategotyType`
    SET Name = p_Name
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteCategoryType(
    IN p_id INT
)
BEGIN
    DELETE FROM `CategotyType` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateAccount(
    IN p_Name VARCHAR(255),
    IN p_Currency INT,
    IN p_UserId INT
)
BEGIN
    INSERT INTO `Account` (Name, Currency, UserId)
    VALUES (p_Name, p_Currency, p_UserId);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAccount(
    IN p_id INT
)
BEGIN
    SELECT * FROM `Account` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateAccount(
    IN p_id INT,
    IN p_Name VARCHAR(255),
    IN p_Currency INT,
    IN p_UserId INT
)
BEGIN
    UPDATE `Account`
    SET Name = p_Name,
        Currency = p_Currency,
        UserId = p_UserId
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteAccount(
    IN p_id INT
)
BEGIN
    DELETE FROM `Account` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateCurrency(
    IN p_Name VARCHAR(255)
)
BEGIN
    INSERT INTO `Currency` (Name)
    VALUES (p_Name);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetCurrency(
    IN p_id INT
)
BEGIN
    SELECT * FROM `Currency` WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateCurrency(
    IN p_id INT,
    IN p_Name VARCHAR(255)
)
BEGIN
    UPDATE `Currency`
    SET Name = p_Name
    WHERE id = p_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DeleteCurrency(
    IN p_id INT
)
BEGIN
    DELETE FROM `Currency` WHERE id = p_id;
END //

DELIMITER ;