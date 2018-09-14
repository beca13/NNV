go
-- Kreiranje baze
create database NNV on primary
( 
	name = N'NNV_data1',
	filename = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_data1.mdf',
	size = 10MB,
	maxsize = unlimited,
	filegrowth = 10%	
),
filegroup [Secondary]
(
	name = N'NNV_data2',
	filename = N'C:\Progruse master;
am Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_data2.ndf',
	size = 5MB,
	maxsize = unlimited,
	filegrowth = 1%
)
log on
(
	name = N'NNV_log',
	filename = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NNV_log.ldf',
	size = 5MB,
	maxsize = 70MB,
	filegrowth = 1MB
)
collate Cyrillic_General_CI_AI
go

use NNV;
go

-- Kreiranje tabele Članovi

create table Clanovi
(
	ClanID int not null identity
	constraint PK_ClanID primary key(ClanID),

	Ime nvarchar(50) not null,

	Prezime nvarchar(50) not null,

	ImePrezime AS Ime + ' ' + Prezime persisted,

	Email nvarchar(50) not null
	constraint UQ_Email unique(Email),

	Status bit not null,

	KorisnickoIme nvarchar(40) not null
	constraint UQ_KorisnickoIme unique (KorisnickoIme),

	Lozinka nvarchar(25) not null
	constraint CHK_Lozinka check (LEN(Lozinka) >= 8 AND LEN(Lozinka) <= 25)
);

-- Kreiranje tabele Sednice

create table Sednice
(
	SednicaID int not null
	constraint PK_SednicaID primary key(SednicaID),

	Datum datetime2 not null,

	VrstaSednice nvarchar(20) not null,

	Ucionica nvarchar(10) null,

	Zapisnik nvarchar(max) not null,

	Poziv nvarchar(max) not null
);

-- Kreiranje tabele Prisustvo

create table Prisustvo
(
	ClanID int not null
	constraint FK_ClanID foreign key(ClanID)
	references Clanovi(ClanID),

	SednicaID int not null
	constraint FK_SednicaID foreign key(SednicaID)
	references Sednice(SednicaID),

	constraint PK_CK_PrisustvoID primary key(ClanID, SednicaID),

	Prisutan bit not null,

	Opravdano bit null
);

-- Kreiranje tabele VrsteDokumenata

create table VrsteDokumenata
(
	DokumentID int not null identity
	constraint PK_DokumentID primary key(DokumentID),

	VrstaDokumenta nvarchar(max) not null,
);

-- Kreiranje tabele Prilozi

create table Prilozi
(
	PrilogID int not null
	constraint PK_PrilogID primary key(PrilogID),

	SednicaID int not null
	constraint FKK_SednicaID foreign key(SednicaID)
	references Sednice(SednicaID),

	DokumentID int not null
	constraint FK_DokumentID foreign key(DokumentID)
	references VrsteDokumenata(DokumentID),

	NazivPriloga nvarchar(max) null,

	Putanja nvarchar(max) null,

	Poslato bit null,

	DatumSlanja datetime2 null,
);