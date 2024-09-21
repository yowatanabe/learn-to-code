# No.057

あなたは企業の社員情報を管理するMySQLデータベースを扱っています。以下の`employees`テーブルと`departments`テーブルがあります。

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

1. **サブクエリを使用して、全社員の中で最も給与が高い社員の名前と給与を取得するSQL文を書いてください。**

2. **サブクエリを使用して、各部門の平均給与を計算し、会社全体の平均給与を上回る部門名とその平均給与を取得するSQL文を書いてください。**

3. **相関サブクエリを使用して、各社員が所属する部門内で自分の給与が部門平均以上である社員の名前、部門名、給与を取得するSQL文を書いてください。**
