<?php

function generateRandomPassword($length = 8)
{
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_+=';
    $password = '';

    for ($i = 0; $i < $length; $i++) {
        $index = rand(0, strlen($chars) - 1);
        $password .= $chars[$index];
    }

    return $password;
}

$password = generateRandomPassword();
echo "Generated Password: $password\n";
