# Panduan Sholat Interaktif

Aplikasi web PHP Native + MySQL untuk menampilkan gerakan dan bacaan sholat
secara terstruktur, dengan dua mode pengguna (Dewasa & Anak-anak).

## Struktur Arsitektur

```
Front-end  -> HTML/CSS/JS (assets/, includes/header.php, includes/footer.php)
Back-end   -> PHP Native, PDO (includes/functions.php, config/db.php)
Database   -> MySQL/MariaDB (database/schema.sql)
```

Seluruh konten gerakan & bacaan **diambil dari database**, tidak ditulis
statis di HTML (lihat `includes/functions.php` -> `getAllGerakan()`,
`getGerakanByUrutan()`), sesuai kebutuhan F-09.

## 1. Setup Lokal (XAMPP/Laragon/MAMP)

1. Salin folder `sholat-app` ke folder `htdocs` (XAMPP) atau `www` (Laragon).
2. Buka phpMyAdmin, buat database baru (atau biarkan, sudah dibuat otomatis
   dari file SQL), lalu **import** file `database/schema.sql`.
3. Buka `config/db.php`, sesuaikan `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS`
   dengan kredensial MySQL lokal (default XAMPP: user `root`, password kosong).
4. Akses melalui browser: `http://localhost/sholat-app/`

## 2. Mengisi Identitas Kelompok

Buka phpMyAdmin -> tabel `pengaturan` -> edit baris pertama, isi:

- `nama_kelompok`
- `program_studi`
- `mata_kuliah`
- `nama_dosen`

Nilai ini otomatis tampil di header setiap halaman. Nilai bawaan di
`schema.sql` hanyalah placeholder ("Kelompok 1", dst.)

## 3. Menambahkan Audio & Video

- Letakkan file MP3 bacaan di `assets/audio/` dengan nama sesuai kolom
  `audio_file` pada tabel `bacaan` (mis. `assets/audio/04-fatihah.mp3`).
- Untuk video, isi kolom `video_url` pada tabel `gerakan` dengan URL embed
  (mis. `https://www.youtube.com/embed/ID_VIDEO`). Jika kosong, tombol video
  akan menampilkan pesan bahwa video belum ditambahkan.

## 4. Deploy Online (Daring)

**Opsi A — InfinityFree / shared hosting PHP gratis:**

1. Buat akun & database MySQL di panel hosting (cPanel/Vista Panel).
2. Import `database/schema.sql` lewat phpMyAdmin yang disediakan hosting.
3. Upload seluruh isi folder `sholat-app` ke `htdocs`/`public_html` via
   File Manager atau FTP.
4. Edit `config/db.php` dengan kredensial database dari hosting (host
   biasanya bukan `localhost`, cek info database di panel).

**Opsi B — Railway / Render (kontainer):**

1. Tambahkan MySQL sebagai add-on/plugin di project.
2. Jalankan isi `database/schema.sql` melalui koneksi database yang diberikan.
3. Deploy kode PHP (butuh image PHP+Apache, mis. `richarvey/nginx-php-fpm`
   atau Dockerfile PHP sederhana) dan set environment variable koneksi DB
   sesuai `config/db.php`.

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
│   ├── audio/               # Taruh file mp3 di sini
│   └── video/
└── database/
    └── schema.sql          # CREATE TABLE + data gerakan & bacaan lengkap
```

## 6. Fitur yang Sudah Diimplementasikan

| Kode | Fitur                                    | Status                           |
| ---- | ---------------------------------------- | -------------------------------- |
| F-01 | Daftar gerakan sholat                    | ✅ `index.php`                   |
| F-02 | Detail gerakan (gambar + bacaan 4 lapis) | ✅ `gerakan.php`                 |
| F-03 | Audio bacaan                             | ✅ tag `<audio>` per bacaan      |
| F-04 | Opsi video                               | ✅ tombol toggle                 |
| F-05 | Navigasi Next/Previous                   | ✅                               |
| F-06 | Autoplay berurutan                       | ✅ `assets/js/app.js`            |
| F-07 | Mode Dewasa & Anak                       | ✅ toggle di header, session PHP |
| F-08 | Identitas di header                      | ✅ dari tabel `pengaturan`       |
| F-09 | Konten dari database                     | ✅ PDO, tidak hardcode           |

## 7. Catatan Konten

Bacaan mencakup 13 langkah: Niat, Takbiratul Ihram, Doa Iftitah, Al-Fatihah,
Surah pendek (Al-Ikhlas), Ruku', I'tidal, Sujud (2x), Duduk di antara dua
sujud, Tasyahud Awal, Tasyahud Akhir, dan Salam. Silakan sesuaikan/lengkapi
teks di `database/schema.sql` sesuai mazhab/referensi yang dipakai dosen
kalian.
