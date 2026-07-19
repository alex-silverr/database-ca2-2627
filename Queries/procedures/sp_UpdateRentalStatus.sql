CREATE OR ALTER PROCEDURE sp_UpdateRentalStatus
    @RentalID INT
    @NewRentStatusText VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE RentRecords
    SET RentStatus = (SELECT ID FROM RentalStatuses WHERE RentStatus = @NewRentStatusText)
    WHERE ID = @RentalID
END;