CREATE VIEW vw_PublisherBookStatistics
AS
SELECT
    p.PublisherName,
    COUNT(b.BookBarcode) AS TotalBooks
FROM Publishers p
INNER JOIN Books b
    ON p.ID = b.Publisher
GROUP BY
    p.PublisherName;
GO