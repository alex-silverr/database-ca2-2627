USE Library;
GO

CREATE OR ALTER PROCEDURE sp_BookAuthorXML
(
    @BookBarcode VARCHAR(40)
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        B.BookBarcode AS '@Barcode',
        B.Title,
        P.PublisherName,
        (
            SELECT
                dbo.fn_FullAuthorName(BA.Author) AS FullName
            FROM Books_Authors BA
            WHERE BA.Book = B.BookBarcode
            FOR XML PATH('Author'), TYPE
        ) AS Authors
    FROM Books B
        INNER JOIN Publishers P
            ON B.Publisher = P.ID
    WHERE
        B.BookBarcode = @BookBarcode
    FOR XML PATH('Book'), ROOT('Library');
END;
GO