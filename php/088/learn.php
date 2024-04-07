<?php

abstract class Vehicle
{
    // 抽象メソッド定義
    abstract public function move();
}

class Car extends Vehicle
{
    // Carクラス固有の実装
    public function move()
    {
        echo "Car is moving\n";
    }
}

class Bicycle extends Vehicle
{
    // Bicycleクラス固有の実装
    public function move()
    {
        echo "Bicycle is moving\n";
    }
}

// インスタンスの作成とメソッドのテスト
$car = new Car();
$car->move();

$bicycle = new Bicycle();
$bicycle->move();
