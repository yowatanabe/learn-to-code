# No.032

データベースの正規化について学ぶために、以下のシナリオに基づいてテーブルを設計し、データを正規化してください。特に、第1正規形（1NF）、第2正規形（2NF）、第3正規形（3NF）への変換を行います。

**シナリオ:**

あなたは大学のコース管理システムのデータベースを設計しています。最初に1つのテーブルを作成しましたが、データが冗長で管理が難しくなっています。これを正規化する手順を示してください。

**元のテーブル:**

**Enrollments テーブル:**

| EnrollmentID | StudentName | Course1       | Course2       | Course3       | Instructor1  | Instructor2  | Instructor3  |
|--------------|-------------|---------------|---------------|---------------|--------------|--------------|--------------|
| 1            | Alice       | Math 101      | History 201   | NULL          | Prof. Smith  | Prof. Johnson| NULL         |
| 2            | Bob         | Chemistry 101 | NULL          | NULL          | Prof. Clark  | NULL         | NULL         |
| 3            | Charlie     | Math 101      | Physics 202   | History 201   | Prof. Smith  | Prof. Taylor | Prof. Johnson|
