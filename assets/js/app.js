document.addEventListener('DOMContentLoaded', function () {

  // ---------- Toggle video (F-04) ----------
  var videoBtn = document.getElementById('videoToggleBtn');
  var videoWrap = document.getElementById('videoWrap');
  if (videoBtn && videoWrap) {
    videoBtn.addEventListener('click', function () {
      videoWrap.classList.toggle('open');
      videoBtn.textContent = videoWrap.classList.contains('open')
        ? '✖ Tutup Video'
        : '🎬 Tonton Video Gerakan/Bacaan';
    });
  }

  // ---------- Autoplay berurutan (F-06) ----------
  var autoplayCheck = document.getElementById('autoplayCheck');
  var app = window.SHOLAT_APP;
  if (!autoplayCheck || !app) return;

  var STORAGE_KEY = 'sholatAutoplayAktif';

  // Pulihkan preferensi autoplay dari halaman sebelumnya
  var autoplayAktif = sessionStorage.getItem(STORAGE_KEY) === '1';
  autoplayCheck.checked = autoplayAktif;

  autoplayCheck.addEventListener('change', function () {
    sessionStorage.setItem(STORAGE_KEY, autoplayCheck.checked ? '1' : '0');
  });

  var audios = document.querySelectorAll('.bacaan-audio');

  if (autoplayAktif) {
    if (audios.length > 0) {
      // Putar bacaan pertama otomatis, lalu lanjut ke bacaan berikutnya
      playSequence(0);
    } else {
      // Tidak ada bacaan di gerakan ini, langsung lanjut ke gerakan berikutnya
      goNextAfterDelay();
    }
  }

  function playSequence(index) {
    if (index >= audios.length) {
      goNextAfterDelay();
      return;
    }
    var current = audios[index];
    current.play().catch(function () {
      // Peramban memblokir autoplay bersuara tanpa interaksi user;
      // pengguna cukup menekan play sekali, sisanya akan lanjut otomatis.
    });
    current.addEventListener('ended', function handler() {
      current.removeEventListener('ended', handler);
      playSequence(index + 1);
    });
  }

  function goNextAfterDelay() {
    if (app.urutanSekarang >= app.totalGerakan) return; // sudah gerakan terakhir
    setTimeout(function () {
      window.location.href = app.nextUrl;
    }, 1200);
  }
});
