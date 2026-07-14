<?php
require_once __DIR__ . '/../config/db.php';

/** Ambil identitas kelompok (F-08) */
function getIdentitas() {
    $db = getDB();
    $stmt = $db->query("SELECT * FROM pengaturan LIMIT 1");
    return $stmt->fetch() ?: [
        'nama_kelompok' => 'Nama Kelompok',
        'program_studi' => 'Program Studi',
        'mata_kuliah' => 'Mata Kuliah',
        'nama_dosen' => 'Nama Dosen',
        'judul_aplikasi' => 'Panduan Sholat Interaktif'
    ];
}

/** Ambil seluruh daftar gerakan terurut (F-01) */
function getAllGerakan() {
    $db = getDB();
    $stmt = $db->query("SELECT * FROM gerakan ORDER BY urutan ASC");
    return $stmt->fetchAll();
}

/** Ambil satu gerakan berdasarkan urutan, beserta bacaannya (F-02) */
function getGerakanByUrutan($urutan) {
    $db = getDB();
    $stmt = $db->prepare("SELECT * FROM gerakan WHERE urutan = ?");
    $stmt->execute([$urutan]);
    $gerakan = $stmt->fetch();
    if (!$gerakan) return null;

    $stmtBacaan = $db->prepare("SELECT * FROM bacaan WHERE gerakan_id = ? ORDER BY urutan_bacaan ASC");
    $stmtBacaan->execute([$gerakan['id']]);
    $gerakan['bacaan'] = $stmtBacaan->fetchAll();

    return $gerakan;
}

/** Total jumlah gerakan, untuk navigasi next/previous (F-05) */
function getTotalGerakan() {
    $db = getDB();
    return (int) $db->query("SELECT COUNT(*) AS total FROM gerakan")->fetch()['total'];
}

/** Helper: mode aktif pengguna, disimpan di session (F-07) */
function getMode() {
    if (session_status() === PHP_SESSION_NONE) session_start();
    if (isset($_GET['mode']) && in_array($_GET['mode'], ['dewasa', 'anak'])) {
        $_SESSION['mode'] = $_GET['mode'];
    }
    return $_SESSION['mode'] ?? 'dewasa';
}
