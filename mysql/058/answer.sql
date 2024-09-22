-- サブクエリを使用して、売上が最も多い商品の名前とその価格を表示するクエリ
SELECT
  ProductName,
  Price
FROM
  Products
WHERE
  ProductID = (
    SELECT
      ProductID
    FROM
      Sales
    ORDER BY
      Quantity DESC
    LIMIT
      1
  );

-- 売上数量が平均を上回る商品の名前を表示するクエリ
SELECT
  ProductName
FROM
  Products
WHERE
  ProductID IN (
    SELECT
      ProductID
    FROM
      Sales
    WHERE
      Quantity > (
        SELECT
          AVG(Quantity)
        FROM
          Sales
      )
  );
