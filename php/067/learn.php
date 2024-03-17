<?php

class BankAccount
{
    private $balance = 0;

    public function deposit($amount)
    {
        $this->balance += $amount;
        echo "預金後の残高: {$this->balance}\n";
    }

    public function withdraw($amount)
    {
        if ($amount > $this->balance) {
            echo "残高不足で引き出しできません。\n";
        } else {
            $this->balance -= $amount;
            echo "引き出し後の残高: {$this->balance}\n";
        }
    }

    public function getBalance()
    {
        return $this->balance;
    }
}

$account = new BankAccount();
$account->deposit(1000);
$account->withdraw(500);
$account->withdraw(600);
echo "現在の残高: " . $account->getBalance() . "\n";
