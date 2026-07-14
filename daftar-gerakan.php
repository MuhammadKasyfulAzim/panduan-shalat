<?php
require_once __DIR__ . '/includes/functions.php';
$mode = getMode();
$semuaGerakan = getAllGerakan();
$identitas = getIdentitas();
require __DIR__ . '/includes/header.php';
?>

<section class="hero">
  <div class="container">
    <h1><?= $mode === 'anak' ? 'Yuk, Belajar Gerakan Sholat!' : 'Panduan Gerakan &amp; Bacaan Sholat' ?></h1>
    <p>
      <?= $mode === 'anak'
        ? 'Klik gerakan di bawah ini satu-satu, dari berdiri sampai salam, biar makin lancar sholatnya.'
        : 'Ikuti setiap gerakan secara berurutan lengkap dengan bacaan, transliterasi, terjemahan, dan audio.' ?>
    </p>

    <!-- Signature element: tasbih / prayer-bead progress tracker -->
    <div class="tasbih" aria-label="Urutan gerakan sholat">
      <?php foreach ($semuaGerakan as $i => $g): ?>
        <a href="gerakan.php?u=<?= $g['urutan'] ?>" class="tasbih-bead" title="<?= htmlspecialchars($mode === 'anak' ? $g['nama_anak'] : $g['nama_dewasa']) ?>">
          <?= $g['urutan'] ?>
        </a>
        <?php if ($i < count($semuaGerakan) - 1): ?><div class="tasbih-line"></div><?php endif; ?>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<main class="container">
  <div class="gerakan-list">
    <?php foreach ($semuaGerakan as $g): ?>
      <a class="gerakan-card" href="gerakan.php?u=<?= $g['urutan'] ?>">
        <span class="num"><?= str_pad($g['urutan'], 2, '0', STR_PAD_LEFT) ?></span>
        <span>
          <h3><?= htmlspecialchars($mode === 'anak' ? $g['nama_anak'] : $g['nama_dewasa']) ?></h3>
          <p><?= htmlspecialchars(mb_strimwidth($mode === 'anak' ? $g['deskripsi_anak'] : $g['deskripsi_dewasa'], 0, 90, '...')) ?></p>
        </span>
      </a>
    <?php endforeach; ?>
  </div>
</main>

<?php require __DIR__ . '/includes/footer.php'; ?>
