USE [master]
GO
/****** Object:  Database [Kutuphane]    Script Date: 11.02.2025 22:22:10 ******/
CREATE DATABASE [Kutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kutuphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kutuphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kutuphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kutuphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Kutuphane] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kutuphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Kutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kutuphane] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kutuphane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [Kutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kutuphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kutuphane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kutuphane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kutuphane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Kutuphane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Kutuphane]
GO
/****** Object:  UserDefinedFunction [dbo].[CarpmaYap]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CarpmaYap]
(
@deger1 int,
@deger2 int
)
returns int 
as
begin
return @deger1 * @deger2
end
GO
/****** Object:  UserDefinedFunction [dbo].[MailOlustur]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[MailOlustur]
(
@ad nvarchar(50),
@soyad nvarchar(50)
)
returns char(17)
as
begin
declare @birleştirici char(17)
set @birleştirici=LOWER(LEFT(@ad,3)+'.'+RIGHT(@soyad,3)+ '@gmail.com')
return @birleştirici
end
GO
/****** Object:  UserDefinedFunction [dbo].[OrtalamaAl]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[OrtalamaAl]
(
@s1 money,
@s2 money,
@s3 money
)
returns money
as
begin
return (@s1+@s2+@s3)/3
end
GO
/****** Object:  UserDefinedFunction [dbo].[ToplamaYap]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ToplamaYap]
(
@deger1 int,
@deger2 int
)
returns int 
as
begin
return @deger1 + @deger2
end
GO
/****** Object:  UserDefinedFunction [dbo].[YasHesapla]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[YasHesapla]
(
@tarih date
)
returns int
as
begin
declare @yas int 
set @yas=DATEDIFF(YEAR,@tarih,GETDATE())
return @yas
end
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisId] [int] IDENTITY(1,1) NOT NULL,
	[MüsteriId] [int] NOT NULL,
	[Tarih] [date] NOT NULL,
	[Tutar] [money] NOT NULL,
	[CalisanId] [int] NULL,
	[TeslimatTarihi] [date] NULL,
	[KargoUcreti] [int] NULL,
	[TeslimatUlkesi] [nchar](30) NULL,
	[TeslimatBolgesi] [nchar](30) NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nchar](30) NOT NULL,
	[Soyad] [nchar](30) NOT NULL,
	[Email] [nchar](22) NOT NULL,
	[Telefon] [int] NOT NULL,
	[Adres] [nchar](50) NULL,
	[UyelikTarihi] [date] NOT NULL,
	[Bolge] [nchar](10) NULL,
	[Sehir] [nchar](13) NULL,
	[Ulke] [nchar](20) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AmerikalıMusteri]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[AmerikalıMusteri]
as
select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, m.Sehir, s.Tarih from Siparisler s
INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
where m.Ulke = 'ABD'
GO
/****** Object:  View [dbo].[TurkMusteri]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TurkMusteri]
as
select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, s.Tarih from Siparisler s
INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
where m.Ulke = 'Turkiye'
group by m.MusteriId, m.Ad + m.Soyad, m.Ulke, s.Tarih
GO
/****** Object:  Table [dbo].[Calisanlar]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisanlar](
	[CalisanId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nchar](10) NOT NULL,
	[Soyad] [nchar](10) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Telefon] [int] NOT NULL,
	[BaslangicTarihi] [date] NOT NULL,
	[Yetki] [nchar](50) NOT NULL,
	[Maas] [money] NOT NULL,
	[DogumTarihi] [date] NOT NULL,
	[Sehir] [nchar](50) NULL,
	[Ulke] [nchar](50) NULL,
	[Rapor] [nchar](30) NULL,
 CONSTRAINT [PK_Calisanlar] PRIMARY KEY CLUSTERED 
(
	[CalisanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapId] [int] IDENTITY(1,1) NOT NULL,
	[KitapAdi] [nchar](30) NOT NULL,
	[YazarId] [int] NOT NULL,
	[Fiyat] [money] NOT NULL,
	[Stok] [int] NOT NULL,
	[KategoriId] [int] NOT NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiparisDetaylari]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetaylari](
	[SiparisDetayId] [int] IDENTITY(1,1) NOT NULL,
	[MüsteriId] [int] NOT NULL,
	[Adet] [int] NOT NULL,
	[BirimFiyat] [money] NOT NULL,
	[KitapId] [int] NOT NULL,
	[SiparisId] [int] NOT NULL,
 CONSTRAINT [PK_SiparisDetaylari] PRIMARY KEY CLUSTERED 
(
	[SiparisDetayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DetayliSatisRaporu]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create table Musteriler 
--(
--MusteriId int,
--Ad nvarchar(30),
--Soyad nvarchar(30),
--Email nvarchar(30),
--Telefon int,
--Adres nvarchar(50),
--UyelikTarihi date
--);

--create table Kategoriler 
--(
--KategoriId int,
--KategoriAdi nvarchar(30),
--Aciklama nvarchar(50)
--);

--create table Yazarlar 
--(
--YazarId int,
--Ad nvarchar(30),
--Soyad nvarchar(30),
--DogumYili date
--);

--create table Kitaplar 
--(
--KitapId int,
--KitapAdi nvarchar(30),
--YazarId int,
--Fiyat money,
--Stok int,
--KategoriId int
--);

--create table Siparisler 
--(
--SiparisId int,
--MüsteriId int,
--Tarih date,
--Tutar money
--);

--create table SiparisDetaylari 
--(
--SiparisDetayId int,
--Adet int,
--BirimFiyat money,
--KitapId int,
--SipariId int    
--);

--create table Odemeler 
--(
--Id int,
--SiparisId int,
--MusteriId int,
--Tutar money,
--ÖdemeTürü nvarchar(10),
--Tarih date
--);

--create table Yorumlar 
--(
--YorumId int,
--KitapId int,
--MusteriId int,
--Puan int,
--Yorum nvarchar(100),
--Tarih date
--);

--Ürünlerin idleri adları stok miktarlarini fiyatlarını ve fiyatlara kdv eklenmiş hallerini raporlayınız.
--select k.KitapAdi, k.Fiyat*1.18 KdvFiyat, k.Fiyat from Kitaplar k

--select GETDATE() --2025-02-09 13:04:05.247
--select DAY(GETDATE()) --9
--select MONTH(GETDATE()) --2
--select YEAR(GETDATE()) --2025

--Bugünden 19.02.1923 tarihine kadar geçen zamanı yıl bazında raporlayınız.
--select DATEDIFF(YEAR, '02.19.1923', GETDATE())

--Çalışanların ad ve soyadlarıyla birlikte yaşlarını gruplayınız.
--select c.CalisanId, c.Ad, c.Soyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c
--select c.CalisanId, LEFT(c.Ad, 1) + '.' + c.Soyad AdSoyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c

--Ürün ücreti 400 den yüksek olan ürünleri raporlayınız.
--select * from Kitaplar k where k.Fiyat > 400

--Londra da yaşayan personelleri listeleyiniz.
--select * from Calisanlar c where c.Sehir = 'Londra'

--CategoryID si 5 olmayan ürünlerimin adlarını ve CategoryID lerini yazınız.
--select * from Kitaplar k where k.KategoriId != 5

--'01.05.2019' tarihinden sonra işe girmiş personelimin ad,soyad ve işe giriş tarihini raporlayınız
--select * from Calisanlar c where c.BaslangicTarihi > '01.05.2019'

--Ürünlerimin arasında stok miktarı 20 ile 50 dahil ve arasında olan ürünleri raporlayınız.
--select * from Kitaplar k where k.Stok > 20 and k.Stok >= 50

--Yaşı 30 dan büyük ve dahil olan ingilterede oturmayan çalışanların ad ve yaşını raporlayınız ancak isimler a.akkuş formatında olmalıdır.
--select LEFT(c.Ad, 1) + '.' + c.Soyad AdSoyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c 
--where c.Ulke != 'UK' 
--and DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) > 30

--2020 dahil ve sonra alınmış kargo ücreti 20 den büyük ve Fransaya gönderilmemiş siparişlerin ID sini, sipariş tarihini, teslimat tarihlerini ve kargo ücretlerini raporlayınız.
--select s.SiparisId, s.Tarih, s.TeslimatTarihi, s.KargoUcreti from Siparisler s 
--where s.KargoUcreti > 20 and s.TeslimatUlkesi != 'Fransa'

--Henüz müşteriye ulaşılmamış siparişleri listeleyin.
--select * from Siparisler s where s.TeslimatTarihi is null

--Müşteriye ulaşılmış siparişleri listeleyin.
--select * from Siparisler s where s.TeslimatTarihi is not null

--Bölge bilgisi olmayan müşterileri listeleyin.
--select * from Musteriler m where m.Bolge is null

--Bölge bilgisi olan müşterileri listeleyin.
--select * from Musteriler m where m.Bolge is not null

--Kimseye rapor vermeyen personelleri lsteleyin.
--select * from Calisanlar c where c.Rapor is null

--8 yada 10 id lerine sahip olan müşteriler tarafından alınmış 3 nolu personelin onayladığı
--bölgesi olmayan siparişleri raporlayınız
--select * from Siparisler s 
--where (s.MüsteriId = 8 or s.MüsteriId = 10)
--and s.CalisanId = 3 and s.TeslimatBolgesi is null

--8 yada 10 id lerine sahip olan müşteriler tarafından alınmış 3 nolu personelin onayladığı
--bölgesi olmayan siparişlerin idsini küçükten büyüğe(a dan z ye) raporlayınız
--select * from Siparisler s 
--where (s.MüsteriId = 8 or s.MüsteriId = 10)
--and s.CalisanId = 3 and s.TeslimatBolgesi is null
--order by s.SiparisId asc

--Personelin adını a dan z ye sıralayınız.
--select c.Ad + ' ' + c.Soyad AdSoyad from Calisanlar c
--order by AdSoyad asc

--Müşterilerin id lerini şirket adlarını ve ülkelerini raporlayınız, ancak ülke fransız olacak ve müşteri idlerine göre desc sıralanacak.
--select * from Musteriler m where m.Ulke = 'Fransa'
--order by m.MusteriId desc

--En ucuz 10 tane ürünü raporlayınız.
--select top 10 * from Kitaplar k 
--order by k.Fiyat asc 

--En son teslim edilen 5 siparişin detaylarını raporlayınız.
--select top 5 * from Siparisler s 
--order by s.TeslimatTarihi desc

--Stok miktarı 20 den büyük ve eşit 49 dan küçük ve eşit ürünleri listeleyiniz.
--select * from Kitaplar k
--where k.Stok >= 20 and k.Stok <= 49
--order by k.Fiyat asc

--select * from Kitaplar k
--where k.Stok between 20 and 49
--order by k.Fiyat asc

--01.01.2020 ile 01.06.2025 tarihleri arasındaki siparişleri raporlayınız.
--select * from Siparisler s where s.Tarih between '01.01.2020' and '01.06.2025'

--01.01.2020 ile 01.06.2025 tarihleri arasında, müşteri idsi 5 veya 20 olan vermiş olduğu siparişleri raporlayınız.
--select * from Siparisler s where s.Tarih between '01.01.2020' and '01.06.2025' and (s.MüsteriId = 5 or s.MüsteriId = 20)

--Baş harfi h olan stoklarda mevcut 100 ile 250 dolar arası ücreti olan ürünleri fiyatlarına göre listeleyiniz.
--select * from Kitaplar k where LEFT(k.KitapAdi, 1) = 'h' and (k.Stok is not null) and (k.Fiyat between 100 and 250)

--Baş harfi h olan stoklarda mevcut 100 ile 250 dolar arası ücreti olan ürünleri fiyatlarına göre listeleyiniz.
--select k.KitapId ,k.KitapAdi, k.Fiyat, k.Stok from Kitaplar k where LEFT(k.KitapAdi, 1) = 'h' and (k.Stok is not null) and (k.Fiyat between 100 and 250) order by k.Fiyat asc

--Çarşamba günü alınan kargo ücretleri 50 ile 100 arasında olan teslim tarihi null olmayan sipariş bilgilerini raporlayın ve sipariş tarihine göre büyükten küçüğe sıralayınız.
--select * from Siparisler s where DATENAME(WEEKDAY,s.Tarih)='Tuesday' and (s.TeslimatTarihi is not null) and (s.KargoUcreti between 50 and 100) order by s.Tarih desc

--Soyadları b harfi ile başlayan müşterileri listeleyiniz.
--select * from Musteriler m where m.Soyad like 'a%'

--İsimleri a harfi ile biten müşterileri listeleyiniz.
--SELECT * FROM Musteriler m where m.Sehir like '%o'

--Şehirleri arasında 'nb' geçen müşterileri listeleyiniz.
--select * from Musteriler m where m.Sehir like '%nb%'

--Müşteri maillerinden ilk iki harfi bilinmeyen ama son üç harfi 'com' olan müşterileri listeleyiniz.
--select * from Musteriler m where m.Email LIKE '%com'

--Müşteri emaillerinde ilk harfi a yada s arasında olan müşterileri listeleyiniz.
--select * from Musteriler m where m.Email like '[AS]%'

--Müşteri emaillerinde ilk harfi a ile k arasında olan müşterileri getiriniz.
--select * from Musteriler m where m.Email like '[A-K]%'

--Müşteri emaillerinde ilk harfi a olan, ikinci harfinde n olmayan müşterileri listeleyiniz.
--select * from Musteriler m where LEFT(m.Email, 1) = 'A' and LEFT(m.Email, 2) != 'N'
--select * from Musteriler m where m.Email like 'A[^N]%'

--Ülkesi İngiltere olmayan adı a ile başlayıp soyadı r ile biten, doğum tarihi 1991 den önce olan çalışanları listeleyiniz.
--select * from Calisanlar c where c.Ulke != 'UK' and (c.Ad like 'A%' and c.Soyad like '%k') and (YEAR(c.DogumTarihi) < 1991)

--Stokta bulunan kaç adet ürünüm var listeleyiniz.
--select COUNT(k.KitapId) ToplamUrunAdeti from Kitaplar k where k.Stok > 0

--2020 yılından sonra alınmış kaç adet siparişim var raporlayınız.
--select COUNT(s.SiparisId) from Siparisler s where YEAR(s.Tarih) > 2020

--Kaç ülkeden müşterimiz bulunmaktadır(x ülkesinden y kadar).
--select COUNT(s.TeslimatUlkesi) ToplamUlke, s.TeslimatUlkesi from Siparisler s group by s.TeslimatUlkesi

--Her bir üründen bir adet alırsam ne kadar öderim listeleyiniz.
--select SUM(k.Fiyat) from Kitaplar k

--Depoda ücret bazlı olarak toplam ne kadarlık ürünüm kalmıştır listeleyiniz.
--select SUM(k.Fiyat * k.Stok) ToplamKalan from Kitaplar k

--2025 yılından alınmış olan siparişlerim için toplam ne kadarlık kargo ödemesi yapmışımdır listeleyiniz.
--select SUM(s.KargoUcreti) ToplamOdeme from Siparisler s where YEAR(s.Tarih) = '2025'

--Bu zamana kadar ödenmmiş ortalama kargo ücretini bulunuz.
--select AVG(s.KargoUcreti) from Siparisler s
--select SUM(s.KargoUcreti)/COUNT(s.SiparisId) from Siparisler s

--Şu ana kadar toplam kaç dolarlık cirom var bulunuz.
--select SUM(sp.BirimFiyat * sp.Adet) from SiparisDetaylari sp

--Ülke başına ne kadarlık kargo ücreti ödendi bulunuz.
--select SUM(s.KargoUcreti)/COUNT(distinct s.TeslimatUlkesi) UlkeBasınaOdenenUcret, s.TeslimatUlkesi from Siparisler s GROUP BY s.TeslimatUlkesi

--Sipariş başına ortalama ne kadarlık kargo ücreti ödendi bulunuz.
--select s.SiparisId, AVG(s.KargoUcreti) SiparisBasinaUcret from Siparisler s group by s.SiparisId

--En yüksek bedelli ürünümü raporlayınız.
--select top 1 k.KitapAdi, k.YazarId, k.Fiyat from Kitaplar k order by k.Fiyat desc

--En düşük fiyatlı ürünümü raporlayınız.
--select k.KitapAdi, k.YazarId, MIN(k.Fiyat) Fiyat from Kitaplar k group by k.KitapAdi, k.YazarId, k.Fiyat order by k.Fiyat asc

--Müşteri idleri leri 5-10 arasında olanların vermiş oldukları, sipariş tarihi 01.01.2020 ile 06.06.2023 arasında olan siparişlere, en az ne kadar kargo ücreti ödenmiştir raporlayınız.
--select MIN(s.KargoUcreti) ToplamKargoUcreti from Siparisler s where s.MüsteriId between 5 and 10 and (s.Tarih between '01.01.2020' and '06.06.2023') 

--En fazla satışımızda kaç dolarlık satış yapılmıştır bulunuz.
--select MAX(sd.Adet * sd.BirimFiyat) Toplam from SiparisDetaylari sd

--Teslimat bölgesi MAR veya IC olan, 2023 yılında bir pazartesi günü alınmış siparişler için ödenen azami kargo bedelini bulunuz.
--select s.SiparisId, s.MüsteriId, s.Tarih, s.TeslimatBolgesi ,MAX(s.KargoUcreti) AzamiKargoBedeli from Siparisler s 
--where s.TeslimatBolgesi in('MAR', 'IC') and DATENAME(WEEKDAY, s.Tarih) = 'Monday' 
--group by s.SiparisId, s.MüsteriId, s.Tarih, s.TeslimatBolgesi
--order by MAX(s.KargoUcreti)

--1, 5 yada 15 id li müşteriler tarafından istenmiş EGE bölgesine gönderilen, kargo ücreti 20 ile 200 dolar arasında olan siparişlere toplam ne kadarlık kargo ödemesi gerçekleşmiştir raporlayınız.
--select SUM(s.KargoUcreti) ToplamKargoOdemesi from Siparisler s 
--where s.MüsteriId in(1, 5, 15) AND s.TeslimatBolgesi = 'EGE' AND s.KargoUcreti between 20 and 200

--1, 5 yada 15 id li müşteriler tarafından istenmiş EGE bölgesine gönderilen
--kargo ücreti 20 ile 200 dolar arasında olan siparişlere toplam ne kadarlık kargo ödemesi gerçekleşmiştir raporlayınız(DETAYLI CEVAP).
--select s.MüsteriId, s.SiparisId, s.TeslimatBolgesi ,SUM(s.KargoUcreti) ToplamKargoOdemesi from Siparisler s 
--where s.MüsteriId in(1, 5, 15) AND s.TeslimatBolgesi = 'EGE' AND s.KargoUcreti between 20 and 200
--group by s.MüsteriId, s.SiparisId, s.TeslimatBolgesi
--order by s.MüsteriId 

--Ülkelere göre çalışan sayısı nedir raporlayınız.
--select c.Ulke, COUNT(c.CalisanId) ToplamCalisan from Calisanlar c group by c.Ulke order by COUNT(c.CalisanId) asc

--Çalışanlara göre almış oldukları sipariş sayısını raporlayınız.
--select s.CalisanId, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.CalisanId
--ORDER BY SiparisSayisi desc

--Ülkelere göre siparis sayısını raporlayınız ve en çok sipariş veren 3 ülkeyi listeleyiniz.
--select top 3 s.TeslimatUlkesi, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.TeslimatUlkesi ORDER BY SiparisSayisi desc

--Hangi müşteri kaç kere alışveriş yapmıştır raporlayınız.
--select s.MüsteriId, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.MüsteriId ORDER BY SiparisSayisi desc

--Hangi personel kaç satışta yer almıştır raporlayınız.
--select s.CalisanId, COUNT(s.SiparisId) SatisSayisi from Siparisler s GROUP BY s.CalisanId ORDER BY SatisSayisi desc

--Hangi kategoriden toplam kaç tane ürün vardır(stoklarla beraber) raporlayınız.
--select k.KategoriId, SUM(k.Stok) StoktaOlanToplamUrunSayisi from Kitaplar k 
--GROUP BY k.KategoriId 
--ORDER BY StoktaOlanToplamUrunSayisi desc

--Ürünleri bulundukları kategori adlarıyla birlikte raporlayınız.
--select k.KitapAdi, c.KategoriAdi from Kitaplar k INNER JOIN Kategoriler c ON k.KategoriId = c.KategoriId

--Ürünlerin satış raporunu ürün adı, satış fiyatı, adet şeklinde listeleyiniz.
--select k.KitapAdi, sd.BirimFiyat, sd.Adet from SiparisDetaylari sd 
--INNER JOIN Kitaplar k ON sd.KitapId = k.KitapId

--Hangi satıştan hangi ürünler satılmıştır raporlayınız.
--select s.SiparisId, k.KitapAdi, sd.Adet, s.Tarih from Siparisler s 
--INNER JOIN SiparisDetaylari sd ON s.SiparisId = sd.SiparisId 
--INNER JOIN Kitaplar k ON k.KitapId = sd.KitapId

--Hangi personel hangi müşteriye hangi tarihte satış yapmıştır raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, LEFT(m.Ad, 1) + '.' + m.Soyad MusteriAdSoyad, s.Tarih from Calisanlar c 
--INNER JOIN Siparisler s ON c.CalisanId = s.CalisanId
--INNER JOIN Musteriler m ON s.MüsteriId = m.MusteriId

--Hangi kategoriden kaç tane ürünüm var raporlayınız.
--select k.KategoriAdi, count(kp.KitapID) AS KategoriBazindaUrunSayisi from Kategoriler k
--left join Kitaplar kp ON k.KategoriId = kp.KategoriID GROUP BY k.KategoriAdi 
--order by KategoriBazindaUrunSayisi desc

--Hangi müşteri hangi üründen kaç dolarlık alışveriş yapmıştır raporlayınız.
--select m.Ad, k.KitapAdi, (sd.BirimFiyat*sd.Adet) ToplamSatış from Musteriler m
--inner join Siparisler s on s.MüsteriId=m.MusteriId
--inner join SiparisDetaylari sd on sd.SiparisId=s.SiparisId
--inner join Kitaplar k on k.KitapId= sd.KitapId

--Hangi personel hangi kategoriden ne kadar satmıştır(kaç adet her kategoriden) raporlayınız.
--select LEFT(c.Ad, 1)+ '.' + c.Soyad CalisanAdSoyad, ktg.KategoriAdi, k.KitapAdi, sd.Adet from Kategoriler ktg 
--inner join Kitaplar k on k.KategoriId = ktg.KategoriId
--inner join SiparisDetaylari sd on k.KitapId = sd.KitapId
--inner join Siparisler s on sd.SiparisId = s.SiparisId 
--inner join Calisanlar c on s.CalisanId = c.CalisanId

--Ürün adlarını ve kategori adlarını raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi from Kitaplar k
--INNER JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId

--ROMAN kategorisine ait stoklarda bulunan ürünleri raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi, k.Stok from Kitaplar k 
--INNER JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId
--where ktg.KategoriAdi = 'ROMAN' and k.Stok > 0

--Müşteri adları arasında a geçen müşterilerin vermiş olduğu 7, 10 yada 18 id li çalışan tarafından alınmış siparişlere toplam ne kadarlık kargo ödemesi yapılmıştır raporlayınız.
--select SUM(s.KargoUcreti) ToplamKargoUcreti from Siparisler s 
--inner join Musteriler m on m.MusteriId = s.MüsteriId
--inner join Calisanlar c on s.CalisanId = c.CalisanId
--where m.Ad like '%a%' and c.CalisanId in(7, 10, 18)

--Her bir üründen toplam ne kadarlık satış yapılmıştır ve o ürünler hangi kategoriye aittir raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi ,SUM(sd.BirimFiyat * sd.Adet) ToplamSatis from Kategoriler ktg
--inner join Kitaplar k on ktg.KategoriId = k.KategoriId 
--inner join SiparisDetaylari sd on k.KitapId = sd.KitapId
--group by k.KitapAdi, ktg.KategoriAdi
--order by ToplamSatis desc

--Kategorisi olmayan ürünleri raporlayınız.
--select * from Kitaplar k LEFT JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId

--Ürünü olmayan kategorileri raporlayınız.
--select * from Kategoriler ktg left join Kitaplar k on ktg.KategoriId = k.KategoriId

--Kategorilerin toplam satışlarını raporlayınız.
--select ktg.KategoriAdi, Sum(sd.BirimFiyat * sd.Adet) ToplamSatis
--from Kategoriler ktg 
--left join Kitaplar k on ktg.KategoriId = k.KategoriId
--left join SiparisDetaylari sd on sd.KitapId = k.KitapId
--group by ktg.KategoriAdi
--order by ToplamSatis desc

--Hangi personel hangi ürünü toplam kaç dolarlık satmıştır raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, k.KitapAdi, SUM(sd.BirimFiyat * sd.Adet) Toplam from Kitaplar k
--LEFT JOIN SiparisDetaylari sd ON sd.KitapId = k.KitapId
--LEFT JOIN Siparisler s ON sd.SiparisId = s.SiparisId
--LEFT JOIN Calisanlar c ON s.CalisanId = c.CalisanId
--GROUP BY LEFT(c.Ad, 1) + '.' + c.Soyad, k.KitapAdi
--ORDER BY Toplam desc

--Sipariş vermeyen müşterilerin adını ve sipariş tarihini raporlayınız.
--select * from Musteriler m RIGHT JOIN Siparisler s ON m.MusteriId = s.MüsteriId

--Toplam sipariş miktarı 2 nin üstünde olan ürünlerin adlarını ve sipariş miktarlarını raporlayınız.
--select k.KitapAdi, SUM(sd.Adet) SiparisMiktari from SiparisDetaylari sd
--INNER JOIN Kitaplar k ON k.KitapId = sd.KitapId
--GROUP BY k.KitapAdi
--HAVING sum(sd.Adet) > 2
--ORDER BY SiparisMiktari desc

--Hangi personel hangi ürünü toplam kaç dolarlık satmıştır, toplam satışı 100 den büyük olanları raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, k.KitapAdi, SUM(sd.BirimFiyat * sd.Adet) Toplam from Kitaplar k
--LEFT JOIN SiparisDetaylari sd ON k.KitapId = sd.KitapId
--LEFT JOIN Siparisler s ON s.SiparisId = sd.SiparisId
--LEFT JOIN Calisanlar c ON s.CalisanId = c.CalisanId
--GROUP BY LEFT(c.Ad, 1) + '.' + c.Soyad, k.KitapAdi
--HAVING SUM(sd.BirimFiyat * sd.Adet) > 100
--ORDER BY Toplam desc

--Yeni bir kategori ve açıklamasını ekleyiniz.
--INSERT Kategoriler(KategoriAdi, Aciklama) values('Siir', 'Siir Kitaplari')
--select * from Kategoriler

--Yeni bir personel ekleyiniz.
--insert Calisanlar 
--values ('Ezgi Cagla', 'Sariyildiz', 'ezgi.sryldz@gmail.com', '020193847', '2020.09.27', 'Patron', '100000', '2000.09.21', 'Istanbul', 'Turkiye', null)
--select * from Calisanlar c

--Sadece 4 id li musterinin telefon değeri değiştirip raporlayınız.
--select * from Musteriler m
--update Musteriler set Telefon = '53958432'
--where MusteriId = 4

--Çalışanlar tablosundaki Eylül adlı çalışanın doğum tarihini 01.01.1999 ve soyadını Han olarak değiştirin ve raporlayınız.
--select * from Calisanlar c
--insert Calisanlar(Ad, Soyad) values('Eylül', 'Bahar')
--update Calisanlar set DogumTarihi = '1999.01.01'
--where CalisanId=3

--Stoğu 10 dan küçük olan ürünlere %6 zam yapan kodu tasarlayınız.
--select * from Kitaplar
--update Kitaplar set Fiyat *= 1.06 
--where Stok = 5

--Türk müşterilerden alınmış siparişleri listeleyiniz.
--create view TurkMusteri
--as
--select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, m.Sehir, s.Tarih from Siparisler s
--INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
--where m.Ulke = 'Turkiye'
--group by m.MusteriId, m.Ad + m.Soyad, m.Ulke, m.Sehir, s.Tarih
--select * from TurkMusteri

--Türk müşterilerden alınmış siparişleri listeleyen view den şehiri kaldırınız.
--alter view TurkMusteri
--as
--select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, s.Tarih from Siparisler s
--INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
--where m.Ulke = 'Turkiye'
--group by m.MusteriId, m.Ad + m.Soyad, m.Ulke, s.Tarih
--select * from TurkMusteri

--Kategori ismi ve açıklamasını içeren bir view oluşturunuz.
--CREATE VIEW Kategori
--AS
--SELECT ktg.KategoriAdi, ktg.Aciklama FROM Kategoriler ktg
--select * from Kategori

--Oluşturduğumuz kategori viewine yeni bir veri ekleyiniz.
--INSERT Kategori(KategoriAdi, Aciklama) values('Dergi', 'Dergiler')
--SELECT * FROM Kategori

--Ürünü olan ve olmayan kategorileri listeleyiniz.
--CREATE VIEW ButunUrunler
--AS
--SELECT k.KitapAdi, ktg.KategoriAdi FROM Kitaplar k 
--RIGHT JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId
--SELECT * FROM ButunUrunler

--WITH SCHEMABINDING kullanarak bütün müşterileri idleri ve mailleriyle beraber getiriniz.
--CREATE VIEW ButunMusteriler
--with schemabinding
--AS
--SELECT m.MusteriId, m.Email FROM dbo.Musteriler m
--select * from ButunMusteriler

--ENCRYPTION : ButunMusteriler için bu keywordü kullanınız.
--ALTER VIEW ButunMusteriler
--with schemabinding, encryption
--AS
--SELECT m.MusteriId, m.Email FROM dbo.Musteriler m
--select * from ButunMusteriler

--Araştırma kategorisine ait stoklarımda mevcut ürünlerin adlarını, ücretlerini, kdvli ücretlerini gösteren bir view tasarlayınız.
--(bağlı bulunduğu kolonlar asla silinmemeli view kodları görünmemelidir)
--create view KategoriyeUrun
--with schemabinding, encryption
--as 
--select ktg.KategoriAdi, k.KitapAdi, k.Fiyat, (k.Fiyat*1.18) KdvliUcret, k.Stok from dbo.Kategoriler ktg
--inner join dbo.Kitaplar k on k.KategoriId = ktg.KategoriId
--where ktg.KategoriAdi = 'Araştırma' and k.Stok > 0
--select * from KategoriyeUrun

--Dışarıdan girilen değer kadar zam yapan bir proc tasarlayınız.
--create proc zamYapici
--(
--@miktar money
--)
--as
--update Kitaplar set Fiyat = Fiyat + @miktar  --her zamYapici çağrıldığında kitapların fiyatında zam yapacak 
--go
--zamYapici 2                                  --2 lira zam yapılıyor
--select * from Kitaplar order by Fiyat desc

--Dışarda girilen kategori adına ait ürünleri listeleyen bir proc tasarlayınız.
--create proc KategoriyeGoreGetir
--(
--@add nvarchar(20)
--)
--as
--select KitapAdi, KategoriAdi from Kitaplar k
--inner join Kategoriler ktg on k.KategoriId = ktg.KategoriId
--where KategoriAdi = @add
--KategoriyeGoreGetir 'roman'

--Dışarıda girilen karakterleri içerisinde barındıran müşteri adına sahip müşterilerin verdiği siparişleri raporlayan proc tasarlayınız.
--create proc HarfGiris
--(
--@harfGir nvarchar(10)
--)
--as
--select m.Ad, s.SiparisId from Musteriler m 
--inner join Siparisler s on m.MusteriId = s.MüsteriId
--where m.Ad like @harfGir
--go
--HarfGiris '%b%'

--Aynı kategori var ise uyarı verip eklemeyen, yoksa ekleyen bir proc tasarlayınız.
--create proc KategoriEkle -- bu şekilde eğer isim yoksa ekler varsa uyarı verir
--(
--@ad nvarchar(20),
--@aciklama nvarchar(30)
--)
--as
--if(not exists(select * from Kategoriler where KategoriAdi = @ad))
--begin 
--insert Kategoriler(KategoriAdi, Aciklama) Values(@ad, @aciklama)
--end
--else
--begin
--print 'Zaten böyle bir kategori var!'
--end
--KategoriEkle 'Çocuk', 'Çocuk Kitapları'
--select * from Kategoriler

--Ürün id ve stoğu dışarıda verilen stok değerini ekleyen storage prosedürünü tasarlayınız.
--create proc Storage
--(
--@id int,
--@stok int
--)
--as
--update Kitaplar set Stok = @stok + Stok
--where KitapId = @id
--select * from Kitaplar
--Storage 5, 11

--Dışarıdan gelen 2 değeri toplayan ve bize geri döndüren bir fonksiyon tasarlayınız.
--create function ToplamaYap
--(
--@deger1 int,
--@deger2 int
--)
--returns int 
--as
--begin
--return @deger1 + @deger2
--end

--select dbo.ToplamaYap(100,40) 'Toplama'

--Dışarıdan gelen 2 değeri çarpan ve bize geri döndüren bir fonksiyon tasarlayınız.
--create function CarpmaYap
--(
--@deger1 int,
--@deger2 int
--)
--returns int 
--as
--begin
--return @deger1 * @deger2
--end

--select dbo.CarpmaYap(10,4) 'Çarpma yapar'

--Dışarıdan gelen üç sayınn ortalamasını geri döndüren fonkisyon tasarlayınız.
--create function OrtalamaAl
--(
--@s1 money,
--@s2 money,
--@s3 money
--)
--returns money
--as
--begin
--return (@s1+@s2+@s3)/3
--end
--select dbo.OrtalamaAl(42.5,10.8,21.9) 'Ortalama'

--Parametre olarak ad, soyad bilgisi alan, adın ilk üç harfi arada nokta ve soyadın ilk üç harfi yanına @gmail.com yazdıran bir function tasarlayınız.
--create function MailOlustur
--(
--@ad nvarchar(50),
--@soyad nvarchar(50)
--)
--returns char(17)
--as
--begin
--declare @birleştirici char(17)
--set @birleştirici=LOWER(LEFT(@ad,3)+'.'+RIGHT(@soyad,3)+ '@gmail.com')
--return @birleştirici
--end
--select dbo.MailOlustur('Ezgi','Sariyildiz')'Mail'

--Dışarıdan bir tarih alan ve bu tarihe göre yaş hesaplayan bir fonksiyon hesaplayınız. Bu fonksiyonu çalışanlar tablosu için çalıştırınız.
--create function YasHesapla
--(
--@tarih date
--)
--returns int
--as
--begin
--declare @yas int 
--set @yas=DATEDIFF(YEAR,@tarih,GETDATE())
--return @yas
--end
--select c.Ad, c.Soyad, dbo.YasHesapla(c.DogumTarihi) 'Yas' from Calisanlar c
--select dbo.YasHesapla('1990.01.01')

--Dışarıda girilen çalışanın siparişlerini gösteren  bir fonksiyon tasarlayınız.
--create function SiparisBilgisi
--(
--@ad nvarchar(25)
--)
--returns table
--as
--return select s.SiparisId, s.Tarih, c.Ad + '' + c.Soyad as AdSoyad from Calisanlar c 
--inner join Siparisler s on s.CalisanId = c.CalisanId
--where c.Ad = @ad
--select * from dbo.SiparisBilgisi('Eylül')

--Server üzerinde 'DenemeDb' diye bir db oluşturunuz varsa bu database i siliniz yoksa ekleyiniz.
--if(not exists (select Name from sys.databases))
--begin
--create database DenemeDb
--print 'Veri Tabanı başarıyla eklendi'
--end
--else
--begin
--drop database DenemeDb
--print 'başarılı bir şekilde silindi'
--end

--Yazar tablosunda Orhan Kemal diye bir yazar varsa doğum yilini 1965.07.22 olarak güncelleyiniz yoksa kaydı ad, soyad ve doğum tarihini ekleyiniz.
--if(exists(select * from Yazarlar y where y.Soyad = 'Kemal'))
--begin
--update Yazarlar set DogumYili = '1965.07.22' where Soyad = 'Kemal'
--print 'Kayıt güncellendi'
--end
--else
--begin
--insert Yazarlar(Ad, Soyad, DogumYili) values('Orhan', 'Kemal', '1965.07.22')
--print 'Kayıt eklendi'
--end


--Hangi ürün hangi müşterinin hangi personelden aldığını raporlayınız.
CREATE VIEW [dbo].[DetayliSatisRaporu]
AS
select k.KitapAdi, LEFT(m.Ad, 1) + '.' + m.Soyad MusteriAdSoyad, LEFT(c.Ad, 1) + '.' + c.Soyad PersonelAdSoyad from Kitaplar k
LEFT JOIN SiparisDetaylari sd ON sd.KitapId = k.KitapId
LEFT JOIN Siparisler s ON s.SiparisId = sd.SiparisId
RIGHT JOIN Calisanlar c ON c.CalisanId = s.CalisanId
LEFT JOIN Musteriler m ON m.MusteriId = s.MüsteriId






















GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nchar](30) NOT NULL,
	[Aciklama] [nchar](50) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Kategori]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--create table Musteriler 
--(
--MusteriId int,
--Ad nvarchar(30),
--Soyad nvarchar(30),
--Email nvarchar(30),
--Telefon int,
--Adres nvarchar(50),
--UyelikTarihi date
--);

--create table Kategoriler 
--(
--KategoriId int,
--KategoriAdi nvarchar(30),
--Aciklama nvarchar(50)
--);

--create table Yazarlar 
--(
--YazarId int,
--Ad nvarchar(30),
--Soyad nvarchar(30),
--DogumYili date
--);

--create table Kitaplar 
--(
--KitapId int,
--KitapAdi nvarchar(30),
--YazarId int,
--Fiyat money,
--Stok int,
--KategoriId int
--);

--create table Siparisler 
--(
--SiparisId int,
--MüsteriId int,
--Tarih date,
--Tutar money
--);

--create table SiparisDetaylari 
--(
--SiparisDetayId int,
--Adet int,
--BirimFiyat money,
--KitapId int,
--SipariId int    
--);

--create table Odemeler 
--(
--Id int,
--SiparisId int,
--MusteriId int,
--Tutar money,
--ÖdemeTürü nvarchar(10),
--Tarih date
--);

--create table Yorumlar 
--(
--YorumId int,
--KitapId int,
--MusteriId int,
--Puan int,
--Yorum nvarchar(100),
--Tarih date
--);

--Ürünlerin idleri adları stok miktarlarini fiyatlarını ve fiyatlara kdv eklenmiş hallerini raporlayınız.
--select k.KitapAdi, k.Fiyat*1.18 KdvFiyat, k.Fiyat from Kitaplar k

--select GETDATE() --2025-02-09 13:04:05.247
--select DAY(GETDATE()) --9
--select MONTH(GETDATE()) --2
--select YEAR(GETDATE()) --2025

--Bugünden 19.02.1923 tarihine kadar geçen zamanı yıl bazında raporlayınız.
--select DATEDIFF(YEAR, '02.19.1923', GETDATE())

--Çalışanların ad ve soyadlarıyla birlikte yaşlarını gruplayınız.
--select c.CalisanId, c.Ad, c.Soyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c
--select c.CalisanId, LEFT(c.Ad, 1) + '.' + c.Soyad AdSoyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c

--Ürün ücreti 400 den yüksek olan ürünleri raporlayınız.
--select * from Kitaplar k where k.Fiyat > 400

--Londra da yaşayan personelleri listeleyiniz.
--select * from Calisanlar c where c.Sehir = 'Londra'

--CategoryID si 5 olmayan ürünlerimin adlarını ve CategoryID lerini yazınız.
--select * from Kitaplar k where k.KategoriId != 5

--'01.05.2019' tarihinden sonra işe girmiş personelimin ad,soyad ve işe giriş tarihini raporlayınız
--select * from Calisanlar c where c.BaslangicTarihi > '01.05.2019'

--Ürünlerimin arasında stok miktarı 20 ile 50 dahil ve arasında olan ürünleri raporlayınız.
--select * from Kitaplar k where k.Stok > 20 and k.Stok >= 50

--Yaşı 30 dan büyük ve dahil olan ingilterede oturmayan çalışanların ad ve yaşını raporlayınız ancak isimler a.akkuş formatında olmalıdır.
--select LEFT(c.Ad, 1) + '.' + c.Soyad AdSoyad, DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) Yas from Calisanlar c 
--where c.Ulke != 'UK' 
--and DATEDIFF(YEAR, c.DogumTarihi, GETDATE()) > 30

--2020 dahil ve sonra alınmış kargo ücreti 20 den büyük ve Fransaya gönderilmemiş siparişlerin ID sini, sipariş tarihini, teslimat tarihlerini ve kargo ücretlerini raporlayınız.
--select s.SiparisId, s.Tarih, s.TeslimatTarihi, s.KargoUcreti from Siparisler s 
--where s.KargoUcreti > 20 and s.TeslimatUlkesi != 'Fransa'

--Henüz müşteriye ulaşılmamış siparişleri listeleyin.
--select * from Siparisler s where s.TeslimatTarihi is null

--Müşteriye ulaşılmış siparişleri listeleyin.
--select * from Siparisler s where s.TeslimatTarihi is not null

--Bölge bilgisi olmayan müşterileri listeleyin.
--select * from Musteriler m where m.Bolge is null

--Bölge bilgisi olan müşterileri listeleyin.
--select * from Musteriler m where m.Bolge is not null

--Kimseye rapor vermeyen personelleri lsteleyin.
--select * from Calisanlar c where c.Rapor is null

--8 yada 10 id lerine sahip olan müşteriler tarafından alınmış 3 nolu personelin onayladığı
--bölgesi olmayan siparişleri raporlayınız
--select * from Siparisler s 
--where (s.MüsteriId = 8 or s.MüsteriId = 10)
--and s.CalisanId = 3 and s.TeslimatBolgesi is null

--8 yada 10 id lerine sahip olan müşteriler tarafından alınmış 3 nolu personelin onayladığı
--bölgesi olmayan siparişlerin idsini küçükten büyüğe(a dan z ye) raporlayınız
--select * from Siparisler s 
--where (s.MüsteriId = 8 or s.MüsteriId = 10)
--and s.CalisanId = 3 and s.TeslimatBolgesi is null
--order by s.SiparisId asc

--Personelin adını a dan z ye sıralayınız.
--select c.Ad + ' ' + c.Soyad AdSoyad from Calisanlar c
--order by AdSoyad asc

--Müşterilerin id lerini şirket adlarını ve ülkelerini raporlayınız, ancak ülke fransız olacak ve müşteri idlerine göre desc sıralanacak.
--select * from Musteriler m where m.Ulke = 'Fransa'
--order by m.MusteriId desc

--En ucuz 10 tane ürünü raporlayınız.
--select top 10 * from Kitaplar k 
--order by k.Fiyat asc 

--En son teslim edilen 5 siparişin detaylarını raporlayınız.
--select top 5 * from Siparisler s 
--order by s.TeslimatTarihi desc

--Stok miktarı 20 den büyük ve eşit 49 dan küçük ve eşit ürünleri listeleyiniz.
--select * from Kitaplar k
--where k.Stok >= 20 and k.Stok <= 49
--order by k.Fiyat asc

--select * from Kitaplar k
--where k.Stok between 20 and 49
--order by k.Fiyat asc

--01.01.2020 ile 01.06.2025 tarihleri arasındaki siparişleri raporlayınız.
--select * from Siparisler s where s.Tarih between '01.01.2020' and '01.06.2025'

--01.01.2020 ile 01.06.2025 tarihleri arasında, müşteri idsi 5 veya 20 olan vermiş olduğu siparişleri raporlayınız.
--select * from Siparisler s where s.Tarih between '01.01.2020' and '01.06.2025' and (s.MüsteriId = 5 or s.MüsteriId = 20)

--Baş harfi h olan stoklarda mevcut 100 ile 250 dolar arası ücreti olan ürünleri fiyatlarına göre listeleyiniz.
--select * from Kitaplar k where LEFT(k.KitapAdi, 1) = 'h' and (k.Stok is not null) and (k.Fiyat between 100 and 250)

--Baş harfi h olan stoklarda mevcut 100 ile 250 dolar arası ücreti olan ürünleri fiyatlarına göre listeleyiniz.
--select k.KitapId ,k.KitapAdi, k.Fiyat, k.Stok from Kitaplar k where LEFT(k.KitapAdi, 1) = 'h' and (k.Stok is not null) and (k.Fiyat between 100 and 250) order by k.Fiyat asc

--Çarşamba günü alınan kargo ücretleri 50 ile 100 arasında olan teslim tarihi null olmayan sipariş bilgilerini raporlayın ve sipariş tarihine göre büyükten küçüğe sıralayınız.
--select * from Siparisler s where DATENAME(WEEKDAY,s.Tarih)='Tuesday' and (s.TeslimatTarihi is not null) and (s.KargoUcreti between 50 and 100) order by s.Tarih desc

--Soyadları b harfi ile başlayan müşterileri listeleyiniz.
--select * from Musteriler m where m.Soyad like 'a%'

--İsimleri a harfi ile biten müşterileri listeleyiniz.
--SELECT * FROM Musteriler m where m.Sehir like '%o'

--Şehirleri arasında 'nb' geçen müşterileri listeleyiniz.
--select * from Musteriler m where m.Sehir like '%nb%'

--Müşteri maillerinden ilk iki harfi bilinmeyen ama son üç harfi 'com' olan müşterileri listeleyiniz.
--select * from Musteriler m where m.Email LIKE '%com'

--Müşteri emaillerinde ilk harfi a yada s arasında olan müşterileri listeleyiniz.
--select * from Musteriler m where m.Email like '[AS]%'

--Müşteri emaillerinde ilk harfi a ile k arasında olan müşterileri getiriniz.
--select * from Musteriler m where m.Email like '[A-K]%'

--Müşteri emaillerinde ilk harfi a olan, ikinci harfinde n olmayan müşterileri listeleyiniz.
--select * from Musteriler m where LEFT(m.Email, 1) = 'A' and LEFT(m.Email, 2) != 'N'
--select * from Musteriler m where m.Email like 'A[^N]%'

--Ülkesi İngiltere olmayan adı a ile başlayıp soyadı r ile biten, doğum tarihi 1991 den önce olan çalışanları listeleyiniz.
--select * from Calisanlar c where c.Ulke != 'UK' and (c.Ad like 'A%' and c.Soyad like '%k') and (YEAR(c.DogumTarihi) < 1991)

--Stokta bulunan kaç adet ürünüm var listeleyiniz.
--select COUNT(k.KitapId) ToplamUrunAdeti from Kitaplar k where k.Stok > 0

--2020 yılından sonra alınmış kaç adet siparişim var raporlayınız.
--select COUNT(s.SiparisId) from Siparisler s where YEAR(s.Tarih) > 2020

--Kaç ülkeden müşterimiz bulunmaktadır(x ülkesinden y kadar).
--select COUNT(s.TeslimatUlkesi) ToplamUlke, s.TeslimatUlkesi from Siparisler s group by s.TeslimatUlkesi

--Her bir üründen bir adet alırsam ne kadar öderim listeleyiniz.
--select SUM(k.Fiyat) from Kitaplar k

--Depoda ücret bazlı olarak toplam ne kadarlık ürünüm kalmıştır listeleyiniz.
--select SUM(k.Fiyat * k.Stok) ToplamKalan from Kitaplar k

--2025 yılından alınmış olan siparişlerim için toplam ne kadarlık kargo ödemesi yapmışımdır listeleyiniz.
--select SUM(s.KargoUcreti) ToplamOdeme from Siparisler s where YEAR(s.Tarih) = '2025'

--Bu zamana kadar ödenmmiş ortalama kargo ücretini bulunuz.
--select AVG(s.KargoUcreti) from Siparisler s
--select SUM(s.KargoUcreti)/COUNT(s.SiparisId) from Siparisler s

--Şu ana kadar toplam kaç dolarlık cirom var bulunuz.
--select SUM(sp.BirimFiyat * sp.Adet) from SiparisDetaylari sp

--Ülke başına ne kadarlık kargo ücreti ödendi bulunuz.
--select SUM(s.KargoUcreti)/COUNT(distinct s.TeslimatUlkesi) UlkeBasınaOdenenUcret, s.TeslimatUlkesi from Siparisler s GROUP BY s.TeslimatUlkesi

--Sipariş başına ortalama ne kadarlık kargo ücreti ödendi bulunuz.
--select s.SiparisId, AVG(s.KargoUcreti) SiparisBasinaUcret from Siparisler s group by s.SiparisId

--En yüksek bedelli ürünümü raporlayınız.
--select top 1 k.KitapAdi, k.YazarId, k.Fiyat from Kitaplar k order by k.Fiyat desc

--En düşük fiyatlı ürünümü raporlayınız.
--select k.KitapAdi, k.YazarId, MIN(k.Fiyat) Fiyat from Kitaplar k group by k.KitapAdi, k.YazarId, k.Fiyat order by k.Fiyat asc

--Müşteri idleri leri 5-10 arasında olanların vermiş oldukları, sipariş tarihi 01.01.2020 ile 06.06.2023 arasında olan siparişlere, en az ne kadar kargo ücreti ödenmiştir raporlayınız.
--select MIN(s.KargoUcreti) ToplamKargoUcreti from Siparisler s where s.MüsteriId between 5 and 10 and (s.Tarih between '01.01.2020' and '06.06.2023') 

--En fazla satışımızda kaç dolarlık satış yapılmıştır bulunuz.
--select MAX(sd.Adet * sd.BirimFiyat) Toplam from SiparisDetaylari sd

--Teslimat bölgesi MAR veya IC olan, 2023 yılında bir pazartesi günü alınmış siparişler için ödenen azami kargo bedelini bulunuz.
--select s.SiparisId, s.MüsteriId, s.Tarih, s.TeslimatBolgesi ,MAX(s.KargoUcreti) AzamiKargoBedeli from Siparisler s 
--where s.TeslimatBolgesi in('MAR', 'IC') and DATENAME(WEEKDAY, s.Tarih) = 'Monday' 
--group by s.SiparisId, s.MüsteriId, s.Tarih, s.TeslimatBolgesi
--order by MAX(s.KargoUcreti)

--1, 5 yada 15 id li müşteriler tarafından istenmiş EGE bölgesine gönderilen, kargo ücreti 20 ile 200 dolar arasında olan siparişlere toplam ne kadarlık kargo ödemesi gerçekleşmiştir raporlayınız.
--select SUM(s.KargoUcreti) ToplamKargoOdemesi from Siparisler s 
--where s.MüsteriId in(1, 5, 15) AND s.TeslimatBolgesi = 'EGE' AND s.KargoUcreti between 20 and 200

--1, 5 yada 15 id li müşteriler tarafından istenmiş EGE bölgesine gönderilen
--kargo ücreti 20 ile 200 dolar arasında olan siparişlere toplam ne kadarlık kargo ödemesi gerçekleşmiştir raporlayınız(DETAYLI CEVAP).
--select s.MüsteriId, s.SiparisId, s.TeslimatBolgesi ,SUM(s.KargoUcreti) ToplamKargoOdemesi from Siparisler s 
--where s.MüsteriId in(1, 5, 15) AND s.TeslimatBolgesi = 'EGE' AND s.KargoUcreti between 20 and 200
--group by s.MüsteriId, s.SiparisId, s.TeslimatBolgesi
--order by s.MüsteriId 

--Ülkelere göre çalışan sayısı nedir raporlayınız.
--select c.Ulke, COUNT(c.CalisanId) ToplamCalisan from Calisanlar c group by c.Ulke order by COUNT(c.CalisanId) asc

--Çalışanlara göre almış oldukları sipariş sayısını raporlayınız.
--select s.CalisanId, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.CalisanId
--ORDER BY SiparisSayisi desc

--Ülkelere göre siparis sayısını raporlayınız ve en çok sipariş veren 3 ülkeyi listeleyiniz.
--select top 3 s.TeslimatUlkesi, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.TeslimatUlkesi ORDER BY SiparisSayisi desc

--Hangi müşteri kaç kere alışveriş yapmıştır raporlayınız.
--select s.MüsteriId, COUNT(s.SiparisId) SiparisSayisi from Siparisler s 
--GROUP BY s.MüsteriId ORDER BY SiparisSayisi desc

--Hangi personel kaç satışta yer almıştır raporlayınız.
--select s.CalisanId, COUNT(s.SiparisId) SatisSayisi from Siparisler s GROUP BY s.CalisanId ORDER BY SatisSayisi desc

--Hangi kategoriden toplam kaç tane ürün vardır(stoklarla beraber) raporlayınız.
--select k.KategoriId, SUM(k.Stok) StoktaOlanToplamUrunSayisi from Kitaplar k 
--GROUP BY k.KategoriId 
--ORDER BY StoktaOlanToplamUrunSayisi desc

--Ürünleri bulundukları kategori adlarıyla birlikte raporlayınız.
--select k.KitapAdi, c.KategoriAdi from Kitaplar k INNER JOIN Kategoriler c ON k.KategoriId = c.KategoriId

--Ürünlerin satış raporunu ürün adı, satış fiyatı, adet şeklinde listeleyiniz.
--select k.KitapAdi, sd.BirimFiyat, sd.Adet from SiparisDetaylari sd 
--INNER JOIN Kitaplar k ON sd.KitapId = k.KitapId

--Hangi satıştan hangi ürünler satılmıştır raporlayınız.
--select s.SiparisId, k.KitapAdi, sd.Adet, s.Tarih from Siparisler s 
--INNER JOIN SiparisDetaylari sd ON s.SiparisId = sd.SiparisId 
--INNER JOIN Kitaplar k ON k.KitapId = sd.KitapId

--Hangi personel hangi müşteriye hangi tarihte satış yapmıştır raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, LEFT(m.Ad, 1) + '.' + m.Soyad MusteriAdSoyad, s.Tarih from Calisanlar c 
--INNER JOIN Siparisler s ON c.CalisanId = s.CalisanId
--INNER JOIN Musteriler m ON s.MüsteriId = m.MusteriId

--Hangi kategoriden kaç tane ürünüm var raporlayınız.
--select k.KategoriAdi, count(kp.KitapID) AS KategoriBazindaUrunSayisi from Kategoriler k
--left join Kitaplar kp ON k.KategoriId = kp.KategoriID GROUP BY k.KategoriAdi 
--order by KategoriBazindaUrunSayisi desc

--Hangi müşteri hangi üründen kaç dolarlık alışveriş yapmıştır raporlayınız.
--select m.Ad, k.KitapAdi, (sd.BirimFiyat*sd.Adet) ToplamSatış from Musteriler m
--inner join Siparisler s on s.MüsteriId=m.MusteriId
--inner join SiparisDetaylari sd on sd.SiparisId=s.SiparisId
--inner join Kitaplar k on k.KitapId= sd.KitapId

--Hangi personel hangi kategoriden ne kadar satmıştır(kaç adet her kategoriden) raporlayınız.
--select LEFT(c.Ad, 1)+ '.' + c.Soyad CalisanAdSoyad, ktg.KategoriAdi, k.KitapAdi, sd.Adet from Kategoriler ktg 
--inner join Kitaplar k on k.KategoriId = ktg.KategoriId
--inner join SiparisDetaylari sd on k.KitapId = sd.KitapId
--inner join Siparisler s on sd.SiparisId = s.SiparisId 
--inner join Calisanlar c on s.CalisanId = c.CalisanId

--Ürün adlarını ve kategori adlarını raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi from Kitaplar k
--INNER JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId

--ROMAN kategorisine ait stoklarda bulunan ürünleri raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi, k.Stok from Kitaplar k 
--INNER JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId
--where ktg.KategoriAdi = 'ROMAN' and k.Stok > 0

--Müşteri adları arasında a geçen müşterilerin vermiş olduğu 7, 10 yada 18 id li çalışan tarafından alınmış siparişlere toplam ne kadarlık kargo ödemesi yapılmıştır raporlayınız.
--select SUM(s.KargoUcreti) ToplamKargoUcreti from Siparisler s 
--inner join Musteriler m on m.MusteriId = s.MüsteriId
--inner join Calisanlar c on s.CalisanId = c.CalisanId
--where m.Ad like '%a%' and c.CalisanId in(7, 10, 18)

--Her bir üründen toplam ne kadarlık satış yapılmıştır ve o ürünler hangi kategoriye aittir raporlayınız.
--select k.KitapAdi, ktg.KategoriAdi ,SUM(sd.BirimFiyat * sd.Adet) ToplamSatis from Kategoriler ktg
--inner join Kitaplar k on ktg.KategoriId = k.KategoriId 
--inner join SiparisDetaylari sd on k.KitapId = sd.KitapId
--group by k.KitapAdi, ktg.KategoriAdi
--order by ToplamSatis desc

--Kategorisi olmayan ürünleri raporlayınız.
--select * from Kitaplar k LEFT JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId

--Ürünü olmayan kategorileri raporlayınız.
--select * from Kategoriler ktg left join Kitaplar k on ktg.KategoriId = k.KategoriId

--Kategorilerin toplam satışlarını raporlayınız.
--select ktg.KategoriAdi, Sum(sd.BirimFiyat * sd.Adet) ToplamSatis
--from Kategoriler ktg 
--left join Kitaplar k on ktg.KategoriId = k.KategoriId
--left join SiparisDetaylari sd on sd.KitapId = k.KitapId
--group by ktg.KategoriAdi
--order by ToplamSatis desc

--Hangi personel hangi ürünü toplam kaç dolarlık satmıştır raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, k.KitapAdi, SUM(sd.BirimFiyat * sd.Adet) Toplam from Kitaplar k
--LEFT JOIN SiparisDetaylari sd ON sd.KitapId = k.KitapId
--LEFT JOIN Siparisler s ON sd.SiparisId = s.SiparisId
--LEFT JOIN Calisanlar c ON s.CalisanId = c.CalisanId
--GROUP BY LEFT(c.Ad, 1) + '.' + c.Soyad, k.KitapAdi
--ORDER BY Toplam desc

--Sipariş vermeyen müşterilerin adını ve sipariş tarihini raporlayınız.
--select * from Musteriler m RIGHT JOIN Siparisler s ON m.MusteriId = s.MüsteriId

--Toplam sipariş miktarı 2 nin üstünde olan ürünlerin adlarını ve sipariş miktarlarını raporlayınız.
--select k.KitapAdi, SUM(sd.Adet) SiparisMiktari from SiparisDetaylari sd
--INNER JOIN Kitaplar k ON k.KitapId = sd.KitapId
--GROUP BY k.KitapAdi
--HAVING sum(sd.Adet) > 2
--ORDER BY SiparisMiktari desc

--Hangi personel hangi ürünü toplam kaç dolarlık satmıştır, toplam satışı 100 den büyük olanları raporlayınız.
--select LEFT(c.Ad, 1) + '.' + c.Soyad CalisanAdSoyad, k.KitapAdi, SUM(sd.BirimFiyat * sd.Adet) Toplam from Kitaplar k
--LEFT JOIN SiparisDetaylari sd ON k.KitapId = sd.KitapId
--LEFT JOIN Siparisler s ON s.SiparisId = sd.SiparisId
--LEFT JOIN Calisanlar c ON s.CalisanId = c.CalisanId
--GROUP BY LEFT(c.Ad, 1) + '.' + c.Soyad, k.KitapAdi
--HAVING SUM(sd.BirimFiyat * sd.Adet) > 100
--ORDER BY Toplam desc

--Yeni bir kategori ve açıklamasını ekleyiniz.
--INSERT Kategoriler(KategoriAdi, Aciklama) values('Siir', 'Siir Kitaplari')
--select * from Kategoriler

--Yeni bir personel ekleyiniz.
--insert Calisanlar 
--values ('Ezgi Cagla', 'Sariyildiz', 'ezgi.sryldz@gmail.com', '020193847', '2020.09.27', 'Patron', '100000', '2000.09.21', 'Istanbul', 'Turkiye', null)
--select * from Calisanlar c

--Sadece 4 id li musterinin telefon değeri değiştirip raporlayınız.
--select * from Musteriler m
--update Musteriler set Telefon = '53958432'
--where MusteriId = 4

--Çalışanlar tablosundaki Eylül adlı çalışanın doğum tarihini 01.01.1999 ve soyadını Han olarak değiştirin ve raporlayınız.
--select * from Calisanlar c
--insert Calisanlar(Ad, Soyad) values('Eylül', 'Bahar')
--update Calisanlar set DogumTarihi = '1999.01.01'
--where CalisanId=3

--Stoğu 10 dan küçük olan ürünlere %6 zam yapan kodu tasarlayınız.
--select * from Kitaplar
--update Kitaplar set Fiyat *= 1.06 
--where Stok = 5

--Türk müşterilerden alınmış siparişleri listeleyiniz.
--create view TurkMusteri
--as
--select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, m.Sehir, s.Tarih from Siparisler s
--INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
--where m.Ulke = 'Turkiye'
--group by m.MusteriId, m.Ad + m.Soyad, m.Ulke, m.Sehir, s.Tarih
--select * from TurkMusteri

--Türk müşterilerden alınmış siparişleri listeleyen view den şehiri kaldırınız.
--alter view TurkMusteri
--as
--select m.MusteriId, m.Ad + m.Soyad MusteriAdSoyad, m.Ulke, s.Tarih from Siparisler s
--INNER JOIN Musteriler m ON m.MusteriId = s.CalisanId
--where m.Ulke = 'Turkiye'
--group by m.MusteriId, m.Ad + m.Soyad, m.Ulke, s.Tarih
--select * from TurkMusteri

--Kategori ismi ve açıklamasını içeren bir view oluşturunuz.
--CREATE VIEW Kategori
--AS
--SELECT ktg.KategoriAdi, ktg.Aciklama FROM Kategoriler ktg
--select * from Kategori

--Oluşturduğumuz kategori viewine yeni bir veri ekleyiniz.
--INSERT Kategori(KategoriAdi, Aciklama) values('Dergi', 'Dergiler')
--SELECT * FROM Kategori

--Ürünü olan ve olmayan kategorileri listeleyiniz.
--CREATE VIEW ButunUrunler
--AS
--SELECT k.KitapAdi, ktg.KategoriAdi FROM Kitaplar k 
--RIGHT JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId
--SELECT * FROM ButunUrunler

--WITH SCHEMABINDING kullanarak bütün müşterileri idleri ve mailleriyle beraber getiriniz.
--CREATE VIEW ButunMusteriler
--with schemabinding
--AS
--SELECT m.MusteriId, m.Email FROM dbo.Musteriler m
--select * from ButunMusteriler

--ENCRYPTION : ButunMusteriler için bu keywordü kullanınız.
--ALTER VIEW ButunMusteriler
--with schemabinding, encryption
--AS
--SELECT m.MusteriId, m.Email FROM dbo.Musteriler m
--select * from ButunMusteriler

--Araştırma kategorisine ait stoklarımda mevcut ürünlerin adlarını, ücretlerini, kdvli ücretlerini gösteren bir view tasarlayınız.
--(bağlı bulunduğu kolonlar asla silinmemeli view kodları görünmemelidir)
--create view KategoriyeUrun
--with schemabinding, encryption
--as 
--select ktg.KategoriAdi, k.KitapAdi, k.Fiyat, (k.Fiyat*1.18) KdvliUcret, k.Stok from dbo.Kategoriler ktg
--inner join dbo.Kitaplar k on k.KategoriId = ktg.KategoriId
--where ktg.KategoriAdi = 'Araştırma' and k.Stok > 0
--select * from KategoriyeUrun

--Dışarıdan girilen değer kadar zam yapan bir proc tasarlayınız.
--create proc zamYapici
--(
--@miktar money
--)
--as
--update Kitaplar set Fiyat = Fiyat + @miktar  --her zamYapici çağrıldığında kitapların fiyatında zam yapacak 
--go
--zamYapici 2                                  --2 lira zam yapılıyor
--select * from Kitaplar order by Fiyat desc

--Dışarda girilen kategori adına ait ürünleri listeleyen bir proc tasarlayınız.
--create proc KategoriyeGoreGetir
--(
--@add nvarchar(20)
--)
--as
--select KitapAdi, KategoriAdi from Kitaplar k
--inner join Kategoriler ktg on k.KategoriId = ktg.KategoriId
--where KategoriAdi = @add
--KategoriyeGoreGetir 'roman'

--Dışarıda girilen karakterleri içerisinde barındıran müşteri adına sahip müşterilerin verdiği siparişleri raporlayan proc tasarlayınız.
--create proc HarfGiris
--(
--@harfGir nvarchar(10)
--)
--as
--select m.Ad, s.SiparisId from Musteriler m 
--inner join Siparisler s on m.MusteriId = s.MüsteriId
--where m.Ad like @harfGir
--go
--HarfGiris '%b%'

--Aynı kategori var ise uyarı verip eklemeyen, yoksa ekleyen bir proc tasarlayınız.
--create proc KategoriEkle -- bu şekilde eğer isim yoksa ekler varsa uyarı verir
--(
--@ad nvarchar(20),
--@aciklama nvarchar(30)
--)
--as
--if(not exists(select * from Kategoriler where KategoriAdi = @ad))
--begin 
--insert Kategoriler(KategoriAdi, Aciklama) Values(@ad, @aciklama)
--end
--else
--begin
--print 'Zaten böyle bir kategori var!'
--end
--KategoriEkle 'Çocuk', 'Çocuk Kitapları'
--select * from Kategoriler

--Ürün id ve stoğu dışarıda verilen stok değerini ekleyen storage prosedürünü tasarlayınız.
--create proc Storage
--(
--@id int,
--@stok int
--)
--as
--update Kitaplar set Stok = @stok + Stok
--where KitapId = @id
--select * from Kitaplar
--Storage 5, 11

--Dışarıdan gelen 2 değeri toplayan ve bize geri döndüren bir fonksiyon tasarlayınız.
--create function ToplamaYap
--(
--@deger1 int,
--@deger2 int
--)
--returns int 
--as
--begin
--return @deger1 + @deger2
--end

--select dbo.ToplamaYap(100,40) 'Toplama'

--Dışarıdan gelen 2 değeri çarpan ve bize geri döndüren bir fonksiyon tasarlayınız.
--create function CarpmaYap
--(
--@deger1 int,
--@deger2 int
--)
--returns int 
--as
--begin
--return @deger1 * @deger2
--end

--select dbo.CarpmaYap(10,4) 'Çarpma yapar'

--Dışarıdan gelen üç sayınn ortalamasını geri döndüren fonkisyon tasarlayınız.
--create function OrtalamaAl
--(
--@s1 money,
--@s2 money,
--@s3 money
--)
--returns money
--as
--begin
--return (@s1+@s2+@s3)/3
--end
--select dbo.OrtalamaAl(42.5,10.8,21.9) 'Ortalama'

--Parametre olarak ad, soyad bilgisi alan, adın ilk üç harfi arada nokta ve soyadın ilk üç harfi yanına @gmail.com yazdıran bir function tasarlayınız.
--create function MailOlustur
--(
--@ad nvarchar(50),
--@soyad nvarchar(50)
--)
--returns char(17)
--as
--begin
--declare @birleştirici char(17)
--set @birleştirici=LOWER(LEFT(@ad,3)+'.'+RIGHT(@soyad,3)+ '@gmail.com')
--return @birleştirici
--end
--select dbo.MailOlustur('Ezgi','Sariyildiz')'Mail'

--Dışarıdan bir tarih alan ve bu tarihe göre yaş hesaplayan bir fonksiyon hesaplayınız. Bu fonksiyonu çalışanlar tablosu için çalıştırınız.
--create function YasHesapla
--(
--@tarih date
--)
--returns int
--as
--begin
--declare @yas int 
--set @yas=DATEDIFF(YEAR,@tarih,GETDATE())
--return @yas
--end
--select c.Ad, c.Soyad, dbo.YasHesapla(c.DogumTarihi) 'Yas' from Calisanlar c
--select dbo.YasHesapla('1990.01.01')

--Dışarıda girilen çalışanın siparişlerini gösteren  bir fonksiyon tasarlayınız.
--create function SiparisBilgisi
--(
--@ad nvarchar(25)
--)
--returns table
--as
--return select s.SiparisId, s.Tarih, c.Ad + '' + c.Soyad as AdSoyad from Calisanlar c 
--inner join Siparisler s on s.CalisanId = c.CalisanId
--where c.Ad = @ad
--select * from dbo.SiparisBilgisi('Eylül')

--Server üzerinde 'DenemeDb' diye bir db oluşturunuz varsa bu database i siliniz yoksa ekleyiniz.
--if(not exists (select Name from sys.databases))
--begin
--create database DenemeDb
--print 'Veri Tabanı başarıyla eklendi'
--end
--else
--begin
--drop database DenemeDb
--print 'başarılı bir şekilde silindi'
--end

--Yazar tablosunda Orhan Kemal diye bir yazar varsa doğum yilini 1965.07.22 olarak güncelleyiniz yoksa kaydı ad, soyad ve doğum tarihini ekleyiniz.
--if(exists(select * from Yazarlar y where y.Soyad = 'Kemal'))
--begin
--update Yazarlar set DogumYili = '1965.07.22' where Soyad = 'Kemal'
--print 'Kayıt güncellendi'
--end
--else
--begin
--insert Yazarlar(Ad, Soyad, DogumYili) values('Orhan', 'Kemal', '1965.07.22')
--print 'Kayıt eklendi'
--end






















GO
/****** Object:  View [dbo].[ButunUrunler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ButunUrunler]
AS
SELECT k.KitapAdi, ktg.KategoriAdi FROM Kitaplar k 
RIGHT JOIN Kategoriler ktg ON k.KategoriId = ktg.KategoriId
GO
/****** Object:  UserDefinedFunction [dbo].[SiparisBilgisi]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[SiparisBilgisi]
(
@ad nvarchar(25)
)
returns table
as
return select s.SiparisId, s.Tarih, c.Ad + '' + c.Soyad as AdSoyad from Calisanlar c 
inner join Siparisler s on s.CalisanId = c.CalisanId
where c.Ad = @ad
GO
/****** Object:  View [dbo].[ButunMusteriler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ButunMusteriler]
with schemabinding
AS
SELECT m.MusteriId, m.Email FROM dbo.Musteriler m
GO
/****** Object:  View [dbo].[create_view_KategoriyeUrun_]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[create_view_KategoriyeUrun_]
AS
SELECT ktg.KategoriAdi, k.KitapAdi, k.Fiyat, (k.Fiyat*1.18) AS KdvllUcret, k.Stok 
FROM dbo.Kategoriler ktg 
INNER JOIN dbo.Kitaplar k ON k.KategoriId = ktg.KategoriId
WHERE ktg.KategoriAdi = 'Tarih' AND k.Stok > 0;
GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odemeler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SiparisId] [int] NOT NULL,
	[MusteriId] [int] NOT NULL,
	[Tutar] [money] NOT NULL,
	[ÖdemeTürü] [nvarchar](10) NOT NULL,
	[Tarih] [date] NOT NULL,
 CONSTRAINT [PK_Odemeler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[YazarId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nchar](30) NOT NULL,
	[Soyad] [nchar](30) NOT NULL,
	[DogumYili] [date] NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[YazarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumId] [int] IDENTITY(1,1) NOT NULL,
	[KitapId] [int] NOT NULL,
	[MusteriId] [int] NOT NULL,
	[Puan] [int] NOT NULL,
	[Yorum] [nchar](100) NULL,
	[Tarih] [date] NOT NULL,
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calisanlar] ON 

INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (1, N'Adem      ', N'Kara      ', N'adm.kr@gmail.com                                  ', 5482654, CAST(N'2019-01-01' AS Date), N'Patron                                            ', 50000.0000, CAST(N'1980-06-08' AS Date), N'Ankara                                            ', N'Turkiye                                           ', NULL)
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (2, N'Zuleyha   ', N'Kara      ', N'zlyh.kr@gmail.com                                 ', 5268574, CAST(N'2019-01-01' AS Date), N'Patron                                            ', 50000.0000, CAST(N'1985-12-25' AS Date), N'Ankara                                            ', N'Turkiye                                           ', NULL)
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (3, N'Eylül     ', N'Bahar     ', N'eyll.bhr@gmail.com                                ', 5487541, CAST(N'2019-02-16' AS Date), N'Satis                                             ', 15000.0000, CAST(N'1999-01-01' AS Date), N'Istanbul                                          ', N'Turkiye                                           ', N'Patron                        ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (4, N'Nazli     ', N'Duduk     ', N'nzl.ddk@gmail.com                                 ', 5471516, CAST(N'2019-02-19' AS Date), N'Satis                                             ', 15000.0000, CAST(N'2000-03-13' AS Date), N'Erzurum                                           ', N'Turkiye                                           ', N'Patron                        ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (6, N'Akif      ', N'Budak     ', N'akf.bdk@gmail.com                                 ', 5627485, CAST(N'2019-02-10' AS Date), N'Kasiyer                                           ', 12000.0000, CAST(N'1990-12-26' AS Date), N'Ankara                                            ', N'Turkiye                                           ', N'Satis                         ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (7, N'Celil     ', N'Baran     ', N'cll@gmail.com                                     ', 5698521, CAST(N'2019-03-18' AS Date), N'Kasiyer                                           ', 12000.0000, CAST(N'1999-01-04' AS Date), N'Ankara                                            ', N'Turkiye                                           ', N'Satis                         ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (8, N'Burak     ', N'Deniz     ', N'brk@gmail.com                                     ', 5365241, CAST(N'2019-07-22' AS Date), N'Satis                                             ', 15000.0000, CAST(N'1999-11-04' AS Date), N'Londra                                            ', N'UK                                                ', N'Patron                        ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (9, N'Dilara    ', N'Tas       ', N'dlr.ts@gmail.com                                  ', 5362514, CAST(N'2019-08-15' AS Date), N'Satis                                             ', 15000.0000, CAST(N'2000-09-25' AS Date), N'Londra                                            ', N'UK                                                ', N'Patron                        ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (10, N'Ceylan    ', N'Guzel     ', N'cylgzl@gmail.com                                  ', 5264875, CAST(N'2019-11-25' AS Date), N'Satis                                             ', 15000.0000, CAST(N'2000-09-09' AS Date), N'Venedik                                           ', N'Italya                                            ', N'Patron                        ')
INSERT [dbo].[Calisanlar] ([CalisanId], [Ad], [Soyad], [Email], [Telefon], [BaslangicTarihi], [Yetki], [Maas], [DogumTarihi], [Sehir], [Ulke], [Rapor]) VALUES (11, N'Ezgi Cagla', N'Sariyildiz', N'ezgi.sryldz@gmail.com                             ', 20193847, CAST(N'2020-09-27' AS Date), N'Patron                                            ', 100000.0000, CAST(N'2000-09-21' AS Date), N'Istanbul                                          ', N'Turkiye                                           ', NULL)
SET IDENTITY_INSERT [dbo].[Calisanlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (1, N'Roman                         ', N'Kurgu Kitapları                                   ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (2, N'Kişisel Gelişim               ', N'Kişisel Gelişim Kitapları                         ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (3, N'Fantastik                     ', N'Fantastik Kitaplar                                ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (4, N'Tarih                         ', N'Tarih Kitapları                                   ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (5, N'Psikoloji                     ', N'Psikolojik Kitaplar                               ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (6, N'Felsefe                       ', N'Felsefe Kitapları                                 ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (7, N'Bilim Kurgu                   ', N'Bilim Kurgu Kitapları                             ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (8, N'Sosyoloji                     ', N'Sosyoloji Kitapları                               ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (9, N'Din                           ', N'Din Kitapları                                     ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (10, N'Yabancı                       ', N'Yabancı Dil Kitapları                             ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (11, N'Çocuk                         ', N'Çocuk Kitapları                                   ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (12, N'Temel Eserler                 ', N'Temel Eserler Kitapları                           ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (13, N'Sağlık                        ', N'Sağlık Kitapları                                  ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (14, N'Hikaye                        ', N'Hikaye Kitapları                                  ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (15, N'Çizgi Roman                   ', N'Çizgi Roman ve Mangalar                           ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (16, N'Araştırma                     ', N'Araştırma Kitapları                               ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (17, N'Siir                          ', N'Siir Kitaplari                                    ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (18, N'Dergi                         ', N'Dergiler                                          ')
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Aciklama]) VALUES (19, N'Masal                         ', N'Masal Kitapları                                   ')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (1, N'Od                            ', 11, 320.0000, 25, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (3, N'İskender                      ', 2, 320.0000, 20, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (4, N'Ustam ve Ben                  ', 2, 422.0000, 10, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (5, N'Gece Yarısı Kütüphanesi       ', 3, 282.9000, 30, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (6, N'Nevrotik Bir Gezegenden Notlar', 3, 242.0000, 4, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (7, N'The Midnight Library          ', 3, 430.2400, 5, 10)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (8, N'Suzan Defter                  ', 1, 212.0000, 7, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (9, N'Osman                         ', 1, 462.0000, 6, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (10, N'Aziz Bey Hadisesi             ', 1, 171.6000, 80, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (11, N'Beyaz Diş                     ', 4, 142.0000, 3, 14)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (12, N'Martin Eden                   ', 4, 148.2800, 13, 14)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (13, N'The Call Of The Wild          ', 4, 50.7600, 5, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (14, N'Hıhıcık                       ', 5, 202.3400, 16, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (15, N'Kınalı Serçe                  ', 5, 261.7000, 25, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (16, N'Dedemin Bakkalı               ', 5, 356.0400, 100, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (17, N'Lo                            ', 5, 277.0000, 4, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (18, N'Sultanı Öldürmek              ', 6, 392.0000, 8, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (19, N'Sis ve Gece                   ', 6, 277.6000, 14, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (20, N'Veba Geceleri                 ', 7, 510.8000, 97, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (21, N'Masumiyet Müzesi              ', 7, 320.0000, 111, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (23, N'Olasılıksız                   ', 8, 415.4000, 323, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (24, N'Empati                        ', 8, 463.1000, 119, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (25, N'Das Kapital                   ', 9, 209.0000, 7, 6)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (26, N'Aforizmalar                   ', 9, 122.0000, 1, 6)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (27, N'Kendine İyi Davran Güzel İnsan', 10, 212.0000, 9, 5)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (30, N'Hayat Acemileri İçin Bir Yaşam', 10, 197.0000, 3, 5)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (31, N'Azdahak                       ', 11, 330.6000, 300, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (32, N'Aşk Hikayesi                  ', 11, 261.7000, 14, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (33, N'Simyacı                       ', 12, 267.0000, 56, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (34, N'Saatleri Ayarlama Enstitüsü   ', 13, 404.8000, 115, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (35, N'Beş Şehir                     ', 13, 245.8000, 5, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (36, N'Şeker Portakalı               ', 14, 309.4000, 30, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (37, N'Delifişek                     ', 14, 302.0000, 10, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (38, N'Var Mısın?                    ', 15, 70.9000, 50, 2)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (39, N'İnsan İnsana                  ', 15, 197.0000, 9, 5)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (40, N'İstanbul''dan Sayfalar         ', 16, 208.7000, 40, 16)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (41, N'Türklerin Tarihi              ', 16, 208.7000, 11, 4)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (42, N'Doğu Ekspresi''nde Cinayet     ', 17, 309.4000, 66, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (43, N'Acı Kahve                     ', 17, 180.0800, 32, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (44, N'Harry Potter ve Felsefe Taşı  ', 18, 267.0000, 262, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (47, N'Harry Potter Ateş Kadehi      ', 18, 659.2000, 110, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (48, N'Harry Potter Azkaban Tutsağı  ', 18, 429.1800, 14, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (49, N'Bülbülü Öldürmek              ', 19, 314.7000, 111, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (50, N'Geç Kalma Genç Kal            ', 20, 322.0000, 3, 13)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (51, N'Hayatın Senin Elinde          ', 20, 422.0000, 9, 13)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (52, N'Genel Beslenme                ', 21, 192.0000, 10, 13)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (53, N'Madalyonun İçi                ', 22, 388.9000, 128, 5)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (54, N'Camdaki Kız                   ', 22, 320.0000, 214, 5)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (55, N'Kardeşimin Hikayesi           ', 23, 288.2000, 16, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (56, N'Puslu Kıtalar Atlası          ', 24, 214.0000, 54, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (57, N'Aramıza Hoş Geldin Penguen    ', 25, 94.2200, 5, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (58, N'Büyümek İsteyen Fil           ', 25, 46.0000, 8, 11)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (59, N'Ulusların Düşüşü              ', 26, 420.7000, 98, 16)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (60, N'Savaş Sanatı                  ', 27, 129.2000, 5, 6)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (61, N'The Art of War                ', 27, 92.0000, 6, 10)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (62, N'Zagor Maxi 13                 ', 28, 87.0000, 7, 15)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (63, N'Percy Jackson ve Olimposlular ', 29, 230.0000, 7, 15)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (64, N'Neşeli Günler                 ', 30, 52.0000, 10, 15)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (65, N'Kendime Düşünceler            ', 31, 60.0000, 8, 8)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (66, N'Varoluşçuluk                  ', 32, 282.0000, 10, 6)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (71, N'Tabiat Kanunu Üzerine         ', 35, 112.0000, 1, 8)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (72, N'Yaşam Bilgeliği Üzerine       ', 36, 86.8000, 16, 6)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (73, N'Yüzüklerin Efendisi I.        ', 37, 540.4800, 102, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (74, N'Yüzüklerin Efendisi II.       ', 37, 459.9200, 54, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (75, N'Yüzüklerin Efendisi III.      ', 37, 459.9200, 62, 3)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (76, N'Karanlığın Sol Eli            ', 38, 320.0000, 20, 7)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (77, N'Tehanu                        ', 38, 254.0000, 6, 7)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (78, N'En Uzak Sahil                 ', 38, 264.8800, 5, 7)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (80, N'Beylikten İmparatorluğa       ', 39, 309.4000, 14, 4)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (81, N'İslam Tarihi                  ', 39, 1002.0000, 2, 9)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (82, N'II: Abdülhamit Han            ', 39, 422.0000, 10, 4)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (83, N'Bu Ülke                       ', 40, 267.0000, 32, 8)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (84, N'Mağaradakiler                 ', 40, 317.0000, 8, 8)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (85, N'Brief Answers                 ', 41, 494.0000, 1, 1)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (86, N'Mesaj                         ', 42, 402.0000, 2, 16)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (87, N'Kendimi Keşfediyorum          ', 43, 309.4000, 80, 2)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (88, N'Eleştiri, Düşünce ve Miras    ', 44, 139.0000, 3, 9)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (89, N'Kulleteyn                     ', 44, 262.0000, 8, 16)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (90, N'Uzun Hikaye                   ', 45, 161.0000, 20, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (91, N'Rüzgarlı Pazar                ', 45, 192.8000, 50, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (92, N'Akıntıya Karşı                ', 45, 161.0000, 50, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (93, N'Sefiller                      ', 46, 161.0000, 24, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (94, N'Bir İdam Mahkumunun Son Günü  ', 46, 61.3600, 144, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (95, N'Notre Dame''ın Kamburu         ', 46, 330.6000, 90, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (96, N'Yalnız Efe                    ', 47, 44.4000, 74, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (97, N'Kaşağı                        ', 47, 70.9000, 50, 12)
INSERT [dbo].[Kitaplar] ([KitapId], [KitapAdi], [YazarId], [Fiyat], [Stok], [KategoriId]) VALUES (98, N'Şermin                        ', 48, 75.1400, 20, 11)
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (3, N'Ali                           ', N'Kara                          ', N'ali.kara@gmail.com    ', 5263512, N'Istanbul,Turkiye                                  ', CAST(N'2019-05-01' AS Date), N'MAR       ', N'Istanbul     ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (4, N'Ayse                          ', N'Bakır                         ', N'ayse.bkr@gmail.com    ', 53958432, N'Ankara,Turkiye                                    ', CAST(N'2019-06-21' AS Date), N'IC        ', N'Ankara       ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (5, N'Mehmet                        ', N'Akıncı                        ', N'mhmt_knc@gmail.com    ', 5624791, N'Izmir,Turkiye                                     ', CAST(N'2019-05-06' AS Date), N'EGE       ', N'Izmir        ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (6, N'Zeynep                        ', N'Tarhan                        ', N'zynp-tr@gmail.com     ', 5478963, N'Bursa,Turkiye                                     ', CAST(N'2019-08-24' AS Date), N'MAR       ', N'Bursa        ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (7, N'Ezgi                          ', N'Sariyildiz                    ', N'ezgi.sryldz@gmail.com ', 5639874, N'Canakkale,Turkiye                                 ', CAST(N'2019-09-21' AS Date), N'MAR       ', N'Canakkale    ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (8, N'Akın                          ', N'Akıl                          ', N'akinakil2020@gmail.com', 5821679, N'Edirne,Turkiye                                    ', CAST(N'2019-12-28' AS Date), NULL, NULL, N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (9, N'Bilal                         ', N'Çelik                         ', N'bll.clk@gmail.com     ', 5147825, N'Kars,Turkiye                                      ', CAST(N'2019-11-08' AS Date), N'DOGU      ', N'Kars         ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (10, N'Veli                          ', N'Bakan                         ', N'veli_b90@gmail.com    ', 5568542, N'Van,Turkiye                                       ', CAST(N'2019-05-21' AS Date), N'DOGU      ', N'Van          ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (11, N'Emre                          ', N'Demir                         ', N'emre-dmr11@hotmail.com', 5565545, N'Erzincan,Turkiye                                  ', CAST(N'2019-08-13' AS Date), N'DOGU      ', N'Erzincan     ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (12, N'Kadir                         ', N'Çakır                         ', N'kdr_ckr@hotmail.com   ', 5781320, N'Malatya,Turkiye                                   ', CAST(N'2019-01-09' AS Date), N'DOGU      ', N'Malatya      ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (13, N'Zülal                         ', N'Kalın                         ', N'zll_kln21@hotmail.com ', 5589416, N'San Francisco,ABD                                 ', CAST(N'2019-07-16' AS Date), N'CA        ', N'San Fransisco', N'ABD                 ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (14, N'Jenny                         ', N'Molly                         ', N'jny-mly15@mail.com    ', 66587411, N'London,UK                                         ', CAST(N'2019-02-24' AS Date), N'LDN       ', N'Londra       ', N'UK                  ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (15, N'Helen                         ', N'Nolan                         ', N'hln.nln22@hmail.com   ', 565854523, N'Barselona,Ispanya                                 ', CAST(N'2019-12-12' AS Date), N'CAT       ', N'Barselona    ', N'Ispanya             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (16, N'Defne                         ', N'Ceylan                        ', N'defne.ceylan77@outlook', 5498521, N'Antalya,Turkiye                                   ', CAST(N'2019-10-24' AS Date), NULL, NULL, N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (17, N'Hilal                         ', N'Bilen                         ', N'hilal.bl53@outlook.com', 5423651, N'Istanbul,Turkiye                                  ', CAST(N'2019-02-26' AS Date), NULL, NULL, N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (18, N'Sevgi                         ', N'Şahin                         ', N'sevg.shn@outlook.com  ', 5568204, N'Istanbul,Turkiye                                  ', CAST(N'2019-09-25' AS Date), NULL, NULL, N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (19, N'Doğa                          ', N'Başar                         ', N'doga.basr@hotmail.com ', 5584916, N'Istanbul,Turkiye                                  ', CAST(N'2019-04-29' AS Date), N'MAR       ', N'Istanbul     ', N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (20, N'Sermin                        ', N'Ceyhan                        ', N'srmn-cylan@hotmail.com', 5531805, N'Paris,Fransa                                      ', CAST(N'2019-02-20' AS Date), N'IDF       ', N'Paris        ', N'Fransa              ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (21, N'Ömer                          ', N'Can                           ', N'omr.can00@outlook.com ', 5994610, N'Van,Turkiye                                       ', CAST(N'2019-02-20' AS Date), NULL, NULL, N'Turkiye             ')
INSERT [dbo].[Musteriler] ([MusteriId], [Ad], [Soyad], [Email], [Telefon], [Adres], [UyelikTarihi], [Bolge], [Sehir], [Ulke]) VALUES (22, N'Taner                         ', N'Yıldız                        ', N'tnr-yldz@hotmail.com  ', 5421718, N'Ankara,Turkiye                                    ', CAST(N'2019-08-09' AS Date), N'IC        ', N'Ankara       ', N'Turkiye             ')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Odemeler] ON 

INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (1, 1, 3, 245.0000, N'Kredi Kart', CAST(N'2021-02-25' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (3, 2, 4, 1000.0000, N'Kredi Kart', CAST(N'2021-05-10' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (4, 3, 5, 700.0000, N'Kredi Kart', CAST(N'2024-08-19' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (5, 4, 6, 669.0000, N'Kredi Kart', CAST(N'2021-06-28' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (6, 5, 7, 780.0000, N'Kredi Kart', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (7, 6, 8, 600.0000, N'Kredi Kart', CAST(N'2020-07-15' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (9, 7, 9, 500.0000, N'Kapıda', CAST(N'2023-01-24' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (10, 8, 10, 800.0000, N'Kapıda', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (11, 9, 11, 955.0000, N'Kapıda', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (12, 10, 12, 1000.0000, N'Kapıda', CAST(N'2022-07-25' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (13, 11, 13, 800.0000, N'Kapıda', CAST(N'2020-12-16' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (14, 12, 14, 595.0000, N'Kapıda', CAST(N'2020-09-21' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (15, 13, 15, 897.0000, N'Kapıda', CAST(N'2021-09-10' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (16, 14, 16, 557.0000, N'Kapıda', CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (17, 15, 17, 931.0000, N'Kapıda', CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (18, 16, 18, 573.0000, N'Havale', CAST(N'2022-04-04' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (19, 17, 19, 802.0000, N'Havale', CAST(N'2021-06-16' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (20, 18, 20, 506.0000, N'Havale', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Odemeler] ([Id], [SiparisId], [MusteriId], [Tutar], [ÖdemeTürü], [Tarih]) VALUES (21, 19, 21, 332.0000, N'Havale', CAST(N'2021-02-02' AS Date))
SET IDENTITY_INSERT [dbo].[Odemeler] OFF
GO
SET IDENTITY_INSERT [dbo].[SiparisDetaylari] ON 

INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (1, 3, 2, 100.0000, 4, 1)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (2, 4, 3, 100.0000, 5, 2)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (3, 5, 2, 100.0000, 6, 3)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (4, 6, 3, 100.0000, 7, 4)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (5, 7, 1, 100.0000, 8, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (6, 8, 2, 100.0000, 9, 6)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (7, 9, 5, 100.0000, 10, 7)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (8, 10, 4, 100.0000, 11, 8)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (9, 11, 2, 100.0000, 12, 9)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (10, 12, 3, 100.0000, 13, 10)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (11, 13, 2, 100.0000, 14, 11)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (12, 14, 2, 100.0000, 15, 12)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (13, 15, 3, 100.0000, 16, 13)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (14, 16, 2, 100.0000, 17, 14)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (16, 17, 1, 100.0000, 18, 15)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (17, 18, 2, 100.0000, 19, 16)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (18, 19, 3, 100.0000, 20, 17)
INSERT [dbo].[SiparisDetaylari] ([SiparisDetayId], [MüsteriId], [Adet], [BirimFiyat], [KitapId], [SiparisId]) VALUES (19, 20, 3, 100.0000, 21, 18)
SET IDENTITY_INSERT [dbo].[SiparisDetaylari] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (1, 3, CAST(N'2021-02-25' AS Date), 245.0000, 4, CAST(N'2021-03-10' AS Date), 50, N'Turkiye                       ', N'MAR                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (2, 4, CAST(N'2021-05-10' AS Date), 1000.0000, 3, CAST(N'2021-05-28' AS Date), 50, N'Turkiye                       ', N'IC                            ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (3, 5, CAST(N'2024-08-19' AS Date), 700.0000, 6, CAST(N'2024-08-28' AS Date), 50, N'Turkiye                       ', N'EGE                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (4, 6, CAST(N'2021-06-28' AS Date), 669.0000, 6, CAST(N'2021-07-10' AS Date), 50, N'Turkiye                       ', N'MAR                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (5, 7, CAST(N'2023-08-15' AS Date), 780.0000, 3, CAST(N'2023-08-29' AS Date), 50, N'Turkiye                       ', N'MAR                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (6, 8, CAST(N'2020-07-15' AS Date), 600.0000, 3, CAST(N'2020-07-29' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (7, 9, CAST(N'2023-01-24' AS Date), 500.0000, 4, CAST(N'2023-02-14' AS Date), 50, N'Turkiye                       ', N'DOGU                          ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (8, 10, CAST(N'2019-11-11' AS Date), 800.0000, 4, CAST(N'2019-11-28' AS Date), 50, N'Turkiye                       ', N'DOGU                          ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (9, 11, CAST(N'2024-10-08' AS Date), 955.0000, 6, CAST(N'2024-10-28' AS Date), 50, N'Turkiye                       ', N'DOGU                          ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (10, 12, CAST(N'2022-07-25' AS Date), 1000.0000, 6, CAST(N'2022-08-10' AS Date), 50, N'Turkiye                       ', N'DOGU                          ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (11, 13, CAST(N'2020-12-16' AS Date), 800.0000, 7, CAST(N'2020-12-26' AS Date), 200, N'ABD                           ', N'CA                            ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (12, 14, CAST(N'2020-09-21' AS Date), 595.0000, 7, CAST(N'2020-10-05' AS Date), 200, N'UK                            ', N'LDN                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (13, 15, CAST(N'2021-09-10' AS Date), 847.0000, 8, CAST(N'2021-09-25' AS Date), 200, N'Ispanya                       ', N'CAT                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (14, 16, CAST(N'2023-08-19' AS Date), 557.0000, 8, CAST(N'2023-08-30' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (15, 17, CAST(N'2023-10-07' AS Date), 931.0000, 9, CAST(N'2023-10-20' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (16, 18, CAST(N'2022-04-04' AS Date), 573.0000, 9, CAST(N'2022-04-25' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (17, 19, CAST(N'2021-06-16' AS Date), 802.0000, 10, CAST(N'2021-06-29' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (18, 20, CAST(N'2023-03-12' AS Date), 506.0000, 10, CAST(N'2023-03-26' AS Date), 50, N'Fransa                        ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (19, 21, CAST(N'2021-02-02' AS Date), 332.0000, 8, CAST(N'2021-02-22' AS Date), 50, N'Turkiye                       ', N'IDF                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (20, 15, CAST(N'2025-02-08' AS Date), 680.0000, 4, NULL, 200, N'Ispanya                       ', N'CAT                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (21, 17, CAST(N'2025-02-05' AS Date), 768.0000, 6, NULL, 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (22, 5, CAST(N'2025-02-08' AS Date), 665.0000, 7, NULL, 50, N'Turkiye                       ', N'EGE                           ')
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (23, 10, CAST(N'2020-08-20' AS Date), 650.0000, 3, CAST(N'2020-09-11' AS Date), 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (24, 8, CAST(N'2025-01-15' AS Date), 400.0000, 3, NULL, 50, N'Turkiye                       ', NULL)
INSERT [dbo].[Siparisler] ([SiparisId], [MüsteriId], [Tarih], [Tutar], [CalisanId], [TeslimatTarihi], [KargoUcreti], [TeslimatUlkesi], [TeslimatBolgesi]) VALUES (25, 20, CAST(N'2025-01-01' AS Date), 500.0000, 6, CAST(N'2025-01-20' AS Date), 50, N'Fransa                        ', NULL)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (1, N'Ayfer                         ', N'Tunç                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (2, N'Elif                          ', N'Şafak                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (3, N'Matt                          ', N'Haig                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (4, N'Jack                          ', N'London                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (5, N'Şermin                        ', N'Yaşar                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (6, N'Ahmet                         ', N'Ümit                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (7, N'Orhan                         ', N'Pamuk                         ', CAST(N'1970-01-02' AS Date))
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (8, N'Adam                          ', N'Fawer                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (9, N'Karl                          ', N'Marx                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (10, N'Beyhan                        ', N'Budak                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (11, N'İskender                      ', N'Pala                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (12, N'Paulo                         ', N'Coelho                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (13, N'Ahmet Hamdi                   ', N'Tanpınar                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (14, N'Jose Mauro De                 ', N' Vaconcelos                   ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (15, N'Doğan                         ', N'Cüceloğlu                     ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (16, N'İlber                         ', N'Ortaylı                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (17, N'Agatha                        ', N'Christie                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (18, N'J.K.                          ', N'Rowling                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (19, N'Harper                        ', N'Lee                           ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (20, N'Osman                         ', N'Müftüoğlu                     ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (21, N'Ayşe                          ', N'Baysal                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (22, N'Gülseren                      ', N'Budayıcıoğlu                  ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (23, N'Zülfü                         ', N'Livaneli                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (24, N'İhsan Oktay                   ', N'Anar                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (25, N'Andreya                       ', N'Reitmeyer                     ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (26, N'Daron                         ', N'Acemoğlu                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (27, N'Sun                           ', N'Tzu                           ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (28, N'Roberto                       ', N'Altariva                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (29, N'Rick                          ', N'Riordan                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (30, N'Berk                          ', N'Kuruçay                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (31, N'Marcus                        ', N'Aurelius                      ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (32, N'Jean Paul                     ', N'Sartre                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (35, N'John                          ', N'Locke                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (36, N'Artur                         ', N'Schopenhauer                  ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (37, N'J.R.R.                        ', N'Tolkien                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (38, N'Ursula K.                     ', N'Leguin                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (39, N'Ziya Nur                      ', N'Aksun                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (40, N'Cemil                         ', N'Meriç                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (41, N'Stephen                       ', N'Hawking                       ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (42, N'Carl                          ', N'Sagan                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (43, N'Sinan                         ', N'Canan                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (44, N'Turan                         ', N'Dursun                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (45, N'Mustafa                       ', N'Kutlu                         ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (46, N'Victor                        ', N'Hugo                          ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (47, N'Ömer                          ', N'Seyfettin                     ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (48, N'Tevfik                        ', N'Fikret                        ', NULL)
INSERT [dbo].[Yazarlar] ([YazarId], [Ad], [Soyad], [DogumYili]) VALUES (50, N'Orhan                         ', N'Kemal                         ', CAST(N'1965-07-22' AS Date))
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Yorumlar] ON 

INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (1, 1, 3, 5, N'Harika bir kitap                                                                                    ', CAST(N'2021-02-25' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (4, 3, 4, 5, N'Mükemmel kitap                                                                                      ', CAST(N'2021-05-10' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (5, 4, 5, 4, N'Güzeldi                                                                                             ', CAST(N'2024-08-19' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (6, 5, 6, 1, N'Hiç Beğenmedim                                                                                      ', CAST(N'2021-06-28' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (7, 6, 7, 5, N'Herkes okumalı                                                                                      ', CAST(N'2023-08-15' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (8, 7, 8, 4, N'Çok güzel bir kitap                                                                                 ', CAST(N'2020-07-15' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (9, 8, 9, 5, N'Tavsiye ediyorum                                                                                    ', CAST(N'2023-01-24' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (10, 9, 10, 5, N'Bayıldım                                                                                            ', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (11, 10, 11, 4, N'Mutlaka okunmalı                                                                                    ', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (12, 11, 12, 3, N'Beğenmedim                                                                                          ', CAST(N'2022-07-25' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (13, 12, 13, 1, N'Rezalet bir yazım                                                                                   ', CAST(N'2020-12-16' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (14, 13, 14, 1, N'Okumayın, çok kötü                                                                                  ', CAST(N'2020-09-21' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (15, 14, 15, 5, N'Kesinlikle herkes okumalı                                                                           ', CAST(N'2021-09-10' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (16, 15, 16, 4, N'Baya güzel, akıcı bir dilde anlatım yapılmış                                                        ', CAST(N'2023-08-19' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (17, 16, 17, 5, N'Bu yazar ve kitapları kesinlikle herkes tarafından okunmalı                                         ', CAST(N'2023-10-07' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (18, 17, 18, 4, N'Eh işte, beğendim diyebilirim                                                                       ', CAST(N'2022-04-04' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (19, 18, 19, 3, N'Fena değil                                                                                          ', CAST(N'2021-06-16' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (20, 19, 20, 2, NULL, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[Yorumlar] ([YorumId], [KitapId], [MusteriId], [Puan], [Yorum], [Tarih]) VALUES (21, 20, 21, 5, NULL, CAST(N'2021-02-02' AS Date))
SET IDENTITY_INSERT [dbo].[Yorumlar] OFF
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Kategoriler]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yazarlar] FOREIGN KEY([YazarId])
REFERENCES [dbo].[Yazarlar] ([YazarId])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yazarlar]
GO
ALTER TABLE [dbo].[Odemeler]  WITH CHECK ADD  CONSTRAINT [FK_Odemeler_Siparisler] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[Odemeler] CHECK CONSTRAINT [FK_Odemeler_Siparisler]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Kitaplar] FOREIGN KEY([KitapId])
REFERENCES [dbo].[Kitaplar] ([KitapId])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Kitaplar]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Siparisler] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Siparisler]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Calisanlar] FOREIGN KEY([CalisanId])
REFERENCES [dbo].[Calisanlar] ([CalisanId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Calisanlar]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Kitaplar] FOREIGN KEY([KitapId])
REFERENCES [dbo].[Kitaplar] ([KitapId])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Kitaplar]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Musteriler]
GO
/****** Object:  StoredProcedure [dbo].[HarfGiris]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HarfGiris]
(
@harfGir nvarchar(10)
)
as
select m.Ad, s.SiparisId from Musteriler m 
inner join Siparisler s on m.MusteriId = s.MüsteriId
where m.Ad like @harfGir
GO
/****** Object:  StoredProcedure [dbo].[KategoriEkle]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KategoriEkle] -- bu şekilde eğer isim yoksa ekler varsa uyarı verir
(
@ad nvarchar(20),
@aciklama nvarchar(30)
)
as
if(not exists(select * from Kategoriler where KategoriAdi = @ad))
begin 
insert Kategoriler(KategoriAdi, Aciklama) Values(@ad, @aciklama)
end
else
begin
print 'Zaten böyle bir kategori var!'
end
GO
/****** Object:  StoredProcedure [dbo].[KategoriyeGoreGetir]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KategoriyeGoreGetir]
(
@add nvarchar(20)
)
as
select KitapAdi, KategoriAdi from Kitaplar k
inner join Kategoriler ktg on k.KategoriId = ktg.KategoriId
where KategoriAdi = @add
GO
/****** Object:  StoredProcedure [dbo].[Storage]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Storage]
(
@id int,
@stok int
)
as
update Kitaplar set Stok = @stok + Stok
where KitapId = @id
GO
/****** Object:  StoredProcedure [dbo].[zamYapici]    Script Date: 11.02.2025 22:22:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zamYapici]
(
@miktar money
)
as
update Kitaplar set Fiyat = Fiyat + @miktar  --her zamYapici çağrıldığında zam yapacak 
GO
USE [master]
GO
ALTER DATABASE [Kutuphane] SET  READ_WRITE 
GO
