-- when a book is rented, and its rental status is set as "On Time"
-- the book's status must be set as "Rented". when a book is rented
-- and its rental status is set as "On Hold" the book's status must
-- be set as "On Hold".
-- when a book is returned, its availability must be changed to
-- "Available", and when a book is lost, it must be changed to 
-- "Unavailable for Renting"

CREATE TRIGGER tg_updateBookStatusOnRental
ON RentRecords
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @new_RentStatus INT
    DECLARE @new_RentedBook VARCHAR(40)
    DECLARE @new_AvailStatus INT

    SELECT @new_RentStatus = RentStatus FROM inserted
    SELECT @new_RentedBook = RentedBook FROM inserted

    SET @new_AvailStatus = CASE 
        WHEN @new_RentStatus = (SELECT ID FROM RentalStatuses WHERE RentStatus = 'On Hold')
            THEN (SELECT ID FROM AvailabilityStatuses WHERE AvailStatus = 'On Hold')
        WHEN @new_RentStatus = (SELECT ID FROM RentalStatuses WHERE RentStatus = 'On Time')
            THEN (SELECT ID FROM AvailabilityStatuses WHERE AvailStatus = 'Rented')
        WHEN @new_RentStatus = (SELECT ID FROM RentalStatuses WHERE RentStatus = 'Returned')
            THEN (SELECT ID FROM AvailabilityStatuses WHERE AvailStatus = 'Available')
        WHEN @new_RentStatus = (SELECT ID FROM RentalStatuses WHERE RentStatus = 'Book Lost')
            THEN (SELECT ID FROM AvailabilityStatuses WHERE AvailStatus = 'Unavailable for Renting')
    END;

    UPDATE Books
    SET AvailabilityStatus = @new_AvailStatus
    WHERE BookBarcode = @new_RentedBook
END;