create database SAYGAMESTORE
go
use SAYGAMESTORE
go

-- I.CREATE TABLE
-- 1.CUSTOMER table
CREATE TABLE CUSTOMER 
(
    CustomerID VARCHAR (20) NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
	Gender NVARCHAR (20) NOT NULL,
    Age INT NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone INT,
    CustomerType NVARCHAR(50) NOT NULL DEFAULT 'Regular'
);

-- 2.GAME table
CREATE TABLE GAME 
(
    GameID VARCHAR (20) NOT NULL PRIMARY KEY,
    GameName NVARCHAR(100) NOT NULL,
    ReleaseDate DATE,
	PublisherName NVARCHAR(100),
	DeveloperName NVARCHAR(100),
	Price INT NOT NULL,
	AgeRating VARCHAR (5)NOT NULL
);

-- 3.GENRE table
CREATE TABLE GENRE 
(
    GenreID VARCHAR(20) NOT NULL PRIMARY KEY,
    Genrename NVARCHAR(20) NOT NULL
);

-- 4.GAME GENRE table
CREATE TABLE GameGenre
(
	GameID VARCHAR (20) NOT NULL ,
	GenreID VARCHAR (20) NOT NULL,
	PRIMARY KEY (GameID, GenreID)
);

-- 5.SERVICE table --dữ liệu ok
CREATE TABLE SERVICE 
(
    ServiceID VARCHAR (20) NOT NULL PRIMARY KEY,
    ServiceName VARCHAR(50) NOT NULL,
	CPU VARCHAR(50) NOT NULL,
	VGA VARCHAR(50) NOT NULL,
	RAM VARCHAR(50) NOT NULL,
	SSD VARCHAR(50) NOT NULL,
    Price INT NOT NULL,
    MaxUses INT NOT NULL
);

-- 6.SUBSCRIPTION table
CREATE TABLE SUBSCRIPTION 
(
    SubscriptionID VARCHAR (20) NOT NULL PRIMARY KEY,
    CustomerID VARCHAR (20) NOT NULL,
    ServiceID VARCHAR (20) NOT NULL,
    StartDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    EndDate DATETIME NOT NULL ,
    Status NVARCHAR(20) NOT NULL DEFAULT 'active'
);

-- 7.ORDER table
CREATE TABLE OrderTable
(
    OrderID VARCHAR (20) NOT NULL PRIMARY KEY,
    CustomerID VARCHAR (20) NOT NULL,
    GameID VARCHAR (20) NOT NULL,
    Price INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PaymentStatus VARCHAR(50) NOT NULL DEFAULT 'pending'
);


-- 8.PAYMENT table
 CREATE TABLE PAYMENT 
 (
    PaymentID VARCHAR (20) NOT NULL PRIMARY KEY,
    CustomerID VARCHAR (20) NOT NULL,
    OrderID VARCHAR (20) NULL,
    SubscriptionID VARCHAR (20) NULL,
    PaymentDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Amount INT NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL DEFAULT 'credit_card'
);

-- 9.DISCOUNT table
CREATE TABLE DISCOUNT 
(
    DiscountID VARCHAR (20) NOT NULL PRIMARY KEY,
    GameID VARCHAR (20) NULL,
    ServiceID VARCHAR (20) NULL,
    Value DECIMAL(3,2) NOT NULL,
    ValidFrom DATETIME NOT NULL,
    ValidTo DATETIME,
);

-- 10.LICENSE KEY table
CREATE TABLE LICENSEKEY 
(
    KeyID VARCHAR (20) NOT NULL PRIMARY KEY,
    GameID VARCHAR (20) NOT NULL,
    KeyCode VARCHAR(255) NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'unused'
);

-- II.ADD DATA VÀO TỪNG BẢNG
-- 1.DATA CUSTOMER table
INSERT INTO CUSTOMER (CustomerID, Name, Gender, Age, Email, Phone, CustomerType) VALUES
('KH01', N'Nguyễn Văn An', 'Male', 32, 'nguyenvanan@gmail.com', '0912345678', 'Regular'),
('KH02', N'Trần Thị Hoa', 'Female', 27, 'tranthihoa@gmail.com', '0987654321', 'VIP'),
('KH03', N'Lê Văn Minh', 'Male', 45, 'levanminh@gmail.com', '0901234567', 'Premium'),
('KH04', N'Phạm Thị Lan', 'Female', 22, 'phamthilan@gmail.com', '0934567890', 'Regular'),
('KH05', N'Đỗ Văn Hùng', 'Male', 38, 'dovanhung@gmail.com', '0978123456', 'VIP'),
('KH06', N'Hoàng Thị Mai', 'Female', 29, 'hoangthimai@gmail.com', '0965432187', 'Premium'),
('KH07', N'Vũ Văn Nam', 'Male', 41, 'vuvannam@gmail.com', '0919876543', 'Regular'),
('KH08', N'Bùi Thị Hạnh', 'Female', 35, 'buithihanh@gmail.com', '0943218765', 'VIP'),
('KH09', N'Đặng Văn Phúc', 'Male', 28, 'dangvanphuc@gmail.com', '0923456781', 'Premium'),
('KH10', N'Phan Thị Gấu', 'Female', 33, 'phanthigau@gmail.com', '0932187654', 'Regular'),
('KH11', N'Nguyễn Văn Bình', 'Male', 26, 'nguyenvanbinh@gmail.com', '0912348765', 'VIP'),
('KH12', N'Trần Thị Cúc', 'Female', 30, 'tranthicuc@gmail.com', '0987123456', 'Premium'),
('KH13', N'Lê Văn Dũng', 'Male', 36, 'levandung@gmail.com', '0909876543', 'Regular'),
('KH14', N'Phạm Thị Hương', 'Female', 24, 'phamthihuong@gmail.com', '0934561234', 'VIP'),
('KH15', N'Đỗ Văn Quang', 'Male', 39, 'dovanquang@gmail.com', '0978654321', 'Premium'),
('KH16', N'Hoàng Thị Yến', 'Female', 28, 'hoangthiyen@gmail.com', '0965123789', 'Regular'),
('KH17', N'Vũ Văn Sơn', 'Male', 31, 'vuvanson@gmail.com', '0912345679', 'VIP'),
('KH18', N'Bùi Thị Ngọc', 'Female', 37, 'buithingoc@gmail.com', '0943218766', 'Premium'),
('KH19', N'Đặng Văn Lâm', 'Male', 29, 'dangvanlam@gmail.com', '0923456782', 'Regular'),
('KH20', N'Phan Thị Kim', 'Female', 34, 'phanthikim@gmail.com', '0932187655', 'VIP'),
('KH21', N'Nguyễn Minh Tuấn', 'Male', 38, 'nguyenminhtuan@gmail.com', '0931234556', 'Premium'),
('KH22', N'Võ Thị Quỳnh', 'Female', 23, 'vothiquynh@gmail.com', '0971234565', 'Regular'),
('KH23', N'Phạm Việt Anh', 'Male', 28, 'phamvietanh@gmail.com', '0908765433', 'Regular'),
('KH24', N'Trịnh Thị Trang', 'Female', 41, 'trinhthitrang@gmail.com', '0912765432', 'Premium'),
('KH25', N'Tạ Văn Duy', 'Male', 36, 'tavanduy@gmail.com', '0909988721', 'VIP'),
('KH26', N'Nguyễn Thị Phượng', 'Female', 37, 'nguyenthiphuong@gmail.com', '0987632478', 'Premium'),
('KH27', N'Lê Minh Hoàng', 'Male', 19, 'leminhhoang@gmail.com', '0912123452', 'VIP'),
('KH28', N'Đào Thị Hương', 'Female', 33, 'daothihuong@gmail.com', '0942422345', 'Regular'),
('KH29', N'Nguyễn Quốc Bảo', 'Male', 29, 'nguyenquocbao@gmail.com', '0998765211', 'Premium'),
('KH30', N'Nguyễn Thị Như', 'Female', 30, 'nguyenthinhu@gmail.com', '0913089642', 'VIP'),
('KH31', N'Phạm Duy Khánh', 'Male', 26, 'phamduykhanh@gmail.com', '0921357891', 'Regular'),
('KH32', N'Lý Thị Hậu', 'Female', 47, 'lythihau@gmail.com', '0966432156', 'Premium'),
('KH33', N'Hoàng Đức Duy', 'Male', 51, 'hoangducduy@gmail.com', '0916453245', 'VIP'),
('KH34', N'Ngô Thị Hằng', 'Female', 22, 'ngothihang@gmail.com', '0961234987', 'Premium'),
('KH35', N'Đặng Trung Hiếu', 'Male', 35, 'dangtrunghieu@gmail.com', '0992341575', 'Regular'),
('KH36', N'Đoàn Thị Trang', 'Female', 24, 'doanthitrang@gmail.com', '0971546842', 'VIP'),
('KH37', N'Nguyễn Tài Long', 'Male', 40, 'nguyentailong@gmail.com', '0913465764', 'Premium'),
('KH38', N'Trần Thị Cúc', 'Female', 20, 'tranthicuc@gmail.com', '0941567811', 'Regular'),
('KH39', N'Nguyễn Đình Sơn', 'Male', 27, 'nguyendinhson@gmail.com', '0934578761', 'VIP'),
('KH40', N'Nguyễn Nhàn Oanh', 'Female', 37, 'nguyennhanoanh@gmail.com', '0981765432', 'Premium'),
('KH41', N'Trần Việt Hoàng', 'Male', 24, 'tranviethoang@gmail.com', '0971765784', 'Regular'),
('KH42', N'Lê Thị Hải', 'Female', 43, 'lethihai@gmail.com', '0964543453', 'Premium'),
('KH43', N'Nguyễn Văn Hiếu', 'Male', 59, 'nguyenvanhieu@gmail.com', '0915974563', 'Regular'),
('KH44', N'Hoàng Hồng Hạnh', 'Female', 50, 'hoanghonghanh@gmail.com', '0971111111', 'VIP'),
('KH45', N'Đỗ Minh Đức', 'Male', 42, 'dominhduc@gmail.com', '0917456314', 'Premium'),
('KH46', N'Võ Ngọc Lan', 'Female', 32, 'vongoclan@gmail.com', '0923765321', 'VIP'),
('KH47', N'Nguyễn Văn Gành', 'Male', 38, 'nguyenvanganh@gmail.com', '0911678943', 'Regular'),
('KH48', N'Lê Thị Vân', 'Female', 21, 'lethivan@gmail.com', '0961476375', 'Premium'),
('KH49', N'Nguyễn Minh Quang', 'Male', 14, 'nguyenminhquang@gmail.com', '0939812347', 'Regular'),
('KH50', N'Đặng Thị Hiền', 'Female', 44, 'dangthihien@gmail.com', '0941867361', 'VIP'),
('KH51', N'Nguyễn Văn Phát', 'Male', 24, 'nguyenvanphat@gmail.com', '0991122334', 'Premium'),
('KH52', N'Nguyễn Thị Ngân', 'Female', 21, 'nguyenthingan@gmail.com', '0962413123', 'Regular'),
('KH53', N'Trần Đình Tú', 'Male', 54, 'trandinhtu@gmail.com', '0912348762', 'VIP'),
('KH54', N'Võ Hoàng Nam', 'Female', 55, 'vohoangnam@gmail.com', '0973621378', 'Premium'),
('KH55', N'Đinh Công Gành', 'Male', 45, 'dinhcongganh@gmail.com', '0912375436', 'Regular'),
('KH56', N'Hoàng Thị Trang', 'Female', 12, 'hoangthitrang@gmail.com', '0981247894', 'Premium'),
('KH57', N'Nguyễn Tùng Sơn', 'Male', 28, 'nguyentungson@gmail.com', '0913333444', 'VIP'),
('KH58', N'Lê Thị Xuân', 'Female', 13, 'lethixuan@gmail.com', '0978763121', 'Regular'),
('KH59', N'Nguyễn Văn Đông', 'Male', 53, 'nguyenvandong@gmail.com', '0936445212', 'Premium'),
('KH60', N'Hà Thị Gấm', 'Female', 35, 'hathigam@gmail.com', '0991234567', 'VIP'),
('KH61', N'Trần Mạnh Quân', 'Male', 55, 'tranmanhquan@gmail.com', '0911665711', 'Regular'),
('KH62', N'Từ Diệu Linh', 'Female', 44, 'tudieulinh@gmail.com', '0919494949', 'Premium'),
('KH63', N'Nguyễn Minh Hải', 'Male', 60, 'nguyenminhhai@gmail.com', '0935559782', 'VIP'),
('KH64', N'Trần Thị Hương', 'Female', 23, 'tranthihuong@gmail.com', '0962221001', 'Regular'),
('KH65', N'Nguyễn Văn Trường', 'Male', 34, 'nguyenvantruong@gmail.com', '0916182736', 'Premium'),
('KH66', N'Hồ Phan Linh', 'Female', 33, 'hophanlinh@gmail.com', '0999987632', 'VIP'),
('KH67', N'Lê Quốc Hưng', 'Male', 26, 'lequochung@gmail.com', '0972233467', 'Regular'),
('KH68', N'Nguyễn Kim Oanh', 'Female', 46, 'nguyenkimoanh@gmail.com', '0967548765', 'Premium'),
('KH69', N'Trịnh Hồng Sơn', 'Male', 21, 'trinhhongson@gmail.com', '0917458745', 'Regular'),
('KH70', N'Lê Thị Hằng', 'Female', 26, 'lethihang@gmail.com', '0935447812', 'VIP'),
('KH71', N'Nguyễn Văn Gấu', 'Male', 24, 'nguyenvangau@gmail.com', '0992323233', 'Regular'),
('KH72', N'Trần Thị Hậu', 'Female', 14, 'tranthihau@gmail.com', '0942139824', 'Premium'),
('KH73', N'Nguyễn Văn Công', 'Male', 17, 'nguyenvancong@gmail.com', '0952745232', 'VIP'),
('KH74', N'Phạm Thị Minh', 'Female', 27, 'phamthiminh@gmail.com', '0931247852', 'Regular'),
('KH75', N'Đỗ Xuân Trường', 'Male', 58, 'doxuantruong@gmail.com', '0934124147', 'Premium'),
('KH76', N'Hoàng Thúy Oanh', 'Female', 41, 'hoangthuyoanh@gmail.com', '0981761771', 'VIP'),
('KH77', N'Lê Thái Tuấn', 'Male', 37, 'lethaituan@gmail.com', '0975432343', 'Regular'),
('KH78', N'Nguyễn Thị Yến', 'Female', 53, 'nguyenthiyen@gmail.com', '0916161112', 'Premium'),
('KH79', N'Nguyễn Quốc Toàn', 'Male', 50, 'nguyenquoctoan@gmail.com', '0905578756', 'Regular'),
('KH80', N'Đinh Thị Giang', 'Female', 23, 'dinhthigiang@gmail.com', '0919302344', 'Premium'),
('KH81', N'Phạm Duy An', 'Male', 11, 'phamduyan@gmail.com', '0938956212', 'VIP'),
('KH82', N'Nguyễn Kim Long', 'Female', 20, 'nguyenkimlong@gmail.com', '0986482971', 'Regular'),
('KH83', N'Nguyễn Văn Dũng', 'Male', 22, 'nguyenvandung@gmail.com', '0912457971', 'Regular'),
('KH84', N'Lê Xuân Phúc', 'Female', 24, 'lexuanphuc@gmail.com', '0984798348', 'Regular'),
('KH85', N'Nguyễn Đông Hà', 'Male', 44, 'nguyendongha@gmail.com', '0912479783', 'Premium'),
('KH86', N'Nguyễn Bảo Ngọc', 'Female', 42, 'nguyenbaongoc@gmail.com', '0901278781', 'Regular'),
('KH87', N'Nguyễn Hữu Đạt', 'Male', 23, 'nguyenhuudat@gmail.com', '0921234123', 'Premium'),
('KH88', N'Trần Nhật Hạ', 'Female', 56, 'trannhatha@gmail.com', '0971378917', 'VIP'),
('KH89', N'Đặng Minh Khoa', 'Male', 58, 'dangminhkhoa@gmail.com', '0999941491', 'Regular'),
('KH90', N'Hoàng Kim Hoa', 'Female', 14, 'hoangkimhoa@gmail.com', '0984841843', 'Premium'),
('KH91', N'Đỗ Văn Hoài', 'Male', 35, 'dovanhoai@gmail.com', '0914786912', 'Regular'),
('KH92', N'Nguyễn Thị Châu', 'Female', 54, 'nguyenthichau@gmail.com', '0914271892', 'VIP'),
('KH93', N'Nguyễn Đức Mạnh', 'Male', 34, 'nguyenducmanh@gmail.com', '0921151847', 'VIP'),
('KH94', N'Võ Thị Lan Anh', 'Female', 24, 'vothilananh@gmail.com', '0971987141', 'Premium'),
('KH95', N'Nguyễn Văn Dương', 'Male', 56, 'nguyenvanduong@gmail.com', '0971494876', 'VIP'),
('KH96', N'Viên Thị Hòa', 'Female', 23, 'vienthihoa@gmail.com', '0948748391', 'Regular'),
('KH97', N'Nguyễn Hữu Nghĩa', 'Male', 57, 'nguyenhuunghia@gmail.com', '0959485972', 'Premium'),
('KH98', N'Nguyễn Mai Hoa', 'Female', 17, 'nguyenmaihoa@gmail.com', '0971234484', 'Regular'),
('KH99', N'Lê Minh Nhật', 'Male', 33, 'leminhnhat@gmail.com', '0914934873', 'VIP'),
('KH100', N'Nguyễn Thị Gấm', 'Female', 16, 'nguyenthigam@gmail.com', '0917497482', 'Premium'),
('KH101', N'Phạm Huy Hoàng', 'Male', 52, 'phamhuyhoang@gmail.com', '0939414948', 'VIP'),
('KH102', N'Bùi Thị Ngọc', 'Female', 36, 'buithingoc@gmail.com', '0954848488', 'Regular'),
('KH103', N'Lương Văn Tú', 'Male', 28, 'luongvantu@gmail.com', '0911117543', 'Regular'),
('KH104', N'Trịnh Thị Lan Anh', 'Female', 43, 'trinhtilananh@gmail.com', '0913745147', 'Premium'),
('KH105', N'Nguyễn Hoài Phong', 'Male', 14, 'nguyenhoaiphong@gmail.com', '0934124878', 'VIP'),
('KH106', N'Đỗ Thị Mỹ', 'Female', 42, 'dothimy@gmail.com', '0997478412', 'Regular'),
('KH107', N'Nguyễn Văn Đức', 'Male', 45, 'nguyenvanduc@gmail.com', '0941498747', 'VIP'),
('KH108', N'Nguyễn Ngọc Mai', 'Female', 29, 'nguyenngocmai@gmail.com', '0971178473', 'Premium'),
('KH109', N'Đặng Thế Hùng', 'Male', 37, 'dangthehung@gmail.com', '0984198947', 'Regular'),
('KH110', N'Nguyễn Thị Hạnh', 'Female', 36, 'nguyenthiha@gmail.com', '0984641313', 'VIP'),
('KH111', N'Vũ Văn Hùng', 'Male', 25, 'vuvanhung@gmail.com', '0914717484', 'Premium'),
('KH112', N'Hoàng Minh Linh', 'Female', 23, 'hoangminhlinh@gmail.com', '0927979712', 'Regular'),
('KH113', N'Đào Đức Anh', 'Male', 24, 'daoducanh@gmail.com', '0919894842','VIP')
-- 2.DATA GAME table
INSERT INTO GAME (GameID, GameName, ReleaseDate, PublisherName, DeveloperName, Price, AgeRating) VALUES
('GA01', 'Grand Theft Auto V', '2015/04/14', 'Rockstar Games', 'Rockstar North', 790000, '18+'),
('GA02', 'The Witcher 3: Wild Hunt', '2015/05/19', 'CD Projekt', 'CD Projekt Red', 550000, '18+'),
('GA03', 'Minecraft', '2011/11/18', 'Mojang', 'Mojang Studios', 700000, '7+'),
('GA04', 'Red Dead Redemption 2', '2019/11/05', 'Rockstar Games', 'Rockstar Studios', 950000, '18+'),
('GA05', 'Cyberpunk 2077', '2020/12/10', 'CD Projekt', 'CD Projekt Red', 900000, '18+'),
('GA06', 'FIFA 23', '2022/09/30', 'Electronic Arts', 'EA Sports', 650000, '3+'),
('GA07', 'Assassin''s Creed Valhalla', '2020/11/10', 'Ubisoft', 'Ubisoft Montreal', 1100000, '18+'),
('GA08', 'Counter-Strike: GO', '2012/08/21', 'Valve', 'Valve', 340000, '16+'),
('GA09', 'Dota 2', '2013/07/09', 'Valve', 'Valve', 0, '12+'),
('GA10', 'Apex Legends', '2019/02/04', 'Electronic Arts', 'Respawn Entertainment', 0, '16+'),
('GA11', 'PUBG: Battlegrounds', '2017/12/21', 'PUBG Corporation', 'PUBG Corporation', 340000, '16+'),
('GA12', 'Among Us', '2018/11/16', 'Innersloth', 'Innersloth', 79000, '7+'),
('GA13', 'Call of Duty: Warzone', '2020/03/10', 'Activision', 'Infinity Ward', 0, '18+'),
('GA14', 'Valorant', '2020/06/02', 'Riot Games', 'Riot Games', 0, '16+'),
('GA15', 'Overwatch 2', '2022/10/04', 'Blizzard', 'Blizzard Entertainment', 650000, '12+'),
('GA16', 'League of Legends', '2009/10/27', 'Riot Games', 'Riot Games', 0, '12+'),
('GA17', 'Far Cry 6', '2021/10/07', 'Ubisoft', 'Ubisoft Toronto', 1050000, '18+'),
('GA18', 'Forza Horizon 5', '2021/11/09', 'Xbox Game Studios', 'Playground Games', 1100000, '3+'),
('GA19', 'Elden Ring', '2022/02/25', 'Bandai Namco', 'FromSoftware', 1150000, '16+'),
('GA20', 'Doom Eternal', '2020/03/20', 'Bethesda', 'id Software', 1200000, '18+'),
('GA21', 'Sekiro: Shadows Die Twice', '2019/03/22', 'Activision', 'FromSoftware', 950000, '18+'),
('GA22', 'Tom Clancy''s Rainbow Six Siege', '2015/12/01', 'Ubisoft', 'Ubisoft Montreal', 370000, '18+'),
('GA23', 'The Sims 4', '2014/09/02', 'Electronic Arts', 'Maxis', 360000, '12+'),
('GA24', 'BioShock Infinite', '2013/03/26', '2K Games', 'Irrational Games', 180000, '18+'),
('GA25', 'Hollow Knight', '2017/02/24', 'Team Cherry', 'Team Cherry', 120000, '7+'),
('GA26', 'Stardew Valley', '2016/02/26', 'ConcernedApe', 'ConcernedApe', 125000, '7+'),
('GA27', 'Hades', '2020/09/17', 'Supergiant Games', 'Supergiant Games', 215000, '16+'),
('GA28', 'Portal 2', '2011/04/19', 'Valve', 'Valve', 190000, '7+'),
('GA29', 'CyberConnect2', '2021/05/05', 'Bandai Namco', 'CyberConnect2', 670000, '12+'),
('GA30', 'Subnautica', '2018/01/23', 'Unknown Worlds Entertainment', 'Unknown Worlds Entertainment', 320000, '7+'),
('GA31', 'Ori and the Will of the Wisps', '2020/03/11', 'Xbox Game Studios', 'Moon Studios', 270000, '7+'),
('GA32', 'Dishonored 2', '2016/11/11', 'Bethesda', 'Arkane Studios', 290000, '18+'),
('GA33', 'Death Stranding', '2020/07/14', '505 Games', 'Kojima Productions', 1050000, '18+'),
('GA34', 'Team Fortress 2', '2007/10/10', 'Valve', 'Valve', 0, '16+'),
('GA35', 'The Elder Scrolls V: Skyrim', '2011/11/11', 'Bethesda', 'Bethesda Game Studios', 540000, '18+'),
('GA36', 'Terraria', '2011/05/16', 'Re-Logic', 'Re-Logic', 100000, '7+'),
('GA37', 'Hitman 3', '2021/01/20', 'IO Interactive', 'IO Interactive', 900000, '18+'),
('GA38', 'Fall Guys', '2020/08/04', 'Epic Games', 'Mediatonic', 0, '3+'),
('GA39', 'Destiny 2', '2019/10/01', 'Bungie', 'Bungie', 0, '16+'),
('GA40', 'Rocket League', '2015/07/07', 'Psyonix', 'Psyonix', 0, '7+'),
('GA41', 'Plague Inc: Evolved', '2016/02/18', 'Ndemic Creations', 'Ndemic Creations', 160000, '7+'),
('GA42', 'Dead by Daylight', '2016/06/14', 'Behaviour Interactive', 'Behaviour Interactive', 275000, '18+'),
('GA43', 'Dark Souls III', '2016/04/12', 'Bandai Namco', 'FromSoftware', 790000, '18+'),
('GA44', 'Resident Evil Village', '2021/05/07', 'Capcom', 'Capcom', 990000, '18+'),
('GA45', 'Borderlands 3', '2019/09/13', '2K Games', 'Gearbox Software', 899000, '18+'),
('GA46', 'Metro Exodus', '2019/02/15', 'Deep Silver', '4A Games', 850000, '18+'),
('GA47', 'Football Manager 2023', '2022/11/08', 'Sega', 'Sports Interactive', 1070000, '7+'),
('GA48', 'Slay the Spire', '2019/01/23', 'Humble Games', 'Mega Crit Games', 220000, '12+'),
('GA49', 'Monster Hunter: World', '2018/08/09', 'Capcom', 'Capcom', 890000, '16+'),
('GA50', 'Horizon Zero Dawn', '2020/08/07', 'PlayStation PC LLC', 'Guerrilla Games', 799000, '16+'),
('GA51', 'Civilization VI', '2016/10/21', '2K Games', 'Firaxis Games', 350000, '12+'),
('GA52', 'Battlefield V', '2018/11/20', 'Electronic Arts', 'DICE', 650000, '18+'),
('GA53', 'Mortal Kombat 11', '2019/04/23', 'Warner Bros.', 'NetherRealm Studios', 1150000, '18+'),
('GA54', 'NBA 2K23', '2022/09/09', '2K Sports', 'Visual Concepts', 1000000, '3+'),
('GA55', 'Cuphead', '2017/09/29', 'StudioMDHR', 'StudioMDHR', 220000, '7+'),
('GA56', 'Dark Souls Remastered', '2018/05/23', 'Bandai Namco', 'FromSoftware', 790000, '16+'),
('GA57', 'Ori and the Blind Forest', '2015/03/11', 'Xbox Game Studios', 'Moon Studios', 210000, '7+'),
('GA58', 'Genshin Impact', '2020/09/28', 'miHoYo', 'miHoYo', 0, '12+'),
('GA59', 'Cuphead: The Delicious Last Course', '2022/06/30', 'StudioMDHR', 'StudioMDHR', 99000, '7+'),
('GA60', 'Anthem', '2019/02/22', 'Electronic Arts', 'BioWare', 400000, '16+'),
('GA61', 'It Takes Two', '2021/03/26', 'Electronic Arts', 'Hazelight Studios', 690000, '16+'),
('GA62', 'Little Nightmares II', '2021/02/11', 'Bandai Namco', 'Tarsier Studios', 600000, '16+'),
('GA63', 'Planet Zoo', '2019/11/05', 'Frontier Developments', 'Frontier Developments', 720000, '3+'),
('GA64', 'Marvel’s Guardians of the Galaxy', '2021/10/26', 'Square Enix', 'Eidos-Montreal', 1150000, '16+'),
('GA65', 'PAYDAY 2', '2013/08/13', '505 Games', 'Overkill Software', 120000, '18+'),
('GA66', 'Cities: Skylines', '2015/03/10', 'Paradox Interactive', 'Colossal Order', 320000, '3+'),
('GA67', 'TUNIC', '2022/03/16', 'Finji', 'Andrew Shouldice', 400000, '7+'),
('GA68', 'CyberConnect2', '2021/05/05', 'Bandai Namco', 'CyberConnect2', 670000, '12+'),
('GA69', 'Total War: WARHAMMER III', '2022/02/17', 'SEGA', 'Creative Assembly', 1200000, '16+'),
('GA70', 'NBA 2K21', '2020/09/04', '2K Sports', 'Visual Concepts', 1000000, '3+'),
('GA71', 'Halo Infinite', '2021/12/08', 'Xbox Game Studios', '343 Industries', 0, '16+'),
('GA72', 'No Man''s Sky', '2016/08/12', 'Hello Games', 'Hello Games', 600000, '12+'),
('GA73', 'The Forest', '2018/04/30', 'Endnight Games', 'Endnight Games', 180000, '18+'),
('GA74', 'The Stanley Parable', '2013/10/17', 'Galactic Cafe', 'Davey Wreden, William P', 100000, '12+'),
('GA75', 'The Outer Worlds', '2019/10/25', 'Private Division', 'Obsidian Entertainment', 890000, '18+'),
('GA76', 'Outer Wilds', '2020/06/18', 'Annapurna Interactive', 'Mobius Digital', 330000, '12+'),
('GA77', 'Control', '2019/08/27', '505 Games', 'Remedy Entertainment', 620000, '16+'),
('GA78', 'XCOM 2', '2016/02/05', '2K Games', 'Firaxis Games', 790000, '16+'),
('GA79', 'WWE 2K22', '2022/03/11', '2K Sports', 'Visual Concepts', 1000000, '18+'),
('GA80', 'Disco Elysium', '2019/10/15', 'ZA/UM', 'ZA/UM', 310000, '18+'),
('GA81', 'Tropico 6', '2019/03/29', 'Kalypso Media', 'Limbic Entertainment', 380000, '16+'),
('GA82', 'Watch Dogs: Legion', '2020/10/29', 'Ubisoft', 'Ubisoft Toronto', 1100000, '18+'),
('GA83', 'Grounded', '2022/09/27', 'Xbox Game Studios', 'Obsidian Entertainment', 390000, '7+'),
('GA84', 'Mafia: Definitive Edition', '2020/09/25', '2K Games', 'Hangar 13', 749000, '18+'),
('GA85', 'Sea of Thieves', '2018/03/20', 'Xbox Game Studios', 'Rare', 595000, '12+'),
('GA86', 'Ghostwire: Tokyo', '2022/03/25', 'Bethesda', 'Tango Gameworks', 1050000, '16+'),
('GA87', 'Spelunky 2', '2020/09/15', 'Mossmouth', 'Mossmouth, BlitWorks', 180000, '7+'),
('GA88', 'Returnal', '2023/08/15', 'PlayStation PC LLC', 'Housemarque', 1400000, '16+'),
('GA89', 'F1 2022', '2022/06/28', 'Electronic Arts', 'Codemasters', 1250000, '3+'),
('GA90', 'Ghost of Tsushima', '2024/05/16', 'Sony Interactive', 'Sucker Punch Productions', 1590000, '18+'),
('GA91', 'Sifu', '2022/02/08', 'Sloclap', 'Sloclap', 650000, '16+'),
('GA92', 'Alan Wake Remastered', '2021/10/05', 'Epic Games Publishing', 'Remedy Entertainment', 700000, '16+'),
('GA93', 'Dragon Age: Inquisition', '2014/11/18', 'Electronic Arts', 'BioWare', 390000, '18+'),
('GA94', 'Portal', '2007/10/10', 'Valve', 'Valve', 99000, '7+'),
('GA95', 'Dying Light 2 Stay Human', '2022/02/04', 'Techland', 'Techland', 1180000, '18+'),
('GA96', 'A Plague Tale: Requiem', '2022/10/18', 'Focus Entertainment', 'Asobo Studio', 950000, '18+'),
('GA97', 'High on Life', '2022/12/13', 'Squanch Games', 'Squanch Games', 660000, '18+'),
('GA98', 'Streets of Rage 4', '2020/04/30', 'DotEmu', 'DotEmu', 160000, '12+'),
('GA99', 'Superhot', '2016/02/25', 'Superhot Team', 'Superhot Team', 150000, '16+'),
('GA100', 'TEKKEN 7', '2017/06/02', 'Bandai Namco Entertainment', 'Bandai Namco Studios', 800000, '16+');
-- 3.DATA GENRE table
INSERT INTO GENRE (GenreID, GenreName) VALUES
('GE01', 'Action'),
('GE02', 'Adventure'),
('GE03', 'Role-Playing (RPG)'),
('GE04', 'Shooter'),
('GE05', 'Open World'),
('GE06', 'Simulation'),
('GE07', 'Strategy'),
('GE08', 'Sports'),
('GE09', 'Racing'),
('GE10', 'Fighting'),
('GE11', 'Platformer'),
('GE12', 'Puzzle'),
('GE13', 'Survival'),
('GE14', 'Horror'),
('GE15', 'StealGA'),
('GE16', 'Sandbox'),
('GE17', 'Battle Royale'),
('GE18', 'MMORPG'),
('GE19', 'MOBA'),
('GE20', 'Card Game'),
('GE21', 'Roguelike'),
('GE22', 'Metroidvania'),
('GE23', 'Party Game'),
('GE24', 'Tactical'),
('GE25', 'Beat ''em up'),
('GE26', 'RhyGAm'),
('GE27', 'Visual Novel'),
('GE28', 'Turn-based'),
('GE29', 'Co-op'),
('GE30', 'Hack and Slash'),
('GE31', 'Souls-like'),
('GE32', 'Farming'),
('GE33', 'City-building'),
('GE34', 'Management'),
('GE35', 'Indie'),
('GE36', 'Narrative'),
('GE37', 'Exploration'),
('GE38', 'Puzzle-platformer'),
('GE39', 'Roguelite'),
('GE40', 'Deck-building'),
('GE41', 'Tycoon'),
('GE42', 'Sports Simulation'),
('GE43', 'Arcade'),
('GE44', 'Multiplayer'),
('GE45', 'Singleplayer'),
('GE46', 'Online'),
('GE47', 'Real-time Strategy'),
('GE48', 'First-person'),
('GE49', 'GAird-person'),
('GE50', 'Shooter-cooperative');
-- 4.DATA GAME GENRE table
INSERT INTO GameGenre (GameID, GenreID) VALUES
('GA01','GE01'), ('GA01','GE02'), ('GA01','GE05'), ('GA01','GE44'),
('GA02','GE03'), ('GA02','GE01'), ('GA02','GE05'), ('GA02','GE02'),
('GA03','GE16'), ('GA03','GE06'), ('GA03','GE11'), ('GA03','GE13'),
('GA04','GE01'), ('GA04','GE02'), ('GA04','GE05'), ('GA04','GE03'),
('GA05','GE03'), ('GA05','GE01'), ('GA05','GE02'), ('GA05','GE05'),
('GA06','GE08'), ('GA06','GE42'), ('GA06','GE44'),
('GA07','GE01'), ('GA07','GE05'), ('GA07','GE02'), ('GA07','GE15'),
('GA08','GE04'), ('GA08','GE44'), ('GA08','GE46'), ('GA08','GE45'),
('GA09','GE19'), ('GA09','GE44'), ('GA09','GE08'),
('GA10','GE17'), ('GA10','GE04'), ('GA10','GE44'),
('GA11','GE17'), ('GA11','GE04'), ('GA11','GE44'),
('GA12','GE23'), ('GA12','GE44'), ('GA12','GE29'),
('GA13','GE04'), ('GA13','GE17'), ('GA13','GE44'),
('GA14','GE04'), ('GA14','GE44'), ('GA14','GE18'),
('GA15','GE04'), ('GA15','GE44'), ('GA15','GE08'),
('GA16','GE19'), ('GA16','GE44'), ('GA16','GE08'),
('GA17','GE01'), ('GA17','GE02'), ('GA17','GE05'), ('GA17','GE15'),
('GA18','GE09'), ('GA18','GE47'), ('GA18','GE44'),
('GA19','GE03'), ('GA19','GE31'), ('GA19','GE01'), ('GA19','GE02'),
('GA20','GE01'), ('GA20','GE14'), ('GA20','GE31'),
('GA21','GE01'), ('GA21','GE31'), ('GA21','GE14'),
('GA22','GE24'), ('GA22','GE04'), ('GA22','GE44'),
('GA23','GE06'), ('GA23','GE08'), ('GA23','GE34'),
('GA24','GE01'), ('GA24','GE14'), ('GA24','GE02'),
('GA25','GE11'), ('GA25','GE22'), ('GA25','GE39'),
('GA26','GE06'), ('GA26','GE32'), ('GA26','GE11'),
('GA27','GE21'), ('GA27','GE01'), ('GA27','GE30'),
('GA28','GE12'), ('GA28','GE38'), ('GA28','GE11'),
('GA29','GE12'), ('GA29','GE04'), ('GA29','GE03'),
('GA30','GE13'), ('GA30','GE06'), ('GA30','GE01'),
('GA31','GE11'), ('GA31','GE02'), ('GA31','GE01'),
('GA32','GE15'), ('GA32','GE02'), ('GA32','GE01'),
('GA33','GE03'), ('GA33','GE36'), ('GA33','GE01'),
('GA34','GE04'), ('GA34','GE44'), ('GA34','GE47'),
('GA35','GE03'), ('GA35','GE02'), ('GA35','GE05'),
('GA36','GE06'), ('GA36','GE11'), ('GA36','GE13'),
('GA37','GE15'), ('GA37','GE01'), ('GA37','GE24'),
('GA38','GE23'), ('GA38','GE29'), ('GA38','GE11'),
('GA39','GE04'), ('GA39','GE44'), ('GA39','GE18'),
('GA40','GE08'), ('GA40','GE44'), ('GA40','GE09'),
('GA41','GE12'), ('GA41','GE06'), ('GA41','GE21'),
('GA42','GE14'), ('GA42','GE44'), ('GA42','GE13'),
('GA43','GE31'), ('GA43','GE03'), ('GA43','GE01'),
('GA44','GE14'), ('GA44','GE01'), ('GA44','GE03'),
('GA45','GE01'), ('GA45','GE02'), ('GA45','GE30'),
('GA46','GE13'), ('GA46','GE01'), ('GA46','GE14'),
('GA47','GE08'), ('GA47','GE42'), ('GA47','GE44'),
('GA48','GE21'), ('GA48','GE12'), ('GA48','GE40'),
('GA49','GE03'), ('GA49','GE01'), ('GA49','GE13'),
('GA50','GE05'), ('GA50','GE02'), ('GA50','GE01'),
('GA51','GE07'), ('GA51','GE28'), ('GA51','GE41'),
('GA52','GE04'), ('GA52','GE44'), ('GA52','GE08'),
('GA53','GE10'), ('GA53','GE01'), ('GA53','GE44'),
('GA54','GE08'), ('GA54','GE42'), ('GA54','GE44'),
('GA55','GE11'), ('GA55','GE43'), ('GA55','GE23'),
('GA56','GE31'), ('GA56','GE03'), ('GA56','GE01'),
('GA57','GE11'), ('GA57','GE02'), ('GA57','GE36'),
('GA58','GE03'), ('GA58','GE06'), ('GA58','GE44'),
('GA59','GE11'), ('GA59','GE23'), ('GA59','GE43'),
('GA60','GE01'), ('GA60','GE06'), ('GA60','GE15'),
('GA61','GE29'), ('GA61','GE44'), ('GA61','GE07'),
('GA62','GE14'), ('GA62','GE13'), ('GA62','GE01'),
('GA63','GE06'), ('GA63','GE33'), ('GA63','GE34'),
('GA64','GE01'), ('GA64','GE02'), ('GA64','GE03'),
('GA65','GE01'), ('GA65','GE44'), ('GA65','GE20'),
('GA66','GE33'), ('GA66','GE41'), ('GA66','GE06'),
('GA67','GE11'), ('GA67','GE01'), ('GA67','GE36'),
('GA68','GE28'), ('GA68','GE03'), ('GA68','GE04'),
('GA69','GE07'), ('GA69','GE01'), ('GA69','GE16'),
('GA70','GE08'), ('GA70','GE42'), ('GA70','GE44'),
('GA71','GE04'), ('GA71','GE44'), ('GA71','GE09'),
('GA72','GE05'), ('GA72','GE06'), ('GA72','GE01'),
('GA73','GE13'), ('GA73','GE31'), ('GA73','GE02'),
('GA74','GE12'), ('GA74','GE36'), ('GA74','GE23'),
('GA75','GE03'), ('GA75','GE25'), ('GA75','GE30'),
('GA76','GE38'), ('GA76','GE02'), ('GA76','GE36'),
('GA77','GE24'), ('GA77','GE02'), ('GA77','GE01'),
('GA78','GE07'), ('GA78','GE28'), ('GA78','GE16'),
('GA79','GE08'), ('GA79','GE44'), ('GA79','GE10'),
('GA80','GE36'), ('GA80','GE35'), ('GA80','GE03'),
('GA81','GE06'), ('GA81','GE33'), ('GA81','GE41'),
('GA82','GE15'), ('GA82','GE01'), ('GA82','GE02'),
('GA83','GE13'), ('GA83','GE11'), ('GA83','GE29'),
('GA84','GE01'), ('GA84','GE02'), ('GA84','GE30'),
('GA85','GE08'), ('GA85','GE07'), ('GA85','GE22'),
('GA86','GE14'), ('GA86','GE01'), ('GA86','GE03'),
('GA87','GE11'), ('GA87','GE23'), ('GA87','GE43'),
('GA88','GE30'), ('GA88','GE01'), ('GA88','GE16'),
('GA89','GE09'), ('GA89','GE08'), ('GA89','GE44'),
('GA90','GE01'), ('GA90','GE02'), ('GA90','GE05'),
('GA91','GE30'), ('GA91','GE01'), ('GA91','GE31'),
('GA92','GE36'), ('GA92','GE12'), ('GA92','GE01'),
('GA93','GE03'), ('GA93','GE36'), ('GA93','GE02'),
('GA94','GE12'), ('GA94','GE38'), ('GA94','GE16'),
('GA95','GE01'), ('GA95','GE13'), ('GA95','GE14'),
('GA96','GE01'), ('GA96','GE02'), ('GA96','GE03'),
('GA97','GE36'), ('GA97','GE12'), ('GA97','GE35'),
('GA98','GE25'), ('GA98','GE01'), ('GA98','GE43'),
('GA99','GE21'), ('GA99','GE03'), ('GA99','GE16'),
('GA100','GE10'), ('GA100','GE04'), ('GA100','GE44');
-- 5.DATA SERVICE table
INSERT INTO Service (ServiceID, ServiceName, CPU, VGA, RAM, SSD, Price, MaxUses) VALUES
('DF',  'Default',   'Intel Core i3 14100',  'RTX 1660 super','16GB',  '256GB', 10000, 50),
('AD',  'Advanced',  'Intel Core i5 13600K', 'RTX 2060 Super','16GB',  '256GB', 20000, 50),
('IM',  'Immediate', 'Intel Core i5 14600K', 'GTX 3060','16GB',  '512GB', 30000, 50),
('SU',  'Super',     'Intel Core i7 13700F', 'GTX 3070ti','16GB', '512GB', 45000, 50),
('SUP', 'Supreme',   'Intel Core i7 14700K', 'RTX 4050','32GB',  '512GB', 60000, 50),
('AST', 'Astronaut', 'Intel Core i9 14900K', 'GTX 4080','64GB',  '1TB',   95000, 50);
-- 6.DATA SUBSCRIPTION table
INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status) VALUES
('SUB01', 'KH01', 'DF', '2023-01-15 10:00:00', '2024-01-14 23:59:59', 'active'),
('SUB02', 'KH02', 'AD', '2022-12-01 09:30:00', '2023-12-01 23:59:59', 'expired'),
('SUB03', 'KH03', 'IM', '2023-03-10 14:20:00', '2024-03-09 23:59:59', 'active'),
('SUB04', 'KH04', 'SU', '2023-04-01 11:15:00', '2024-04-30 23:59:59', 'active'),
('SUB05', 'KH05', 'SUP', '2023-05-12 08:45:00', '2024-05-11 23:59:59', 'active'),
('SUB06', 'KH06', 'AST', '2022-08-20 12:00:00', '2023-08-19 23:59:59', 'expired'),
('SUB07', 'KH07', 'DF', '2023-02-27 16:30:00', '2024-02-26 23:59:59', 'active'),
('SUB08', 'KH08', 'AD', '2023-01-10 10:10:00', '2024-01-09 23:59:59', 'active'),
('SUB09', 'KH09', 'IM', '2023-06-15 09:00:00', '2024-06-14 23:59:59', 'active'),
('SUB10', 'KH10', 'SU', '2023-03-25 14:00:00', '2024-03-24 23:59:59', 'active'),
('SUB11', 'KH11', 'SUP', '2023-02-02 09:30:00', '2023-08-01 23:59:59', 'cancelled'),
('SUB12', 'KH12', 'AST', '2023-07-01 13:00:00', '2024-06-30 23:59:59', 'active'),
('SUB13', 'KH13', 'DF', '2023-01-15 10:30:00', '2023-07-14 23:59:59', 'cancelled'),
('SUB14', 'KH14', 'AD', '2023-05-05 15:45:00', '2024-05-04 23:59:59', 'active'),
('SUB15', 'KH15', 'IM', '2023-06-20 08:45:00', '2024-06-19 23:59:59', 'active'),
('SUB16', 'KH16', 'SU', '2023-03-30 11:00:00', '2024-03-29 23:59:59', 'active'),
('SUB17', 'KH17', 'SUP', '2023-07-07 14:30:00', '2024-07-06 23:59:59', 'active'),
('SUB18', 'KH18', 'AST', '2023-04-25 09:20:00', '2023-10-24 23:59:59', 'cancelled'),
('SUB19', 'KH19', 'DF', '2023-01-21 12:15:00', '2024-01-20 23:59:59', 'active'),
('SUB20', 'KH20', 'AD', '2023-02-14 10:10:00', '2024-02-13 23:59:59', 'active'),
('SUB21', 'KH21', 'IM', '2023-06-01 16:00:00', '2024-05-31 23:59:59', 'active'),
('SUB22', 'KH22', 'SU', '2023-05-10 09:30:00', '2024-05-09 23:59:59', 'active'),
('SUB23', 'KH23', 'SUP', '2022-12-12 11:00:00', '2023-12-11 23:59:59', 'expired'),
('SUB24', 'KH24', 'AST', '2023-06-15 14:30:00', '2024-06-14 23:59:59', 'active'),
('SUB25', 'KH25', 'DF', '2023-03-03 10:45:00', '2024-03-02 23:59:59', 'active'),
('SUB26', 'KH26', 'AD', '2023-01-05 11:15:00', '2024-01-04 23:59:59', 'active'),
('SUB27', 'KH27', 'IM', '2023-07-19 13:00:00', '2024-07-18 23:59:59', 'active'),
('SUB28', 'KH28', 'SU', '2023-02-28 15:30:00', '2024-02-27 23:59:59', 'active'),
('SUB29', 'KH29', 'SUP', '2023-04-20 09:00:00', '2024-04-19 23:59:59', 'active'),
('SUB30', 'KH30', 'AST', '2023-06-30 10:45:00', '2024-06-29 23:59:59', 'active'),
('SUB31', 'KH31', 'DF', '2023-01-18 14:00:00', '2024-01-17 23:59:59', 'active'),
('SUB32', 'KH32', 'AD', '2023-03-10 09:30:00', '2024-03-09 23:59:59', 'active'),
('SUB33', 'KH33', 'IM', '2023-02-15 11:45:00', '2024-02-14 23:59:59', 'active'),
('SUB34', 'KH34', 'SU', '2023-05-22 10:00:00', '2024-05-21 23:59:59', 'active'),
('SUB35', 'KH35', 'SUP', '2023-04-12 16:00:00', '2024-04-11 23:59:59', 'active'),
('SUB36', 'KH36', 'AST', '2023-06-08 08:30:00', '2024-06-07 23:59:59', 'active'),
('SUB37', 'KH37', 'DF', '2023-02-05 09:45:00', '2024-02-04 23:59:59', 'active'),
('SUB38', 'KH38', 'AD', '2023-01-20 13:15:00', '2024-01-19 23:59:59', 'active'),
('SUB39', 'KH39', 'IM', '2023-03-31 11:00:00', '2024-03-30 23:59:59', 'active'),
('SUB40', 'KH40', 'SU', '2023-04-18 14:30:00', '2024-04-17 23:59:59', 'active'),
('SUB41', 'KH41', 'SUP', '2023-05-05 12:00:00', '2024-05-04 23:59:59', 'active'),
('SUB42', 'KH42', 'AST', '2023-01-12 09:00:00', '2024-01-11 23:59:59', 'active'),
('SUB43', 'KH43', 'DF', '2023-06-03 15:00:00', '2024-06-02 23:59:59', 'active'),
('SUB44', 'KH44', 'AD', '2023-02-22 10:30:00', '2024-02-21 23:59:59', 'active'),
('SUB45', 'KH45', 'IM', '2023-03-07 13:45:00', '2024-03-06 23:59:59', 'active'),
('SUB46', 'KH46', 'SU', '2023-04-27 14:20:00', '2024-04-26 23:59:59', 'active'),
('SUB47', 'KH47', 'SUP', '2023-06-11 09:00:00', '2024-06-10 23:59:59', 'active'),
('SUB48', 'KH48', 'AST', '2023-05-08 11:15:00', '2024-05-07 23:59:59', 'active'),
('SUB49', 'KH49', 'DF', '2023-01-25 10:00:00', '2024-01-24 23:59:59', 'active'),
('SUB50', 'KH50', 'AD', '2023-07-01 16:30:00', '2024-06-30 23:59:59', 'active');
-- 7.DATA ORDER table
INSERT INTO OrderTable (OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus) VALUES
('OD01', 'KH01', 'GA01', 790000, '2023-01-10 10:15:00', 'completed'),
('OD02', 'KH02', 'GA02', 550000, '2023-01-12 14:20:00', 'completed'),
('OD03', 'KH03', 'GA03', 700000, '2023-01-15 09:50:00', 'pending'),
('OD04', 'KH04', 'GA04', 950000, '2023-01-18 11:30:00', 'completed'),
('OD05', 'KH05', 'GA05', 900000, '2023-01-20 16:45:00', 'completed'),
('OD06', 'KH06', 'GA06', 650000, '2023-01-22 13:15:00', 'completed'),
('OD07', 'KH07', 'GA07', 1100000, '2023-01-25 10:05:00', 'pending'),
('OD08', 'KH08', 'GA08', 340000, '2023-01-27 18:00:00', 'completed'),
('OD09', 'KH09', 'GA09', 0, '2023-01-30 12:00:00', 'failed'),
('OD10', 'KH10', 'GA10', 0, '2023-02-01 14:35:00', 'completed'),
('OD11', 'KH11', 'GA11', 340000, '2023-02-03 09:10:00', 'completed'),
('OD12', 'KH12', 'GA12', 79000, '2023-02-05 15:25:00', 'refunded'),
('OD13', 'KH13', 'GA13', 0, '2023-02-07 16:40:00', 'pending'),
('OD14', 'KH14', 'GA14', 0, '2023-02-10 11:55:00', 'completed'),
('OD15', 'KH15', 'GA15', 650000, '2023-02-12 10:30:00', 'completed'),
('OD16', 'KH16', 'GA16', 0, '2023-02-14 14:00:00', 'canceled'),
('OD17', 'KH17', 'GA17', 1050000, '2023-02-16 13:20:00', 'pending'),
('OD18', 'KH18', 'GA18', 1100000, '2023-02-18 10:25:00', 'completed'),
('OD19', 'KH19', 'GA19', 1150000, '2023-02-20 17:00:00', 'completed'),
('OD20', 'KH20', 'GA20', 1200000, '2023-02-22 09:45:00', 'completed'),
('OD21', 'KH21', 'GA21', 950000, '2023-02-24 15:30:00', 'pending'),
('OD22', 'KH22', 'GA22', 370000, '2023-02-26 13:50:00', 'completed'),
('OD23', 'KH23', 'GA23', 360000, '2023-02-28 10:40:00', 'completed'),
('OD24', 'KH24', 'GA24', 180000, '2023-03-02 11:15:00', 'completed'),
('OD25', 'KH25', 'GA25', 120000, '2023-03-04 16:45:00', 'pending'),
('OD26', 'KH26', 'GA26', 125000, '2023-03-06 14:20:00', 'completed'),
('OD27', 'KH27', 'GA27', 215000, '2023-03-08 12:05:00', 'completed'),
('OD28', 'KH28', 'GA28', 190000, '2023-03-10 10:10:00', 'completed'),
('OD29', 'KH29', 'GA29', 670000, '2023-03-12 09:30:00', 'pending'),
('OD30', 'KH30', 'GA30', 320000, '2023-03-14 14:00:00', 'completed'),
('OD31', 'KH31', 'GA31', 270000, '2023-03-16 11:35:00', 'completed'),
('OD32', 'KH32', 'GA32', 290000, '2023-03-18 13:40:00', 'completed'),
('OD33', 'KH33', 'GA33', 1050000, '2023-03-20 15:25:00', 'pending'),
('OD34', 'KH34', 'GA34', 0, '2023-03-22 09:50:00', 'completed'),
('OD35', 'KH35', 'GA35', 540000, '2023-03-24 17:00:00', 'completed'),
('OD36', 'KH36', 'GA36', 100000, '2023-03-26 12:10:00', 'completed'),
('OD37', 'KH37', 'GA37', 900000, '2023-03-28 14:40:00', 'pending'),
('OD38', 'KH38', 'GA38', 0, '2023-03-30 11:25:00', 'completed'),
('OD39', 'KH39', 'GA39', 0, '2023-04-01 13:50:00', 'completed'),
('OD40', 'KH40', 'GA40', 0, '2023-04-03 16:35:00', 'completed'),
('OD41', 'KH41', 'GA41', 160000, '2023-04-05 10:20:00', 'completed'),
('OD42', 'KH42', 'GA42', 275000, '2023-04-07 14:45:00', 'completed'),
('OD43', 'KH43', 'GA43', 790000, '2023-04-09 12:00:00', 'completed'),
('OD44', 'KH44', 'GA44', 990000, '2023-04-11 15:10:00', 'pending'),
('OD45', 'KH45', 'GA45', 899000, '2023-04-13 11:35:00', 'completed'),
('OD46', 'KH46', 'GA46', 850000, '2023-04-15 13:55:00', 'completed'),
('OD47', 'KH47', 'GA47', 1070000, '2023-04-17 09:10:00', 'completed'),
('OD48', 'KH48', 'GA48', 220000, '2023-04-19 14:30:00', 'completed'),
('OD49', 'KH49', 'GA49', 890000, '2023-04-21 16:05:00', 'completed'),
('OD50', 'KH50', 'GA50', 799000, '2023-04-23 10:20:00', 'pending'),
('OD51', 'KH51', 'GA51', 350000, '2023-04-25 13:45:00', 'completed'),
('OD52', 'KH52', 'GA52', 650000, '2023-04-27 11:10:00', 'completed'),
('OD53', 'KH53', 'GA53', 1150000, '2023-04-29 14:30:00', 'completed'),
('OD54', 'KH54', 'GA54', 1000000, '2023-05-01 10:00:00', 'pending'),
('OD55', 'KH55', 'GA55', 220000, '2023-05-03 15:20:00', 'completed'),
('OD56', 'KH56', 'GA56', 790000, '2023-05-05 12:10:00', 'completed'),
('OD57', 'KH57', 'GA57', 210000, '2023-05-07 13:40:00', 'completed'),
('OD58', 'KH58', 'GA58', 0, '2023-05-09 11:15:00', 'completed'),
('OD59', 'KH59', 'GA59', 99000, '2023-05-11 16:30:00', 'completed'),
('OD60', 'KH60', 'GA60', 400000, '2023-05-13 10:50:00', 'pending'),
('OD61', 'KH61', 'GA61', 690000, '2023-05-15 14:20:00', 'completed'),
('OD62', 'KH62', 'GA62', 600000, '2023-05-17 10:40:00', 'completed'),
('OD63', 'KH63', 'GA63', 720000, '2023-05-19 13:10:00', 'completed'),
('OD64', 'KH64', 'GA64', 1150000, '2023-05-21 15:45:00', 'completed'),
('OD65', 'KH65', 'GA65', 120000, '2023-05-23 11:30:00', 'completed'),
('OD66', 'KH66', 'GA66', 320000, '2023-05-25 14:50:00', 'completed'),
('OD67', 'KH67', 'GA67', 400000, '2023-05-27 12:15:00', 'pending'),
('OD68', 'KH68', 'GA68', 670000, '2023-05-29 16:00:00', 'completed'),
('OD69', 'KH69', 'GA69', 1200000, '2023-05-31 09:40:00', 'completed'),
('OD70', 'KH70', 'GA70', 1000000, '2023-06-02 14:10:00', 'completed'),
('OD71', 'KH71', 'GA71', 0, '2023-06-04 11:00:00', 'completed'),
('OD72', 'KH72', 'GA72', 600000, '2023-06-06 16:25:00', 'completed'),
('OD73', 'KH73', 'GA73', 180000, '2023-06-08 12:30:00', 'completed'),
('OD74', 'KH74', 'GA74', 100000, '2023-06-10 10:05:00', 'completed'),
('OD75', 'KH75', 'GA75', 890000, '2023-06-12 14:00:00', 'pending'),
('OD76', 'KH76', 'GA76', 330000, '2023-06-14 13:15:00', 'completed'),
('OD77', 'KH77', 'GA77', 620000, '2023-06-16 15:50:00', 'completed'),
('OD78', 'KH78', 'GA78', 790000, '2023-06-18 09:45:00', 'completed'),
('OD79', 'KH79', 'GA79', 1000000, '2023-06-20 14:30:00', 'pending'),
('OD80', 'KH80', 'GA80', 310000, '2023-06-22 12:10:00', 'completed'),
('OD81', 'KH81', 'GA81', 380000, '2023-06-24 10:40:00', 'completed'),
('OD82', 'KH82', 'GA82', 1100000, '2023-06-26 15:05:00', 'completed'),
('OD83', 'KH83', 'GA83', 390000, '2023-06-28 13:30:00', 'pending'),
('OD84', 'KH84', 'GA84', 749000, '2023-06-30 11:00:00', 'completed'),
('OD85', 'KH85', 'GA85', 595000, '2023-07-02 16:20:00', 'completed'),
('OD86', 'KH86', 'GA86', 1050000, '2023-07-04 14:15:00', 'completed'),
('OD87', 'KH87', 'GA87', 180000, '2023-07-06 10:50:00', 'completed'),
('OD88', 'KH88', 'GA88', 1400000, '2023-07-08 12:40:00', 'pending'),
('OD89', 'KH89', 'GA89', 1250000, '2023-07-10 15:10:00', 'completed'),
('OD90', 'KH90', 'GA90', 1590000, '2023-07-12 09:30:00', 'completed'),
('OD91', 'KH91', 'GA91', 650000, '2023-07-14 14:55:00', 'completed'),
('OD92', 'KH92', 'GA92', 700000, '2023-07-16 13:20:00', 'completed'),
('OD93', 'KH93', 'GA93', 390000, '2023-07-18 11:45:00', 'pending'),
('OD94', 'KH94', 'GA94', 99000, '2023-07-20 16:00:00', 'completed'),
('OD95', 'KH95', 'GA95', 1180000, '2023-07-22 10:30:00', 'completed'),
('OD96', 'KH96', 'GA96', 950000, '2023-07-24 14:00:00', 'completed'),
('OD97', 'KH97', 'GA97', 660000, '2023-07-26 12:20:00', 'completed'),
('OD98', 'KH98', 'GA98', 160000, '2023-07-28 15:45:00', 'completed'),
('OD99', 'KH99', 'GA99', 150000, '2023-07-30 13:10:00', 'completed'),
('OD100', 'KH100', 'GA100', 800000, '2023-08-01 11:35:00', 'pending');
-- 8.DATA PAYMENT table
INSERT INTO Payment (PaymentID, CustomerID, OrderID, SubscriptionID, PaymentDate, Amount, PaymentMethod) VALUES
('PAY01', 'KH01', 'OD01', NULL, '2023-01-10 10:15:00', 790000, 'credit_card'),
('PAY02', 'KH02', 'OD02', NULL, '2023-01-12 14:20:00', 550000, 'ATM'),
('PAY03', 'KH03', NULL, 'SUB03', '2023-01-15 09:50:00', 2100000, 'MOMO'), -- 700000 * 3 (3 months)
('PAY04', 'KH04', 'OD04', NULL, '2023-01-18 11:30:00', 950000, 'credit_card'),
('PAY05', 'KH05', 'OD05', NULL, '2023-01-20 16:45:00', 900000, 'ATM'),
('PAY06', 'KH06', 'OD06', NULL, '2023-01-22 13:15:00', 650000, 'MOMO'),
('PAY07', 'KH07', NULL, 'SUB07', '2023-01-25 10:05:00', 500000, 'credit_card'), -- 10000 * 50
('PAY08', 'KH08', 'OD08', NULL, '2023-01-27 18:00:00', 340000, 'ATM'),
('PAY09', 'KH09', NULL, 'SUB09', '2023-01-30 12:00:00', 500000, 'MOMO'), -- 500000
('PAY10', 'KH10', 'OD10', NULL, '2023-02-01 14:35:00', 600000, 'credit_card'),
('PAY11', 'KH11', 'OD11', NULL, '2023-02-03 09:10:00', 340000, 'ATM'),
('PAY12', 'KH12', NULL, 'SUB12', '2023-02-05 15:25:00', 79000, 'MOMO'),
('PAY13', 'KH13', NULL, 'SUB13', '2023-02-07 16:40:00', 800000, 'credit_card'),
('PAY14', 'KH14', 'OD14', NULL, '2023-02-10 11:55:00', 900000, 'ATM'),
('PAY15', 'KH15', 'OD15', NULL, '2023-02-12 10:30:00', 650000, 'MOMO'),
('PAY16', 'KH16', NULL, 'SUB16', '2023-02-14 14:00:00', 1050000, 'credit_card'),
('PAY17', 'KH17', 'OD17', NULL, '2023-02-16 13:20:00', 1100000, 'ATM'),
('PAY18', 'KH18', 'OD18', NULL, '2023-02-18 10:25:00', 1100000, 'MOMO'),
('PAY19', 'KH19', 'OD19', NULL, '2023-02-20 17:00:00', 1150000, 'credit_card'),
('PAY20', 'KH20', 'OD20', NULL, '2023-02-22 09:45:00', 950000, 'ATM'),
('PAY21', 'KH21', NULL, 'SUB21', '2023-02-24 15:30:00', 740000, 'MOMO'), -- 370000 * 2
('PAY22', 'KH22', 'OD22', NULL, '2023-02-26 13:50:00', 360000, 'credit_card'),
('PAY23', 'KH23', 'OD23', NULL, '2023-02-28 10:40:00', 180000, 'ATM'),
('PAY24', 'KH24', 'OD24', NULL, '2023-03-02 11:15:00', 120000, 'MOMO'),
('PAY25', 'KH25', NULL, 'SUB25', '2023-03-04 16:45:00', 125000, 'credit_card'),
('PAY26', 'KH26', 'OD26', NULL, '2023-03-06 14:20:00', 125000, 'ATM'),
('PAY27', 'KH27', 'OD27', NULL, '2023-03-08 12:05:00', 215000, 'MOMO'),
('PAY28', 'KH28', 'OD28', NULL, '2023-03-10 10:10:00', 190000, 'credit_card'),
('PAY29', 'KH29', NULL, 'SUB29', '2023-03-12 09:30:00', 670000, 'ATM'), -- 670000
('PAY30', 'KH30', 'OD30', NULL, '2023-03-14 14:00:00', 270000, 'MOMO'),
('PAY31', 'KH31', 'OD31', NULL, '2023-03-16 11:35:00', 290000, 'credit_card'),
('PAY32', 'KH32', NULL, 'SUB32', '2023-03-18 13:40:00', 1050000, 'ATM'),
('PAY33', 'KH33', 'OD33', NULL, '2023-03-20 15:25:00', 540000, 'MOMO'),
('PAY34', 'KH34', NULL, 'SUB34', '2023-03-22 09:50:00', 100000, 'credit_card'),
('PAY35', 'KH35', 'OD35', NULL, '2023-03-24 17:00:00', 900000, 'ATM'),
('PAY36', 'KH36', 'OD36', NULL, '2023-03-26 12:10:00', 100000, 'MOMO'),
('PAY37', 'KH37', NULL, 'SUB37', '2023-03-28 14:40:00', 800000, 'credit_card'),
('PAY38', 'KH38', 'OD38', NULL, '2023-03-30 11:25:00', 0, 'ATM'),
('PAY39', 'KH39', 'OD39', NULL, '2023-04-01 13:50:00', 0, 'MOMO'),
('PAY40', 'KH40', 'OD40', NULL, '2023-04-03 16:35:00', 0, 'credit_card'),
('PAY41', 'KH41', 'OD41', NULL, '2023-04-05 10:20:00', 160000, 'ATM'),
('PAY42', 'KH42', 'OD42', NULL, '2023-04-07 14:45:00', 275000, 'MOMO'),
('PAY43', 'KH43', 'OD43', NULL, '2023-04-09 12:00:00', 790000, 'credit_card'),
('PAY44', 'KH44', 'OD44', NULL, '2023-04-11 15:10:00', 990000, 'ATM'),
('PAY45', 'KH45', 'OD45', NULL, '2023-04-13 11:35:00', 899000, 'MOMO'),
('PAY46', 'KH46', 'OD46', NULL, '2023-04-15 13:55:00', 850000, 'credit_card'),
('PAY47', 'KH47', 'OD47', NULL, '2023-04-17 09:10:00', 1070000, 'ATM'),
('PAY48', 'KH48', 'OD48', NULL, '2023-04-19 14:30:00', 220000, 'MOMO'),
('PAY49', 'KH49', 'OD49', NULL, '2023-04-21 16:05:00', 890000, 'credit_card'),
('PAY50', 'KH50', 'OD50', NULL, '2023-04-23 10:20:00', 799000, 'ATM'),
('PAY51', 'KH51', NULL, 'SUB50', '2023-04-25 13:45:00', 350000, 'MOMO'),
('PAY52', 'KH52', 'OD52', NULL, '2023-04-27 11:10:00', 650000, 'credit_card'),
('PAY53', 'KH53', 'OD53', NULL, '2023-04-29 14:30:00', 1150000, 'ATM'),
('PAY54', 'KH54', NULL, 'SUB47', '2023-05-01 10:00:00', 1000000, 'MOMO'),
('PAY55', 'KH55', 'OD55', NULL, '2023-05-03 15:20:00', 220000, 'credit_card'),
('PAY56', 'KH56', 'OD56', NULL, '2023-05-05 12:10:00', 790000, 'ATM'),
('PAY57', 'KH57', 'OD57', NULL, '2023-05-07 13:40:00', 210000, 'MOMO'),
('PAY58', 'KH58', NULL, 'SUB45', '2023-05-09 11:15:00', 0, 'credit_card'),
('PAY59', 'KH59', 'OD59', NULL, '2023-05-11 16:30:00', 99000, 'ATM'),
('PAY60', 'KH60', 'OD60', NULL, '2023-05-13 10:50:00', 400000, 'MOMO'),
('PAY61', 'KH61', 'OD61', NULL, '2023-05-15 14:20:00', 690000, 'credit_card'),
('PAY62', 'KH62', 'OD62', NULL, '2023-05-17 10:40:00', 600000, 'ATM'),
('PAY63', 'KH63', 'OD63', NULL, '2023-05-19 13:10:00', 720000, 'MOMO'),
('PAY64', 'KH64', 'OD64', NULL, '2023-05-21 15:45:00', 1150000, 'credit_card'),
('PAY65', 'KH65', 'OD65', NULL, '2023-05-23 11:30:00', 120000, 'ATM'),
('PAY66', 'KH66', 'OD66', NULL, '2023-05-25 14:50:00', 320000, 'MOMO'),
('PAY67', 'KH67', NULL, 'SUB06', '2023-05-27 12:15:00', 400000, 'credit_card'),
('PAY68', 'KH68', 'OD68', NULL, '2023-05-29 16:00:00', 670000, 'ATM'),
('PAY69', 'KH69', 'OD69', NULL, '2023-05-31 09:40:00', 1200000, 'MOMO'),
('PAY70', 'KH70', 'OD70', NULL, '2023-06-02 14:10:00', 1000000, 'credit_card'),
('PAY71', 'KH71', NULL, 'SUB17', '2023-06-04 11:00:00', 0, 'ATM'),
('PAY72', 'KH72', 'OD72', NULL, '2023-06-06 16:25:00', 600000, 'MOMO'),
('PAY73', 'KH73', 'OD73', NULL, '2023-06-08 12:30:00', 180000, 'credit_card'),
('PAY74', 'KH74', 'OD74', NULL, '2023-06-10 10:05:00', 100000, 'ATM'),
('PAY75', 'KH75', 'OD75', NULL, '2023-06-12 14:00:00', 890000, 'MOMO'),
('PAY76', 'KH76', 'OD76', NULL, '2023-06-14 13:15:00', 330000, 'credit_card'),
('PAY77', 'KH77', 'OD77', NULL, '2023-06-16 15:50:00', 620000, 'ATM'),
('PAY78', 'KH78', 'OD78', NULL, '2023-06-18 09:45:00', 790000, 'MOMO'),
('PAY79', 'KH79', NULL, 'SUB09', '2023-06-20 14:30:00', 1000000, 'credit_card'),
('PAY80', 'KH80', 'OD80', NULL, '2023-06-22 12:10:00', 310000, 'ATM'),
('PAY81', 'KH81', 'OD81', NULL, '2023-06-24 10:40:00', 380000, 'MOMO'),
('PAY82', 'KH82', 'OD82', NULL, '2023-06-26 15:05:00', 1100000, 'credit_card'),
('PAY83', 'KH83', NULL, 'SUB38', '2023-06-28 13:30:00', 390000, 'ATM'),
('PAY84', 'KH84', 'OD84', NULL, '2023-06-30 11:00:00', 749000, 'MOMO'),
('PAY85', 'KH85', 'OD85', NULL, '2023-07-02 16:20:00', 595000, 'credit_card'),
('PAY86', 'KH86', 'OD86', NULL, '2023-07-04 14:15:00', 1050000, 'ATM'),
('PAY87', 'KH87', 'OD87', NULL, '2023-07-06 10:50:00', 180000, 'MOMO'),
('PAY88', 'KH88', NULL, 'SUB28', '2023-07-08 12:40:00', 1400000, 'credit_card'),
('PAY89', 'KH89', 'OD89', NULL, '2023-07-10 15:10:00', 1250000, 'ATM'),
('PAY90', 'KH90', 'OD90', NULL, '2023-07-12 09:30:00', 1590000, 'MOMO'),
('PAY91', 'KH91', 'OD91', NULL, '2023-07-14 14:55:00', 650000, 'credit_card'),
('PAY92', 'KH92', 'OD92', NULL, '2023-07-16 13:20:00', 700000, 'ATM'),
('PAY93', 'KH93', NULL, 'SUB29', '2023-07-18 11:45:00', 390000, 'MOMO'),
('PAY94', 'KH94', 'OD94', NULL, '2023-07-20 16:00:00', 99000, 'credit_card'),
('PAY95', 'KH95', 'OD95', NULL, '2023-07-22 10:30:00', 1180000, 'ATM'),
('PAY96', 'KH96', 'OD96', NULL, '2023-07-24 14:00:00', 950000, 'MOMO'),
('PAY97', 'KH97', 'OD97', NULL, '2023-07-26 12:20:00', 660000, 'credit_card'),
('PAY98', 'KH98', 'OD98', NULL, '2023-07-28 15:45:00', 160000, 'ATM'),
('PAY99', 'KH99', 'OD99', NULL, '2023-07-30 13:10:00', 150000, 'MOMO'),
('PAY100', 'KH100', NULL, 'SUB10', '2023-08-01 11:35:00', 800000, 'credit_card');
-- 9.DATA DISCOUNT table
INSERT INTO DISCOUNT (DiscountID, GameID, ServiceID, Value, ValidFrom, ValidTo) VALUES
('DT1', 'GA01', NULL, '0.60', '2023-06-01 00:00:00', '2023-06-30 23:59:59'),
('DT2', NULL, 'AD', '0.20', '2023-06-05 00:00:00', '2023-07-05 23:59:59'),
('DT3', 'GA03', NULL, '0.60', '2023-06-10 00:00:00', '2023-07-10 23:59:59'),
('DT4', NULL, 'SU', '0.05', '2023-06-15 00:00:00', '2023-07-15 23:59:59'),
('DT5', 'GA05', NULL, '0.05', '2023-06-20 00:00:00', '2023-07-20 23:59:59'),
('DT6', NULL, 'AST', '0.70', '2023-06-25 00:00:00', '2023-07-25 23:59:59'),
('DT7', 'GA07', NULL, '0.20', '2023-06-01 00:00:00', '2023-06-30 23:59:59'),
('DT8', NULL, 'AD', '0.30', '2023-07-01 00:00:00', '2023-07-31 23:59:59'),
('DT9', 'GA09', NULL, '0.20', '2023-07-05 00:00:00', '2023-08-05 23:59:59'),
('DT10', NULL, 'SU', '0.50', '2023-07-10 00:00:00', '2023-08-10 23:59:59'),
('DT11', 'GA11', NULL, '0.10', '2023-07-15 00:00:00', '2023-08-15 23:59:59'),
('DT12', NULL, 'AST', '0.05', '2023-07-20 00:00:00', '2023-08-20 23:59:59'),
('DT13', 'GA13', NULL, '0.15', '2023-08-01 00:00:00', '2023-08-31 23:59:59'),
('DT14', NULL, 'AD', '0.25', '2023-08-05 00:00:00', '2023-08-31 23:59:59'),
('DT15', 'GA15', NULL, '0.30', '2023-08-10 00:00:00', '2023-08-31 23:59:59'),
('DT16', NULL, 'SU', '0.20', '2023-08-15 00:00:00', '2023-08-31 23:59:59'),
('DT17', 'GA17', NULL, '0.10', '2023-08-20 00:00:00', '2023-08-31 23:59:59'),
('DT18', NULL, 'AST', '0.40', '2023-08-25 00:00:00', '2023-08-31 23:59:59'),
('DT19', 'GA19', NULL, '0.35', '2023-09-01 00:00:00', '2023-09-30 23:59:59'),
('DT20', NULL, 'AD', '0.50', '2023-09-05 00:00:00', '2023-09-30 23:59:59'),
('DT21', 'GA21', NULL, '0.15', '2023-09-10 00:00:00', '2023-09-30 23:59:59'),
('DT22', NULL, 'SU', '0.25', '2023-09-15 00:00:00', '2023-09-30 23:59:59'),
('DT23', 'GA23', NULL, '0.20', '2023-09-20 00:00:00', '2023-09-30 23:59:59'),
('DT24', NULL, 'AST', '0.30', '2023-09-25 00:00:00', '2023-09-30 23:59:59'),
('DT25', 'GA25', NULL, '0.10', '2023-10-01 00:00:00', '2023-10-31 23:59:59'),
('DT26', NULL, 'AD', '0.15', '2023-10-05 00:00:00', '2023-10-31 23:59:59'),
('DT27', 'GA27', NULL, '0.25', '2023-10-10 00:00:00', '2023-10-31 23:59:59'),
('DT28', NULL, 'SU', '0.20', '2023-10-15 00:00:00', '2023-10-31 23:59:59'),
('DT29', 'GA29', NULL, '0.30', '2023-10-20 00:00:00', '2023-10-31 23:59:59'),
('DT30', NULL, 'AST', '0.40', '2023-10-25 00:00:00', '2023-10-31 23:59:59'),
('DT31', 'GA31', NULL, '0.35', '2023-11-01 00:00:00', '2023-11-30 23:59:59'),
('DT32', NULL, 'AD', '0.50', '2023-11-05 00:00:00', '2023-11-30 23:59:59'),
('DT33', 'GA33', NULL, '0.15', '2023-11-10 00:00:00', '2023-11-30 23:59:59'),
('DT34', NULL, 'SU', '0.25', '2023-11-15 00:00:00', '2023-11-30 23:59:59'),
('DT35', 'GA35', NULL, '0.20', '2023-11-20 00:00:00', '2023-11-30 23:59:59'),
('DT36', NULL, 'AST', '0.30', '2023-11-25 00:00:00', '2023-11-30 23:59:59'),
('DT37', 'GA37', NULL, '0.10', '2023-12-01 00:00:00', '2023-12-31 23:59:59'),
('DT38', NULL, 'AD', '0.15', '2023-12-05 00:00:00', '2023-12-31 23:59:59'),
('DT39', 'GA39', NULL, '0.25', '2023-12-10 00:00:00', '2023-12-31 23:59:59'),
('DT40', NULL, 'SU', '0.20', '2023-12-15 00:00:00', '2023-12-31 23:59:59'),
('DT41', 'GA41', NULL, '0.30', '2023-12-20 00:00:00', '2023-12-31 23:59:59'),
('DT42', NULL, 'AST', '0.40', '2023-12-25 00:00:00', '2023-12-31 23:59:59'),
('DT43', 'GA43', NULL, '0.35', '2024-01-01 00:00:00', '2026-01-01 23:59:59'),
('DT44', NULL, 'AD', '0.50', '2024-01-05 00:00:00', '2026-01-01 23:59:59'),
('DT45', 'GA45', NULL, '0.15', '2024-01-10 00:00:00', '2026-01-01 23:59:59'),
('DT46', NULL, 'SU', '0.25', '2024-01-15 00:00:00', '2026-01-01 23:59:59'),
('DT47', 'GA47', NULL, '0.20', '2024-01-20 00:00:00', '2026-01-01 23:59:59'),
('DT48', NULL, 'AST', '0.30', '2024-01-25 00:00:00', '2026-01-01 23:59:59'),
('DT49', 'GA49', NULL, '0.10', '2024-02-01 00:00:00', '2026-01-01 23:59:59'),
('DT50', NULL, 'AD', '0.15', '2024-02-05 00:00:00', '2026-01-01 23:59:59'),
('DT51', 'GA51', NULL, '0.25', '2024-02-10 00:00:00', '2026-01-01 23:59:59'),
('DT52', NULL, 'SU', '0.20', '2024-02-15 00:00:00', '2026-01-01 23:59:59'),
('DT53', 'GA53', NULL, '0.30', '2024-02-20 00:00:00', '2026-01-01 23:59:59'),
('DT54', NULL, 'AST', '0.40', '2024-02-25 00:00:00', '2026-01-01 23:59:59'),
('DT55', 'GA55', NULL, '0.35', '2024-03-01 00:00:00', '2026-01-01 23:59:59'),
('DT56', NULL, 'AD', '0.50', '2024-03-05 00:00:00', '2026-01-01 23:59:59'),
('DT57', 'GA57', NULL, '0.15', '2024-03-10 00:00:00', '2026-01-01 23:59:59'),
('DT58', NULL, 'SU', '0.25', '2024-03-15 00:00:00', '2026-01-01 23:59:59'),
('DT59', 'GA59', NULL, '0.20', '2024-03-20 00:00:00', '2026-01-01 23:59:59'),
('DT60', NULL, 'AST', '0.30', '2024-03-25 00:00:00', '2026-01-01 23:59:59'),
('DT61', 'GA61', NULL, '0.10', '2024-04-01 00:00:00', '2026-01-01 23:59:59'),
('DT62', NULL, 'AD', '0.15', '2024-04-05 00:00:00', '2026-01-01 23:59:59'),
('DT63', 'GA63', NULL, '0.25', '2024-04-10 00:00:00', '2026-01-01 23:59:59'),
('DT64', NULL, 'SU', '0.20', '2024-04-15 00:00:00', '2026-01-01 23:59:59'),
('DT65', 'GA65', NULL, '0.30', '2024-04-20 00:00:00', '2026-01-01 23:59:59'),
('DT66', NULL, 'AST', '0.40', '2024-04-25 00:00:00', '2026-01-01 23:59:59'),
('DT67', 'GA67', NULL, '0.35', '2024-05-01 00:00:00', '2026-01-01 23:59:59'),
('DT68', NULL, 'AD', '0.50', '2024-05-05 00:00:00', '2026-01-01 23:59:59'),
('DT69', 'GA69', NULL, '0.15', '2024-05-10 00:00:00', '2026-01-01 23:59:59'),
('DT70', NULL, 'SU', '0.25', '2024-05-15 00:00:00', '2026-01-01 23:59:59'),
('DT71', 'GA71', NULL, '0.20', '2024-05-20 00:00:00', '2026-01-01 23:59:59'),
('DT72', NULL, 'AST', '0.30', '2024-05-25 00:00:00', '2026-01-01 23:59:59'),
('DT73', 'GA73', NULL, '0.10', '2024-06-01 00:00:00', '2026-01-01 23:59:59'),
('DT74', NULL, 'AD', '0.15', '2024-06-05 00:00:00', '2026-01-01 23:59:59'),
('DT75', 'GA75', NULL, '0.25', '2024-06-10 00:00:00', '2026-01-01 23:59:59'),
('DT76', NULL, 'SU', '0.20', '2024-06-15 00:00:00', '2026-01-01 23:59:59'),
('DT77', 'GA77', NULL, '0.30', '2024-06-20 00:00:00', '2026-01-01 23:59:59'),
('DT78', NULL, 'AST', '0.40', '2024-06-25 00:00:00', '2026-01-01 23:59:59'),
('DT79', 'GA79', NULL, '0.35', '2024-07-01 00:00:00', '2026-01-01 23:59:59'),
('DT80', NULL, 'AD', '0.50', '2024-07-05 00:00:00', '2026-01-01 23:59:59'),
('DT81', 'GA81', NULL, '0.15', '2024-07-10 00:00:00', '2026-01-01 23:59:59'),
('DT82', NULL, 'SU', '0.25', '2024-07-15 00:00:00', '2026-01-01 23:59:59'),
('DT83', 'GA83', NULL, '0.20', '2024-07-20 00:00:00', '2026-01-01 23:59:59'),
('DT84', NULL, 'AST', '0.30', '2024-07-25 00:00:00', '2026-01-01 23:59:59'),
('DT85', 'GA85', NULL, '0.10', '2024-08-01 00:00:00', '2026-01-01 23:59:59'),
('DT86', NULL, 'AD', '0.15', '2024-08-05 00:00:00', '2026-01-01 23:59:59'),
('DT87', 'GA87', NULL, '0.25', '2024-08-10 00:00:00', '2026-01-01 23:59:59'),
('DT88', NULL, 'SU', '0.20', '2024-08-15 00:00:00', '2026-01-01 23:59:59'),
('DT89', 'GA89', NULL, '0.30', '2024-08-20 00:00:00', '2026-01-01 23:59:59'),
('DT90', NULL, 'AST', '0.40', '2024-08-25 00:00:00', '2026-01-01 23:59:59'),
('DT91', 'GA91', NULL, '0.35', '2024-09-01 00:00:00', '2026-01-01 23:59:59'),
('DT92', NULL, 'AD', '0.50', '2024-09-05 00:00:00', '2026-01-01 23:59:59'),
('DT93', 'GA93', NULL, '0.15', '2024-09-10 00:00:00', '2026-01-01 23:59:59')
-- 10.DATA LICENSE KEY table
INSERT INTO LICENSEKEY (KeyID, GameID, KeyCode, Status) VALUES
('KEY1', 'GA01', 'A1B2C3D4E5F6', 'Unused'),
('KEY2', 'GA02', 'G7H8I9J0K1L2', 'Used'),
('KEY3', 'GA03', 'M3N4O5P6Q7R8', 'Unused'),
('KEY4', 'GA04', 'S9T0U1V2W3X4', 'Used'),
('KEY5', 'GA05', 'Y5Z6A7B8C9D0', 'Unused'),
('KEY6', 'GA06', 'E1F2G3H4I5J6', 'Used'),
('KEY7', 'GA07', 'K7L8M9N0O1P2', 'Unused'),
('KEY8', 'GA08', 'Q3R4S5T6U7V8', 'Used'),
('KEY9', 'GA09', 'W9X0Y1Z2A3B4', 'Unused'),
('KEY10', 'GA10', 'O7P8Q9R0S1T2', 'Used'),
('KEY11', 'GA11', 'I1J2K3L4M5N6', 'Unused'),
('KEY12', 'GA12', 'O7P8Q9R0S1T2', 'Used'),
('KEY13', 'GA13', 'A3B4C5D6E7F8', 'Unused'),
('KEY14', 'GA14', 'G1H2I3J4K5L6', 'Used'),
('KEY15', 'GA15', 'M9N0O1P2Q3R4', 'Unused'),
('KEY16', 'GA16', 'S5T6U7V8W9X0', 'Used'),
('KEY17', 'GA17', 'Y1Z2A3B4C5D6', 'Unused'),
('KEY18', 'GA18', 'E7F8G9H0I1J2', 'Used'),
('KEY19', 'GA19', 'K3L4M5N6O7P8', 'Unused'),
('KEY20', 'GA20', 'Q9R0S1T2U3V4', 'Used'),
('KEY21', 'GA21', 'A5B6C7D8E9F0', 'Unused'),
('KEY22', 'GA22', 'G2H3I4J5K6L7', 'Used'),
('KEY23', 'GA23', 'M8N9O0P1Q2R3', 'Unused'),
('KEY24', 'GA24', 'S4T5U6V7W8X9', 'Used'),
('KEY25', 'GA25', 'Y0Z1A2B3C4D5', 'Unused'),
('KEY26', 'GA26', 'E6F7G8H9I0J1', 'Used'),
('KEY27', 'GA27', 'K2L3M4N5O6P7', 'Unused'),
('KEY28', 'GA28', 'Q8R9S0T1U2V3', 'Used'),
('KEY29', 'GA29', 'A4B5C6D7E8F9', 'Unused'),
('KEY30', 'GA30', 'G0H1I2J3K4L5', 'Used'),
('KEY31', 'GA31', 'M6N7O8P9Q0R1', 'Unused'),
('KEY32', 'GA32', 'S2T3U4V5W6X7', 'Used'),
('KEY33', 'GA33', 'Y8Z9A0B1C2D3', 'Unused'),
('KEY34', 'GA34', 'E4F5G6H7I8J9', 'Used'),
('KEY35', 'GA35', 'K0L1M2N3O4P5', 'Unused'),
('KEY36', 'GA36', 'Q6R7S8T9U0V1', 'Used'),
('KEY37', 'GA37', 'A2B3C4D5E6F7', 'Unused'),
('KEY38', 'GA38', 'G8H9I0J1K2L3', 'Used'),
('KEY39', 'GA39', 'M4N5O6P7Q8R9', 'Unused'),
('KEY40', 'GA40', 'S0T1U2V3W4X5', 'Used');

-- III.ADD FOREIGN KEY
-- Bảng GameGenre: GameID & GenreID là FK
ALTER TABLE GameGenre
ADD CONSTRAINT FK_GameGenre_Game FOREIGN KEY (GameID) REFERENCES GAME(GameID),
    CONSTRAINT FK_GameGenre_Genre FOREIGN KEY (GenreID) REFERENCES GENRE(GenreID);

-- Bảng SUBSCRIPTION: CustomerID & ServiceID là FK
ALTER TABLE SUBSCRIPTION
ADD CONSTRAINT FK_Subscription_Customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT FK_Subscription_Service FOREIGN KEY (ServiceID) REFERENCES SERVICE(ServiceID);

-- Bảng OrderTable: CustomerID & GameID là FK
ALTER TABLE OrderTable
ADD CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT FK_Order_Game FOREIGN KEY (GameID) REFERENCES GAME(GameID);

-- Bảng PAYMENT: CustomerID, OrderID, SubscriptionID là FK
ALTER TABLE PAYMENT
ADD CONSTRAINT FK_Payment_Customer FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT FK_Payment_Order FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID),
	CONSTRAINT FK_Payment_Subscription FOREIGN KEY (SubscriptionID) REFERENCES SUBSCRIPTION(SubscriptionID);

-- Bảng DISCOUNT: GameID & ServiceID là FK (nullable)
ALTER TABLE DISCOUNT
ADD CONSTRAINT FK_Discount_Game FOREIGN KEY (GameID) REFERENCES GAME(GameID),
    CONSTRAINT FK_Discount_Service FOREIGN KEY (ServiceID) REFERENCES SERVICE(ServiceID);

-- Bảng LICENSEKEY: GameID là FK
ALTER TABLE LICENSEKEY
ADD CONSTRAINT FK_LicenseKey_Game FOREIGN KEY (GameID) REFERENCES GAME(GameID);


-- IV.FUNTION - QUERY

-- Chức năng 1: Quản trị viên lưu trữ, xem, thêm, xóa, sửa dữ liệu
-- Thêm dữ liệu game 
GO
CREATE PROCEDURE SP_InsertGame
    @GameID VARCHAR(20), @GameName NVARCHAR(100), @ReleaseDate DATE,
    @PublisherName NVARCHAR(100), @DeveloperName NVARCHAR(100),
    @Price INT, @AgeRating VARCHAR(5)
AS
BEGIN
    INSERT INTO GAME VALUES (@GameID, @GameName, @ReleaseDate, @PublisherName, @DeveloperName, @Price, @AgeRating)
END
EXEC SP_InsertGame @GameID='GA101',@GameName='FREE FIRE', @ReleaseDate='2018-09-12', 
					@PublisherName='RedTeam', @DeveloperName='GARENA', @Price='0', @AgeRating='12+'

select * from GAME where GameName like '%FREE%'
-- Cập nhật giá dịch vụ 
GO
CREATE PROCEDURE SP_UpdateServicePrice
    @ServiceID VARCHAR(20), @NewPrice INT
AS
BEGIN
    UPDATE SERVICE SET Price = @NewPrice WHERE ServiceID = @ServiceID
END
EXEC SP_UpdateServicePrice @ServiceID='SU', @NewPrice = 70000

select * from SERVICE where ServiceID='SU'
-- Cập nhật giá game
GO
CREATE PROCEDURE SP_UpdateGamePrice
    @GameID VARCHAR(20),
    @NewPrice INT
AS
BEGIN
    UPDATE GAME
    SET Price = @NewPrice
    WHERE GameID = @GameID
END
EXEC SP_UpdateGamePrice @GameID=GA06, @NewPrice=550000

select * from GAME where GameID='GA06'
-- xóa game, dịch vụ, đơn hàng
GO
CREATE PROCEDURE SP_DeleteGame
    @GameID VARCHAR(20)
AS
BEGIN
    DELETE FROM GAME WHERE GameID = @GameID
END
EXEC SP_DeleteGame @GameID='GA101'

select * from GAME where GameID='GA101'

-- Chức năng 2: Khách hàng tìm kiếm các sản phẩm - Game (dựa theo từ khóa, thể loại ) 
-- Tìm kiếm trò chơi điện tử theo tên, thể loại, khoảng giá
GO
CREATE PROCEDURE SP_FindGames
    @GameKeyword NVARCHAR(100) = NULL,
    @GenreKeyword NVARCHAR(100) = NULL,
    @MinPrice INT = NULL,
    @MaxPrice INT = NULL
AS
BEGIN
    SELECT G.GameID, G.GameName, G.ReleaseDate, G.PublisherName, G.DeveloperName, G.Price, G.AgeRating
    FROM GAME G
    LEFT JOIN GameGenre GG ON G.GameID = GG.GameID
    LEFT JOIN GENRE GE ON GG.GenreID = GE.GenreID
    WHERE (G.GameName LIKE '%' + @GameKeyword + '%' OR @GameKeyword IS NULL)
      AND (GE.GenreName LIKE '%' + @GenreKeyword + '%' OR @GenreKeyword IS NULL)
      AND (G.Price >= @MinPrice OR @MinPrice IS NULL)
      AND (G.Price <= @MaxPrice OR @MaxPrice IS NULL)
    GROUP BY G.GameID, G.GameName, G.ReleaseDate, G.PublisherName, G.DeveloperName, G.Price, G.AgeRating;
END;
EXEC SP_FindGames @GameKeyword = 'Mine'
EXEC sp_FindGames @GenreKeyword = 'Act'
EXEC SP_FindGames @MinPrice=100000, @MaxPrice=1000000
-- Liệt kê các game theo độ tuổi phù hợp
GO
CREATE PROCEDURE SP_GetGamesByAgeRating
    @Age INT
AS
BEGIN
    SELECT 
        G.GameName,
        G.AgeRating,
        G.Price
    FROM GAME G
    WHERE 
        CASE 
            WHEN G.AgeRating = '3+' THEN 3
            WHEN G.AgeRating = '7+' THEN 7
            WHEN G.AgeRating = '12+' THEN 12
            WHEN G.AgeRating = '16+' THEN 16
            WHEN G.AgeRating = '18+' THEN 18
            ELSE 0
        END <= @Age
END
EXEC SP_GetGamesByAgeRating @Age=15
-- Tìm các game có giảm giá 
GO
CREATE PROCEDURE sp_FindGamesWithDiscount
    @GameKeyword NVARCHAR(100) = NULL,
    @GenreKeyword NVARCHAR(100) = NULL
AS
BEGIN
    SELECT 
        G.GameID, 
        G.GameName, 
        G.ReleaseDate, 
        G.PublisherName, 
        G.DeveloperName, 
        G.Price AS OriginalPrice,
        COALESCE(G.Price * (1 - D.Value), G.Price) AS DiscountedPrice,
        G.AgeRating
    FROM GAME G
    LEFT JOIN GameGenre GG ON G.GameID = GG.GameID
    LEFT JOIN GENRE GE ON GG.GenreID = GE.GenreID
    LEFT JOIN DISCOUNT D ON G.GameID = D.GameID 
        AND D.ValidFrom <= GETDATE() 
        AND (D.ValidTo IS NULL OR D.ValidTo >= GETDATE())
    WHERE (G.GameName LIKE '%' + @GameKeyword + '%' OR @GameKeyword IS NULL)
      AND (GE.GenreName LIKE '%' + @GenreKeyword + '%' OR @GenreKeyword IS NULL)
    GROUP BY 
        G.GameID, 
        G.GameName, 
        G.ReleaseDate, 
        G.PublisherName, 
        G.DeveloperName, 
        G.Price, 
        D.Value,
        G.AgeRating;
END;
EXEC SP_FindGamesWithDiscount @GameKeyword='GRAND'
EXEC SP_FindGamesWithDiscount @GameKeyword = 'Total War: WARHAMMER III';

-- Chức năng 3: Khách hàng đặt mua sản phẩm
-- Đặt hàng một trò chơi 
GO
CREATE PROCEDURE SP_PlaceGameOrder
    @OrderID VARCHAR(20),
    @CustomerID VARCHAR(20),
    @GameID VARCHAR(20)
AS
BEGIN
    DECLARE @BasePrice INT;
    DECLARE @DiscountRate DECIMAL(5,4);
    DECLARE @FinalPrice INT;

    -- Lấy giá gốc
    SELECT @BasePrice = Price FROM GAME WHERE GameID = @GameID;

    -- Lấy giảm giá (nếu có) và kiểm tra hạn dùng
    SELECT TOP 1 @DiscountRate = Value 
    FROM DISCOUNT 
    WHERE GameID = @GameID 
      AND ValidFrom <= GETDATE() 
      AND (ValidTo IS NULL OR ValidTo >= GETDATE());

    -- Tính giá sau giảm (giá INT làm tròn xuống)
    SET @FinalPrice = 
        CASE 
            WHEN @DiscountRate IS NOT NULL THEN CAST(@BasePrice * (1 - @DiscountRate) AS INT)
            ELSE @BasePrice
        END;

    -- Thêm đơn hàng
    INSERT INTO OrderTable (OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus)
    VALUES (@OrderID, @CustomerID, @GameID, @FinalPrice, GETDATE(), 'pending');
END;

EXEC SP_PlaceGameOrder   @OrderID ='OD101',
    @CustomerID ='KH12',
    @GameID ='GA05'

select * from OrderTable where CustomerID='KH12'

--Cấp License Key cho khách hàng khi đơn hàng được thanh toán
GO
CREATE PROCEDURE SP_AssignLicenseKeyToOrder
    @OrderID VARCHAR(20)
AS
BEGIN
    DECLARE @GameID VARCHAR(20);
    DECLARE @AssignedKey VARCHAR(255);

    -- Lấy GameID của đơn hàng
    SELECT @GameID = GameID
    FROM OrderTable
    WHERE OrderID = @OrderID;

    -- Kiểm tra trạng thái đơn hàng đã thanh toán chưa
    IF EXISTS (
        SELECT 1 FROM OrderTable 
        WHERE OrderID = @OrderID AND PaymentStatus = 'completed'
    )
    BEGIN
        -- Lấy LicenseKey chưa dùng cho game này
        SELECT TOP 1 @AssignedKey = KeyCode 
        FROM LICENSEKEY 
        WHERE GameID = @GameID AND Status = 'unused';

        -- Nếu có License thì đánh dấu đã cấp
        IF @AssignedKey IS NOT NULL
        BEGIN
            UPDATE LICENSEKEY
            SET Status = 'used'
            WHERE KeyCode = @AssignedKey;

            PRINT 'License key cấp cho đơn hàng: ' + @AssignedKey;
        END
        ELSE
        BEGIN
            PRINT 'Không còn LicenseKey khả dụng cho Game này.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Đơn hàng chưa thanh toán.';
    END
END;
 
EXEC SP_AssignLicenseKeyToOrder @OrderID = 'OD101'
Exec SP_AssignLicenseKeyToOrder @OrderID = 'OD14'

-- Chức năng 4: Khách hàng tìm kiếm các gói dịch vụ 
--– lọc theo giá/ tìm theo từ khóa tên dịch vụ/xem cấu hình
GO
CREATE PROCEDURE SP_FindServices
    @ServiceName NVARCHAR(100) = NULL,
    @MinPrice INT = NULL,
    @MaxPrice INT = NULL,
    @CPU NVARCHAR(50) = NULL,
    @VGA NVARCHAR(50) = NULL,
    @RAM NVARCHAR(50) = NULL,
    @SSD NVARCHAR(50) = NULL
AS
BEGIN
    SELECT 
        S.ServiceID, 
        S.ServiceName, 
        S.CPU, 
        S.VGA, 
        S.RAM, 
        S.SSD, 
        S.Price, 
        S.MaxUses
    FROM SERVICE S
    WHERE (S.ServiceName LIKE '%' + @ServiceName + '%' OR @ServiceName IS NULL)
      AND (S.Price >= @MinPrice OR @MinPrice IS NULL)
      AND (S.Price <= @MaxPrice OR @MaxPrice IS NULL)
      AND (S.CPU LIKE '%' + @CPU + '%' OR @CPU IS NULL)
      AND (S.VGA LIKE '%' + @VGA + '%' OR @VGA IS NULL)
      AND (S.RAM LIKE '%' + @RAM + '%' OR @RAM IS NULL)
      AND (S.SSD LIKE '%' + @SSD + '%' OR @SSD IS NULL)
    ORDER BY S.ServiceID; -- Sắp xếp theo ServiceID
END;
EXEC SP_FindServices @ServiceName = 'SuP'
EXEC SP_FindServices @MinPrice = 10000, @MaxPrice = 80000
EXEC SP_FindServices @CPU = 'i5'

-- Tìm kiếm dịch vụ máy ảo đang được giảm giá
GO
CREATE PROCEDURE sp_FindDiscountedServices
    @ServiceName NVARCHAR(100) = NULL
AS
BEGIN
    SELECT 
        S.ServiceID, 
        S.ServiceName, 
        S.CPU, 
        S.VGA, 
        S.RAM, 
        S.SSD, 
        S.Price AS OriginalPrice,
        D.Value AS DiscountValue,
        COALESCE(S.Price * (1 - D.Value), S.Price) AS DiscountedPrice,
        S.MaxUses
    FROM SERVICE S
    JOIN DISCOUNT D ON S.ServiceID = D.ServiceID 
        AND D.ValidFrom <= GETDATE() 
        AND (D.ValidTo IS NULL OR D.ValidTo >= GETDATE())
    WHERE (S.ServiceName LIKE '%' + @ServiceName + '%' OR @ServiceName IS NULL)
    ORDER BY S.ServiceID; -- Sắp xếp theo ServiceID
END;

EXEC sp_FindDiscountedServices @ServiceName = 'SUPER'

--Chức năng 5: Khách hàng đăng ký gói dịch vụ 
--tạo bảng đăng ký
GO
CREATE PROCEDURE SP_SubscribeService
    @CustomerID VARCHAR(20),
    @ServiceID VARCHAR(20),
    @EndDate DATETIME
AS
BEGIN
    DECLARE @CurrentUses INT;
    DECLARE @MaxUses INT;
    DECLARE @SubID VARCHAR(20);
    DECLARE @LastNumber INT;

    -- Lấy số lớn nhất phía sau 'SUB'
    SELECT @LastNumber = MAX(CAST(RIGHT(SubscriptionID, LEN(SubscriptionID) - 3) AS INT))
    FROM SUBSCRIPTION
    WHERE ISNUMERIC(RIGHT(SubscriptionID, LEN(SubscriptionID) - 3)) = 1;

    IF @LastNumber IS NULL
        SET @LastNumber = 0;

    SET @SubID = 'SUB' + CAST(@LastNumber + 1 AS VARCHAR);

    -- Đếm số người dùng đang active
    SELECT @CurrentUses = COUNT(*)
    FROM SUBSCRIPTION 
    WHERE ServiceID = @ServiceID AND Status = 'active';

    -- Lấy max slot
    SELECT @MaxUses = MaxUses FROM SERVICE WHERE ServiceID = @ServiceID;

    IF @CurrentUses >= @MaxUses
    BEGIN
        RAISERROR('Rất tiếc, hết slot cho bạn rồi.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1 FROM SUBSCRIPTION 
        WHERE CustomerID = @CustomerID AND ServiceID = @ServiceID AND Status = 'active'
    )
    BEGIN
        RAISERROR('Rất tiếc, tạm thời không đăng ký được.', 16, 1);
        RETURN;
    END

    -- Thêm subscription với ID mới
    INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status)
    VALUES (@SubID, @CustomerID, @ServiceID, GETDATE(), @EndDate, 'active');
END;
EXEC SP_SubscribeService 
	 @CustomerID = 'KH15', 
    @ServiceID = 'AST', 
    @EndDate = '2025-06-01 23:00:00.000';
select * from SUBSCRIPTION where CustomerID='KH15'

-- Chức năng 6: Xem lịch sử hóa đơn, giao dịch và các dịch vụ đã đăng ký của khách hàng
-- xem lịch sử đơn hàng
GO
CREATE PROCEDURE SP_GetCustomerOrders
    @CustomerID VARCHAR(20)
AS
BEGIN
    SELECT 
        O.OrderID,
        G.GameName,
        O.Price,
        O.OrderDate,
        O.PaymentStatus
    FROM OrderTable O
    JOIN GAME G ON O.GameID = G.GameID
    WHERE O.CustomerID = @CustomerID
    ORDER BY O.OrderDate DESC
END

EXEC SP_GetCustomerOrders @CustomerID = 'KH55'

-- xem lịch sử đăng ký dịch vụ
GO
CREATE PROCEDURE SP_GetCustomerSubscriptions
    @CustomerID VARCHAR(20)
AS
BEGIN
    SELECT 
        S.SubscriptionID,
        SV.ServiceName,
        SV.CPU, SV.RAM, SV.VGA, SV.SSD,
        S.StartDate,
        S.EndDate,
        S.Status
    FROM SUBSCRIPTION S
    JOIN SERVICE SV ON S.ServiceID = SV.ServiceID
    WHERE S.CustomerID = @CustomerID
    ORDER BY S.StartDate DESC
END

EXEC SP_GetCustomerSubscriptions @CustomerID = 'KH15'
--xem hóa đơn thanh toán
GO
CREATE PROCEDURE SP_GetCustomerPayments
    @CustomerID VARCHAR(20)
AS
BEGIN
    SELECT 
        P.PaymentID,
        P.PaymentDate,
        ISNULL(P.OrderID, '') AS OrderID,
        ISNULL(P.SubscriptionID, '') AS SubscriptionID,
        P.Amount,
        P.PaymentMethod
    FROM PAYMENT P
    WHERE P.CustomerID = @CustomerID
    ORDER BY P.PaymentDate DESC
END

EXEC SP_GetCustomerPayments @CustomerID = 'KH35'
EXEC SP_GetCustomerPayments @CustomerID = 'KH25'
EXEC SP_GetCustomerPayments @CustomerID = 'KH15'
-- Chức năng 7: Báo cáo doanh thu, sản phẩm bán chạy, dịch vụ được ưa chuộng
-- Báo cáo tổng doanh thu
    SELECT 
        SUM(CASE WHEN OrderID IS NOT NULL THEN Amount ELSE 0 END) AS RevenueFromGameSales,
        SUM(CASE WHEN SubscriptionID IS NOT NULL THEN Amount ELSE 0 END) AS RevenueFromSubscriptions,
        SUM(Amount) AS TotalRevenue
    FROM PAYMENT
-- Doanh thu theo từng trò chơi
    SELECT 
        G.GameID,
        G.GameName,
        COUNT(O.OrderID) AS TotalOrders,
        SUM(P.Amount) AS TotalRevenue
    FROM GAME G
    INNER JOIN OrderTable O ON G.GameID = O.GameID
    INNER JOIN PAYMENT P ON O.OrderID = P.OrderID
    GROUP BY G.GameID, G.GameName
-- Doanh thu theo khoảng thời gian
GO
CREATE PROCEDURE SP_Report_TotalRevenue_ByDate
    @FromDate DATETIME,
    @ToDate DATETIME
AS
BEGIN
    SELECT 
        SUM(Amount) AS TotalRevenue,
        COUNT(PaymentID) AS TotalTransactions
    FROM PAYMENT
    WHERE PaymentDate BETWEEN @FromDate AND @ToDate
END
EXEC SP_Report_TotalRevenue_ByDate @FromDate = '2023-01-01', @ToDate = '2025-05-31'

-- Top 5 khách hàng chi tiêu nhiều nhất
    SELECT  top 5
        C.CustomerID,
        C.Name,
        SUM(P.Amount) AS TotalSpent
    FROM CUSTOMER C
    INNER JOIN PAYMENT P ON C.CustomerID = P.CustomerID
    GROUP BY C.CustomerID, C.Name
    ORDER BY TotalSpent DESC
-- Top N trò chơi bán chạy nhất
GO
CREATE PROCEDURE SP_Report_TopSellingGames
    @TopN INT = 10
AS
BEGIN
    SELECT TOP (@TopN)
        G.GameID,
        G.GameName,
        COUNT(O.OrderID) AS TotalOrders,
        SUM(P.Amount) AS TotalRevenue
    FROM GAME G
    INNER JOIN OrderTable O ON G.GameID = O.GameID
    INNER JOIN PAYMENT P ON O.OrderID = P.OrderID
    GROUP BY G.GameID, G.GameName
    ORDER BY TotalOrders DESC
END
EXEC SP_Report_TopSellingGames
-- top N dịch vụ được thuê nhiều nhất
go
CREATE PROCEDURE SP_Report_TopSubscribedServices
    @TopN INT = 5
AS
BEGIN
    SELECT TOP (@TopN)
        SV.ServiceID,
        SV.ServiceName,
        COUNT(S.SubscriptionID) AS TotalSubscriptions
    FROM SUBSCRIPTION S
    JOIN SERVICE SV ON S.ServiceID = SV.ServiceID
    GROUP BY SV.ServiceID, SV.ServiceName
    ORDER BY TotalSubscriptions DESC
END
EXEC SP_Report_TopSubscribedServices

-- V.TRIGGER
--  1. TR_Customer_Age_Check: Không cho khách dưới 13 tuổi đăng ký
GO
CREATE TRIGGER TR_Customer_Age_Check
ON CUSTOMER
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Age < 13)
    BEGIN
        RAISERROR('Khách hàng phải từ 13 tuổi trở lên.', 16, 1)
        RETURN
    END
    INSERT INTO CUSTOMER
    SELECT * FROM inserted
END
 -- TEST 1
 INSERT INTO CUSTOMER (CustomerID, Name, Gender, Age, Email, Phone, CustomerType)
VALUES ('KH124', 'Test Kid', 'MALE',10,'test@example.com', '1234752436', 'Regular');

-- 2. TR_Order_Validate_Game: Không cho đặt hàng game không tồn tại

GO
CREATE TRIGGER TR_Order_Validate_Game
ON OrderTable
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        WHERE NOT EXISTS (SELECT 1 FROM GAME g WHERE g.GameID = i.GameID)
    )
    BEGIN
        RAISERROR('Game không tồn tại trong hệ thống.', 16, 1)
    END
    ELSE
    BEGIN
        INSERT INTO OrderTable (OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus)
        SELECT OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus
        FROM inserted
    END
END
-- TEST 2
INSERT INTO OrderTable (OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus)
VALUES ('OD999', 'KH01', 'GA9999', 200000, GETDATE(), 'pending');


-- 3. TR_Restrict_Multiple_Subscriptions: Một khách không được đăng ký trùng dịch vụ đang hoạt động
GO
CREATE TRIGGER TR_Restrict_Multiple_Subscriptions
ON SUBSCRIPTION
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN SUBSCRIPTION s ON i.CustomerID = s.CustomerID AND i.ServiceID = s.ServiceID
        WHERE s.Status = 'active'
    )
    BEGIN
        RAISERROR('Khách hàng đã có một đăng ký dịch vụ này đang hoạt động.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status)
VALUES ('SUB999', 'KH01', 'DF', GETDATE(), '2025-12-31', 'active');


-- 4.TR_Payment_Order_Subscription_Check: Một thanh toán chỉ được gắn 1 đơn hàng hoặc 1 đăng ký
GO
CREATE TRIGGER TR_Payment_Order_Subscription_Check
ON PAYMENT
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE OrderID IS NOT NULL AND SubscriptionID IS NOT NULL
    )
    BEGIN
        RAISERROR('Chỉ được thanh toán cho đơn hàng hoặc dịch vụ, không phải cả hai.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO PAYMENT (PaymentID, CustomerID, OrderID, SubscriptionID, PaymentDate, Amount, PaymentMethod)
VALUES ('PAY199', 'KH01', 'OD01', 'SUB01', GETDATE(), 500000, 'credit_card');


-- 5. TR_Discount_Value_Validation: Giá trị giảm giá không vượt quá 99.99%
GO
CREATE TRIGGER TR_Discount_Value_Validation
ON DISCOUNT
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE Value > 0.9999 OR Value <= 0
    )
    BEGIN
        RAISERROR('Giá trị giảm giá phải từ 0.0001 đến 0.9999.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO DISCOUNT (DiscountID, GameID, ServiceID, Value, ValidFrom, ValidTo)
VALUES ('DT999', 'GA01', NULL, 1.2, GETDATE(), '2025-12-31');

--6. TR_Service_Usage_Limit: Không vượt quá MaxUses
GO
CREATE TRIGGER TR_Service_Usage_Limit
ON SUBSCRIPTION
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SERVICE s ON i.ServiceID = s.ServiceID
        WHERE (
            SELECT COUNT(*) FROM SUBSCRIPTION WHERE ServiceID = s.ServiceID AND Status = 'active'
        ) >= s.MaxUses
    )
    BEGIN
        RAISERROR('Số lượng sử dụng dịch vụ vượt quá giới hạn.', 16, 1)
    END
    ELSE
    BEGIN
        INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status)
        SELECT SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status
        FROM inserted
    END
END

INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status)
VALUES ('SUB998', 'KH02', 'DF', GETDATE(), '2025-12-31', 'active');

-- 7. TR_LicenseKey_Assignment: Không cho cấp key đã dùng
GO
CREATE TRIGGER TR_LicenseKey_Assignment
ON LICENSEKEY
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Status <> 'unused')
    BEGIN
        RAISERROR('Không thể tạo key với trạng thái đã sử dụng.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO LICENSEKEY (KeyID, GameID, KeyCode, Status)
VALUES ('KEY999', 'GA01', 'DUMMYKEY999', 'used');

-- 8. TR_Game_Delete_Protect: Không cho xóa game đã có đơn hàng
GO
CREATE TRIGGER TR_Game_Delete_Protect
ON GAME
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d JOIN OrderTable o ON d.GameID = o.GameID
    )
    BEGIN
        RAISERROR('Không thể xóa game đã có đơn hàng.', 16, 1)
        RETURN
    END
    DELETE FROM GAME WHERE GameID IN (SELECT GameID FROM deleted)
END

DELETE FROM GAME WHERE GameID = 'GA01';

--9. TR_Order_Price_Match_Game: Giá đơn hàng phải đúng với giá game trừ discount
GO
CREATE TRIGGER TR_Order_Price_Match_Game
ON OrderTable
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN GAME g ON i.GameID = g.GameID
        LEFT JOIN DISCOUNT d ON g.GameID = d.GameID 
            AND GETDATE() BETWEEN d.ValidFrom AND ISNULL(d.ValidTo, GETDATE())
        WHERE i.Price <> CAST(g.Price * (1 - ISNULL(d.Value, 0)) AS INT)
    )
    BEGIN
        RAISERROR('Giá đơn hàng không khớp với giá gốc sau giảm.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO OrderTable (OrderID, CustomerID, GameID, Price, OrderDate, PaymentStatus)
VALUES ('OD998', 'KH01', 'GA01', 400000, GETDATE(), 'pending');

--10. TR_Subscription_End_After_Start: Ngày kết thúc phải sau ngày bắt đầu
GO
CREATE TRIGGER TR_Subscription_End_After_Start
ON SUBSCRIPTION
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted WHERE EndDate <= StartDate
    )
    BEGIN
        RAISERROR('Ngày kết thúc phải sau ngày bắt đầu.', 16, 1)
        ROLLBACK
    END
END

INSERT INTO SUBSCRIPTION (SubscriptionID, CustomerID, ServiceID, StartDate, EndDate, Status)
VALUES ('SUB997', 'KH42', 'AD', GETDATE(), DATEADD(DAY, -1, GETDATE()), 'active');

-- VI.PHÂN QUYỀN
-- CUSTOMER
USE MASTER
GO
CREATE LOGIN SGS_CUSTOMER
	WITH PASSWORD= 'SGS_CUSTOMER',
	CHECK_EXPIRATION=OFF,
	CHECK_POLICY=OFF
GO

USE SAYGAMESTORE
			GO
			   CREATE USER SGS_CUSTOMER
			   FOR LOGIN SGS_CUSTOMER
			GO

USE SAYGAMESTORE
			GO
			  GRANT SELECT ON GAME TO SGS_CUSTOMER;
				GRANT SELECT ON GENRE TO SGS_CUSTOMER;
				GRANT SELECT ON GameGenre TO SGS_CUSTOMER;
				GRANT SELECT ON DISCOUNT TO SGS_CUSTOMER;
				GRANT SELECT ON SERVICE TO SGS_CUSTOMER;
			GO
-- STAFF 
USE MASTER
GO
CREATE LOGIN SGS_STAFF
	WITH PASSWORD= 'SGS_STAFF',
	CHECK_EXPIRATION=OFF,
	CHECK_POLICY=OFF
GO

USE SAYGAMESTORE
			GO
			   CREATE USER SGS_STAFF
			   FOR LOGIN SGS_STAFF
			GO
USE SAYGAMESTORE
			GO
				GRANT SELECT, INSERT, UPDATE, DELETE ON CUSTOMER TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON GAME TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON GENRE TO SGS_STAFFr;
				GRANT SELECT, INSERT, UPDATE, DELETE ON GameGenre TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON SERVICE TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON SUBSCRIPTION TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON OrderTable TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON PAYMENT TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON DISCOUNT TO SGS_STAFF;
				GRANT SELECT, INSERT, UPDATE, DELETE ON LICENSEKEY TO SGS_STAFF;
			GO
-- ADMIN
USE MASTER
GO
CREATE LOGIN SGS_ADMIN
	WITH PASSWORD= 'SGS_ADMIN',
	CHECK_EXPIRATION=OFF,
	CHECK_POLICY=OFF
GO
USE SAYGAMESTORE
			GO
			   CREATE USER SGS_ADMIN
			   FOR LOGIN SGS_ADMIN
			GO
EXEC sp_addrolemember 'db_owner', 'SGS_ADMIN';
