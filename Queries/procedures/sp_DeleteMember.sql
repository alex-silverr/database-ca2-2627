USE Library;
GO

CREATE OR ALTER PROCEDURE sp_DeleteMember
(
    @MemberID INT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT *
        FROM RentRecords
        WHERE RentedBy=@MemberID
          AND RentStatus <>
          (
             SELECT ID
             FROM RentalStatuses
             WHERE RentStatus='Returned'
          )
    )
    BEGIN
        PRINT 'Member has outstanding rentals.';
        RETURN;
    END

    DELETE
    FROM Members
    WHERE ID=@MemberID;

    PRINT 'Member deleted successfully.';
END;
GO