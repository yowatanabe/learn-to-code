<?php

$logMessages = [
    "[2024-03-25 14:22:10] ERROR: An error occurred.",
    "[2024-03-25 14:23:45] INFO: Information message.",
    "[2024-03-25 14:25:33] CRITICAL: Critical system failure.",
    "[2024-03-26 09:10:22] INFO: System startup complete.",
    "[2024-03-26 09:14:15] ERROR: Failed to load module.",
    "[2024-03-26 09:17:53] CRITICAL: Disk space almost full.",
    "[2024-03-26 10:00:00] INFO: User login successful.",
    "[2024-03-26 10:05:42] ERROR: Access denied for user 'admin'.",
    "[2024-03-26 11:30:55] CRITICAL: Database not responding.",
    "[2024-03-26 11:45:19] INFO: Backup completed successfully."
];

foreach ($logMessages as $logMessage) {
    if (preg_match("/\[(.*?)\] (ERROR|CRITICAL): (.*)/", $logMessage, $matches)) {
        $date = $matches[1];
        $errorLevel = $matches[2];
        $message = $matches[3];

        echo "[{$date}] {$errorLevel}: {$message}\n";
    }
}
