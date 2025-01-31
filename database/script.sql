USE [master]
GO

CREATE DATABASE [TravelManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 

GO
ALTER DATABASE [TravelManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ANSI_WARNINGS OFF 
GODATABASE [TravelManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TravelManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TravelManagementSystem', N'ON'
GO
ALTER DATABASE [TravelManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [TravelManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TravelManagementSystem]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER 
CREATE TABLE [dbo].[ActivitySchedules](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[day_number] [int] NULL,
	[activity_name] [nvarchar](255) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[location] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[payment_date] [date] NULL,
	[payment_method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 3/17/2024 1:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[user_id] [int] NULL,
	[booking_date] [date] NULL,
	[number_of_people] [int] NULL,
	[total_price] [decimal](18, 2) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](15) NULL,
	[id_card] [nvarchar](255) NULL,
	[booking_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[hotel_name] [nvarchar](255) NULL,
	[location_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelTour](
	[hotel_id] [int] NOT NULL,
	[tour_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC,
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[restaurant_id] [int] IDENTITY(1,1) NOT NULL,
	[restaurant_name] [nvarchar](255) NULL,
	[location_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantTour](
	[restaurant_id] [int] NOT NULL,
	[tour_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurant_id] ASC,
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[content] [nvarchar](max) NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourDates](
	[tour_date_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[current_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourLocation](
	[tour_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[tour_id] [int] IDENTITY(1,1) NOT NULL,
	[tour_name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[tour_price] [decimal](18, 2) NULL,
	[image_url] [nvarchar](max) NULL,
	[employee_id] [int] NULL,
	[start_location] [nvarchar](255) NULL,
	[max_capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourTransportation](
	[tour_id] [int] NOT NULL,
	[transportation_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tour_id] ASC,
	[transportation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportations](
	[transportation_id] [int] IDENTITY(1,1) NOT NULL,
	[transportation_name] [nvarchar](255) NULL,
	[image_url] [nvarchar](max) NULL,
	[departure_time] [time](7) NULL,
	[return_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[transportation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](15) NULL,
	[role] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivitySchedules] ON 

INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (5, 3, 1, N'HO CHI MINH CITY - DA NANG - HUE - DAI NOI - THIEN MU Pagoda Number of meals: 02 (Lunch, dinner)', CAST(N'07:17:00' AS Time), CAST(N'19:17:00' AS Time), N'HO CHI MINH CITY - DA NANG - HUE - DAI NOI - THIEN MU Pagoda ', N'You gather at the Domestic Departure Terminal, Tan Son Nhat airport, Vietravel tour guides assist with check-in procedures for the group to take the flight to Da Nang. At Da Nang airport, the car and tour guide pick up the group to visit Hue:

- Citadel: Ancient royal palace of 13 kings of the Nguyen Dynasty, visit Ngo Mon, Thai Hoa Palace, Forbidden City, The Mieu, Hien Lam Cac, Cuu Dinh, Hue Museum of Royal Antiquities.

- Tu Duc Tomb: A place with charming landscapes and is said to be one of the most beautiful architectural tombs of the Nguyen Dynasty kings

- Thien Mu Pagoda: The pagoda is considered the oldest in Hue and is home to many precious antiques not only historically but also artistically.

Freely stroll the streets of Hue at night, experience a Hue that is not quiet but full of life at the Walking Street along the Perfume River, freely enjoy Hue street dishes such as banh mi, Hue sweet soup, and watch the boats Dragons move up and down beside Toa Kham wharf, echoing Hue''s songs. Explore the vibrant Western Quarter at night with many crowded shops and souvenir shops.


Overnight in Hue.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (6, 3, 2, N'HUE - PHONG NHA CAVE - ECOSTAY Pagoda FLOWER FIELD - QUANG BINH Number of meals: 03 (Breakfast, lunch, dinner)', CAST(N'06:18:00' AS Time), CAST(N'17:18:00' AS Time), N'HUE - PHONG NHA CAVE - ECOSTAY Pagoda FLOWER FIELD - QUANG BINH ', N'Have breakfast at the hotel. You depart early for Quang Binh, the group visits:

- Phong Nha Cave: Located in the Phong Nha - Ke Bang World Natural Heritage complex, considered a fairyland because of the system of limestone mountains and the longest underground river in the world.

- Visit Len Chua Ecostay: visit the garden with a variety of colorful flowers: buckwheat, sunflower, starfish, mustard flower... Walk along the roads, take pictures and look out to see the majestic limestone mountains, the enchanting scenery, the wine cellar preserved in the cave or enjoy various types of refreshing drinks. at the cafe area (at your own expense)

The group had lunch with rustic dishes: grilled chicken, fresh fish, wild vegetables... specialties of the mountains and forests of Phong Nha Ke Bang.

- Nhat Le Beach: Wild and romantic beach with clear blue water and soft sand.

After sightseeing, the group departs for the hotel, checks in and is free to rest and explore Quang Binh at night.


Overnight in Quang Binh.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (8, 3, 3, N'QUANG BINH - LA VANG - DAM LANG AN - DA NANG Number of meals: 03 (Breakfast, lunch, dinner)', CAST(N'12:55:00' AS Time), CAST(N'18:56:00' AS Time), N'QUANG BINH - LA VANG - DAM LANG AN - DA NANG ', N'Breakfast at the hotel. You depart for Da Nang, on the way stopping to visit:

- Quang Tri Ancient Citadel: Listen to tour guide''s explanation of DMZ Demilitarized Zone and Hien Luong Bridge Ben Hai River (17th Parallel).

- La Vang Sanctuary: One of four Roman basilicas in Vietnam.

(Note: During the period from August 8 to August 16 every year, La Vang Holy Land holds the annual "Pilgrimage Congress of Our Lady of La Vang", so tours departing during this period will not visit. Yell)

- Lap An Lagoon: Watch the clouds floating on the mountain peaks surrounding the lagoon, before going through Hai Van Tunnel to Da Nang.

- Hoi An Ancient Town: Covered Bridge, Phung Hung Ancient House, Phuoc Kien Assembly Hall, Handicraft Facility,... Freely release flower lanterns to pray for health, peace & prosperity in the new year on the Hoai River... (own expense).

In the evening, you can walk around on your own to enjoy the beautiful scenery of Da Nang at night, see the Dragon Bridge, Love Bridge, Tran Thi Ly Bridge, Trade Center, Food Street, CafÃ© - Bar - Disco...

Overnight in Da Nang.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (9, 5, 1, N'HO CHI MINH CITY - DA NANG - HUE - HUONG THUY XUAN VILLAGE Number of meals: 02 (lunch, dinner)', CAST(N'12:17:00' AS Time), CAST(N'21:17:00' AS Time), N'HO CHI MINH CITY - DA NANG - HUE - HUONG THUY XUAN VILLAGE ', N'You gather at Column 5, Domestic Departure Terminal, Tan Son Nhat airport, Vietravel tour guide will assist with check-in procedures for the group to take the flight to Da Nang. At Da Nang airport, the car and tour guide picked up the group and went straight to Hue. Sightseeing:

- Citadel: ancient royal palace of 13 kings of the Nguyen Dynasty, visit Ngo Mon, Thai Hoa Palace, Forbidden City, The Mieu, Hien Lam Cac, Cuu Dinh, Hue Museum of Royal Antiquities.
- Thien Mu Pagoda: the pagoda is considered the oldest in Hue and is home to many precious antiques not only historically but also artistically.

Lunch at local restaurant. In the afternoon, you continue your journey to visit:
- Thuy Xuan Incense Village: Check-in at the famous Traditional Craft Village and also one of the famous virtual living coordinates of young people in Hue. The beautiful village covered with green trees nestled at the foot of Vong Canh hill is famous for a series of incense making establishments "showing off" green, red, purple, yellow...
- Enjoy Hue folk songs on the Perfume River: You can enjoy the traditional music space of Hue while the boat cruises down the Perfume River and experience releasing flower lanterns to pray for peace...
- Strolling the City at Night: Experience a Hue night full of new life at the Walking Street, freely enjoy Hue street dishes such as banh mi, Hue sweet soup,...watch the dragon boats going up and down the wharf The Kham Palace echoed with the echoes of Hue''s songs. Explore the vibrant Western Quarter at night with many crowded shops, live music, souvenir shops,...

Overnight in Hue', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (10, 5, 2, N'HUE - LA VANG - PHONG NHA CAVE Number of meals: 03 (Breakfast, lunch, dinner)', CAST(N'08:19:00' AS Time), CAST(N'19:19:00' AS Time), N'HUE - LA VANG - PHONG NHA CAVE ', N'Breakfast buffet at the hotel. You depart early for Dong Hoi Quang Binh, on the way stop to visit:
- La Vang Sanctuary: one of four Roman basilicas in Vietnam

Note: During the period from August 8 to August 16 every year, La Vang Holy Land holds the annual "Pilgrimage Congress of Our Lady of La Vang", so tours departing during this period will not visit La Vang. Echoing )

- Phong Nha Cave: Located in the Phong Nha - Ke Bang World Natural Heritage complex, considered a fairyland thanks to its system of limestone mountains and the longest underground river in the world.
The group returned to Hue a bit late around 20:00. You are free to rest.

Overnight in Hue

Note: In case you choose not to go to Quang Binh and stay in Hue to freely visit and rest, please notify your request before paying in full, reducing the cost of 400,000 VND/1 adult guest. You will cover your own expenses for lunch and dinner, and expenses for visiting other scenic spots in the Ancient Capital.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (11, 5, 3, N'HUE - DA NANG - HOI AN ANCIENT TOWN Number of meals: 02 (Breakfast, dinner)', CAST(N'06:20:00' AS Time), CAST(N'12:20:00' AS Time), N'HUE - DA NANG - HOI AN ANCIENT TOWN ', N'Breakfast buffet at the hotel. You depart for Da Nang, on the way stopping to visit:
- Lap An Lagoon: admire the scenery of clouds floating on the mountain peaks surrounding the lagoon, before going through Hai Van Tunnel to Da Nang

Arriving in Da Nang, the group visited:
- Ba Na - Suoi Mo tourist area: (cable car costs & lunch at your own expense): Enjoy the cold air of Da Lat in the Central region, the group is free to visit Linh Ung Pagoda, Debay Wine Cellars, flower gardens Le Jardin D''Amour, Ba Na''s new Spiritual Area, visit Linh Chua Linh Tu Temple, Fantasy Park amusement park.
- Golden Bridge: Free to take photos at Da Nang''s super hot tourist destination.
- Experience the funicular to the Moon Castle: The new project at Ba Na tourist area has just been put into operation in April 2022.

Lunch at Ba Na at your own expense. Then the group continued to visit and have fun until it was time to get off the cable.

In the afternoon, you continue your journey to visit:
- Hoi An Ancient Town - Covered Bridge, Phung Hung Ancient House, Phuoc Kien Assembly Hall, Handicraft Facility,... You are free to enjoy tea & cookies Reaching Out Tea House, a special tea shop of the Association of People with Disabilities disability, .... (own expense).

Overnight in Da Nang.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (12, 6, 1, N'SB NOI BAI - HANOI 00 meals: (first day at your own expense)', CAST(N'09:40:00' AS Time), CAST(N'18:40:00' AS Time), N'SB NOI BAI - HANOI ', N'You gather at Tan Son Nhat airport (Domestic Terminal), the tour guide will assist guests with check-in procedures for the flight to Hanoi. Arriving at Noi Bai airport, the car and Vietravel tour guide will pick you up and go to Hanoi to check into the hotel to rest or freely visit Hanoi''s old quarter.
Overnight in Hanoi.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (13, 6, 2, N'HANOI - HA LONG 03 meals: (Breakfast, Lunch, Afternoon)', CAST(N'06:41:00' AS Time), CAST(N'20:41:00' AS Time), N'HANOI - HA LONG', N'You have breakfast and check out of the hotel. The car departs to take you to visit Hoan Kiem Lake and look outside the Turtle Tower, Ngoc Son Temple, and The Huc Bridge.

Continuing the journey, the car departs to take you to the coastal city of Ha Long via Hai Phong - Ha Long highway, on the scenic road to Bach Dang Giang. Upon arrival, you get on the boat to cruise Ha Long Bay - a beautiful and extremely lively natural landscape, recognized by UNESCO as a World Natural Heritage site in 1994.

- Thien Cung Cave is one of the most beautiful caves in Ha Long. Magnificent and splendid beauty thanks to layers of stalactites and shimmering streams of light.

- From the boat, admire the large and small islands in Ha Long Bay: Fighting Islet, Lu Huong Islet.

Visit and shop at OCOP Central Ha Long Center with many fresh and dried seafood products, squid rolls,... that meet OCO quality standards

The car picks you up for dinner and check-in at the hotel, free to rest.

Or choose some services to explore Ha Long at night (self-sufficient transportation and tour costs):

- Experience the Queen Cable Car service at Sun World Ha Long Complex on Ba Deo Mountain, admire the beautiful night view of Ha Long city under shimmering lights (expected cable car operating time is from 10:00 a.m. to 6:00 p.m. each day). Saturday and Sunday)

Overnight in Ha Long.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (14, 6, 3, N'HA LONG - NINH BINH 03 meals: (Breakfast, Lunch, Afternoon)', CAST(N'06:42:00' AS Time), CAST(N'20:42:00' AS Time), N'HA LONG - NINH BINH ', N'Customers eat breakfast at the hotel. The car will take you to visit the Quang Ninh Museum and take photos outside the Dolphin Palace - the Palace of Planning, Fairs, Exhibitions and Culture of Quang Ninh, which seems to have become an impressive destination for tourists with its architectural style. unique structure.

You return to the hotel to check out and have lunch.

Continuing the journey, you depart for Ninh Binh - a land known as "The place to dream of, the place to return to" with many extremely unique cultural and natural relics. Upon arrival, you will admire Bai Dinh Pagoda - a pagoda complex with many Vietnamese records such as the 80-ton bronze statue of Maitreya Buddha, the corridor with 500 Arhat statues, the 99m high Stupa...

Overnight in Ninh Binh.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (15, 6, 4, N'NINH BINH - NOI BAI AIRPORT 02 Meals: (Breakfast, Lunch)', CAST(N'07:43:00' AS Time), CAST(N'20:43:00' AS Time), N'NINH BINH - NOI BAI AIRPORT ', N'You have breakfast and check out of the hotel. Car takes you to visit:

- Trang An Tourist Area: You board a traditional boat to visit the majestic limestone mountain system and flooded valleys, connected by streams, creating caves flooded all year round. Dotting the wild, quiet space are mossy, ancient images of communal houses, temples, and palaces nestled at the foot of high mountains.

- Tuyet Tinh Coc: located in the middle of the ancient capital of Hoa Lu (Ninh Binh), Am Tien cave hidden halfway up the mountain is known as "paradise on earth" and is called Tuyet Tinh Coc Vietnam by young people.
The car departs to take you to Noi Bai airport to check in for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (16, 7, 1, N'SB NOI BAI - HANOI', CAST(N'06:01:00' AS Time), CAST(N'20:01:00' AS Time), N'SB NOI BAI - HANOI', N'You gather at Tan Son Nhat airport (Domestic Terminal), the tour guide will assist guests with check-in procedures for the flight to Hanoi. Arriving at Noi Bai airport, the car and Vietravel tour guide will pick you up and go to Hanoi to check into the hotel to rest or freely visit Hanoi''s old quarter.

Overnight in Hanoi.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (17, 7, 2, N'HANOI - YEN TU - HA LONG 01 Meal: (Breakfast)', CAST(N'06:02:00' AS Time), CAST(N'19:02:00' AS Time), N'HANOI - YEN TU - HA LONG', N'You have breakfast and check out of the hotel. The car departs to take you to visit:

- Ho Chi Minh Mausoleum (not visited on Mondays, Fridays and the annual maintenance period June 15 - August 15) visit and learn about the life and career of the father of the nation at Uncle Ho''s Stilt House, Ho Chi Minh Museum, One Pillar Pagoda.

- Take a tour around Hoan Kiem Lake to see the outside of Turtle Tower, Ngoc Son Temple, and The Huc Bridge.

Continuing the journey, the car departs to take you to the coastal city of Ha Long along Highway 18, on the way stopping for lunch and visiting the sacred land of Yen Tu:

- Visit and take photos of Nuong Village and have lunch at Com Que

- You board the cable car to visit the natural beauty of Dong Yen Tu (cable car expenses are at your own expense), which still preserves many historical relics known as the "Ancestral Land of Vietnamese Buddhism", admire the Mot Mai Pagoda, Hoa Yen Pagoda - the place of practice of Buddha Emperor Tran Nhan Tong to give birth to the new Truc Lam Zen Sect, is located halfway up the mountain at an altitude of 516m. Following in the footsteps of the Buddha, visit the Bronze Pagoda called Thien Truc Tu (Buddha''s Realm Pagoda), located at the highest peak of the Yen Tu range (1,068m) - the largest bronze pagoda in Vietnam.

You check in to the hotel and have dinner. In the evening, you are free to explore many exciting entertainment activities in Bai Chay "old town" - located next to Sun World Ha Long park from street food to super cute cafes like Hon Gai Coffee & Lounge or relax comfortably at The Mini Bar, Brothers Pub,...

Overnight in Ha Long.

Or choose some services to explore Ha Long at night (self-sufficient transportation and tour costs):
- Experience the Queen Cable Car service at Sun World Ha Long Complex on Ba Deo Mountain, admire the beautiful night view of Ha Long city under shimmering lights (expected cable car operating time is from 10:00 a.m. to 6:00 p.m. each day). Saturday and Sunday)', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (18, 7, 3, N'HA LONG BAY - NINH BINH 01 meal: (Breakfast)', CAST(N'06:03:00' AS Time), CAST(N'21:03:00' AS Time), N'HA LONG BAY - NINH BINH ', N'You have breakfast and check out of the hotel. The car departs to take you to visit:
- Take photos outside Quang Ninh Museum, Dolphin Palace - Quang Ninh Planning, Fair, Exhibition and Cultural Palace,

- Get on the boat to cruise Ha Long Bay - a beautiful and extremely lively natural landscape, recognized by UNESCO as a World Natural Heritage site in 1994.

- Visit Thien Cung Cave, one of the most beautiful caves in Ha Long. Magnificent and splendid beauty thanks to layers of stalactites and shimmering streams of light. From the boat, admire the large and small islands in Ha Long Bay: Fighting Islet, Hon Lu Huong Islet.

- Visit and shop for specialties at Huong Da Ha Long Seafood with many famous items such as Ha Long hand-pounded squid rolls, braised meat with shrimp paste, shrimp floss, dried sea worms, anchovies, snapper fish, etc.

After sightseeing, the car picks you up at the boat dock to depart for Ninh Binh - a land known as "The place to dream of, the place to return to" with many extremely unique cultural and natural relics. You will have dinner and check in to the hotel to rest.

In the evening, you are free to explore Hoa Lu Ancient Town, an ancient, beautiful, quiet check-in space that becomes more sparkling and magical with the colors of lanterns and Stupas on Ky Lan Lake; Experience many folk game activities and many types of cultural and artistic forms from ethnic groups such as water puppetry, Tac Xinh dancing, Xam singing,... to acoustic performances that will take place in the evenings. weekend.


Overnight in Ninh Binh.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (19, 7, 4, N'NINH BINH - SB NOI BAI 01 Meal: (Breakfast)', CAST(N'06:03:00' AS Time), CAST(N'09:03:00' AS Time), N'NINH BINH - SB NOI BAI ', N'You have breakfast and check out of the hotel. Car takes you to visit:
- Trang An Tourist Area: You board a traditional boat to visit the majestic limestone mountain system and flooded valleys, connected by streams creating caves flooded all year round. Dotting the wild, quiet space are mossy, ancient images of communal houses, temples, and palaces nestled at the foot of high mountains.

- Visit Bai Dinh Pagoda - a pagoda complex with many Vietnamese records such as the 80-ton bronze Maitreya Buddha statue, corridor with 500 Arhat statues, 99m high Stupa...

The car departs to take you to Noi Bai airport to check in for a flight to Ho Chi Minh City. Say goodbye to you and end the tour at Tan Son Nhat airport.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (20, 8, 1, N'afafafafafafaf', CAST(N'06:37:00' AS Time), CAST(N'19:37:00' AS Time), N'HO CHI MINH CITY - DA NANG - HUE ', N'You gather at Domestic Departure Station, Tan Son Nhat airport, Vietravel tour guide checks in for you to take the flight to Da Nang. The car picks you up at Da Nang airport, on the way to Hue. On the way stop to visit:
- Lap An Lagoon: admire the scenery of clouds floating on the mountain peaks surrounding the lagoon.
- Citadel: ancient royal palace of 13 kings of the Nguyen Dynasty, visit Ngo Mon, Thai Hoa Palace, Forbidden City, The Mieu, Hien Lam Cac, Cuu Dinh, Hue Museum of Royal Antiquities...
- Thien Mu Pagoda: the pagoda is considered a symbol of Hue and is home to many precious antiques not only historically but also artistically.
- Shop for Thien Hy sesame specialty
- Strolling the City at Night: experience a Hue at night that is not at all quiet with historical buildings but like a young girl dressed in colorful outfits full of life at the Riverwalk Walking Street Perfume is in harmony with the sparkling beauty of Truong Tien Bridge, XQ embroidery paintings, freely enjoying Hue street dishes such as filtered bread, Hue sweet soup, watching dragon boats go up and down beside Toa Kham wharf echoing Hue folk songs. . Explore the vibrant Western Quarter at night with many crowded shops and souvenir shops.

The group returned to the hotel, checked in and had free time to rest.
 
Overnight in Hue.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (21, 8, 2, N'HUE - LA VANG - PHONG NHA CAVE (Breakfast, lunch, dinner)', CAST(N'06:38:00' AS Time), CAST(N'20:38:00' AS Time), N'HUE - LA VANG - PHONG NHA CAVE ', N'Have breakfast at the hotel. You depart early for Quang Binh, on the way stop to visit:
- La Vang Sanctuary: one of four La Vang basilicas in Vietnam
- Phong Nha Cave: located in the Phong Nha - Ke Bang World Natural Heritage complex, considered a fairyland because of the system of limestone mountains and the longest underground river in the world
The group departs and arrives in Hue around 8:00 p.m., check in and have free time to rest.
 
Overnight in Hue.
Note: In case you choose not to go to Quang Binh and stay in Hue to freely visit and rest, please notify your request before paying in full, reducing the cost of 400,000 VND/1 adult guest. You will cover your own expenses for lunch and dinner, and expenses for visiting other scenic spots in the Ancient Capital.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (22, 8, 3, N'HUE - DA NANG - BA NA TOURIST AREA - HOI AN ANCIENT TOWN (Breakfast, dinner)', CAST(N'06:38:00' AS Time), CAST(N'20:38:00' AS Time), N'HUE - DA NANG - BA NA TOURIST AREA - HOI AN ANCIENT TOWN ', N'Breakfast at the hotel. The car will take you back to Da Nang.
- Ba Na tourist area (cable car cost & lunch at your own expense): enjoy the cold air of Da Lat in the Central region, the group is free to visit Linh Ung Pagoda, Debay Wine Cellars, Le Jardin D'' flower garden Amour, Ba Na''s new Spiritual Area, visit Linh Chua Linh Tu Temple, Fantasy Park amusement park, free time to take photos at the Golden Bridge, a super hot attraction in Ba Na...Lunch at Ba Na at your own expense. Then the group continued to visit and have fun until it was time to get off the cable.

In the afternoon, you will visit:
- Son Tra Peninsula and Linh Ung Pagoda 3: this place has the tallest statue of AvalokiteÅvara Buddha in Vietnam.
- Non Nuoc Quoc Hiep Stone Village: shop for fine art stone products to create feng shui for your home or make meaningful gifts for relatives and friends.
- Hoi An Ancient Town: Covered Bridge, Phung Hung Ancient House, Phuoc Kien Assembly Hall, Handicraft Facility,... Freely release flower lanterns to pray for health, peace & prosperity in the new year on the Hoai River... (own expense).

The group returns to Da Nang, checks in to the hotel, and is free to rest.

Overnight in Da Nang.', NULL)
INSERT [dbo].[ActivitySchedules] ([schedule_id], [tour_id], [day_number], [activity_name], [start_time], [end_time], [location], [description], [image_url]) VALUES (23, 8, 4, N'Di xe', CAST(N'13:12:00' AS Time), CAST(N'16:12:00' AS Time), N'Da Nang', N'aavavavava', NULL)
SET IDENTITY_INSERT [dbo].[ActivitySchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([bill_id], [booking_id], [payment_date], [payment_method]) VALUES (22, 27, CAST(N'2024-03-14' AS Date), N'Visa Card')
INSERT [dbo].[Bills] ([bill_id], [booking_id], [payment_date], [payment_method]) VALUES (23, 28, CAST(N'2024-03-17' AS Date), N'Book Full')
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([booking_id], [tour_id], [user_id], [booking_date], [number_of_people], [total_price], [status]) VALUES (27, 8, 2, CAST(N'2024-03-14' AS Date), 3, CAST(1500.00 AS Decimal(18, 2)), N'0')
INSERT [dbo].[Bookings] ([booking_id], [tour_id], [user_id], [booking_date], [number_of_people], [total_price], [status]) VALUES (28, 7, 2, CAST(N'2024-03-17' AS Date), 20, CAST(9375.00 AS Decimal(18, 2)), N'0')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotels] ON 

INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (1, N'Hotel 5 star', 1, N'hotel.jpg', N'Da Nang')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (2, N'Hotel 4 star', 1, N'hotel.jpg', N'Da Nang')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (3, N'Hotel 5 star', 3, N'hotel.jpg', N'Ha Noi')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (4, N'Hotel 4 star', 3, N'hotel.jpg', N'Ha Noi')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (5, N'Hotel 5 star', 2, N'hotel.jpg', N'Hue')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (6, N'Hotel 4 star', 2, N'hotel.jpg', N'Hue')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (7, N'Hotel 5 star', 4, N'hotel.jpg', N'Ho Chi Minh')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (8, N'Hotel 4 star', 4, N'hotel.jpg', N'Ho Chi Minh')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (9, N'Hotel 5 star', 5, N'hotel.jpg', N'Ha Long')
INSERT [dbo].[Hotels] ([hotel_id], [hotel_name], [location_id], [image_url], [address]) VALUES (10, N'Hotel 4 star', 5, N'hotel.jpg', N'Ha Long')
SET IDENTITY_INSERT [dbo].[Hotels] OFF
GO
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (2, 3)
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (2, 5)
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (4, 6)
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (4, 7)
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (5, 8)
INSERT [dbo].[HotelTour] ([hotel_id], [tour_id]) VALUES (6, 8)
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([location_id], [location_name]) VALUES (1, N'Da Nang')
INSERT [dbo].[Locations] ([location_id], [location_name]) VALUES (2, N'Hue')
INSERT [dbo].[Locations] ([location_id], [location_name]) VALUES (3, N'Ha Noi')
INSERT [dbo].[Locations] ([location_id], [location_name]) VALUES (4, N'Ho Chi Minh')
INSERT [dbo].[Locations] ([location_id], [location_name]) VALUES (5, N'Ha Long')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurants] ON 

INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (1, N'Restaurant 5 star', 1, N'restaurant.jpg', N'Da Nang')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (2, N'Restaurant 4 star', 1, N'restaurant.jpg', N'Da Nang')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (3, N'Restaurant 5 star', 3, N'restaurant.jpg', N'Ha Noi')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (4, N'Restaurant 4 star', 3, N'restaurant.jpg', N'Ha Noi')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (5, N'Restaurant 5 star', 2, N'restaurant.jpg', N'Hue')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (6, N'Restaurant 4 star', 2, N'restaurant.jpg', N'Hue')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (7, N'Restaurant 5 star', 4, N'restaurant.jpg', N'Ho Chi Minh')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (8, N'Restaurant 4 star', 4, N'restaurant.jpg', N'Ho Chi Minh')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (9, N'Restaurant 5 star', 5, N'restaurant.jpg', N'Ha Long')
INSERT [dbo].[Restaurants] ([restaurant_id], [restaurant_name], [location_id], [image_url], [address]) VALUES (10, N'Restaurant 4 star', 5, N'restaurant.jpg', N'Ha Long')
SET IDENTITY_INSERT [dbo].[Restaurants] OFF
GO
INSERT [dbo].[RestaurantTour] ([restaurant_id], [tour_id]) VALUES (4, 7)
INSERT [dbo].[RestaurantTour] ([restaurant_id], [tour_id]) VALUES (5, 8)
INSERT [dbo].[RestaurantTour] ([restaurant_id], [tour_id]) VALUES (6, 8)
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([review_id], [booking_id], [content], [rating]) VALUES (9, 27, N'very good', 5)
INSERT [dbo].[Reviews] ([review_id], [booking_id], [content], [rating]) VALUES (10, 27, N'good', 4)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[TourDates] ON 

INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (7, 3, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-16' AS Date), 3)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (8, 3, CAST(N'2024-04-23' AS Date), CAST(N'2024-04-26' AS Date), 3)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (11, 5, CAST(N'2024-03-12' AS Date), CAST(N'2024-03-14' AS Date), 9)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (12, 5, CAST(N'2024-03-22' AS Date), CAST(N'2024-03-24' AS Date), 3)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (13, 6, CAST(N'2024-03-16' AS Date), CAST(N'2024-03-20' AS Date), 12)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (15, 7, CAST(N'2024-03-21' AS Date), CAST(N'2024-03-24' AS Date), 3)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (16, 7, CAST(N'2024-04-20' AS Date), CAST(N'2024-04-24' AS Date), 0)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (17, 8, CAST(N'2024-03-20' AS Date), CAST(N'2024-03-30' AS Date), 4)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (19, 8, CAST(N'2024-04-19' AS Date), CAST(N'2024-04-22' AS Date), 0)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (20, 6, CAST(N'2024-04-17' AS Date), CAST(N'2024-04-21' AS Date), 0)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (21, 3, CAST(N'2024-03-16' AS Date), CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (22, 8, CAST(N'2024-03-19' AS Date), CAST(N'2024-03-22' AS Date), 5)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (23, 7, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-17' AS Date), 0)
INSERT [dbo].[TourDates] ([tour_date_id], [tour_id], [start_date], [end_date], [current_capacity]) VALUES (24, 8, CAST(N'2024-03-23' AS Date), CAST(N'2024-03-27' AS Date), 2)
SET IDENTITY_INSERT [dbo].[TourDates] OFF
GO
INSERT [dbo].[TourLocation] ([tour_id], [location_id]) VALUES (3, 1)
INSERT [dbo].[TourLocation] ([tour_id], [location_id]) VALUES (5, 1)
INSERT [dbo].[TourLocation] ([tour_id], [location_id]) VALUES (6, 3)
INSERT [dbo].[TourLocation] ([tour_id], [location_id]) VALUES (7, 3)
INSERT [dbo].[TourLocation] ([tour_id], [location_id]) VALUES (8, 2)
GO
SET IDENTITY_INSERT [dbo].[Tours] ON 

INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [tour_price], [image_url], [employee_id], [start_location], [max_capacity]) VALUES (3, N'Da Nang - Hue - Phong Nha Cave - Pagoda Flower Field - La Vang - Ba Na Tourist Area - Golden Bridge - Hoi An - Da Nang (4* hotel with full tour)', N'Freely stroll the streets of Hue at night, experience a Hue that is not quiet but full of life at the Walking Street along the Perfume River, freely enjoy Hue street dishes such as banh mi, Hue sweet soup, and watch the boats Dragons move up and down beside Toa Kham wharf, echoing Hue''s songs. Explore the vibrant Western Quarter at night with many crowded shops and souvenir shops.', CAST(100.00 AS Decimal(18, 2)), N'HueDaNang.jpg', 1, N'Hue', 20)
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [tour_price], [image_url], [employee_id], [start_location], [max_capacity]) VALUES (5, N'Da Nang - Hue - La Vang - Phong Nha Cave - Ba Na Tourist Area - Golden Bridge - Hoi An - Da Nang - Enjoy Hue folk songs on the Perfume River (4* hotel with full tour)', N'On the occasion of the 30th anniversary of Hue Monuments Complex being recognized by UNESCO as a World Cultural Heritage, 20 years of Royal Music being recognized as a representative Intangible Cultural Heritage of Humanity, Hue Festival 2023 with the Chairman Theme: "Cultural Heritage with integration and development" opens with the Festival Opening Program - Ban Soc Ceremony on January 1, 2023 taking place at the Citadel combined with royal and civil festivals and Tet activities. The space is extremely rich and unique with Tet customs and traditional Tet cultural spaces. In addition, the Yellow Apricot Festival (January 9 - 19) aimed at building Thua Thien Hue to become the land of golden apricot flowers in Vietnam is also a highlight of this year. When coming to the Citadel, besides learning about the historic architecture of the ancient capital''s flashy times, you will also experience the bustling spring festival atmosphere everywhere.', CAST(120.00 AS Decimal(18, 2)), N'dananghue2.jpg', 1, N'Hue', 20)
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [tour_price], [image_url], [employee_id], [start_location], [max_capacity]) VALUES (6, N'Hanoi - Ha Long - Ninh Binh - Bai Dinh - Trang An - Tuyet Tinh Coc (4-star hotel)', N'- Set foot in Quang Ninh - the first province with 4 cities: Ha Long, Mong Cai, Uong Bi and Cam Pha, creating a tourist city not only famous for its sea like Ha Long Bay with thousands of undulating rocky islands on the sea. Magical shimmering water waves, beautiful caves, pristine beaches, cool and clear water typical of the islands of Co To, Soi Sim,... Not only that, Quang Ninh also attracts tourists. about the cool air of the sacred mountain Yen Tu, where spirituality, culture and the ultimate resort space converge. If you love the wildness of nature and airy space, try once to visit the Binh Lieu plateau, known as "Sapa the land of coal", with border milestones and a row of "reed grass flags". or the "Dinosaur''s Back" road running along the border is always a favorite stop for tourists inside and outside the province.

-Ninh Binh - the land of "The place to dream, the place to return" makes its mark with Trang An Scenic Landscape Complex - World Natural and Cultural Heritage, rowing boat to visit the stalactite system in caves and monuments Tran Temple; The quiet majesty of the Bai Dinh pagoda complex, the peaceful hideaway behind the cave with Tuyet Tinh Coc,...', CAST(100.00 AS Decimal(18, 2)), N'HanoiHalong.jpg', 2, N'Ha Long', 20)
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [tour_price], [image_url], [employee_id], [start_location], [max_capacity]) VALUES (7, N'Hanoi - Ha Long - Yen Tu - Ninh Binh - Bai Dinh - Trang An (Family Group of 4-6 guests)', N'Set foot in Quang Ninh - the first province with 4 cities: Ha Long, Mong Cai, Uong Bi and Cam Pha, creating a tourist city not only famous for its sea like Ha Long Bay with thousands of rocky islands undulating on the waves Magical shimmering water, beautiful caves, pristine beaches, cool and clear water typical of the islands of Co To, Soi Sim,... Not only that, Quang Ninh also attracts tourists. The cool air of the sacred mountain Yen Tu is the convergence of spirituality, culture and the ultimate resort space. If you love the wildness of nature and airy space, try once to visit the Binh Lieu plateau, known as "Sapa the land of coal", with border milestones and a row of "reed grass flags". or the "Dinosaur''s Back" road running along the border is always a favorite stop for tourists inside and outside the province. ÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ Ninh Binh - the land of "The place to dream of, the place to return to" makes its mark with Trang An Scenic Landscape Complex - World Natural and Cultural Heritage, rowing boat to visit the stalactite system in caves and monuments Tran Temple; The quiet majesty of the Bai Dinh pagoda complex, the peaceful hideaway behind the cave with Tuyet Tinh Coc,...', CAST(625.00 AS Decimal(18, 2)), N'hanoihalong2.jpg', 1, N'Ha Long', 20)
INSERT [dbo].[Tours] ([tour_id], [tour_name], [description], [tour_price], [image_url], [employee_id], [start_location], [max_capacity]) VALUES (8, N'Da Nang - Hue - Lap An Lagoon - La Vang - Phong Nha Cave - Ba Na Tourist Area - Golden Bridge - Son Tra - Hoi An - Da Nang (4* hotel with full tour)', N'In particular, coming to Da Nang during June 2 - July 8, 2023, you cannot miss the Da Nang International Fireworks Festival (DIFF 2023) with the theme "World without distance" honoring world tourism recovery and is one of the most anticipated events of the year. Coming to this year''s festival, you will be delighted with extremely creative and spectacular competition performances from 8 countries: Vietnam, Finland, Canada, France, Australia, Italy, Poland and England. . Accompanying DIFF 2023 is a series of diverse and multicultural activities, music events, festivals, cuisine..., promising to bring visitors the most interesting experiences this summer.', CAST(500.00 AS Decimal(18, 2)), N'hue1.jpg', 1, N'Da Nang', 20)
SET IDENTITY_INSERT [dbo].[Tours] OFF
GO
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (3, 1)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (3, 2)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (5, 1)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (5, 2)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (6, 1)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (7, 1)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (7, 2)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (8, 1)
INSERT [dbo].[TourTransportation] ([tour_id], [transportation_id]) VALUES (8, 2)
GO
SET IDENTITY_INSERT [dbo].[Transportations] ON 

INSERT [dbo].[Transportations] ([transportation_id], [transportation_name], [image_url], [departure_time], [return_time]) VALUES (1, N'Air Plane', N'maybay.jpg', CAST(N'06:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Transportations] ([transportation_id], [transportation_name], [image_url], [departure_time], [return_time]) VALUES (2, N'Bus', N'xebuyt.jpg', CAST(N'09:00:00' AS Time), CAST(N'20:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Transportations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [name], [password], [email], [address], [phone], [role], [status]) VALUES (1, N'admin', N'123', N'admin', N'Da Nang', N'1234567890', N'Admin', N'0')
INSERT [dbo].[Users] ([user_id], [name], [password], [email], [address], [phone], [role], [status]) VALUES (2, N'Nguyen Thanh Hoang', N'123', N'hoangkaito03@gmail.com', N'Da Nang', N'1234567890', N'User', N'0')
INSERT [dbo].[Users] ([user_id], [name], [password], [email], [address], [phone], [role], [status]) VALUES (3, N'Nguyen Phuoc Binh', N'123', N'nguyenphuocbinh2311@gmail.com', N'Da Nang', N'0905967455', N'User', N'0')
INSERT [dbo].[Users] ([user_id], [name], [password], [email], [address], [phone], [role], [status]) VALUES (4, N'Binh', N'123', N'longt9386@gmail.com', N'DN', N'1234567890', N'User', N'1')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

ALTER TABLE [dbo].[Bills] ADD UNIQUE NONCLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivitySchedules]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Bookings] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Bookings]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[HotelTour]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[Hotels] ([hotel_id])
GO
ALTER TABLE [dbo].[HotelTour]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[RestaurantTour]  WITH CHECK ADD FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[Restaurants] ([restaurant_id])
GO
ALTER TABLE [dbo].[RestaurantTour]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[TourDates]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[TourLocation]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[TourLocation]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[TourTransportation]  WITH CHECK ADD FOREIGN KEY([tour_id])
REFERENCES [dbo].[Tours] ([tour_id])
GO
ALTER TABLE [dbo].[TourTransportation]  WITH CHECK ADD FOREIGN KEY([transportation_id])
REFERENCES [dbo].[Transportations] ([transportation_id])
GO
USE [master]
GO
ALTER DATABASE [TravelManagementSystem] SET  READ_WRITE 
GO
