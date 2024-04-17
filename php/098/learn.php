<?php

$xmlString = file_get_contents('users.xml');
$xml = new SimpleXMLElement($xmlString);

foreach ($xml->user as $user) {
    $name = $user->name;
    $age = $user->age;
    $job = $user->job;

    echo "名前: $name, 年齢: $age, 職業: $job\n";
}
