<?php
/**
 * Konfigurasi Koneksi Database
 * -----------------------------------------
 * Ubah nilai di bawah ini sesuai kredensial hosting kalian
 * (shared hosting / InfinityFree / Railway / dsb).
 */
define('DB_HOST', 'localhost');
define('DB_NAME', 'panduan_sholat');
define('DB_USER', 'root');
define('DB_PASS', '');

function getDB() {
    static $pdo = null;
    if ($pdo === null) {
        try {
            $pdo = new PDO(
                "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4",
                DB_USER,
                DB_PASS,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                ]
            );
        } catch (PDOException $e) {
            die('Koneksi database gagal. Pastikan database "panduan_sholat" sudah diimpor dari database/schema.sql. Detail: ' . htmlspecialchars($e->getMessage()));
        }
    }
    return $pdo;
}
