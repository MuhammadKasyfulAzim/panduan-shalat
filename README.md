Panduan Sholat Interaktif

Aplikasi web sederhana untuk belajar gerakan dan bacaan sholat, dibuat pakai PHP native (tanpa framework) dan MySQL. Ada dua mode tampilan: mode dewasa (bacaan lengkap) dan mode anak-anak (bahasa lebih sederhana).

Project ini dibuat untuk tugas mata kuliah AIK, oleh Muhammad Kasyful Azim, Feprian, Rifa Rakha Hafizhta, Muhammad Habibi, Nabil Yumn Afif.

Isi Project

sholat-app/
├── index.php            -> halaman daftar gerakan sholat
├── gerakan.php           -> halaman detail per gerakan (gambar, bacaan, audio, video)
├── daftar-gerakan.php
├── config/
│   └── db.php             -> koneksi ke database
├── includes/
│   ├── functions.php      -> query-query ke database
│   ├── header.php
│   └── footer.php
├── assets/
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── audio/
│   └── video/
└── database/
    └── schema.sql          -> struktur tabel + data awal

Cara Jalanin di Lokal


Copy folder sholat-app ke htdocs (kalau pakai XAMPP) atau www (kalau pakai Laragon)
Buka phpMyAdmin, import file database/schema.sql
Buka config/db.php, sesuaikan DB_HOST, DB_NAME, DB_USER, DB_PASS dengan punya kalian. Default XAMPP biasanya root tanpa password.
Akses lewat browser: http://localhost/sholat-app/


Cara Deploy ke InfinityFree


Bikin database MySQL baru di cPanel InfinityFree
Import database/schema.sql lewat phpMyAdmin yang disediakan
Upload semua isi folder sholat-app ke htdocs lewat File Manager
Edit config/db.php, ganti kredensial sesuai yang InfinityFree kasih (host-nya biasanya bukan localhost, cek di cPanel)


Menambahkan Konten

Identitas kelompok — buka tabel pengaturan di phpMyAdmin, edit baris pertama (nama kelompok, mata kuliah, dosen, dll). Ini otomatis muncul di header.

Audio bacaan — taruh file audio di assets/audio/, namanya harus sama dengan yang ada di kolom audio_file pada tabel bacaan.

Video gerakan — isi kolom video_url di tabel gerakan dengan link YouTube (format embed) atau path file video lokal kalau videonya diupload sendiri ke assets/video/.

Status Fitur


Daftar gerakan sholat — selesai
Detail gerakan (gambar + 4 lapis bacaan: arab, transliterasi, terjemahan dewasa, terjemahan anak) — selesai
Audio per bacaan — selesai
Video per gerakan (opsional, toggle) — selesai
Navigasi next/previous antar gerakan — selesai
Mode dewasa & anak — selesai
Konten diambil dari database, bukan hardcode — selesai


Catatan

Ada 13 gerakan yang dicakup: Niat, Takbiratul Ihram, Doa Iftitah, Al-Fatihah, Surah pendek, Ruku', I'tidal, Sujud (dua kali), Duduk di antara dua sujud, Tasyahud Awal, Tasyahud Akhir, dan Salam.
