<?php

function displayFilesInDirectory($directory)
{
    $files = scandir($directory);

    foreach ($files as $file) {
        if ($file == "." || $file == "..") {
            continue;
        }

        $filePath = $directory . DIRECTORY_SEPARATOR . $file;

        if (is_dir($filePath)) {
            echo "ディレクトリ: $file\n";
            displayFilesInDirectory($filePath);
        } else {
            echo "ファイル: $file\n";
        }
    }
}

$directoryPath = "./dir";

echo "ディレクトリ内のファイル一覧:\n";
displayFilesInDirectory($directoryPath);
