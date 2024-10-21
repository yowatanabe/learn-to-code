-- 非効率なクエリの例
SELECT
  Books.Title,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Books
  JOIN Orders ON Books.BookID = Orders.BookID
GROUP BY
  Books.Title;

-- EXPLAINを使ったクエリ解析
EXPLAIN
SELECT
  Books.Title,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Books
  JOIN Orders ON Books.BookID = Orders.BookID
GROUP BY
  Books.Title;

-- クエリ最適化: インデックスの使用
CREATE INDEX idx_bookid ON Orders (BookID);

-- サブクエリを使った最適化
SELECT
  Books.Title,
  Sales.TotalQuantity
FROM
  Books
  JOIN (
    SELECT
      BookID,
      SUM(Quantity) AS TotalQuantity
    FROM
      Orders
    GROUP BY
      BookID
  ) AS Sales ON Books.BookID = Sales.BookID;

-- EXPLAINを使ったクエリ解析
EXPLAIN
SELECT
  Books.Title,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Books
  JOIN Orders ON Books.BookID = Orders.BookID
GROUP BY
  Books.Title;
