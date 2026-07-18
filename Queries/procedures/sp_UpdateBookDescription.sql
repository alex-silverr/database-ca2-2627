USE Library;
GO

CREATE OR ALTER PROCEDURE sp_UpdateBookDescription
(
    @BookBarcode VARCHAR(40),
    @NewSummary VARCHAR(MAX)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT *
        FROM Books
        WHERE BookBarcode = @BookBarcode
    )
    BEGIN

        UPDATE Books
        SET BookDescription =
        CAST(
        '<BookDescription>
            <Summary>'
            + @NewSummary +
        '</Summary>
        </BookDescription>' AS XML)
        WHERE BookBarcode = @BookBarcode;

        SELECT
            BookBarcode,
            BookDescription
        FROM Books
        WHERE
            BookBarcode=@BookBarcode
            AND BookDescription.exist('/BookDescription/Summary')=1;

    END
END;
GO