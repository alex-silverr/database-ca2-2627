CREATE OR ALTER FUNCTION dbo.fn_FullAuthorName
(
    @AuthorID INT
)
RETURNS VARCHAR(60)
AS
BEGIN
    DECLARE @FullName VARCHAR(60);

    SELECT @FullName =
        CONCAT(
            FirstName,
            CASE
                WHEN LastName IS NULL OR LTRIM(RTRIM(LastName)) = ''
                THEN ''
                ELSE ' ' + LastName
            END
        )
    FROM Authors
    WHERE ID = @AuthorID;

    RETURN @FullName;
END;
GO