-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: panduan_sholat
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gerakan`
--

DROP TABLE IF EXISTS `gerakan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerakan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urutan` int(11) NOT NULL,
  `nama_dewasa` varchar(150) NOT NULL,
  `nama_anak` varchar(150) NOT NULL,
  `deskripsi_dewasa` text NOT NULL,
  `deskripsi_anak` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `gambar_anak` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `video_url_anak` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `urutan` (`urutan`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerakan`
--

LOCK TABLES `gerakan` WRITE;
/*!40000 ALTER TABLE `gerakan` DISABLE KEYS */;
INSERT INTO `gerakan` VALUES (1,1,'Niat','Niat di Dalam Hati','Berdiri tegak menghadap kiblat, niat sholat diucapkan di dalam hati sesuai jenis sholat yang dikerjakan.','Berdiri yang rapi menghadap kiblat, terus bilang di dalam hati mau sholat apa.','assets/images/g01-niat-dewasa.png','assets/images/g01-niat.png',NULL,NULL),(2,2,'Takbiratul Ihram','Takbir Pembuka','Mengangkat kedua tangan sejajar bahu atau telinga sambil mengucapkan \"Allahu Akbar\" sebagai pembuka sholat.','Angkat kedua tangan ke atas dekat telinga sambil bilang \"Allahu Akbar\".','assets/images/g02-takbir-dewasa.png','assets/images/g02-takbir.png',NULL,NULL),(3,3,'Doa Iftitah','Doa Pembuka','Setelah takbiratul ihram, membaca doa iftitah dengan posisi tangan bersedekap di atas dada.','Tangan dilipat di depan dada, terus baca doa pembuka pelan-pelan.','assets/images/g03-iftitah-dewasa.png','assets/images/g03-iftitah.png',NULL,NULL),(4,4,'Membaca Al-Fatihah','Baca Surat Al-Fatihah','Membaca surat Al-Fatihah pada setiap rakaat sebagai rukun sholat yang wajib dibaca.','Baca surat Al-Fatihah, surat yang paling sering dibaca setiap sholat.','assets/images/g04-fatihah-dewasa.png','assets/images/g04-fatihah.png',NULL,NULL),(5,5,'Membaca Surah Pendek','Baca Surat Pendek','Setelah Al-Fatihah pada dua rakaat pertama, dianjurkan membaca surah atau ayat Al-Qur\'an, contohnya surat Al-Ikhlas.','Habis Al-Fatihah, boleh baca surat pendek, contohnya surat Al-Ikhlas.','assets/images/g05-surah-dewasa.png','assets/images/g05-surah.png',NULL,''),(6,6,'Ruku\'','Ruku\' (Membungkuk)','Membungkukkan badan hingga punggung rata dengan kedua tangan memegang lutut, kepala sejajar punggung.','Badan dibungkukkan, tangan pegang lutut, punggung diratakan seperti meja.','assets/images/g06-ruku-dewasa.png','assets/images/g06-ruku.png',NULL,NULL),(7,7,'I\'tidal','Bangun dari Ruku\'','Bangkit dari ruku\' ke posisi berdiri tegak kembali sambil mengangkat kedua tangan sejajar bahu.','Bangun lagi dari membungkuk sampai berdiri tegak, tangan diangkat sebentar.','assets/images/g07-itidal-dewasa.png','assets/images/g07-itidal.png','assets/video/07-itidal-dewasa.mp4','assets/video/07-itidal.mp4'),(8,8,'Sujud Pertama','Sujud Pertama','Meletakkan dahi, hidung, kedua telapak tangan, kedua lutut, dan ujung jari kaki ke lantai dalam posisi sujud.','Nempelin jidat, hidung, kedua tangan, lutut, dan ujung jari kaki ke lantai.','assets/images/g08-sujud1-dewasa.png','assets/images/g08-sujud1.png',NULL,NULL),(9,9,'Duduk di Antara Dua Sujud','Duduk Sebentar','Duduk di antara dua sujud dengan posisi iftirasy (duduk di atas kaki kiri, kaki kanan ditegakkan).','Duduk sebentar di antara dua kali sujud, sebelum sujud yang kedua.','assets/images/g09-duduk-dewasa.png','assets/images/g09-duduk.png',NULL,NULL),(10,10,'Sujud Kedua','Sujud Kedua','Melakukan sujud kedua dengan posisi yang sama seperti sujud pertama, sebagai penutup satu rakaat.','Sujud lagi sekali lagi, sama seperti sujud yang pertama tadi.','assets/images/g10-sujud2-dewasa.png','assets/images/g10-sujud2.png',NULL,NULL),(11,11,'Duduk Tasyahud Awal','Duduk Tasyahud Awal','Dilakukan pada rakaat kedua sholat yang jumlah rakaatnya lebih dari dua, membaca bacaan tasyahud awal.','Duduk di rakaat kedua (kalau sholatnya lebih dari dua rakaat), baca bacaan tasyahud.','assets/images/g11-tasyahud-awal-dewasa.png','assets/images/g11-tasyahud-awal.png',NULL,NULL),(12,12,'Duduk Tasyahud Akhir','Duduk Tasyahud Akhir','Dilakukan pada rakaat terakhir dengan posisi tawarruk, membaca bacaan tasyahud akhir dan sholawat.','Duduk di rakaat terakhir, baca bacaan tasyahud dan sholawat untuk Nabi Muhammad.','assets/images/g12-tasyahud-akhir-dewasa.png','assets/images/g12-tasyahud-akhir.png',NULL,NULL),(13,13,'Salam','Salam Penutup','Menoleh ke kanan lalu ke kiri sambil mengucapkan salam sebagai penutup rangkaian sholat.','Nengok ke kanan dulu, terus ke kiri, sambil ucapkan salam. Sholat selesai!','assets/images/g13-salam-dewasa.png','assets/images/g13-salam.png',NULL,NULL);
/*!40000 ALTER TABLE `gerakan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bacaan`
--

DROP TABLE IF EXISTS `bacaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bacaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gerakan_id` int(11) NOT NULL,
  `urutan_bacaan` int(11) NOT NULL DEFAULT 1,
  `teks_arab` text NOT NULL,
  `transliterasi` text NOT NULL,
  `terjemahan_dewasa` text NOT NULL,
  `terjemahan_anak` text NOT NULL,
  `audio_file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gerakan_id` (`gerakan_id`),
  CONSTRAINT `bacaan_ibfk_1` FOREIGN KEY (`gerakan_id`) REFERENCES `gerakan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bacaan`
--

LOCK TABLES `bacaan` WRITE;
/*!40000 ALTER TABLE `bacaan` DISABLE KEYS */;
INSERT INTO `bacaan` VALUES (1,2,1,'اللَّهُ أَكْبَرُ','Allahu Akbar','Allah Maha Besar.','Allah itu paling besar dan paling hebat.','assets/audio/02-takbir.mp4'),(2,3,1,'اَللّهُمَّ باَعِدْ بَيْنِى وَبَيْنَ خَطَاياَيَ كَمَا باَعَدْتَ بَيْنَ الْمَشْرِقِ وَالْمَغْرِبِاَللّهُمَّ نَقِّنِى مِنَ الْخَطَاياَ كَماَ يُنَقَّى الثَّوْبُ اْلأَبْيَضُ مِنَ الدَّنَسِاَللّهُمَّ اغْسِلْ خَطَاياَيَ باِلْماَءِ وَالثَّلْجِ وَالْبَرَدِ.','Allaahumma baa’id bainii wabainaa khotoo yaa ya kamaa baa ‘adta bainal masyriqi wal maghrib. Allaahumma naqqinii minal khotoo yaa kamaa yunqqots tsaubul abyadhuu minaddanas. Allaahummaghsil khotoo yaa ya bil maa i wats tsalji walbarod.','“Ya Allah, jauhkanlah antara diriku dan di antara kesalahan-kesalahanku sebagaimana Engkau jauhkan antara timur dan barat.\nYa Allah, bersihkanlah aku dari kesalahan \nsebagaimana dibersihkannya kain putih dari kotoran. \nYa Allah, cucilah kesalahan-kesalahanku dengan air, salju dan embun.”','“Ya Allah, jauhkanlah antara diriku dan di antara kesalahan-kesalahanku sebagaimana Engkau jauhkan antara timur dan barat.\nYa Allah, bersihkanlah aku dari kesalahan \nsebagaimana dibersihkannya kain putih dari kotoran. \nYa Allah, cucilah kesalahan-kesalahanku dengan air, salju dan embun.”','assets/audio/03-iftitah.mp4'),(3,4,1,'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ * الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ * الرَّحْمَٰنِ الرَّحِيمِ * مَالِكِ يَوْمِ الدِّينِ * إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ * اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ * صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ','Bismillaahir rahmaanir rahiim. Alhamdu lillaahi rabbil \'aalamiin. Ar-rahmaanir rahiim. Maaliki yaumid diin. Iyyaaka na\'budu wa iyyaaka nasta\'iin. Ihdinash shiraathal mustaqiim. Shiraathal ladziina an\'amta \'alaihim ghairil maghdhuubi \'alaihim walad dhaalliin.','Dengan nama Allah Yang Maha Pengasih lagi Maha Penyayang. Segala puji bagi Allah, Tuhan seluruh alam. Yang Maha Pengasih lagi Maha Penyayang. Penguasa hari pembalasan. Hanya kepada-Mu kami menyembah dan hanya kepada-Mu kami memohon pertolongan. Tunjukilah kami jalan yang lurus. Jalan orang-orang yang telah Engkau beri nikmat, bukan jalan orang yang dimurkai dan bukan jalan orang yang sesat.','Dengan nama Allah yang sayang dan baik hati. Terima kasih ya Allah, yang menjaga seluruh alam. Yang sayang dan baik hati. Yang punya hari akhir nanti. Cuma kepada Allah kita menyembah dan minta tolong. Tunjukkan kami jalan yang benar, jalan orang-orang baik, bukan jalan orang yang salah.','assets/audio/04-fatihah.mp4'),(4,5,1,'قُلْ هُوَ اللَّهُ أَحَدٌ * اللَّهُ الصَّمَدُ * لَمْ يَلِدْ وَلَمْ يُولَدْ * وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ','Qul huwallaahu ahad. Allaahush shamad. Lam yalid wa lam yuulad. Wa lam yakul lahuu kufuwan ahad.','Katakanlah: Dialah Allah, Yang Maha Esa. Allah tempat bergantung segala sesuatu. Dia tidak beranak dan tidak pula diperanakkan. Dan tidak ada sesuatu pun yang setara dengan Dia.','Bilang gini: Allah itu cuma satu. Allah tempat semua makhluk minta tolong. Allah nggak punya anak dan nggak dilahirkan. Nggak ada yang sama kayak Allah.','assets/audio/05-ikhlas.mp4'),(5,6,1,'سُبْحَانَكَ اللّهُمَّ رَبَّناَ وَبِحَمْدِكَ اَللّهُمَّ اغْفِرْلِى','Subhaanaka allaahuma robbanaa wabihamdika allaahumaghfirlii (dibaca 3 kali)','Maha suci Engkau, ya Allah, dan dengan memuji kepada Engkau, ya Allah, aku memohon ampun.','Maha suci Engkau, ya Allah, dan dengan memuji kepada Engkau, ya Allah, aku memohon ampun','assets/audio/06-ruku.mp4'),(6,7,1,'سَمِعَ اللَّهُ لِمَنْ حَمِدَهُ رَبَّنَا وَلَكَ الْحَمْدُ','Sami\'allaahu liman hamidah, rabbanaa wa lakal hamd','Allah mendengar orang yang memuji-Nya. Ya Tuhan kami, bagi-Mu segala puji.','Allah dengar kalau kita puji Dia. Ya Allah, semua pujian buat Kamu.','assets/audio/07-itidal.mp4'),(7,8,1,'سُبْحَانَكَ اللّهُمَّ رَبَّناَ وَبِحَمْدِكَ اَللّهُمَّ اغْفِرْلِى','Subhaanaka allaahuma robbanaa wabihamdika allaahumaghfirlii (dibaca 3 kali)','Maha suci Engkau, ya Allah, dan dengan memuji kepada Engkau, ya Allah, aku memohon ampun.','Allah itu suci dan paling tinggi, kita puji Dia.','assets/audio/08-sujud1.mp4'),(8,9,1,'اَللّهُمَّ اغْفِرْلِى وَارْحَمْنِى وَاجْبُرْنِى وَاهْدِنِى وَارْزُقْنِى','Allaahummaghfirlii warhamnii wajburnii wahdinii warzuqnii','Ya Allah ampunilah aku, kasihanilah aku, cukupilah aku, tunjukilah aku, dan berilah rizki untukku.','Ya Allah, maafin aku, sayang aku, cukupin yang kurang dariku, kasih aku rezeki dan petunjuk, sehatkan aku ya Allah.','assets/audio/09-duduk-antara-sujud.mp4'),(9,10,1,'سُبْحَانَكَ اللّهُمَّ رَبَّناَ وَبِحَمْدِكَ اَللّهُمَّ اغْفِرْلِى','Subhaanaka allaahuma robbanaa wabihamdika allaahumaghfirlii (dibaca 3 kali)','Maha suci Engkau, ya Allah, dan dengan memuji kepada Engkau, ya Allah, aku memohon ampun.','Allah itu suci dan paling tinggi, kita puji Dia lagi.','assets/audio/10-sujud2.mp4'),(10,11,1,'اَلتَّحِيَّاتُ لِلّهِ وَالصَّلَوَاتُ وَالطَّيِّباَتُ. اَلسَّلاَمُ عَلَيْكَ أَيُّهاَ النَّبِيُّوَرَحْمَةُ اللهِ وَبَرَكاَتُهُ. اَلسَّلاَمُ عَلَيْناَ وَعَلَى عِباَدِاللهِ الصَّالِحِيْنَأَشْهَدُ اَنْ لاَاِلَهَ اِلاَّ اللهِ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُوْلُهُ للَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ ، وَعَلَى آلِ مُحَمَّدٍ ، كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ ، إِنَّكَ حَمِيدٌ مَجِيدٌ ، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ ، وَعَلَى آلِ مُحَمَّدٍ ، كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ ، وَعَلَى آلِ إِبْرَاهِيمَ ، إِنَّكَ حَمِيدٌ مَجِيدٌ',' “Attahiyyaatu lillaahi washsholawaatu waththoyyibaat. Assalaamu ‘alaika ayyuhannabiyyu warohmatullaahi wabarokaatuh. Assalaamu’alainaa wa’ala ‘ibaadillaahi shshoolihiin. Asyhadu anlaa ilaaha illallaah waasyhadu annamuhammadan ‘abduhu warosuuluh. Allahumma sholli ‘ala Muhammad wa ‘ala aali Muhammad kamaa shollaita ‘ala Ibroohim wa ‘ala aali Ibrohim, innaka hamidun majiid. Allahumma baarik ‘ala Muhammad wa ‘ala aali Muhammad kamaa baarokta ‘ala Ibrohim wa ‘ala aali Ibrohimm innaka hamidun majiid.”','“Segala kehormatan, kebahagiaan dan kebagusan adalah kepunyaan Allah. Semoga keselamatan bagi Engkau, ya Nabi Muhammad, beserta rahmat dan kebahagiaan Allah. Mudah-mudahan keselamatan juga bagi kita sekalian dan hamba-hamba Allah yang baik-baik. Aku bersaksi bahwa tiada Tuhan melainkan Allah dan aku bersaksi bahwa Muhammad itu hamba Allah dan utusan-Nya. Ya Allah, semoga shalawat tercurah kepada Muhammad dan keluarga Muhammad. Seperti rahmat yang tercurah pada Ibrahim dan keluarga Ibrahim. Dan limpahilah berkah atas Nabi Muhammad beserta para keluarganya. Seperti berkah yang Engkau berikan kepada Nabi Ibrahim dan keluarganya. Sesungguhnya Engkau Maha Terpuji lagi Maha Mulia di seluruh alam.\"','Semua pujian dan kebaikan itu cuma milik Allah.','assets/audio/11-tasyahud-awal.mp4'),(11,12,1,'لتَّحِيَّاتُ لِلّهِ وَالصَّلَوَاتُ وَالطَّيِّباَتُ. اَلسَّلاَمُ عَلَيْكَ أَيُّهاَ النَّبِيُّوَرَحْمَةُ اللهِ وَبَرَكاَتُهُ. اَلسَّلاَمُ عَلَيْناَ وَعَلَى عِباَدِاللهِ الصَّالِحِيْنَأَشْهَدُ اَنْ لاَاِلَهَ اِلاَّ اللهِ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُوْلُهُ للَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ ، وَعَلَى آلِ مُحَمَّدٍ ، كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ ، إِنَّكَ حَمِيدٌ مَجِيدٌ ، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ ، وَعَلَى آلِ مُحَمَّدٍ ، كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ ، وَعَلَى آلِ إِبْرَاهِيمَ ، إِنَّكَ حَمِيدٌ مَجِيدٌ. اَللَّهُمَّ إِنِّيْ أَعُوْذُ بِكَ مِنْ عَذَابِ جَهَنَّمَ وَمِنْ عَذَابِ الْقَبْرِ وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ وَمِنْ شَرِّفِتْنَةِ الْمَسِيْحِ الدَّجَّالِ',' “Attahiyyaatu lillaahi washsholawaatu waththoyyibaat. Assalaamu ‘alaika ayyuhannabiyyu warohmatullaahi wabarokaatuh. Assalaamu’alainaa wa’ala ‘ibaadillaahi shshoolihiin. Asyhadu anlaa ilaaha illallaah waasyhadu annamuhammadan ‘abduhu warosuuluh. Allahumma sholli ‘ala Muhammad wa ‘ala aali Muhammad kamaa shollaita ‘ala Ibroohim wa ‘ala aali Ibrohim, innaka hamidun majiid. Allahumma baarik ‘ala Muhammad wa ‘ala aali Muhammad kamaa baarokta ‘ala Ibrohim wa ‘ala aali Ibrohimm innaka hamidun majiid. Allaahumma inni a’uudzubika min ‘adzaabil qabri wa min ‘adzaabinnaari jahannama wa min fitnatil mahyaa wal mamaati wa min fitnatil masiihid dajjaal.”','“Segala kehormatan, kebahagiaan dan kebagusan adalah kepunyaan Allah. Semoga keselamatan bagi Engkau, ya Nabi Muhammad, beserta rahmat dan kebahagiaan Allah. Mudah-mudahan keselamatan juga bagi kita sekalian dan hamba-hamba Allah yang baik-baik. Aku bersaksi bahwa tiada Tuhan melainkan Allah dan aku bersaksi bahwa Muhammad itu hamba Allah dan utusan-Nya. Ya Allah, semoga shalawat tercurah kepada Muhammad dan keluarga Muhammad. Seperti rahmat yang tercurah pada Ibrahim dan keluarga Ibrahim. Dan limpahilah berkah atas Nabi Muhammad beserta para keluarganya. Seperti berkah yang Engkau berikan kepada Nabi Ibrahim dan keluarganya. Sesungguhnya Engkau Maha Terpuji lagi Maha Mulia di seluruh alam. Ya Allah, sesungguhnya aku berlindung kepadaMu dari adzab Jahannam, dari adzab kubur, dari fitnah kehidupan dan kematian, dan dari keburukan fitnah Dajjal.”','Semua kebaikan itu punya Allah ... Ya Allah, sayangi Nabi Muhammad dan keluarganya ya.','assets/audio/12-tasyahud-akhir.mp4'),(12,13,1,'السَّلاَمُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكَاتُهُ','Assalaamua’alaikum warohmatullaahi wabarokaatuh (menoleh kanan lalu kiri)','Berbahagialah kamu sekalian dengan rahmat dan berkah Allah.','Semoga kalian selamat dan disayang Allah ya.','assets/audio/13-salam.mp4');
/*!40000 ALTER TABLE `bacaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengaturan`
--

DROP TABLE IF EXISTS `pengaturan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengaturan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelompok` varchar(150) NOT NULL DEFAULT 'Nama Kelompok',
  `program_studi` varchar(150) NOT NULL DEFAULT 'Program Studi',
  `mata_kuliah` varchar(150) NOT NULL DEFAULT 'Mata Kuliah',
  `nama_dosen` varchar(150) NOT NULL DEFAULT 'Nama Dosen',
  `judul_aplikasi` varchar(200) NOT NULL DEFAULT 'Panduan Sholat Interaktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengaturan`
--

LOCK TABLES `pengaturan` WRITE;
/*!40000 ALTER TABLE `pengaturan` DISABLE KEYS */;
INSERT INTO `pengaturan` VALUES (1,'Muhammad Kasyful Azim, Feprian, Rifa Rakha Hafizhta, Muhammad Habibi, Nabil Yumn Afif','Teknik Informatika','AIK','Dedy Susanto, S.Pd.I., M.M.','Panduan Sholat Interaktif');
/*!40000 ALTER TABLE `pengaturan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-13 21:43:01
