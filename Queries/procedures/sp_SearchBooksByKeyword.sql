CREATE OR ALTER PROCEDURE sp_SearchBooksByKeyword
(
    @Keyword VARCHAR(100),
    @Language VARCHAR(30)
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        B.BookBarcode,
        B.Title,
        P.PublisherName,
        L.BookLanguage,
        G.Genre,
        S.AvailStatus
    FROM Books B
        INNER JOIN Publishers P
            ON B.Publisher = P.ID
        INNER JOIN Languages L
            ON B.BookLanguage = L.ID
        INNER JOIN BookGenres G
            ON B.Genre = G.ID
        INNER JOIN AvailabilityStatuses S
            ON B.AvailabilityStatus = S.ID
    WHERE
        B.Title LIKE '%' + @Keyword + '%'
        AND L.BookLanguage = @Language
    ORDER BY
        B.Title ASC;
END;
GO