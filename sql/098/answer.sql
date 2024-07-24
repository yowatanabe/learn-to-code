-- 回答1のクエリ
SELECT
    s.SaleID,
    b.Title,
    a.AuthorName,
    s.Quantity,
    s.SaleDate
FROM
    Sales s
    JOIN Books b ON s.BookID = b.BookID
    JOIN Authors a ON b.AuthorID = a.AuthorID;

-- 回答2のクエリ
SELECT
    a.AuthorName,
    SUM(s.Quantity) AS TotalQuantity
FROM
    Sales s
    JOIN Books b ON s.BookID = b.BookID
    JOIN Authors a ON b.AuthorID = a.AuthorID
GROUP BY
    a.AuthorName;
