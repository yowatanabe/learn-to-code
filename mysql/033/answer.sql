-- 第1正規形 (1NF)
-- 1NFの要件を満たすために、各フィールドが単一値を保持するようにし、重複するグループを取り除きます。
CREATE TABLE
  Books_1NF (
    BookID INT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Publisher VARCHAR(255),
    Genre VARCHAR(100),
    ISBN VARCHAR(20),
    StoreName VARCHAR(100),
    StoreAddress VARCHAR(255)
  );

INSERT INTO
  Books_1NF (
    BookID,
    Title,
    Author,
    Publisher,
    Genre,
    ISBN,
    StoreName,
    StoreAddress
  )
VALUES
  (
    1,
    'Clean Code',
    'Robert Martin',
    'Prentice Hall',
    'Programming',
    '978-0132350884',
    'Central',
    '123 Main St'
  ),
  (
    2,
    'The Pragmatic Programmer',
    'Andrew Hunt',
    'Addison-Wesley',
    'Programming',
    '978-0201616224',
    'Central',
    '123 Main St'
  ),
  (
    3,
    'Introduction to Algorithms',
    'Thomas H. Cormen',
    'MIT Press',
    'Computer Science',
    '978-0262033848',
    'North',
    '456 Oak St'
  ),
  (
    4,
    'Design Patterns',
    'Erich Gamma',
    'Addison-Wesley',
    'Programming',
    '978-0201633610',
    'Central',
    '123 Main St'
  ),
  (
    5,
    'The Art of Computer Programming',
    'Donald Knuth',
    'Addison-Wesley',
    'Computer Science',
    '978-0201896831',
    'North',
    '456 Oak St'
  );

-- 第2正規形 (2NF)
-- 2NFの要件を満たすために、部分関数従属性を排除します。ここでは、書店情報を別のテーブルに分割し、書籍情報と結びつけます。
CREATE TABLE
  Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(100),
    StoreAddress VARCHAR(255)
  );

CREATE TABLE
  Books_2NF (
    BookID INT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Publisher VARCHAR(255),
    Genre VARCHAR(100),
    ISBN VARCHAR(20),
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores (StoreID)
  );

INSERT INTO
  Stores (StoreName, StoreAddress)
VALUES
  ('Central', '123 Main St'),
  ('North', '456 Oak St');

INSERT INTO
  Books_2NF (
    BookID,
    Title,
    Author,
    Publisher,
    Genre,
    ISBN,
    StoreID
  )
VALUES
  (
    1,
    'Clean Code',
    'Robert Martin',
    'Prentice Hall',
    'Programming',
    '978-0132350884',
    1
  ),
  (
    2,
    'The Pragmatic Programmer',
    'Andrew Hunt',
    'Addison-Wesley',
    'Programming',
    '978-0201616224',
    1
  ),
  (
    3,
    'Introduction to Algorithms',
    'Thomas H. Cormen',
    'MIT Press',
    'Computer Science',
    '978-0262033848',
    2
  ),
  (
    4,
    'Design Patterns',
    'Erich Gamma',
    'Addison-Wesley',
    'Programming',
    '978-0201633610',
    1
  ),
  (
    5,
    'The Art of Computer Programming',
    'Donald Knuth',
    'Addison-Wesley',
    'Computer Science',
    '978-0201896831',
    2
  );

-- 第3正規形 (3NF)
-- 3NFの要件を満たすために、推移的関数従属性を排除します。ここでは、出版社情報を別のテーブルに分割し、書籍情報と結びつけます。
CREATE TABLE
  Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(255)
  );

CREATE TABLE
  Books_3NF (
    BookID INT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    ISBN VARCHAR(20),
    StoreID INT,
    PublisherID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores (StoreID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers (PublisherID)
  );

INSERT INTO
  Publishers (PublisherName)
VALUES
  ('Prentice Hall'),
  ('Addison-Wesley'),
  ('MIT Press');

INSERT INTO
  Books_3NF (
    BookID,
    Title,
    Author,
    Genre,
    ISBN,
    StoreID,
    PublisherID
  )
VALUES
  (
    1,
    'Clean Code',
    'Robert Martin',
    'Programming',
    '978-0132350884',
    1,
    1
  ),
  (
    2,
    'The Pragmatic Programmer',
    'Andrew Hunt',
    'Programming',
    '978-0201616224',
    1,
    2
  ),
  (
    3,
    'Introduction to Algorithms',
    'Thomas H. Cormen',
    'Computer Science',
    '978-0262033848',
    2,
    3
  ),
  (
    4,
    'Design Patterns',
    'Erich Gamma',
    'Programming',
    '978-0201633610',
    1,
    2
  ),
  (
    5,
    'The Art of Computer Programming',
    'Donald Knuth',
    'Computer Science',
    '978-0201896831',
    2,
    2
  );
