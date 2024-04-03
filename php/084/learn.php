<?php

class Book
{
    public $title;
    public $author;
    public $price;

    // コンストラクタ
    public function __construct($title, $author, $price)
    {
        $this->title = $title;
        $this->author = $author;
        $this->price = $price;
    }

    // 書籍情報を返すメソッド
    public function getInfo()
    {
        return "タイトル: " . $this->title . ", 著者: " . $this->author . ", 価格: ¥" . $this->price . "\n";
    }
}

// 書籍インスタンスの作成
$book = new Book("PHP入門", "山田太郎", 2000);

// 書籍情報の出力
echo $book->getInfo();
