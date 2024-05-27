# No.040

以下の2つのテーブルがあります。

**Students テーブル:**

| StudentID | StudentName | Age | MajorID |
|-----------|-------------|-----|---------|
| 1         | Alice       | 20  | 1       |
| 2         | Bob         | 22  | 2       |
| 3         | Charlie     | 21  | 1       |
| 4         | David       | 23  | 3       |
| 5         | Eve         | 20  | 2       |

**Majors テーブル:**

| MajorID | MajorName      |
|---------|----------------|
| 1       | Computer Science |
| 2       | Mathematics    |
| 3       | Physics        |

次の条件を満たすSQLクエリを作成してください：

1. **EXISTS** 演算子を使用して、22歳以上の学生がいる専攻の名前を表示します。
2. **IN** 演算子を使用して、特定の専攻（例：Computer Science, Mathematics）の学生の名前を表示します。
3. **ANY** 演算子を使用して、任意のMathematics専攻の学生よりも年齢が高い学生の名前を表示します。
4. **ALL** 演算子を使用して、すべてのComputer Science専攻の学生よりも年齢が高い学生の名前を表示します。
