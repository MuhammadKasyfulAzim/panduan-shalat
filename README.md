# Panduan Sholat Interaktif

Ini adalah aplikasi web sederhana buat belajar gerakan dan bacaan sholat, dibuat pakai PHP Native + MySQL. Ada dua mode tampilan: Dewasa dan Anak-anak, jadi bisa dipakai buat berbagai kalangan usia.

Demo bisa dicoba langsung di sini: https://panduansholat.gamer.free/index.php?mode=dewasa

## Sumber Rujukan

Urutan gerakan, bacaan, dan tata cara sholat yang dipakai di aplikasi ini mengacu pada **Himpunan Putusan Tarjih (HPT) Muhammadiyah**, khususnya bagian yang membahas tuntunan sholat. Kalau ada perbedaan lafal atau urutan dengan sumber lain (mazhab/kitab lain), silakan sesuaikan sendiri isi teksnya di `database/schema.sql` — kami cuma isi versi dasarnya sesuai rujukan di atas, jadi kalau dosen atau pembimbing minta versi lain tinggal diedit.

Referensi yang dipakai:
- Tuntunan Bacaan Sholat Menurut Pemahaman Muhammadiyah (PDM Kota Semarang, rujukan HPT lengkap per gerakan): https://muhammadiyahsemarangkota.org/tuntunan-bacaan-sholat-menurut-pemahaman-muhammadiyah/
- Teks bacaan salat sesuai HPT Muhammadiyah (Badan AIK UMSU): https://bim.umsu.ac.id/bacaan-salat-sesuai-himpunan-putusan-tarjih-muhammadiyah/

Kalau link di atas ada yang berubah/mati, tinggal cari ulang lewat kata kunci "Himpunan Putusan Tarjih Muhammadiyah" di situs resmi Muhammadiyah, karena beberapa link cabang/pihak ketiga suka dipindah-pindah.

## Arsitektur Singkat

```
Front-end  -> HTML/CSS/JS (assets/, includes/header.php, includes/footer.php)
Back-end   -> PHP Native, PDO (includes/functions.php, config/db.php)
Database   -> MySQL/MariaDB (database/schema.sql)
```

Semua konten gerakan dan bacaan diambil dari database lewat `getAllGerakan()` dan `getGerakanByUrutan()` di `includes/functions.php`. Tidak ada teks gerakan/bacaan yang ditulis manual di HTML.

## 1. Cara Jalanin di Lokal (XAMPP/Laragon/MAMP)

1. Copy folder `sholat-app` ke `htdocs` (XAMPP) atau `www` (Laragon).
2. Buka phpMyAdmin, bikin database baru, terus import `database/schema.sql`.
3. Buka `config/db.php`, sesuaikan `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS` dengan MySQL lokal kalian (default XAMPP biasanya user `root` tanpa password).
4. Akses lewat browser: `http://localhost/sholat-app/`

## 2. Isi Identitas Kelompok

Buka phpMyAdmin, masuk ke tabel `pengaturan`, edit baris pertama dan isi:
- `nama_kelompok`
- `program_studi`
- `mata_kuliah`
- `nama_dosen`

Data ini otomatis muncul di header tiap halaman. Nilai bawaan di `schema.sql` cuma placeholder ("Kelompok 1", dst), jangan lupa diganti.

## 3. Nambahin Audio & Video

- File MP3 bacaan diletakkan di `assets/audio/`, namanya harus sama dengan kolom `audio_file` di tabel `bacaan` (contoh: `assets/audio/04-fatihah.mp4`).
- Untuk video, isi kolom `video_url` di tabel `gerakan` dengan link embed (contoh: `assets/audio/04-fatihah.mp4`). Kalau kosong, nanti tombol video cuma nampilin pesan "video belum ditambahkan".

## 4. Deploy Online

**Opsi A — Shared hosting gratis (InfinityFree, dsb)**
1. Bikin akun & database MySQL di panel hosting (cPanel/Vista Panel).
2. Import `database/schema.sql` lewat phpMyAdmin bawaan hosting.
3. Upload semua isi folder `sholat-app` ke `htdocs`/`public_html` (File Manager atau FTP).
4. Edit `config/db.php` sesuai kredensial database dari hosting (host biasanya bukan `localhost`, cek di info database panel).

**Opsi B — Railway / Render (kontainer)**
1. Tambahkan MySQL sebagai add-on di project.
2. Jalankan `database/schema.sql` lewat koneksi database yang disediakan.
3. Deploy kode PHP-nya (butuh image PHP+Apache, misal `richarvey/nginx-php-fpm` atau Dockerfile PHP sederhana), set environment variable koneksi DB sesuai `config/db.php`.

## 5. Struktur File

```
sholat-app/
├── index.php              # Daftar gerakan (F-01)
├── gerakan.php             # Detail gerakan + bacaan + navigasi (F-02–F-06)
├── config/
│   └── db.php              # Koneksi database
├── includes/
│   ├── functions.php       # Query ke database (back-end)
│   ├── header.php          # Header + identitas + mode switch
│   └── footer.php
├── assets/
│   ├── css/style.css
│   ├── js/app.js           # Toggle video, autoplay berurutan
│   ├── images/*.svg         # Ilustrasi tiap gerakan
│   ├── audio/               # Taruh file mp4 di sini
│   └── video/
└── database/
    └── schema.sql          # CREATE TABLE + data gerakan & bacaan lengkap
```

## 6. Fitur yang Udah Jalan

| Kode | Fitur | Keterangan |
|------|-------|------------|
| F-01 | Daftar gerakan sholat | `index.php` |
| F-02 | Detail gerakan (gambar + bacaan 4 lapis) | `gerakan.php` |
| F-03 | Audio bacaan | tag `<audio>` per bacaan |
| F-04 | Opsi video | tombol toggle |
| F-05 | Navigasi Next/Previous | sudah ada |
| F-06 | Autoplay berurutan | `assets/js/app.js` |
| F-07 | Mode Dewasa & Anak | toggle di header, pakai session PHP |
| F-08 | Identitas di header | ambil dari tabel `pengaturan` |
| F-09 | Konten dari database | PDO, gak ada yang hardcode |

## 7. Catatan Isi Konten

Bacaan yang dicover ada 13 langkah: Niat, Takbiratul Ihram, Doa Iftitah, Al-Fatihah, surah pendek (Al-Ikhlas), Ruku', I'tidal, Sujud (2x), Duduk di antara dua sujud, Tasyahud Awal, Tasyahud Akhir, dan Salam. Urutan dan lafalnya mengikuti tuntunan di HPT Muhammadiyah — kalau kelompok kalian mau pakai referensi lain atau perlu nambah catatan dari dosen, tinggal edit langsung teksnya di `database/schema.sql`.
