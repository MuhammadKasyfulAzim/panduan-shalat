<?php
require_once __DIR__ . '/includes/functions.php';
$mode = getMode();
$total = getTotalGerakan();

$urutan = isset($_GET['u']) ? max(1, min($total, (int) $_GET['u'])) : 1;
$gerakan = getGerakanByUrutan($urutan);

if (!$gerakan) {
    header('Location: daftar-gerakan.php');
    exit;
}

$nama = $mode === 'anak' ? $gerakan['nama_anak'] : $gerakan['nama_dewasa'];
$deskripsi = $mode === 'anak' ? $gerakan['deskripsi_anak'] : $gerakan['deskripsi_dewasa'];
$identitas = getIdentitas();

require __DIR__ . '/includes/header.php';
?>

<main class="container">

  <a href="daftar-gerakan.php?mode=<?= $mode ?>" class="btn-home top">🏠 Kembali ke Beranda</a>

  <div class="page-flip-stage">
  <div class="page-flip-wrap" id="pageFlipWrap">

  <div class="detail-header">
    <h1><?= htmlspecialchars($nama) ?></h1>
    <span class="step-count">Langkah <?= $gerakan['urutan'] ?> dari <?= $total ?></span>
  </div>

  <div class="detail-grid">
    <div class="detail-image">
      <?php
        // Pilih gambar sesuai mode aktif. Kalau mode anak tapi gambar_anak
        // belum diisi, otomatis pakai gambar dewasa sebagai cadangan.
        $gambarDipakai = ($mode === 'anak' && !empty($gerakan['gambar_anak']))
            ? $gerakan['gambar_anak']
            : $gerakan['gambar'];

        $imgPath = __DIR__ . '/' . $gambarDipakai;
        $ext = strtolower(pathinfo($gambarDipakai, PATHINFO_EXTENSION));

        if (file_exists($imgPath) && $ext === 'svg') {
            // SVG di-embed langsung sebagai kode, supaya warnanya ikut tema
            echo file_get_contents($imgPath);
        } elseif (file_exists($imgPath) && in_array($ext, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            // Foto/gambar biasa ditampilkan lewat tag <img>
            echo '<img src="' . htmlspecialchars($gambarDipakai) . '" alt="' . htmlspecialchars($nama) . '" style="width:100%;height:auto;border-radius:8px;">';
        } else {
            echo '<p style="text-align:center;color:#888;">Gambar belum tersedia</p>';
        }
      ?>
    </div>

    <div>
      <div class="deskripsi-box">
        <p><?= htmlspecialchars($deskripsi) ?></p>
      </div>

      <?php
        // Deteksi otomatis jenis sumber video: YouTube/Vimeo (embed via iframe)
        // atau file video lokal seperti .mp4/.webm/.ogg (diputar via tag <video>)
        $videoUrl = ($mode === 'anak' && !empty($gerakan['video_url_anak']))
            ? $gerakan['video_url_anak']
            : ($gerakan['video_url'] ?? '');
        $isFileVideo = (bool) preg_match('/\.(mp4|webm|ogg)$/i', $videoUrl);
        $isEmbedVideo = !empty($videoUrl) && !$isFileVideo;
      ?>
      <button class="video-toggle-btn" id="videoToggleBtn" type="button">🎬 Tonton Video Gerakan/Bacaan</button>
      <div class="video-wrap" id="videoWrap">
        <?php if ($isFileVideo): ?>
          <video controls preload="none">
            <source src="<?= htmlspecialchars($videoUrl) ?>" type="video/<?= pathinfo($videoUrl, PATHINFO_EXTENSION) === 'mp4' ? 'mp4' : 'webm' ?>">
            Peramban Anda tidak mendukung pemutaran video.
          </video>
        <?php elseif ($isEmbedVideo): ?>
          <iframe src="<?= htmlspecialchars($videoUrl) ?>" allowfullscreen></iframe>
        <?php else: ?>
          <div class="video-placeholder">Video untuk gerakan ini belum ditambahkan oleh admin.<br>Isi kolom <code>gerakan.video_url</code> dengan link YouTube (format embed) atau path file video lokal (mis. <code>assets/video/ruku.mp4</code>).</div>
        <?php endif; ?>
      </div>

      <?php foreach ($gerakan['bacaan'] as $b): ?>
        <?php
          // Deteksi tipe MIME audio otomatis dari ekstensi file, supaya audio
          // tetap diputar walau formatnya .mp3, .mp4, .ogg, dsb.
          $audioExt = strtolower(pathinfo($b['audio_file'], PATHINFO_EXTENSION));
          $audioMime = match ($audioExt) {
              'mp3' => 'audio/mpeg',
              'mp4', 'm4a' => 'audio/mp4',
              'ogg' => 'audio/ogg',
              'wav' => 'audio/wav',
              default => 'audio/mpeg',
          };
        ?>
        <div class="bacaan-card">
          <div class="teks-arab"><?= $b['teks_arab'] ?></div>
          <div class="transliterasi"><?= htmlspecialchars($b['transliterasi']) ?></div>
          <div class="terjemahan"><?= htmlspecialchars($mode === 'anak' ? $b['terjemahan_anak'] : $b['terjemahan_dewasa']) ?></div>
          <audio controls preload="none" class="bacaan-audio">
            <source src="<?= htmlspecialchars($b['audio_file']) ?>" type="<?= $audioMime ?>">
            Peramban Anda tidak mendukung pemutaran audio.
          </audio>
        </div>
      <?php endforeach; ?>

      <?php if (empty($gerakan['bacaan'])): ?>
        <p style="color:var(--ink-soft);font-size:0.9rem;">Gerakan ini tidak memiliki bacaan khusus.</p>
      <?php endif; ?>
    </div>
  </div>

  <div class="nav-controls">
    <a href="gerakan.php?u=<?= $urutan - 1 ?>" id="navPrev" class="nav-btn <?= $urutan <= 1 ? 'disabled' : '' ?>" <?= $urutan <= 1 ? 'aria-disabled="true" tabindex="-1" onclick="return false;"' : '' ?>>&larr; Sebelumnya</a>

    <label class="autoplay-toggle">
      <input type="checkbox" id="autoplayCheck"> Putar otomatis berurutan (autoplay)
    </label>

    <a href="gerakan.php?u=<?= $urutan + 1 ?>" id="navNext" class="nav-btn primary <?= $urutan >= $total ? 'disabled' : '' ?>" <?= $urutan >= $total ? 'aria-disabled="true" tabindex="-1" onclick="return false;"' : '' ?>>Berikutnya &rarr;</a>
  </div>

  </div><!-- /.page-flip-wrap -->
  </div><!-- /.page-flip-stage -->

</main>

<script>
  window.SHOLAT_APP = {
    urutanSekarang: <?= (int) $urutan ?>,
    totalGerakan: <?= (int) $total ?>,
    nextUrl: 'gerakan.php?u=<?= $urutan + 1 ?>&mode=<?= $mode ?>&dir=next'
  };
</script>

<script>
  // Efek page-flip saat berpindah antar gerakan (Sebelumnya/Berikutnya)
  document.addEventListener('DOMContentLoaded', function () {
    var wrap = document.getElementById('pageFlipWrap');
    if (!wrap) return;

    // Entrance animation: kalau datang dari klik Next/Prev, mainkan animasi "masuk"
    var params = new URLSearchParams(window.location.search);
    var dir = params.get('dir');
    if (dir === 'next') {
      wrap.classList.add('flip-in-next');
    } else if (dir === 'prev') {
      wrap.classList.add('flip-in-prev');
    }

    function pindahDenganAnimasi(e, arah) {
      var link = e.currentTarget;
      if (link.getAttribute('aria-disabled') === 'true') return;
      e.preventDefault();

      var href = link.getAttribute('href');
      var sep = href.indexOf('?') > -1 ? '&' : '?';
      var target = href + sep + 'dir=' + arah;

      wrap.classList.remove('flip-in-next', 'flip-in-prev');
      wrap.classList.add(arah === 'next' ? 'flip-out-next' : 'flip-out-prev');

      setTimeout(function () {
        window.location.href = target;
      }, 480); // durasi ini disamakan dengan transition CSS
    }

    var btnNext = document.getElementById('navNext');
    var btnPrev = document.getElementById('navPrev');
    if (btnNext) btnNext.addEventListener('click', function (e) { pindahDenganAnimasi(e, 'next'); });
    if (btnPrev) btnPrev.addEventListener('click', function (e) { pindahDenganAnimasi(e, 'prev'); });
  });
</script>

<?php require __DIR__ . '/includes/footer.php'; ?>
