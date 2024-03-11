<?php

class Car
{
    public $color;
    public $brand;

    // コンストラクタ
    public function __construct($color, $brand)
    {
        $this->color = $color;
        $this->brand = $brand;
    }

    // 車を記述するメソッド
    public function describe()
    {
        return "This is a " . $this->color . " " . $this->brand . ".";
    }
}

// Carクラスのインスタンスを作成
$myCar = new Car("red", "Toyota");

// 車の記述を表示
echo $myCar->describe() . "\n";
