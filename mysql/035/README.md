# No.035

データベースの正規化について学ぶために、以下のシナリオに基づいてテーブルを設計し、データを正規化してください。特に、第1正規形（1NF）、第2正規形（2NF）、第3正規形（3NF）への変換を行います。

**シナリオ:**

あなたは社員のプロジェクト割り当てを管理するシステムを設計しています。最初に1つのテーブルを作成しましたが、データが冗長で管理が困難になっています。これを正規化する手順を示してください。

**元のテーブル:**

**EmployeeProjects テーブル:**

| EmployeeID | EmployeeName | Project1      | Project2      | Project3      | Manager1       | Manager2       | Manager3       |
|------------|--------------|---------------|---------------|---------------|----------------|----------------|----------------|
| 1          | Alice        | Website Redesign | App Development | NULL          | John Doe       | Jane Smith     | NULL           |
| 2          | Bob          | Data Analysis  | NULL          | NULL          | Peter Johnson  | NULL           | NULL           |
| 3          | Charlie      | Website Redesign | Data Migration  | Cloud Setup   | John Doe       | Mary Brown     | Steve White    |
