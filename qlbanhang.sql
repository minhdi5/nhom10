-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 01, 2021 lúc 02:50 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `categorie_id` int(11) NOT NULL,
  `categorie_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `categorie_image` text COLLATE utf8_unicode_ci NOT NULL,
  `categorie_deltail` text COLLATE utf8_unicode_ci NOT NULL,
  `categorie_parent` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `categorie_image`, `categorie_deltail`, `categorie_parent`, `employee_id`) VALUES
(20, 'Riêng nữ', 'Resource/upload/girl.jpg', 'Phong cách thời trang tối giản\r\nNhiều sự lựa chọn\r\nGiá thành hợp lí', NULL, 1),
(23, 'Riêng nam', 'Resource/upload/men.jpg', 'Phong cách thời trang tối giản\r\nNhiều sự lựa chọn\r\nGiá thành hợp lí', NULL, 1),
(25, 'Áo thun', '', '', 20, 1),
(26, 'Áo thun - Test CM', '', '', 25, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `comment_parent` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `comment_date`, `comment_parent`, `member_id`, `product_id`, `comment_status`) VALUES
(50, 'adđư', '2019-06-06 18:53:06', NULL, 3, 3, 0),
(51, 'binh\n', '2021-11-01 19:41:31', NULL, 4, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `config`
--

CREATE TABLE `config` (
  `config_id` int(11) NOT NULL,
  `config_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `config_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `config`
--

INSERT INTO `config` (`config_id`, `config_name`, `config_data`) VALUES
(1, 'categories', '[{\"id\":\"20\",\"name\":\"Ri\\u00eang n\\u1eef\",\"deltail\":\"Phong c\\u00e1ch th\\u1eddi trang t\\u1ed1i gi\\u1ea3n\\r\\nNhi\\u1ec1u s\\u1ef1 l\\u1ef1a ch\\u1ecdn\\r\\nGi\\u00e1 th\\u00e0nh h\\u1ee3p l\\u00ed\",\"image\":\"Resource\\/upload\\/girl.jpg\",\"child\":[{\"id\":\"25\",\"name\":\"\\u00c1o thun\",\"deltail\":\"\",\"image\":\"\",\"child\":[{\"id\":\"26\",\"name\":\"\\u00c1o thun - Test CM\",\"deltail\":\"\",\"image\":\"\"}]}]},{\"id\":\"23\",\"name\":\"Ri\\u00eang nam\",\"deltail\":\"Phong c\\u00e1ch th\\u1eddi trang t\\u1ed1i gi\\u1ea3n\\r\\nNhi\\u1ec1u s\\u1ef1 l\\u1ef1a ch\\u1ecdn\\r\\nGi\\u00e1 th\\u00e0nh h\\u1ee3p l\\u00ed\",\"image\":\"Resource\\/upload\\/men.jpg\"}]'),
(2, 'view', '388');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `contact_address` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`contact_id`, `contact_address`, `contact_phone`, `member_id`) VALUES
(7, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 2),
(8, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '1697777777', 2),
(9, 'adadada adad', '2323231312', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employee_pass` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `employee_fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employee_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `employee_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employee_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_user`, `employee_pass`, `employee_fullname`, `employee_phone`, `employee_email`, `employee_birth`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Thanh Bình', '857350574', 'kakahuy99@gmail.com', '2019-05-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `member_user` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `member_pass` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `member_fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `member_phone` int(11) NOT NULL,
  `member_avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `member_birth` date NOT NULL,
  `member_sex` tinyint(1) NOT NULL,
  `member_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 - Active, 1 - Banned, 0 - Delete'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `members`
--

INSERT INTO `members` (`member_id`, `member_user`, `member_pass`, `member_fullname`, `member_phone`, `member_avatar`, `member_email`, `member_birth`, `member_sex`, `member_status`) VALUES
(2, 'admin2', '38de14bb650bd27f85585a902f7560f5', 'Huy Nguyen', 1697777777, '/Resource/upload/7b5e865557f1974d3df0136ae46bcc98588671.jpg', 'kakahuy104@gmail.com', '1999-06-09', 0, '2'),
(3, 'admin', '38de14bb650bd27f85585a902f7560f5', 'Huy Nguyen', 169777777, NULL, 'kakahuy99@gmail.com', '2019-05-12', 0, '2'),
(4, 'binh', 'e10adc3949ba59abbe56e057f20f883e', 'Butabin', 123456798, NULL, 'btb@gmail.com', '2000-03-20', 0, '0'),
(5, 'sang', 'fcea920f7412b5da7be0cf42b8c93759', 'Minh Di', 12315416, NULL, 'ss@gmail.com', '2000-09-01', 0, '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `member_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `contact_address` text COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` char(13) COLLATE utf8_unicode_ci NOT NULL,
  `order_price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `order_status`, `order_date`, `member_id`, `employee_id`, `contact_address`, `contact_phone`, `order_price`) VALUES
(23, 'Đã hoàn thành', '2019-05-22 06:49:31', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 90000),
(24, 'Đã hoàn thành', '2019-05-22 06:53:53', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 90000),
(25, 'Đã hoàn thành', '2019-05-22 07:53:30', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 90000),
(26, 'Hủy', '2019-05-22 08:11:12', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 90000),
(27, 'Hủy', '2019-06-06 00:54:04', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '1697777777', 8000),
(28, 'Hủy', '2019-06-06 01:45:43', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '1697777777', 8000),
(29, 'Hủy', '2019-06-06 01:46:05', 2, NULL, 'Vĩnh Long, Vũng Liêm, Hiếu Phụng', '84125735057', 8000),
(30, 'Đã hoàn thành', '2019-06-06 18:10:53', 3, NULL, 'adadada adad', '2323231312', 8000),
(31, 'Đã hoàn thành', '2019-06-06 18:52:48', 3, NULL, 'adadada adad', '2323231312', 8000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_elements`
--

CREATE TABLE `order_elements` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_ele_price` decimal(10,0) NOT NULL,
  `order_ele_num` int(11) NOT NULL,
  `order_ele_options` text COLLATE utf8_unicode_ci NOT NULL,
  `order_ele_allprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_elements`
--

INSERT INTO `order_elements` (`order_id`, `product_id`, `order_ele_price`, `order_ele_num`, `order_ele_options`, `order_ele_allprice`) VALUES
(23, 1, '90000', 1, '', 90000),
(23, 3, '8000', 1, '', 8000),
(24, 1, '90000', 1, '', 90000),
(25, 1, '90000', 1, '', 90000),
(25, 3, '8000', 1, '', 8000),
(26, 1, '90000', 1, '', 90000),
(27, 3, '8000', 1, '', 8000),
(28, 3, '8000', 1, '', 8000),
(29, 3, '8000', 1, '', 8000),
(30, 3, '8000', 5, '', 40000),
(31, 3, '8000', 1, '', 8000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `policy`
--

CREATE TABLE `policy` (
  `policy_id` int(11) NOT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `policy_symbol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `policy_parent` int(11) NOT NULL,
  `policy_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `policy_member`
--

CREATE TABLE `policy_member` (
  `employee_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_view` int(11) NOT NULL DEFAULT 0,
  `product_star` tinyint(4) NOT NULL,
  `product_deltail` text COLLATE utf8_unicode_ci NOT NULL,
  `product_day` datetime NOT NULL DEFAULT current_timestamp(),
  `product_options` text COLLATE utf8_unicode_ci NOT NULL,
  `product_num_remai` int(11) NOT NULL,
  `product_num_sold` int(11) NOT NULL DEFAULT 0,
  `product_price` decimal(10,0) NOT NULL,
  `product_sale` tinyint(4) NOT NULL DEFAULT 0,
  `product_image` text COLLATE utf8_unicode_ci NOT NULL,
  `product_status` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'Hoạt Động',
  `employee_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_view`, `product_star`, `product_deltail`, `product_day`, `product_options`, `product_num_remai`, `product_num_sold`, `product_price`, `product_sale`, `product_image`, `product_status`, `employee_id`, `categorie_id`) VALUES
(1, 'Áo Test 1111', 269, 4, 'a', '2019-05-07 22:31:23', '', 189, 11, '90000', 0, '[\"\\/Resource\\/upload\\/d23561e122f1fb082c429f1b3ec80819800698.jpg\"]', 'Hoạt Động', 1, 23),
(2, 'Áo Test 2', 313, 4, 'Test 2', '2019-05-07 22:31:23', '', 0, 1, '90000', 10, '[\"Resource/upload/ao-tre-vai-phoi-mau.jpg\"]', 'Xóa', 1, 26),
(3, 'Áo Test 3', 323, 4, 'Test 3', '2019-05-16 22:31:23', '', 187, 15, '10000', 20, '[\"Resource/upload/ao-tre-vai-phoi-mau.jpg\"]', 'Hoạt Động', 1, 26),
(4, 'Test', 1, 1, 'AVC', '2019-06-06 12:56:44', '[]', 1, 0, '1', 1, '[\"\\/Resource\\/upload\\/b77b5cf0847d0cd7c15ac97f6736d8af600821.jpg\"]', 'Xóa', 1, 20),
(5, '244', 1, 1, 'wr', '2019-06-06 18:56:50', '[]', 1, 0, '0', 0, '[\"\\/Resource\\/upload\\/3e186ad0bd9bd89cc70aaac1e6bf5849137219.jpg\"]', 'Hoạt Động', 1, 20);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorie_id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `categorie_parent` (`categorie_parent`) USING BTREE;

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD UNIQUE KEY `comment_parent` (`comment_parent`),
  ADD KEY `member_id` (`member_id`) USING BTREE,
  ADD KEY `product_id` (`product_id`) USING BTREE;

--
-- Chỉ mục cho bảng `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`config_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Chỉ mục cho bảng `order_elements`
--
ALTER TABLE `order_elements`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`policy_id`),
  ADD KEY `policy_parent` (`policy_parent`);

--
-- Chỉ mục cho bảng `policy_member`
--
ALTER TABLE `policy_member`
  ADD PRIMARY KEY (`employee_id`,`policy_id`),
  ADD KEY `policy_id` (`policy_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `config`
--
ALTER TABLE `config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `policy`
--
ALTER TABLE `policy`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`categorie_parent`) REFERENCES `categories` (`categorie_id`),
  ADD CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_parent`) REFERENCES `comments` (`comment_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Các ràng buộc cho bảng `order_elements`
--
ALTER TABLE `order_elements`
  ADD CONSTRAINT `order_elements_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_elements_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `policy`
--
ALTER TABLE `policy`
  ADD CONSTRAINT `policy_ibfk_1` FOREIGN KEY (`policy_parent`) REFERENCES `policy` (`policy_id`);

--
-- Các ràng buộc cho bảng `policy_member`
--
ALTER TABLE `policy_member`
  ADD CONSTRAINT `policy_member_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`),
  ADD CONSTRAINT `policy_member_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
