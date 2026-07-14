<?php
require_once __DIR__ . '/includes/functions.php';
$mode = getMode();
$identitas = getIdentitas();
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

<?php
// Konten cover diduplikasi di panel kiri & kanan (dengan sengaja) supaya saat
// masing-masing panel dipotong (clip-path) jadi separuh, gabungannya membentuk
// satu tampilan utuh yang presisi di tengah layar.
$coverContent = '
    <div class="cover-ornament-top">۞</div>
    <p class="cover-kicker">Panduan Ibadah Interaktif</p>
    <h1 class="cover-title">
      <span class="title-line line1">Tata Cara</span>
      <span class="title-line line2">Shalat</span>
    </h1>
    <div class="cover-divider"></div>
    <p class="cover-tagline">
      Gerakan &amp; bacaan sholat lengkap, langkah demi langkah,<br>
      untuk semua usia.
    </p>
    <button type="button" class="cover-open-btn-full" data-target="daftar-gerakan.php?mode=dewasa">Buka &nbsp;/&nbsp; Open</button>
    <div class="cover-ornament-bottom">۞</div>
    <div class="cover-identity">
      <span>' . htmlspecialchars($identitas['nama_kelompok']) . '</span>
      <span>&middot;</span>
      <span>' . htmlspecialchars($identitas['program_studi']) . '</span>
      <span>&middot;</span>
      <span>' . htmlspecialchars($identitas['mata_kuliah']) . '</span>
      <span>&middot;</span>
      <span>' . htmlspecialchars($identitas['nama_dosen']) . '</span>
    </div>
';
?>

<div class="cover-page-full" id="coverPageFull">

  <!-- Lapisan "halaman dalam buku", terlihat begitu 2 panel terbuka -->
  <div class="cover-inside-full" id="coverInsideFull">
    <span>🕌</span>
    <p>Membuka&hellip;</p>
  </div>

  <!-- Panel KIRI: menampilkan separuh KIRI dari konten (yang lain dipotong) -->
  <div class="cover-half cover-left" id="coverLeft">
    <div class="cover-full-content">
      <?= $coverContent ?>
    </div>
  </div>

  <!-- Panel KANAN: konten sama persis, tapi yang tampil separuh KANAN -->
  <div class="cover-half cover-right" id="coverRight">
    <div class="cover-full-content">
      <?= $coverContent ?>
    </div>
  </div>

</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    var left = document.getElementById('coverLeft');
    var right = document.getElementById('coverRight');
    var inside = document.getElementById('coverInsideFull');
    var buttons = document.querySelectorAll('.cover-open-btn-full');
    var sudahDibuka = false;

    buttons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        if (sudahDibuka) return;
        sudahDibuka = true;

        var target = this.getAttribute('data-target');

        left.classList.add('opening');
        right.classList.add('opening');
        inside.classList.add('visible');

        setTimeout(function () {
          window.location.href = target;
        }, 950);
      });
    });
  });
</script>

</body>
</html>
