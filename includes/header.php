<?php
$identitas = getIdentitas();
$mode = getMode();
$currentPage = basename($_SERVER['PHP_SELF']);

// Bangun ulang query string agar parameter lain (mis. ?u=5 di gerakan.php) tidak hilang saat ganti mode
$paramsDewasa = array_merge($_GET, ['mode' => 'dewasa']);
$paramsAnak   = array_merge($_GET, ['mode' => 'anak']);
$qsDewasa = http_build_query($paramsDewasa);
$qsAnak   = http_build_query($paramsAnak);
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= htmlspecialchars($identitas['judul_aplikasi']) ?></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&family=Cormorant+Garamond:wght@500;600;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="<?= $mode === 'anak' ? 'mode-anak' : '' ?>">

<header class="site-header">
  <div class="container identity-bar">
    <a class="brand" href="index.php?mode=<?= $mode ?>">🕌 <?= htmlspecialchars($identitas['judul_aplikasi']) ?></a>
    <div class="identity-meta">
      <span><strong>Kelompok:</strong> <?= htmlspecialchars($identitas['nama_kelompok']) ?></span>
      <span><strong>Prodi:</strong> <?= htmlspecialchars($identitas['program_studi']) ?></span>
      <span><strong>Mata Kuliah:</strong> <?= htmlspecialchars($identitas['mata_kuliah']) ?></span>
      <span><strong>Dosen:</strong> <?= htmlspecialchars($identitas['nama_dosen']) ?></span>
    </div>
    <div class="mode-toggle">
      <a href="?<?= $qsDewasa ?>" class="<?= $mode === 'dewasa' ? 'active' : '' ?>">Dewasa</a>
      <a href="?<?= $qsAnak ?>" class="<?= $mode === 'anak' ? 'active' : '' ?>">Anak-anak</a>
    </div>
  </div>
</header>
