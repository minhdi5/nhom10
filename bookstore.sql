-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2017 at 10:34 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(3) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(3) NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `name`, `parent_id`, `sort_order`) VALUES
(1, 'Hà Nội', 0, 1),
(2, 'Huế', 0, 2),
(3, 'TP. Hồ Chí Minh', 0, 3),
(5, 'Đà Nẵng', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_group_id` int(64) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `admin_group_id`, `level`) VALUES
(13, 'Admin', 'e7e23670481ac78b3c4122a99ba60573', 'Phan Văn Quí [Quản Trị Viên]', 1, 1),
(18, 'Member', 'e7e23670481ac78b3c4122a99ba60573', 'Người viết bài []', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `admin_group`
--

CREATE TABLE `admin_group` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin_group`
--

INSERT INTO `admin_group` (`id`, `name`, `sort_order`, `permissions`) VALUES
(1, 'Admin', 1, '{"product":{"add":1,"edit":1,"delete":1},"news":{"add":1,"edit":1,"delete":1}}'),
(2, 'Mod', 2, '{"product":{"add":0,"edit":1,"delete":1},"news":{"add":1,"edit":1,"delete":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `vi_tri` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `vi_tri`, `name`, `image_link`, `href`) VALUES
(13, '1', 'banner-top 1', 'http://localhost/bookstore/upload/images/banner-top/bn_1.jpg', 'http://www.workpress.esy.es/'),
(14, '2', 'banner-top 2', 'http://localhost/bookstore/upload/images/banner-top/bn_2.jpg', 'http://www.workpress.esy.es/');

-- --------------------------------------------------------

--
-- Table structure for table `baohanh`
--

CREATE TABLE `baohanh` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `baohanh`
--

INSERT INTO `baohanh` (`id`, `content`) VALUES
(1, '<h5><strong>QUY ĐỊNH ĐỔI - TRẢ H&Agrave;NG &ndash; HỦY ĐƠN H&Agrave;NG</strong></h5>\r\n\r\n<div>\r\n<p>&nbsp;<em>Qu&yacute; kh&aacute;ch vui l&ograve;ng kiểm tra sản phẩm trước khi k&yacute; x&aacute;c nhận với nh&acirc;n vi&ecirc;n giao h&agrave;ng. Trường hợp, sản phẩm kh&ocirc;ng đ&uacute;ng như đ&atilde; đặt mua qua website hay sản phẩm bị hư hỏng (r&aacute;ch, xước, .v.v.), qu&yacute; kh&aacute;ch c&oacute; quyền từ chối nhận v&agrave; y&ecirc;u cầu <span style="color:#ff0000"><strong>Book Store</strong></span>&nbsp;đổi sản phẩm kh&aacute;c.</em></p>\r\n\r\n<p>&nbsp;&nbsp;<strong><em>1) Quy định đổi h&agrave;ng</em></strong></p>\r\n\r\n<p>Trường hợp sản phẩm bị hư hỏng do qu&aacute; tr&igrave;nh vận chuyển; sản phẩm kh&ocirc;ng đ&uacute;ng quy c&aacute;ch chất lượng hay được giao nhầm bởi <em><span style="color:#ff0000"><strong>Book Store</strong></span></em>, ch&uacute;ng t&ocirc;i sẵn s&agrave;ng đổi sản phẩm mới tương tự cho qu&yacute; kh&aacute;ch. Thời gian đổi h&agrave;ng tối đa l&agrave; 07 ng&agrave;y kể từ ng&agrave;y nhận. Sau thời gian n&agrave;y&nbsp;<em><span style="color:#ff0000"><strong>Book Store</strong></span></em>sẽ kh&ocirc;ng giải quyết mọi khiếu nại của qu&yacute; kh&aacute;ch về việc đổi hay trả h&agrave;ng.</p>\r\n\r\n<p>&nbsp;C&aacute;c bước đổi h&agrave;ng:&nbsp;</p>\r\n\r\n<p>&nbsp;<em>a. &nbsp; &nbsp;&nbsp;</em><strong><em>&nbsp; Đối với đơn h&agrave;ng trong nội th&agrave;nh Huế:</em></strong></p>\r\n\r\n<p>Sau khi nhận s&aacute;ch kh&aacute;ch h&agrave;ng vui l&ograve;ng kiểm tra lại sản phẩm trước khi k&yacute; x&aacute;c nhận nhận h&agrave;ng. Trong trường hợp sản phẩm bị hư hỏng hoặc kh&ocirc;ng đ&uacute;ng như sản phẩm kh&aacute;ch h&agrave;ng đ&atilde; đặt kh&aacute;ch h&agrave;ng c&oacute; quyền y&ecirc;u cầu&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>đổi h&agrave;ng.&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ kiểm tra v&agrave; xử l&yacute; đổi h&agrave;ng tối đa trong v&ograve;ng 2 ng&agrave;y kể từ ng&agrave;y nhận được y&ecirc;u cầu. Nếu sau khi kh&aacute;ch h&agrave;ng đ&atilde; k&yacute; x&aacute;c nhận nhận h&agrave;ng,&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ kh&ocirc;ng giải quyết khiếu nại của kh&aacute;ch h&agrave;ng về chất lượng sản phẩm.</p>\r\n\r\n<p>&nbsp;<em>b. &nbsp; &nbsp; &nbsp;</em><strong><em>Đối với c&aacute;c đơn h&agrave;ng&nbsp;c&aacute;c tỉnh kh&aacute;c:</em></strong></p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch gửi y&ecirc;u cầu hỗ trợ về địa chỉ book_store@shop.com hoặc gọi điện số&nbsp;<strong>0123456789</strong>&nbsp;hoặc c&oacute; thể chat trực tiếp với nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng để được trợ gi&uacute;p.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sẽ nhanh ch&oacute;ng kiểm tra v&agrave; li&ecirc;n hệ qu&yacute; kh&aacute;ch để xử l&yacute; y&ecirc;u cầu.</p>\r\n\r\n<p>Ngay sau khi x&aacute;c nhận lại,&nbsp;<em><span style="color:#ff0000"><strong>Book Store</strong></span></em>&nbsp;sẽ gửi h&agrave;ng mới đến cho qu&yacute; kh&aacute;ch.</p>\r\n\r\n<p>Qu&yacute; kh&aacute;ch kh&ocirc;ng phải trả th&ecirc;m chi ph&iacute; n&agrave;o kh&aacute;c. Chi ph&iacute; ph&aacute;t sinh từ việc gửi trả h&agrave;ng về&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ được quy đổi th&agrave;nh một sản phẩm cộng th&ecirc;m, tương ứng với chi ph&iacute;.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i sẽ gửi sản phẩm mới c&ugrave;ng t&iacute;nh chất với sản phẩm qu&yacute; kh&aacute;ch đ&atilde; chọn mua. Tuy nhi&ecirc;n, trường hợp kh&ocirc;ng c&ograve;n h&agrave;ng thay thế hoặc sản phẩm kh&ocirc;ng c&ograve;n được tiếp tục sản xuất, qu&yacute; kh&aacute;ch c&oacute; thể y&ecirc;u cầu mặt h&agrave;ng tương tự. Nếu c&oacute; ch&ecirc;nh lệch về gi&aacute;, qu&yacute; kh&aacute;ch sẽ được ho&agrave;n trả hoặc phải b&ugrave; th&ecirc;m.</p>\r\n\r\n<p>Trường hợp lỗi sản phẩm được g&acirc;y ra bởi qu&yacute; kh&aacute;ch, v&iacute; dụ như: để rơi, cầm mạnh tay .v.v. sau khi đ&atilde; k&yacute; x&aacute;c nhận từ nh&acirc;n vi&ecirc;n giao h&agrave;ng,&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ kh&ocirc;ng chịu tr&aacute;ch nhiệm v&agrave; kh&ocirc;ng giải quyết đổi h&agrave;ng cho c&aacute;c trường hợp n&agrave;y hoặc tương tự.</p>\r\n\r\n<p>&nbsp;<em>2)</em><strong><em>&nbsp;Quy định hủy đơn h&agrave;ng</em></strong></p>\r\n\r\n<p>Nếu qu&yacute; kh&aacute;ch hủy đơn h&agrave;ng trước khi h&agrave;ng được chuyển, th&ocirc;ng thường l&agrave; trong v&ograve;ng 1 giờ kể từ l&uacute;c nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng li&ecirc;n hệ x&aacute;c nhận đặt h&agrave;ng,&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ ho&agrave;n trả 100% tiền cho những qu&yacute; kh&aacute;ch đ&atilde; thanh to&aacute;n trước qua chuyển khoản &ndash; ATM hay qua cổng thanh to&aacute;n điện tử. Để biết t&igrave;nh trạng hiện tại của đơn h&agrave;ng, qu&yacute; kh&aacute;ch vui l&ograve;ng xem trong mục Quản l&yacute; đơn h&agrave;ng hoặc gọi điện số&nbsp;<strong>0123456789</strong>&nbsp;hoặc c&oacute; thể chat trực tiếp với nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng để được trợ gi&uacute;p.<br />\r\nQu&yacute; kh&aacute;ch h&agrave;ng chỉ c&oacute; thể thực hiện huỷ đơn h&agrave;ng trong quản l&yacute; đơn h&agrave;ng c&aacute; nh&acirc;n trong v&ograve;ng 4h đồng hồ kể từ l&uacute;c đặt h&agrave;ng. Qu&aacute; thời gian tr&ecirc;n nếu qu&yacute; kh&agrave;ng h&agrave;ng muốn huỷ đơn h&agrave;ng xin vui l&ograve;ng li&ecirc;n hệ với bộ phận hỗ trợ b&aacute;n h&agrave;ng của&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>để được hướng dẫn.</p>\r\n\r\n<p>Nếu qu&yacute; kh&aacute;ch hủy đơn h&agrave;ng sau khi h&agrave;ng đ&atilde; được chuyển,&nbsp;<em><span style="color:#ff0000"><strong>Book Store&nbsp;</strong></span></em>sẽ giải quyết ho&agrave;n tiền cho qu&yacute; kh&aacute;ch sau khi đ&atilde; trừ c&aacute;c chi ph&iacute; ph&aacute;t sinh của đơn h&agrave;ng (ph&iacute; vận chuyển, ph&iacute; thanh to&aacute;n, ph&iacute; g&oacute;i qu&agrave;,&hellip;).</p>\r\n</div>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_banner` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_view` int(11) NOT NULL DEFAULT '0',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `status` int(5) NOT NULL,
  `created` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `slug`, `image_link`, `image_banner`, `site_title`, `meta_desc`, `meta_key`, `intro`, `parent_id`, `parent_view`, `sort_order`, `status`, `created`) VALUES
(271, 'Tiểu thuyết Việt Nam', 'tieu-thuyet-viet-nam', '', '', 'Tiểu thuyết Việt Nam', 'Tiểu thuyết Việt Nam', 'Tiểu thuyết Việt Nam', '<p>Tiểu thuyết Việt Nam</p>\r\n', 267, 0, 0, 0, 0),
(272, 'Sản phẩm Giảm Giá', 'san-pham-giam-gia', '', '', 'Sản phẩm Giảm Giá', 'Sản phẩm Giảm Giá', 'Sản phẩm Giảm Giá', '<p>Sản phẩm Giảm Gi&aacute;</p>\r\n', 0, 1, 4, 0, 0),
(269, 'Thơ', 'tho', '', '', 'Thơ', 'Thơ', 'Thơ', '<p>Thơ</p>\r\n', 267, 0, 0, 0, 0),
(270, 'Tiểu thuyết Nước Ngoài', 'tieu-thuyet-nuoc-ngoai', '', '', 'Tiểu thuyết Nước Ngoài', 'Tiểu thuyết Nước Ngoài', 'Tiểu thuyết Nước Ngoài', '<p>Tiểu thuyết Nước Ngo&agrave;i</p>\r\n', 267, 0, 0, 0, 0),
(264, 'Sách cho bà bầu', 'sach-cho-ba-bau', '', '', 'Sách cho bà bầu', 'Sách cho bà bầu', 'Sách cho bà bầu', '<p>S&aacute;ch cho b&agrave; bầu</p>\r\n', 260, 0, 0, 0, 0),
(265, 'Sách hay nên đọc', 'sach-hay-nen-doc', '', '', 'Sách hay nên đọc', 'Sách hay nên đọc', 'Sách hay nên đọc', '<p>S&aacute;ch hay n&ecirc;n đọc</p>\r\n', 260, 0, 0, 0, 0),
(266, 'Sách cho phụ nữ', 'sach-cho-phu-nu', '', '', 'Sách cho phụ nữ', 'Sách cho phụ nữ', 'Sách cho phụ nữ', '<p>S&aacute;ch cho phụ nữ</p>\r\n', 260, 0, 0, 0, 0),
(267, 'Sách văn học', 'sach-van-hoc', '', '', 'Sách văn học', 'Sách văn học', 'Sách văn học', '<p>S&aacute;ch văn học</p>\r\n', 0, 2, 3, 0, 0),
(268, 'Phóng sự, bút kí, hồi kí', 'phong-su-but-ki-hoi-ki', '', '', 'Phóng sự, bút kí, hồi kí', 'Phóng sự, bút kí, hồi kí', 'Phóng sự, bút kí, hồi kí', '<p>Ph&oacute;ng sự, b&uacute;t k&iacute;, hồi k&iacute;</p>\r\n', 267, 0, 0, 0, 0),
(252, 'Văn học Anh', 'van-hoc-anh', '', '', 'Văn học Anh', 'Văn học Anh', 'Văn học Anh', '<p>Văn học Anh</p>\r\n', 251, 0, 0, 0, 0),
(253, 'Văn học Mỹ', 'van-hoc-my', '', '', 'Văn học Mỹ', 'Văn học Mỹ', 'Văn học Mỹ', '<p>Văn học Mỹ</p>\r\n', 251, 0, 0, 0, 0),
(273, 'Văn học Trung Quốc', 'van-hoc-trung-quoc', '', '', 'Văn học Trung Quốc', 'Văn học Trung Quốc', 'Văn học Trung Quốc', '<p>Văn học Trung Quốc</p>\r\n', 251, 0, 0, 0, 0),
(275, 'Văn học Việt Nam', 'van-hoc-viet-nam', '', '', 'Văn học Việt Nam', 'Văn học Việt Nam', 'Văn học Việt Nam', '<p>Văn học Việt Nam</p>\r\n', 251, 0, 0, 0, 0),
(260, 'Sách đáng chú ý', 'sach-dang-chu-y', '', '', 'Sách đáng chú ý', 'Sách đáng chú ý', 'Sách đáng chú ý', '<p>Sách đáng chú ý</p>\r\n', 0, 3, 2, 0, 0),
(263, 'Sách đoạt giải', 'sach-doat-giai', '', '', 'Sách đoạt giải', 'Sách đoạt giải', 'Sách đoạt giải', '<p>S&aacute;ch đoạt giải</p>\r\n', 260, 0, 0, 0, 0),
(251, 'Văn học theo Quốc gia', 'van-hoc-theo-quoc-gia', '', '', 'Văn học theo Quốc gia', 'Văn học theo Quốc gia', 'Văn học theo Quốc gia', '<p>Văn học theo Quốc gia</p>\r\n', 0, 4, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chinh_sach`
--

CREATE TABLE `chinh_sach` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `user_name` text COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `count_like` int(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(128) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` text COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_static`
--

CREATE TABLE `content_static` (
  `id` int(11) NOT NULL,
  `key` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dichvu`
--

CREATE TABLE `dichvu` (
  `id` int(5) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `count_view` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(50) NOT NULL,
  `status` int(5) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer`
--

CREATE TABLE `footer` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gioithieu`
--

CREATE TABLE `gioithieu` (
  `id` int(2) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gioithieu`
--

INSERT INTO `gioithieu` (`id`, `content`) VALUES
(1, '<p>Ch&iacute;nh thức ra mắt từ th&aacute;ng 4/2017, website thương mại điện tử <em><strong><span style="color:#ff0000">Book Store</span></strong></em>&nbsp;cung cấp c&aacute;c sản phẩm thuộc 3&nbsp;ng&agrave;nh h&agrave;ng: S&aacute;ch Văn Học,&nbsp;S&aacute;ch Đ&aacute;ng Ch&uacute; &Yacute;&nbsp; &amp; Văn Học Theo Quốc Gia.<br />\r\n<br />\r\nMục ti&ecirc;u m&agrave; <em><strong><span style="color:#ff0000">Book Store&nbsp;</span></strong></em>hướng tới l&agrave; trở th&agrave;nh website mua s&aacute;ch&nbsp;trực tuyến số 1 tại Huế. Tiện lợi, nhanh ch&oacute;ng &amp; tin cậy trong thị trường thương mại điện tử với đa dạng chủng loại về s&aacute;ch &amp; dịch vụ được đảm bảo.</p>\r\n\r\n<p><br />\r\nKhi mua h&agrave;ng tr&ecirc;n <em><strong><span style="color:#ff0000">Book Store</span></strong></em>, kh&aacute;ch h&agrave;ng sẽ được hưởng c&aacute;c tiện &iacute;ch sau:</p>\r\n\r\n<p>- Dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng đ&aacute;o trước &amp; sau khi mua h&agrave;ng.</p>\r\n\r\n<p>- Giao h&agrave;ng nhanh ch&oacute;ng &amp; chu đ&aacute;o:</p>\r\n\r\n<p>+ Trong v&ograve;ng 24h đối với đơn h&agrave;ng tại Tp Huế&nbsp;&amp; c&aacute;c tỉnh l&acirc;n cận.</p>\r\n\r\n<p>+ Trong v&ograve;ng 48h &ndash; 120h đối với đơn h&agrave;ng tại c&aacute;c tỉnh/ th&agrave;nh phố kh&aacute;c.</p>\r\n\r\n<p>+ Kh&aacute;ch h&agrave;ng kiểm tra được trạng th&aacute;i vận chuyển của đơn h&agrave;ng (biết được đơn h&agrave;ng đ&atilde; được vận chuyển đến địa điểm n&agrave;o/ tỉnh n&agrave;o&hellip;.)</p>\r\n\r\n<p><br />\r\nQu&yacute; kh&aacute;ch c&oacute; nhu cầu đặt mua s&aacute;ch&nbsp;qua điện thoại hay phản hồi &yacute; kiến xin vui l&ograve;ng li&ecirc;n hệ:</p>\r\n\r\n<p>- Qua điện thoại:&nbsp;<strong>0123456789</strong>&nbsp;(bộ phận chăm s&oacute;c kh&aacute;ch h&agrave;ng)</p>\r\n\r\n<p>- Qua email: book_store@shop.com</p>\r\n\r\n<p><br />\r\nĐối t&aacute;c/c&aacute; nh&acirc;n c&oacute; nhu cầu li&ecirc;n hệ hợp t&aacute;c/ mua s&aacute;ch/ DVD,CD với số lượng lớn, xin vui l&ograve;ng li&ecirc;n hệ:</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` int(11) NOT NULL,
  `image_link` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `favicon` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hotline` int(15) NOT NULL,
  `analytic` text COLLATE utf8_unicode_ci NOT NULL,
  `analytic_2` text COLLATE utf8_unicode_ci NOT NULL,
  `chat_box` text COLLATE utf8_unicode_ci NOT NULL,
  `page_face` text COLLATE utf8_unicode_ci NOT NULL,
  `video_youtube` text COLLATE utf8_unicode_ci NOT NULL,
  `google_map` text COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `image_link`, `favicon`, `hotline`, `analytic`, `analytic_2`, `chat_box`, `page_face`, `video_youtube`, `google_map`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/bookstore/upload/images/logo/Book-header.png', 'http://localhost/bookstore/upload/images/logo/icon.png', 123456789, '                                                                                                                                                                                                                                                                                                                                                      ', '                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', '                                                                                                                                                                đây là chat_box                                                                                                                              ', '                                                                                                                                                                https://web.facebook.com/the.future.will.die                                                                                                                              ', '                                                                                                                                                                                                                                                                                              ', '                                                                                                                                                                                                                                                                                              ', 'Book Store : Nơi sẽ chia tri thức', 'Logo', 'Books, Books Online, Shop');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `title`, `content`, `meta_desc`, `meta_key`, `created`) VALUES
(1, 'Giới thiệu', '<p>Giới thiệu</p>\r\n', '', '', 0),
(2, 'Hướng dẫn mua hàng', '<p>Hướng dẫn mua hàng</p>\r\n', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `maker`
--

CREATE TABLE `maker` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `slug`, `image_link`, `site_title`, `meta_desc`, `meta_key`, `url`, `sort_order`) VALUES
(1, 0, 'menu-1', 'menu-1', '', '', '', '', 'http://google.com.vn', 1),
(2, 0, 'menu-2', '', '', '', '', '', 'http://dantri.com.vn', 2),
(4, 0, 'Menu 3', 'menu-3', '', 'day la menu 3', 'day la menu 3', 'day la menu 3', '', 4),
(5, 1, 'menu con 1.2', 'menu-con-12', '', 'seo menu con 1.2', 'seo menu con 1.2', 'seo menu con 1.2', '', 5),
(6, 1, 'menu con 1.1', 'menu-con-11', '', 'menu con 1.1', 'menu con 1.1', 'menu con 1.1', '', 0),
(7, 5, 'menu con 1.2.1', 'menu-cap-3', 'abc.jpg', 'abc', 'abc', 'abc', 'http://vinastar.net', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(150) COLLATE utf8_bin NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `feature` enum('0','1') COLLATE utf8_bin NOT NULL,
  `count_view` int(11) NOT NULL DEFAULT '0',
  `status` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `intro`, `content`, `site_title`, `meta_desc`, `meta_key`, `image_link`, `created`, `feature`, `count_view`, `status`) VALUES
(37, 'Chính phủ chỉ đạo làm rõ thông tin “mô hình” cả nhà làm quan ở Hải Dương', 'chinh-phu-chi-dao-lam-ro-thong-tin-mo-hinh-ca-nha-lam-quan-o-hai-duong', '<p>Thời gian vừa qua dư luận bức x&uacute;c về th&ocirc;ng tin những người th&acirc;n trong gia đ&igrave;nh b&iacute; thư, ph&oacute; b&iacute; thư thường trực huyện Kim Th&agrave;nh, tỉnh Hải Dương li&ecirc;n tiếp được bổ nhiệm nhiều vị tr&iacute; chủ ch', '<p>Thời gian vừa qua dư luận bức x&uacute;c về th&ocirc;ng tin những người th&acirc;n trong gia đ&igrave;nh b&iacute; thư, ph&oacute; b&iacute; thư thường trực huyện Kim Th&agrave;nh, tỉnh Hải Dương li&ecirc;n tiếp được bổ nhiệm nhiều vị tr&iacute; chủ chốt trong huyện. B&aacute;o D&acirc;n tr&iacute; đ&atilde; c&oacute; loạt b&agrave;i phản &aacute;nh thực trạng n&agrave;y tại địa phương tr&ecirc;n.</p>\r\n\r\n<p>Tuy nhi&ecirc;n với quan điểm của huyện Kim Th&agrave;nh th&igrave; việc bổ nhiệm người th&acirc;n trong một gia đ&igrave;nh của &ocirc;ng b&iacute; thư Nguyễn Hữu Tiến v&agrave; ph&oacute; b&iacute; thư trường trực L&ecirc; Ngọc Sang giữ nhiều chức vụ quan trọng tại địa phương l&agrave; chuyện b&igrave;nh thường, đảm bảo quy tr&igrave;nh v&agrave; kh&ocirc;ng c&oacute; g&igrave; lạ lẫm bởi đ&acirc;y l&agrave; một m&ocirc; h&igrave;nh dễ gặp ở nhiều địa phương kh&aacute;c.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="Văn bản chỉ đạo của phó thủ tướng về vấn đề cả họ làm quan mà theo phản ánh của Dân trí" id="img_89782" src="https://dantricdn.com/thumb_w/640/2017/van-ban-chinh-phu-chi-dao-1492607132073.jpg" /></p>\r\n\r\n<p>Văn bản chỉ đạo của ph&oacute; thủ tướng về vấn đề cả họ l&agrave;m quan m&agrave; theo phản &aacute;nh của D&acirc;n tr&iacute;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, tại Hải Ph&ograve;ng b&aacute;o D&acirc;n tr&iacute; cũng phản &aacute;nh việc 6 người trong gia đ&igrave;nh ph&oacute; chủ tịch thường trực huyện An Dương c&ugrave;ng giữ chức danh quan trọng tại huyện.</p>\r\n\r\n<p>Li&ecirc;n quan đến th&ocirc;ng tin n&agrave;y, Ph&oacute; thủ tướng ch&iacute;nh phủ Trương H&ograve;a B&igrave;nh vừa c&oacute; y&ecirc;u cầu Sở Nội vụ kiểm tra, l&agrave;m r&otilde; nội dung b&aacute;o ch&iacute; phản &aacute;nh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align:center"><img alt="Huyện Ủy Kim Thành, nơi có Bí thư và Phó bí thư đang được có nhiều người thân cùng làm lãnh đạo trong huyện này" id="img_87510" src="https://dantricdn.com/thumb_w/640/2017/img20170412110728-1492225542781.jpg" /></p>\r\n\r\n<p>Huyện Ủy Kim Th&agrave;nh, nơi c&oacute; B&iacute; thư v&agrave; Ph&oacute; b&iacute; thư đang được c&oacute; nhiều người th&acirc;n c&ugrave;ng l&agrave;m l&atilde;nh đạo trong huyện n&agrave;y</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cụ thể tại văn bản số 3902/ VPCP &ndash; TCCV ( v/v kiểm tra th&ocirc;ng tin b&aacute;o ch&iacute; tại Hải Ph&ograve;ng v&agrave; Hải Dương) ng&agrave;y 19/4/2017, do ph&oacute; chủ nhiệm Văn ph&ograve;ng ch&iacute;nh phủ Nguyễn Văn T&ugrave;ng k&yacute; n&ecirc;u r&otilde;: Ng&agrave;y 15 v&agrave; ng&agrave;y 17 th&aacute;ng 4 năm 2017, B&aacute;o D&acirc;n tr&iacute; c&oacute; b&agrave;i: &ldquo;Cả họ l&agrave;m quan l&agrave; một&hellip;m&ocirc; h&igrave;nh phổ biến&rdquo; phản &aacute;nh việc người th&acirc;n trong gia đ&igrave;nh B&iacute; thư v&agrave; Ph&oacute; B&iacute; thư huyện Kim Th&agrave;nh, tỉnh Hải Dương nắm giữ nhiều vị tr&iacute; l&atilde;nh đạo chủ chốt trong huyện; &ldquo;6 người trong một gia đ&igrave;nh giữ c&aacute;c chức danh quan trọng trong huyện&rdquo; phản &aacute;nh việc gia đ&igrave;nh &ocirc;ng ph&oacute; Chủ tịch UBND huyện An Dương, TP Hải Ph&ograve;ng c&oacute; 6 người c&ugrave;ng giữ c&aacute;c vị tr&iacute; chủ chốt trong bộ m&aacute;y ch&iacute;nh quyền.</p>\r\n\r\n<p>Về việc n&agrave;y, Ph&oacute; Thủ tướng Thường trực Trương H&ograve;a B&igrave;nh y&ecirc;u cầu Bộ Nội vụ khẩn trương kiểm tra, l&agrave;m r&otilde; nội dung b&aacute;o ch&iacute; phản &aacute;nh, b&aacute;o c&aacute;o Thủ Tướng Ch&iacute;nh Phủ trước ng&agrave;y 28/04/2017.</p>\r\n', 'Chính phủ chỉ đạo làm rõ thông tin “mô hình” cả nhà làm quan ở Hải Dương', 'Chính phủ chỉ đạo làm rõ thông tin “mô hình” cả nhà làm quan ở Hải Dương', 'Chính phủ chỉ đạo làm rõ thông tin “mô hình” cả nhà làm quan ở Hải Dương', 'https://dantricdn.com/thumb_w/640/2017/van-ban-chinh-phu-chi-dao-1492607132073.jpg', 1492674567, '0', 1, 1),
(36, 'Tòa án quốc tế kết luận Monsanto hủy hoại môi trường Việt Nam', 'toa-an-quoc-te-ket-luan-monsanto-huy-hoai-moi-truong-viet-nam', '<p>Nếu tội sử dụng &ldquo;thuộc hủy diệt sinh th&aacute;i&rdquo; được thừa nhận trong luật h&igrave;nh sự quốc tế th&igrave; c&aacute;c hoạt động của Monsanto đ&atilde; phạm phải tội danh như vậy, c&aacute;c thẩm ph&aacute;n quốc tế tuy&ecirc;n bố trong&l', '<p>Nếu tội sử dụng &ldquo;thuộc hủy diệt sinh th&aacute;i&rdquo; được thừa nhận trong luật h&igrave;nh sự quốc tế th&igrave; c&aacute;c hoạt động của Monsanto đ&atilde; phạm phải tội danh như vậy, c&aacute;c thẩm ph&aacute;n quốc tế tuy&ecirc;n bố trong phi&ecirc;n t&ograve;a chống lại tập đo&agrave;n h&oacute;a chất khổng lồ của Mỹ tại La Hay, H&agrave; Lan ng&agrave;y 18/4.&nbsp;</p>\r\n\r\n<p style="text-align:center"><iframe frameborder="0" height="306.6666666666667" scrolling="no" src="http://vcplayer.vcmedia.vn/1.1/?_site=dantri&amp;vid=dantri/gheei6bw7jjfcvlgm2hdnsm3blzbgl/2017/04/19/nxrohrxc6ne-354c0.mp4&amp;autoplay=false&amp;_info=12008936a2a548f3abb98eb6054bd552&amp;_listsuggest=http://wcm.dantri.com.vn/video/zone-6/suggest-videos.htm" width="460"></iframe></p>\r\n\r\n<p>T&ograve;a &aacute;n quốc tế kết luận Monsanto hủy hoại m&ocirc;i trường Việt Nam</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align:center"><img alt="\r\nCác thẩm phán trong Tòa án Quốc tế về Monsanto tại La Hay, Hà Lan ngày 18/4 (Ảnh: EFE)\r\n" id="img_58f62600-24fa-11e7-a8ef-278aa46c14f5" src="https://dantricdn.com/2017/monsanto-jpg-1718483346-1492604320549.jpg" /></p>\r\n\r\n<p>C&aacute;c thẩm ph&aacute;n trong T&ograve;a &aacute;n Quốc tế về Monsanto tại La Hay, H&agrave; Lan ng&agrave;y 18/4 (Ảnh: EFE)</p>\r\n\r\n<p>H&atilde;ng tin&nbsp;<em>AP</em>&nbsp;đưa tin, T&ograve;a &aacute;n Quốc tế Monsanto tại La Hay, H&agrave; Lan do c&aacute;c nh&oacute;m c&aacute;c nh&agrave; hoạt động thiết lập ng&agrave;y 18/4 đ&atilde; đưa ra &yacute; kiến tham vấn về c&aacute;c hoạt động của tập đo&agrave;n h&oacute;a chất khổng lồ của Mỹ. Chủ tọa - thẩm ph&aacute;n Fran&ccedil;oise Tulkens - đ&atilde; thay mặt ban bồi thẩm gồm 5 th&agrave;nh vi&ecirc;n c&ocirc;ng bố kết luận sau hai ng&agrave;y điều trần hồi th&aacute;ng 10 năm ngo&aacute;i v&agrave; nhiều th&aacute;ng xem x&eacute;t c&aacute;c bằng chứng.</p>\r\n\r\n<p>Monsanto l&agrave; c&ocirc;ng ty c&ocirc;ng nghệ sinh học của Mỹ từng sản xuất chất độc da cam m&agrave; qu&acirc;n đội Mỹ rải xuống Việt Nam trong Chiến tranh Việt Nam.</p>\r\n\r\n<p>Phi&ecirc;n t&ograve;a đ&atilde; xem x&eacute;t 6 vấn đề ch&iacute;nh li&ecirc;n quan tới c&aacute;c hoạt động của Monsanto. Trong v&agrave;i th&aacute;ng qua, 5 thẩm ph&aacute;n nổi tiếng thế giới của T&ograve;a &aacute;n Quốc tế Monsanto đ&atilde; lắng nghe 30 nh&acirc;n chứng v&agrave; c&aacute;c chuy&ecirc;n gia từ 5 ch&acirc;u lục n&oacute;i về c&aacute;c vấn đề được đưa ra ra t&ograve;a.</p>\r\n\r\n<p>Đối với 4 vấn đề li&ecirc;n quan tới c&aacute;c vấn đề về nh&acirc;n quyền, t&ograve;a kết luận rằng Monsanto đ&atilde; &ldquo;đ&atilde; tham gia v&agrave;o c&aacute;c hoạt động g&acirc;y t&aacute;c hại tới c&aacute;c quyền của con người về một m&ocirc;i trường v&agrave; lương thực l&agrave;nh mạnh, v&agrave; sức khỏe tốt&rdquo;.</p>\r\n\r\n<p>T&ograve;a &aacute;n cho hay, Monsanto đ&atilde; l&agrave;m ảnh hưởng tới đời sống v&agrave; sức khỏe c&aacute;c c&aacute;c n&ocirc;ng d&acirc;n v&agrave; những người kh&aacute;c khắp thế giới khi sản xuất v&agrave; b&aacute;n nhiều loại h&oacute;a chất nguy hiểm, như thuốc diệt cỏ Roundup, v&agrave; c&aacute;c loại hạt giống biến đổi gen.</p>\r\n\r\n<p>Vấn đề thứ 5 li&ecirc;n quan tới sự đồng l&otilde;a của Monsanto trong c&aacute;c tội &aacute;c chiến tranh trong cuộc chiến của Mỹ tại Việt Nam. Theo đ&oacute;, trong giai đoạn (1962-1973), hơn 70 triệu l&iacute;t chất độc da cam (chứa dioxin) đ&atilde; bị rải xuống gần 2,6 triệu h&eacute;c-ta đất tại Việt Nam, g&acirc;y ra c&aacute;c vấn đề sức khỏe nghi&ecirc;m trọng đối với người d&acirc;n Việt Nam. H&oacute;a chất đ&oacute; cũng g&acirc;y tổn hại cho c&aacute;c binh sĩ Mỹ v&agrave; c&aacute;c nước kh&aacute;c, g&acirc;y ra c&aacute;c vụ kiện tụng về sự li&ecirc;n quan của Monsanto trong cuộc chiến.</p>\r\n\r\n<p>Về vấn đề thứ 6, t&ograve;a &aacute;n kết luận rằng nếu tội sử dụng &ldquo;thuộc hủy diệt sinh th&aacute;i&rdquo; được thừa nhận trong luật h&igrave;nh sự quốc tế th&igrave; c&aacute;c hoạt động của Monsanto đ&atilde; phạm phải tội danh như vậy. Khi đi đến kết luận n&agrave;y, t&ograve;a &aacute;n nhấn mạnh rằng tội sử dụng thuộc hủy diệt sinh th&aacute;i n&ecirc;n được quy định ch&iacute;nh x&aacute;c v&agrave; r&otilde; r&agrave;ng v&agrave; được khẳng định bởi luật h&igrave;nh sự quốc tế.</p>\r\n\r\n<p><strong>Bảo vệ thế giới khỏi c&aacute;c h&oacute;a chất độc hại</strong></p>\r\n\r\n<p style="text-align:center"><img alt="\r\nMột cuộc biểu tình phản đối Monsanto tại La Hay, Hà Lan hồi tháng 10/2016 (Ảnh: Monsanto Tribunal)\r\n" id="img_a58de2e0-24fb-11e7-b630-eb19d879ac9b" src="https://dantricdn.com/thumb_w/640/2017/monsanto-ecocide-1492604877849.jpg" /></p>\r\n\r\n<p>Một cuộc biểu t&igrave;nh phản đối Monsanto tại La Hay, H&agrave; Lan hồi th&aacute;ng 10/2016 (Ảnh: Monsanto Tribunal)</p>\r\n\r\n<p>Được th&agrave;nh lập bởi một nh&oacute;m gồm c&aacute;c tổ chức x&atilde; hội d&acirc;n sự n&ecirc;n kết luận của t&ograve;a kh&ocirc;ng c&oacute; gi&aacute; trị r&agrave;ng buộc ph&aacute;p l&yacute;. Tuy nhi&ecirc;n, c&aacute;c kết luận n&agrave;y đ&atilde; th&uacute;c đẩy nỗ lực lớn hơn của nh&oacute;m &ldquo;nhằm bảo vệ c&aacute;c hạt giống, đất, c&aacute;c cộng đồng v&agrave; x&atilde; hội, h&agrave;nh tinh v&agrave; ch&iacute;nh ch&uacute;ng ta khỏi c&aacute;c h&oacute;a chất độc hại&rdquo;, Vandana Shiva, người đứng đầu tổ chức Navdanya, cho biết hồi năm ngo&aacute;i.</p>\r\n\r\n<p>C&aacute;c thẩm ph&aacute;n cũng viết rằng &ldquo;kết luận tham vấn n&agrave;y l&agrave; t&iacute;n hiệu mạnh mẽ gửi tới kh&ocirc;ng chỉ những người li&ecirc;n quan tới luật ph&aacute;p quốc tế, m&agrave; c&ograve;n l&agrave; nạn nh&acirc;n của c&aacute;c h&oacute;a chất độc hại v&agrave; quyền lực của c&aacute;c tập đo&agrave;n. Phi&ecirc;n t&ograve;a đ&atilde; tạo ra c&aacute;c li&ecirc;n kế v&agrave; chia sẻ th&ocirc;ng tin quan trọng giữa c&aacute;c luật sư v&agrave; c&aacute;c tổ chức đại diện cho c&aacute;c nạn nh&acirc;n. V&igrave; vậy, nhiều khả năng kết luận n&agrave;y sẽ dẫn tới c&aacute;c vụ việc ph&aacute;p l&yacute; hơn chống lại Monsanto v&agrave; c&aacute;c c&ocirc;ng ty tương tự&hellip; C&aacute;c c&ocirc;ng ty g&acirc;y thiệt hại tới sức khỏe, thực phẩm v&agrave; m&ocirc;i trường n&ecirc;n v&agrave; sẽ phải chịu tr&aacute;ch nhiệm về h&agrave;nh động của họ&rdquo;.</p>\r\n\r\n<p>Katherine Paul, gi&aacute;m đốc Hiệp hội những người ti&ecirc;u d&ugrave;ng Organic, cho rằng &ldquo;hi vọng c&ocirc;ng việc m&agrave; T&ograve;a &aacute;n Monsanto ho&agrave;n th&agrave;nh trong 6 th&aacute;ng qua sẽ gi&uacute;p &iacute;ch cho c&aacute;c nh&agrave; hoạch định ch&iacute;nh s&aacute;ch quốc tế v&agrave; c&aacute;c t&ograve;a &aacute;n trong bối cảnh họ t&igrave;m kiếm c&aacute;c c&aacute;ch thức nhằm buộc c&aacute;c tập đo&agrave;n đa quốc gia chịu tr&aacute;ch nhiệm về những thiệt hại m&agrave; họ g&acirc;y ra đối với quyền của ch&uacute;ng ta về sức khỏe v&agrave; m&ocirc;i trường c&oacute; lợi&rdquo;.</p>\r\n\r\n<p style="text-align:center">&nbsp;</p>\r\n', 'Tòa án quốc tế kết luận Monsanto hủy hoại môi trường Việt Nam', 'Tòa án quốc tế kết luận Monsanto hủy hoại môi trường Việt Nam', 'Tòa án quốc tế kết luận Monsanto hủy hoại môi trường Việt Nam', 'https://dantricdn.com/zoom/327_245/2017/monsanto-jpg-1718483346-1492604320549.jpg', 1493437126, '0', 22, 1),
(38, 'Đằng sau chuyện tàu chiến Mỹ “mất tích” trên đường tới Triều Tiên', 'dang-sau-chuyen-tau-chien-my-mat-tich-tren-duong-toi-trieu-tien', '<p>Tuần trước, Nh&agrave; Trắng th&ocirc;ng b&aacute;o, một bi&ecirc;n đội t&agrave;u chiến của Mỹ do t&agrave;u s&acirc;n bay USS Carl Vinson dẫn đầu đang tiến về s&aacute;t b&aacute;n đảo Triều Ti&ecirc;n. Nh&agrave; Trắng n&oacute;i rằng, t&agrave;u US', '<p style="text-align:center"><img alt="\r\nTàu USS Carl Vinson của Mỹ. (Ảnh: EPA)\r\n" id="img_c95bee90-250c-11e7-915b-19efc46c8118" src="https://dantricdn.com/thumb_w/640/2017/tau-1492612258886.jpg" /></p>\r\n\r\n<p style="text-align:center">T&agrave;u USS Carl Vinson của Mỹ. (Ảnh: EPA)</p>\r\n\r\n<p>Tuần trước, Nh&agrave; Trắng th&ocirc;ng b&aacute;o, một bi&ecirc;n đội t&agrave;u chiến của Mỹ do t&agrave;u s&acirc;n bay USS Carl Vinson dẫn đầu đang tiến về s&aacute;t b&aacute;n đảo Triều Ti&ecirc;n. Nh&agrave; Trắng n&oacute;i rằng, t&agrave;u USS Carl Vinson đ&atilde; hủy chuyến thăm Australia, thay v&agrave;o đ&oacute; tiến về v&ugrave;ng biển Nhật Bản để gửi gắm th&ocirc;ng điệp răn đe đến Triều Ti&ecirc;n.</p>\r\n\r\n<p>Th&ocirc;ng tin n&agrave;y từ Nh&agrave; Trắng đ&atilde; nhanh ch&oacute;ng xuất hiện ở trang nhất của nhiều tờ b&aacute;o khắp Đ&ocirc;ng &Aacute; với những đồn đo&aacute;n rằng Mỹ c&oacute; thể sắp tấn c&ocirc;ng phủ đầu Triều Ti&ecirc;n.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, một tuần sau đ&oacute;, Hải qu&acirc;n Mỹ v&ocirc; t&igrave;nh c&ocirc;ng bố một bức ảnh cho thấy hạm đội n&agrave;y đang neo tại v&ugrave;ng biển của Indonesia, hay n&oacute;i c&aacute;ch kh&aacute;c l&agrave; kh&ocirc;ng hề gần b&aacute;n đảo Triều Ti&ecirc;n như tin tức trước đ&oacute;.</p>\r\n\r\n<p>L&yacute; giải về điều n&agrave;y, một quan chức cấp cao Nh&agrave; Trắng n&oacute;i rằng, đ&atilde; c&oacute; sai s&oacute;t trong qu&aacute; tr&igrave;nh trao đổi th&ocirc;ng tin giữa Nh&agrave; Trắng v&agrave; Lầu Năm G&oacute;c về hoạt động của nh&oacute;m t&aacute;c chiến USS Carl Vinson do c&aacute;c chỉ huy đ&atilde; kh&ocirc;ng theo d&otilde;i s&aacute;t sao lộ tr&igrave;nh di chuyển của t&agrave;u n&agrave;y.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, điều đ&aacute;ng n&oacute;i l&agrave;, sau khi nhận ra sự thiếu nhất qu&aacute;n n&agrave;y, cả Nh&agrave; Trắng v&agrave; Lầu Năm G&oacute;c vẫn giữ im lặng, một động th&aacute;i m&agrave; dư luận cho rằng khiến t&igrave;nh h&igrave;nh b&aacute;n đảo Triều Ti&ecirc;n c&agrave;ng th&ecirc;m căng thẳng. Bộ Tư lệnh Th&aacute;i B&igrave;nh Dương Mỹ đến h&ocirc;m qua 18/4 mới ch&iacute;nh thức ra th&ocirc;ng c&aacute;o n&oacute;i rằng nh&oacute;m t&agrave;u t&aacute;c chiến USS Carl Vinson hiện giờ mới thực sự tiến về ph&iacute;a b&aacute;n đảo Triều Ti&ecirc;n.</p>\r\n', 'Đằng sau chuyện tàu chiến Mỹ “mất tích” trên đường tới Triều Tiên', 'Đằng sau chuyện tàu chiến Mỹ “mất tích” trên đường tới Triều Tiên', 'Đằng sau chuyện tàu chiến Mỹ “mất tích” trên đường tới Triều Tiên', 'https://dantricdn.com/thumb_w/640/2017/tau-1492612258886.jpg', 1492674886, '0', 26, 1),
(39, '36 trường đại học có số lượng nguyện vọng đăng ký xét tuyển cao nhất nước', '36-truong-dai-hoc-co-so-luong-nguyen-vong-dang-ky-xet-tuyen-cao-nhat-nuoc', '<p>Theo thống k&ecirc; của Bộ GD&amp;ĐT, t&iacute;nh đến 10h30 ng&agrave;y 19/4, trường ĐH Cần Thơ vẫn l&agrave; trường đứng thứ hạng cao nhất về số lượng nộp hồ sơ đăng k&yacute; x&eacute;t tuyển l&agrave; 93.347, tiếp đến l&agrave; trường ĐH C&ocirc;ng&', '<p>Theo thống k&ecirc; của Bộ GD&amp;ĐT t&iacute;nh đến 10h s&aacute;ng ng&agrave;y 18/4, đ&atilde; c&oacute; 583.221 (74.84%) hồ sơ đăng k&yacute; x&eacute;t tuyển đại học tr&ecirc;n tổng số 779,340 hồ sơ đăng k&yacute; dự thi.</p>\r\n\r\n<p>Đ&aacute;ng ch&uacute; &yacute;, số lượng th&iacute; sinh đăng k&yacute; x&eacute;t tuyển từ 5 nguyện vọng trở l&ecirc;n khoảng gần 500.000.</p>\r\n\r\n<p><em>Dưới đ&acirc;y l&agrave; danh s&aacute;ch 36 trường đại học c&oacute; số lượng nguyện vọng đăng k&yacute; cao nhất nước t&iacute;nh đến thời điểm 10h30 ph&uacute;t ng&agrave;y 19/4.</em></p>\r\n\r\n<p style="text-align:center"><img alt="" id="img_2c74e050-24e4-11e7-915b-19efc46c8118" src="https://dantricdn.com/thumb_w/640/2017/screen-shot-2017-04-19-at-4-38-36-pm-1492594802690.png" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style="text-align:center"><img alt="" id="img_2c95d5d0-24e4-11e7-b3d7-d9e94ef10d9e" src="https://dantricdn.com/thumb_w/640/2017/screen-shot-2017-04-19-at-4-38-59-pm-1492594802693.png" /></p>\r\n\r\n<p style="text-align:center"><img alt="" id="img_2cafed80-24e4-11e7-bf8e-81a5c51653e1" src="https://dantricdn.com/thumb_w/640/2017/screen-shot-2017-04-19-at-4-39-32-pm-1492594802697.png" /></p>\r\n\r\n<p style="text-align:center"><em>Tiếp tục cập nhật...!</em></p>\r\n', '36 trường đại học có số lượng nguyện vọng đăng ký xét tuyển cao nhất nước', '36 trường đại học có số lượng nguyện vọng đăng ký xét tuyển cao nhất nước', '36 trường đại học có số lượng nguyện vọng đăng ký xét tuyển cao nhất nước', 'https://dantricdn.com/thumb_w/640/2017/screen-shot-2017-04-19-at-4-38-59-pm-1492594802693.png', 1493437051, '0', 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `product_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `data` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`transaction_id`, `id`, `product_id`, `product_name`, `image_link`, `qty`, `amount`, `data`, `status`) VALUES
(77, 80, 552, 'Đứa con xa lạ', 'http://anybooks.vn/images/book/image/dua_con_xa_la.jpg', 2, '204000.0000', '', 0),
(78, 81, 536, 'Phụ Nữ Là Phải Đẹp', 'http://anybooks.vn/images/book/image/phu_nu_la_phai_dep.jpg', 1, '140000.0000', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(5) NOT NULL,
  `menu_id` int(5) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image_link` text COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(20) NOT NULL,
  `count_view` int(5) NOT NULL,
  `site_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `address_id` int(5) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` text COLLATE utf8_unicode_ci NOT NULL,
  `maker_id` int(255) NOT NULL,
  `price` int(20) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tac_gia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `xuat_ban` text COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `image_link` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `created_new` int(20) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `warranty` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(255) NOT NULL,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL,
  `rate_count` int(255) NOT NULL,
  `nxb` text COLLATE utf8_unicode_ci NOT NULL,
  `nph` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `feature` enum('0','1') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` int(2) NOT NULL,
  `noi_bat` int(2) NOT NULL,
  `dang_bia` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kich_thuoc` text COLLATE utf8_unicode_ci NOT NULL,
  `ma_sp` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `khoi_luong` text COLLATE utf8_unicode_ci NOT NULL,
  `gifts` text COLLATE utf8_unicode_ci NOT NULL,
  `so_trang` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `address_id`, `name`, `slug`, `maker_id`, `price`, `content`, `tac_gia`, `xuat_ban`, `discount`, `image_link`, `image_list`, `created`, `created_new`, `view`, `meta_key`, `site_title`, `warranty`, `total`, `buyed`, `rate_total`, `rate_count`, `nxb`, `nph`, `meta_desc`, `feature`, `status`, `noi_bat`, `dang_bia`, `kich_thuoc`, `ma_sp`, `khoi_luong`, `gifts`, `so_trang`) VALUES
(505, 271, 0, 'Gái Phượt', 'gai-phuot', 0, 69000, '<h4><strong>G&aacute;i phượt</strong>&nbsp;l&agrave; c&ocirc; g&aacute;i y&ecirc;u đương mộng mơ khắc khoải theo những cung đường, m&agrave; ngay cả khi tiễn biệt một mối t&igrave;nh cũng phải đi một chuyến để chia tay. L&agrave; người mẹ tự tin một m&igrave;nh x&aacute;ch con l&ecirc;n đường, coi con l&agrave; bạn đồng h&agrave;nh, để con c&oacute; thể học từ thi&ecirc;n nhi&ecirc;n, học từ cuộc sống&hellip;<br />\r\n<br />\r\n&ldquo; Đọc&nbsp;<strong>G&aacute;i phượt</strong>, qua những trang viết hấp dẫn, khi h&agrave;i hước, l&uacute;c rưng rưng, t&ocirc;i như thấy thấp tho&aacute;ng ch&iacute;nh m&igrave;nh trong đ&oacute; khi bỏ lại sau lưng cuộc sống an to&agrave;n để l&ecirc;n đường t&igrave;m kiếm những chuyến phi&ecirc;u lưu. T&ocirc;i y&ecirc;u những người con g&aacute;i đi phượt bởi sự mạnh mẽ của họ, cả tr&ecirc;n đường v&agrave; cả trong cuộc sống. Th&ecirc;m nữa, những trang viết về c&aacute;c thế hệ phượt đầu ti&ecirc;n cũng rất th&uacute; vị đối với t&ocirc;i.&rdquo; - Nguyễn Thị Kim Ng&acirc;n, t&aacute;c giả N&agrave;o, m&igrave;nh c&ugrave;ng đạp xe đến Paris cho biết.</h4>\r\n', 'Yếm Đào Lẳng Lơ', '15-02-2017', 12000, 'http://anybooks.vn/images/book/image/gai_phuot.jpg', '[""]', 1492741479, 0, 0, 'Gái Phượt', 'Gái Phượt', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Gái Phượt', '0', 0, 1, 'Bìa mềm', '14 x 20.5 cm', '', '280 gram', '', 255),
(506, 271, 0, 'Ai Cũng Đã Từng Yêu Như Thế (Tái Bản 2017)', 'ai-cung-da-tung-yeu-nhu-the', 0, 79000, '<p><strong>Phan &Yacute; Y&ecirc;n</strong>&nbsp;được bạn đọc tuổi mới lớn biết đến l&agrave; c&acirc;y b&uacute;t viết về t&igrave;nh y&ecirc;u, t&acirc;m sự của tuổi trẻ... những điều giới trẻ đang rất quan t&acirc;m hiện nay. Ai cũng đ&atilde; từng y&ecirc;u như thế của c&ocirc; l&agrave; một trong những t&aacute;c phẩm được chiếm cảm t&igrave;nh của kh&ocirc;ng &iacute;t độc giả trẻ.<br />\r\n<br />\r\nĐọc cuốn s&aacute;ch n&agrave;y, chắc hẳn bạn đọc sẽ thấy đồng cảm, đ&ocirc;i l&uacute;c c&ograve;n t&igrave;m thấy m&igrave;nh trong c&acirc;u chữ đ&oacute;, rằng bản th&acirc;n cũng từng c&oacute; thời gian y&ecirc;u hết m&igrave;nh như thế.<br />\r\n<br />\r\nCuốn s&aacute;ch gồm 3 t&aacute;c phẩm nhỏ l&agrave;<strong>&nbsp;Mối t&igrave;nh đầu, Tưởng y&ecirc;u m&agrave; kh&ocirc;ng phải y&ecirc;u, Đừng đi</strong>. Với mỗi phần, t&aacute;c giả viết những truyện ngắn kh&aacute;c nhau với nh&acirc;n vật, nội dung kh&ocirc;ng tr&ugrave;ng nhau nhưng đều thể hiện về chủ đề t&igrave;nh y&ecirc;u của giới trẻ v&agrave; c&aacute;ch nh&igrave;n của t&aacute;c giả về t&igrave;nh đầu.<br />\r\n<br />\r\nT&aacute;c giả cho rằng t&igrave;nh đầu kh&ocirc;ng nhất thiết phải l&agrave; t&igrave;nh y&ecirc;u đ&ocirc;i lứa, c&oacute; thể l&agrave; t&igrave;nh cảm của con g&aacute;i d&agrave;nh cho cha hay đơn giản chỉ l&agrave; một mối t&igrave;nh m&agrave; sau n&agrave;y bạn gặp gỡ ai cũng đều so s&aacute;nh với người ấy. Đ&oacute; l&agrave; người m&agrave; bạn thỉnh thoảng vẫn nhớ tới, qu&ecirc;n đi l&agrave; điều kh&ocirc;ng thể.<br />\r\n<br />\r\nTrong phần&nbsp;<strong>Mối t&igrave;nh đầu</strong>&nbsp;của cuốn s&aacute;ch, t&aacute;c giả kể về c&ocirc; b&eacute; Miki với dị tật từ nhỏ. C&ocirc; sống trong mặc cảm v&agrave; xa l&aacute;nh từ bạn b&egrave;. Miki chỉ c&oacute; bố v&agrave; ch&uacute; thỏ b&ocirc;ng Zil l&agrave;m bạn. V&igrave; thế, c&ocirc; d&agrave;nh t&igrave;nh cảm đặc biệt cho bố. Khi bố mất đi, Miki lu&ocirc;n lu&ocirc;n nhớ tới v&agrave; lấy đ&oacute; l&agrave;m động lực để vượt qua mọi kh&oacute; khăn. Cũng từ đ&oacute;, h&agrave;nh trang suốt qu&atilde;ng đường của em l&agrave; &quot;mối t&igrave;nh đầu&quot; mang t&ecirc;n bố.<br />\r\n<br />\r\nỞ đ&oacute;, bạn đọc c&ograve;n thấy được c&ocirc; g&aacute;i t&ecirc;n M&acirc;y trong phần Tưởng y&ecirc;u m&agrave; kh&ocirc;ng phải y&ecirc;u. Khi c&ocirc; c&ograve;n đang trong tuổi ăn chưa no, lo chưa tới th&igrave; đ&atilde; mồ c&ocirc;i cả bố lẫn mẹ. Từ đ&oacute;, M&acirc;y sống kh&eacute;p k&iacute;n, lạnh l&ugrave;ng hơn với mọi người xung quanh.<br />\r\n<br />\r\nSau đ&oacute;, c&ocirc; gặp Phong trong một t&igrave;nh huống dở kh&oacute;c dở cười. Bất ngờ, họ trở th&agrave;nh đồng nghiệp của nhau. Những rắc rối đến với c&ocirc; bắt đầu lần lượt tới, từ quan hệ c&ocirc;ng việc, bạn b&egrave;, t&igrave;nh y&ecirc;u... đều bị rối tung l&ecirc;n, kh&ocirc;ng thể kiểm so&aacute;t.<br />\r\n<br />\r\nQua c&acirc;u chuyện của M&acirc;y, t&aacute;c giả muốn gửi gắm tới bạn đọc nhiều triết l&yacute; về sự biến đổi trong cuộc sống. Đ&oacute; l&agrave;: &quot;Những điều ch&uacute;ng ta nhận được rồi sẽ biến mất. Những g&igrave; đổ vỡ rồi sẽ được x&acirc;y đắp lại, những điều mới mẻ sẽ thay thế t&agrave;n dư cũ...&quot;.<br />\r\n<br />\r\nPhần&nbsp;<strong>Đừng đi&nbsp;</strong>của cuốn s&aacute;ch n&agrave;y, t&aacute;c giả kể với văn phong ho&agrave;n to&agrave;n kh&aacute;c, kh&ocirc;ng c&ograve;n l&atilde;ng mạn, trữ t&igrave;nh m&agrave; thay v&agrave;o đ&oacute; l&agrave; sự kết hợp giữa t&igrave;nh y&ecirc;u v&agrave; trinh th&aacute;m huyễn tưởng. Ở đ&oacute;, t&aacute;c phẩm kể về sự gặp gỡ của M&acirc;y v&agrave; anh ch&agrave;ng t&ecirc;n Khang. Người đ&agrave;n &ocirc;ng n&agrave;y đang mong muốn v&agrave; cố gắng thay đổi qu&aacute; khứ để cứu sống bạn g&aacute;i của m&igrave;nh đ&atilde; qua đời 4 th&aacute;ng trước trong một vụ tai nạn.<br />\r\n<br />\r\nKhi được trao một chiếc đồng hồ c&oacute; thể quay ngược thời gian, M&acirc;y kh&ocirc;ng biết phải l&agrave;m thế n&agrave;o trước 2 sự lựa chọn: gặp bố mẹ v&agrave; lời cầu xin cứu người y&ecirc;u của Khang...<br />\r\n<br />\r\nVới lối viết nhẹ nh&agrave;ng, c&aacute;ch kể chuyện đi v&agrave;o l&ograve;ng người, Phan &Yacute; Y&ecirc;n đ&atilde; kh&eacute;o l&eacute;o đưa mỗi cuộc t&igrave;nh một c&acirc;u chuyện chứa đựng c&aacute;c cảm x&uacute;c kh&aacute;c nhau: vui - buồn, đau khổ - hạnh ph&uacute;c... Nhưng ở trạng th&aacute;i n&agrave;o, c&ocirc; g&aacute;i vẫn nhẹ nh&agrave;ng, th&aacute;nh thiện.<br />\r\n<br />\r\nMỗi nh&acirc;n vật trong c&acirc;u chuyện mang đến cho bạn đọc nhiều cảm x&uacute;c kh&aacute;c nhau. Đ&ocirc;i khi, bạn c&ograve;n bắt gặp h&igrave;nh ảnh của m&igrave;nh trong đ&oacute;. V&agrave; th&ocirc;ng qua Ai cũng đ&atilde; từng y&ecirc;u như thế, t&aacute;c giả mang đến những triết l&yacute; s&acirc;u sắc về t&igrave;nh y&ecirc;u để gi&uacute;p bạn đọc biết y&ecirc;u đời, y&ecirc;u người hơn.</p>\r\n', 'Phan Ý Liên', '17-03-2017', 14000, 'http://anybooks.vn/images/book/image/ai_cung_da_tung_yeu_nhu_the_tai_ban_2017_.jpg', '[""]', 1492741525, 0, 4, 'Ai Cũng Đã Từng Yêu Như Thế', 'Ai Cũng Đã Từng Yêu Như Thế', '', 0, 0, 0, 0, '', '', 'Ai Cũng Đã Từng Yêu Như Thế', '0', 0, 0, 'Bìa mềm', '12 x 20 cm', '', '300 gram', '', 248),
(507, 271, 0, '6 Ngày', '6-ngay', 0, 105000, '<p>6 ng&agrave;y của một tuần với c&aacute;c buổi s&aacute;ng trưa chiều tối đ&ecirc;m. Nh&acirc;n vật c&ocirc;ng chức sống thế n&agrave;o trong một ng&agrave;y ấy trong thế giới của m&igrave;nh, nghĩ thế n&agrave;o cho mỗi c&ocirc;ng việc, vui buồn thế n&agrave;o cho mổi chuyện anh chứng kiến v&agrave; tham dự. Cuộc sống th&igrave; đẹp, đời người th&igrave; hữu hạn, vui vẻ hay ch&aacute;n chường, gi&agrave;u hay ngh&egrave;o kh&ocirc;ng phải l&agrave; việc quan trọng nữa, m&agrave; quan trọng l&agrave; được sống b&igrave;nh thường.</p>\r\n', 'Tô Hải Vân', '15-02-2017', 17000, 'http://anybooks.vn/images/book/image/6_ngay.jpg', '[""]', 1492741635, 0, 0, '6 Ngày', '6 Ngày', '', 0, 0, 0, 0, 'Trẻ', 'Trẻ', '6 Ngày', '0', 0, 0, 'Bìa mềm', '13 x 20 cm', '', '600 gram', '', 368),
(508, 271, 0, 'Thời Đại Gái Ế', 'thoi-dai-gia-e', 0, 83000, '<p>Linh l&agrave; một &ldquo;g&aacute;i ế&rdquo;. Ế theo quan niệm của mẹ c&ocirc;, của bạn b&egrave;, người th&acirc;n, v&agrave; của ch&iacute;nh x&atilde; hội m&agrave; c&ocirc; đang sống. Hai mươi t&aacute;m tuổi, chỉ vắt vai đ&uacute;ng một mối t&igrave;nh, lại l&agrave; t&igrave;nh đơn phương với Việt - ch&agrave;ng trai c&ocirc; thầm thương trộm nhớ từ thuở c&ograve;n ngồi tr&ecirc;n ghế nh&agrave; trường. Nhưng Linh vẫn l&ecirc; la h&agrave;ng qu&aacute;n vỉa h&egrave;, vẫn ng&agrave;y ng&agrave;y quấn qu&yacute;t c&ugrave;ng An - c&ocirc; bạn th&acirc;n cũng thuộc dạng &ldquo;g&aacute;i ế&rdquo;, vẫn sống v&ocirc; tư, ph&oacute;ng kho&aacute;ng, độc lập v&agrave; y&ecirc;u đời.&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<p>Bỗng một ng&agrave;y, Linh gặp Phong, ch&agrave;ng trai h&agrave;o hoa phong nh&atilde;, con nh&agrave; t&agrave;i phiệt m&agrave; mẹ c&ocirc; &eacute;p đi xem mắt. Anh bước v&agrave;o cuộc sống của c&ocirc; &agrave;o ạt như một cơn gi&oacute;, khiến cho tr&aacute;i tim bướng bỉnh ấy đổi thay để rồi say đắm trong t&igrave;nh y&ecirc;u ngọt ng&agrave;o. Nhưng hạnh ph&uacute;c chẳng được bao l&acirc;u, s&oacute;ng gi&oacute; đ&atilde; li&ecirc;n tiếp ập đến. Giữa những đẩy x&ocirc; của số phận, những &acirc;n o&aacute;n thương trường, những hiểu lầm chồng chất v&agrave; cả sự trở lại của Việt, liệu rằng cuối con đường, Phong v&agrave; Linh c&oacute; t&igrave;m thấy nhau?<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Một số tr&iacute;ch dẫn:</strong><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Nếu thật sự t&igrave;nh y&ecirc;u kh&ocirc;ng cần đến dũng kh&iacute;, th&igrave; nhiều người trong ch&uacute;ng ta đ&atilde; chẳng chọn c&ocirc; đơn.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Người cũ kh&ocirc;ng nhất thiết phải qu&ecirc;n, nhưng nhất thiết phải bu&ocirc;ng...&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Sống v&igrave; m&igrave;nh, sống l&agrave; m&igrave;nh, y&ecirc;u ai th&igrave; cứ y&ecirc;u, muốn ở cạnh ai th&igrave; cứ ở cạnh người ấy, buồn lo th&igrave; chia sẻ, mệt mỏi th&igrave; dựa dẫm, nghĩ ngợi &iacute;t th&ocirc;i, hận th&ugrave; gh&eacute;t bỏ cũng &iacute;t th&ocirc;i.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Hầu như tất cả mọi thứ tr&ecirc;n đời chỉ cần nỗ lực v&agrave; thời gian l&agrave; đều c&oacute; thể c&oacute; được. Ngoại trừ t&igrave;nh cảm.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;C&oacute; được t&igrave;nh cảm của ai đ&oacute;, kh&ocirc;ng chỉ cần nỗ lực v&agrave; thời gian, m&agrave; c&ograve;n v&ocirc; v&agrave;n những yếu tố kh&aacute;c nữa. V&iacute; dụ như duy&ecirc;n phận.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Đời người giống như một bức tường, dễ đ&oacute;ng r&ecirc;u. Sẽ c&oacute; những đoạn k&yacute; ức khi thời gian phủ l&ecirc;n một lớp bụi, bị người l&atilde;ng qu&ecirc;n mất.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Vừa ng&ocirc;ng cuồng, lại vừa đa cảm, ch&uacute;ng t&ocirc;i cứ thế tận hưởng từng gi&acirc;y ph&uacute;t thời gian tr&ocirc;i, rồi tuổi trẻ bỗng nhi&ecirc;n tuột mất một ng&agrave;y n&agrave;o đ&oacute; chẳng biết. Tr&ecirc;n những con phố d&agrave;i v&agrave; rộng, ch&uacute;ng t&ocirc;i lu&ocirc;n t&igrave;m kiếm tuổi mười t&aacute;m, hai mươi đ&aacute;nh rơi ở những &acirc;m thanh v&agrave; m&ugrave;i vị cổ k&iacute;nh nơi đ&acirc;y.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;Về g&oacute;c độ t&acirc;m l&yacute; học m&agrave; n&oacute;i th&igrave; những người c&ocirc; đơn l&agrave; những người sợ thất bại, muốn trốn tr&aacute;nh, nhưng lại hay kỳ vọng.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;L&agrave; con trai, kh&ocirc;ng mang nổi hạnh ph&uacute;c đến cho người con g&aacute;i m&igrave;nh y&ecirc;u ch&iacute;nh l&agrave; thất bại lớn nhất trong đời.&rdquo;</em><br />\r\n&nbsp;</p>\r\n\r\n<p><em>&ldquo;L&agrave; con g&aacute;i, khiến bản th&acirc;n trở n&ecirc;n nhếch nh&aacute;c ch&iacute;nh l&agrave; đang c&oacute; tội lớn nhất với ch&iacute;nh m&igrave;nh.&rdquo;</em></p>\r\n', 'CaDe', '06-01-2017', 14000, 'http://anybooks.vn/images/book/image/thoi_dai_gai_e.png', '[""]', 1492741720, 0, 0, 'Thời Đại Gái Ế', 'Thời Đại Gái Ế', '', 0, 0, 0, 0, 'Dân Trí', 'Bách Việt', 'Thời Đại Gái Ế', '0', 0, 0, 'Bìa mềm', '13 x 20.5 cm', '', '400 gram', '', 352),
(509, 270, 0, 'Hạnh Phúc Là Khi Ta Sánh Đôi', 'hanh-phuc-la-khi-ta-sanh-doi', 0, 66000, '<p>&ldquo;Thật đi&ecirc;n rồ, từ khi lấy chồng tớ lại cực kỳ th&agrave;nh c&ocirc;ng với đ&agrave;n &ocirc;ng. Đ&uacute;ng l&agrave; kh&ocirc;ng thể tin nổi, nhưng chiếc nhẫn cưới rất thu h&uacute;t họ! Hẳn l&agrave; họ tự nhủ, &iacute;t nhất c&ocirc; n&agrave;ng n&agrave;y cũng kh&ocirc;ng mơ ước được kết h&ocirc;n, c&ocirc; ta đ&atilde; biết đ&aacute;m cưới l&agrave; thế n&agrave;o rồi.&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&igrave;m kiếm, gặp gỡ, y&ecirc;u đương, kết h&ocirc;n, cuộc sống gia đ&igrave;nh với những sắc m&agrave;u, những cung bậc cảm x&uacute;c kh&aacute;c nhau. Những điều tưởng chừng đ&atilde; rất quen thuộc, thậm ch&iacute; nh&agrave;m ch&aacute;n bỗng trở n&ecirc;n thật th&uacute; vị v&agrave; ngọt ng&agrave;o dưới g&oacute;c nh&igrave;n h&agrave;i hước của t&aacute;c giả&nbsp;<strong>Anne Roumanoff</strong>. D&ugrave; đang trong h&agrave;nh tr&igrave;nh t&igrave;m kiếm hay đ&atilde; c&oacute; được nửa kia của đời m&igrave;nh, bạn cũng t&igrave;m thấy ch&iacute;nh m&igrave;nh trong cuốn s&aacute;ch, v&agrave; mỉm cười nhận ra rằng từng gi&acirc;y ph&uacute;t trong cuộc đời n&agrave;y thật đ&aacute;ng sống, đ&aacute;ng tr&acirc;n trọng biết bao.</p>\r\n', 'Anne Roumanoff', '07-04-2017', 11000, 'http://anybooks.vn/images/book/image/hanh_phuc_la_khi_ta_sanh_doi.jpg', '[""]', 1492741815, 0, 0, 'Hạnh Phúc Là Khi Ta Sánh Đôi', 'Hạnh Phúc Là Khi Ta Sánh Đôi', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Hạnh Phúc Là Khi Ta Sánh Đôi', '0', 0, 1, 'Bìa mềm', '14 x 20.5 cm', '', '220 gram', '', 172),
(510, 270, 0, 'Nơi Tình Yêu Ngang Qua', 'noi-tinh-yeu-ngang-qua', 0, 129000, '<p><em>S&acirc;u thẳm trong l&ograve;ng c&oacute; một nơi m&agrave; t&ocirc;i muốn đi.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>S&acirc;u thẳm trong l&ograve;ng c&oacute; một người m&agrave; t&ocirc;i lu&ocirc;n nhớ.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Nơi t&igrave;nh y&ecirc;u ngang qua</strong>&nbsp;đ&atilde; vẽ lại những mảng m&agrave;u k&yacute; ức, những g&oacute;c nhớ trong t&acirc;m hồn tr&ecirc;n mỗi h&agrave;nh tr&igrave;nh y&ecirc;u thương ấy: Một b&aacute;t mỳ l&uacute;a m&igrave; ở Busan, cảnh tượng lọt v&agrave;o trong tầm mắt khi đứng giữa đất trời tr&ecirc;n đỉnh n&uacute;i Darangswi, nhạc Schubert nhẹ nh&agrave;ng sớm thứ Hai, những ng&otilde; phố th&acirc;n quen, những b&atilde;i biển l&acirc;u đời, những con đường đ&ocirc;i l&uacute;c gợi nhớ đến đ&ocirc;i ta...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tất cả những điều nhỏ nhặt, những thứ nhớ mong kia ch&iacute;nh l&agrave; những mảnh gh&eacute;p tạo n&ecirc;n một&nbsp;<strong>Nơi t&igrave;nh y&ecirc;u ngang qua</strong>&nbsp;rất thơ, rất t&igrave;nh v&agrave; rất nhạc...</p>\r\n', 'Choi Kab Soo', '29-03-2017', 22000, 'http://anybooks.vn/images/book/image/noi_tinh_yeu_ngang_qua.jpg', '[""]', 1492741910, 0, 1, 'Nơi Tình Yêu Ngang Qua', 'Nơi Tình Yêu Ngang Qua', '', 0, 0, 0, 0, 'Văn Học', 'Văn Việt', 'Nơi Tình Yêu Ngang Qua', '0', 0, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '540 gram', '', 328),
(511, 270, 0, 'Bệnh Công Chúa', 'benh-cong-chua', 0, 90000, '<p><em>Đ&acirc;y kh&ocirc;ng phải c&acirc;u chuyện về c&ocirc; b&eacute; lọ lem, m&agrave; l&agrave; về vị h&ocirc;n th&ecirc; xấu t&iacute;nh của ho&agrave;ng tử.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&ldquo;C&ocirc; ấy c&oacute; l&uacute;c ngang ngược cảnh vẻ, thực chất l&agrave; v&igrave; giữ vững nguy&ecirc;n tắc; c&ocirc; ấy c&oacute; l&uacute;c g&acirc;y sự v&ocirc; cớ, thực chất l&agrave; muốn dũng cảm b&agrave;y tỏ &yacute; kiến bản th&acirc;n; c&ocirc; ấy tuy t&ocirc;n thờ đồng tiền ưa trưng diện, nhưng biết m&igrave;nh muốn g&igrave;, cũng biết thứ g&igrave; n&ecirc;n bu&ocirc;ng bỏ, thứ g&igrave; n&ecirc;n quyến luyến&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&ocirc; g&aacute;i c&oacute; nội t&acirc;m mạnh mẽ như vậy, d&ugrave; kh&ocirc;ng c&oacute; gi&agrave;y pha l&ecirc; của ho&agrave;ng tử, cũng c&oacute; thể tao nh&atilde;, xinh đẹp, ung dung, lương thiện m&agrave; ki&ecirc;n cường như một c&ocirc;ng ch&uacute;a v&agrave; xứng đ&aacute;ng c&oacute; một kết cục tốt đẹp của ri&ecirc;ng m&igrave;nh...&rdquo;</p>\r\n', 'Macchiato', '04-04-2017', 15000, 'http://anybooks.vn/images/book/image/benh_cong_chua.jpg', '[""]', 1492741985, 0, 1, 'Bệnh Công Chúa', 'Bệnh Công Chúa', '', 0, 0, 0, 0, 'Hà Nội', 'Nhã Nam', 'Bệnh Công Chúa', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '400 gram', '', 348),
(512, 270, 0, ' Kẻ Khủng Bố', 'ke-khung-bo', 0, 99000, '<p>Kẻ khủng bố c&oacute; phải l&agrave; một qu&aacute;i vật, một t&ecirc;n đi&ecirc;n? Người b&igrave;nh thường ch&uacute;ng ta liệu c&oacute; thể n&agrave;o hiểu v&agrave; th&ocirc;ng cảm được với một kẻ khủng bố?&nbsp;<br />\r\n<br />\r\nCuốn tiểu thuyết đặc sắc của&nbsp;<strong>John Updike</strong>&nbsp;l&agrave; cuộc h&agrave;nh tr&igrave;nh t&igrave;m lời đ&aacute;p cho c&acirc;u hỏi ấy. Bằng giọng văn điềm tĩnh, &oacute;c quan s&aacute;t sắc sảo, khả năng ph&acirc;n t&iacute;ch tinh tế, c&ugrave;ng một quyết t&acirc;m quả cảm hầu vượt qua mọi định kiến c&oacute; sẵn về thiện v&agrave; &aacute;c, nh&agrave; văn h&agrave;ng đầu nước Mỹ - t&aacute;c giả&nbsp;<em>Rabbit ơi, chạy đi</em>&nbsp;- khiến cho ta thấy, đằng sau bức ch&acirc;n dung quen thuộc về kẻ khủng bố đ&aacute;ng sợ, đ&aacute;ng căm gh&eacute;t kia l&agrave; một con người, với một tr&iacute; &oacute;c v&agrave; t&acirc;m hồn giống ch&uacute;ng ta hơn l&agrave; kh&aacute;c ch&uacute;ng ta ra sao.</p>\r\n', 'John Updike', '07-04-2017', 15000, 'http://anybooks.vn/images/book/image/ke_khung_bo.jpg', '[""]', 1492742044, 0, 0, ' Kẻ Khủng Bố', ' Kẻ Khủng Bố', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', ' Kẻ Khủng Bố', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '450 gram', '', 408),
(513, 269, 0, 'Sự Đã Rồi Anh Ngồi Anh Hát', 'su-da-roi-anh-ngoi-anh-hat', 0, 65000, '<p>Gồm nhiều b&agrave;i thơ v&agrave; tản văn được sắp xếp theo cấu tr&uacute;c: Những suy tưởng - Trong th&agrave;nh phố - Về t&igrave;nh y&ecirc;u, cuốn s&aacute;ch&nbsp;<strong>&ldquo;Sự đ&atilde; rồi anh ngồi anh h&aacute;t&rdquo;</strong>&nbsp;l&agrave; t&aacute;c phẩm mới nhất được nh&agrave; thơ Lu giới thiệu tới độc giả.<br />\r\n<br />\r\nVẫn như tập thơ đầu tay đ&atilde; xuất bản - &ldquo;Lấp k&iacute;n một lặng im&rdquo;, tập thơ n&agrave;y mang giọng điệu nhẹ nh&agrave;ng man m&aacute;c, vừa y&ecirc;u đời vừa ch&aacute;n đời, vừa b&ocirc;ng ph&egrave;ng vừa ngẫm ngợi của một g&atilde; trai phố. Thơ Lu được đ&aacute;nh gi&aacute; l&agrave; dễ tiếp cận, nhưng dư &acirc;m n&oacute; để lại kh&ocirc;ng dễ tan.</p>\r\n', 'Lữ', '28-03-2017', 11000, 'http://anybooks.vn/images/book/image/su_da_roi_anh_ngoi_anh_hat.jpg', '[""]', 1492742172, 0, 2, 'Sự Đã Rồi Anh Ngồi Anh Hát', 'Sự Đã Rồi Anh Ngồi Anh Hát', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Sự Đã Rồi Anh Ngồi Anh Hát', '0', 0, 1, 'Bìa mềm', '15 x 20 cm', '', '220 gram', '', 168),
(514, 269, 0, 'Đôi Khi', 'doi-khi', 0, 65000, '<p>Sư c&ocirc; Ch&acirc;n Hội Nghi&ecirc;m hiện l&agrave; m&ocirc;t vị gi&aacute;o thọ của L&agrave;ng Mai, với hơn mười lăm năm tu tập sư c&ocirc; đ&atilde; v&agrave; đang hướng dẫn cho rất nhiều người đến l&agrave;ng tu học, gi&uacute;p họ chuyển ho&aacute; khổ đau để sống đời hạnh ph&uacute;c. Những kinh nghiệm v&agrave; tuệ gi&aacute;c qu&yacute; b&aacute;u được sư c&ocirc; thể hiện r&otilde; n&eacute;t trong thơ ca của m&igrave;nh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tập thơ Đ&ocirc;i Khi l&agrave; m&oacute;n qu&agrave; m&agrave; sư c&ocirc; d&agrave;nh tặng cho sinh nhật lần thứ 80 của cha m&igrave;nh với tất cả tấm l&ograve;ng hiếu thảo, niềm tin v&agrave; sức sống.</p>\r\n', 'Chân Hội Nghiêm', '15-03-2017', 6000, 'http://anybooks.vn/images/book/image/doi_khi.jpg', '[""]', 1492742225, 0, 0, 'Đôi Khi', 'Đôi Khi', '', 0, 0, 0, 0, 'Văn Học', 'Phương Nam', 'Đôi Khi', '0', 0, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '250 gam', '', 140),
(515, 269, 0, 'Hoa Gạo Cuối Trời', 'hat-gao-cuoi-troi', 0, 33000, '<p><strong>Những người đ&agrave;n b&agrave; trở về, Hoa gạo cuối trời&nbsp;</strong>&ndash; hai ấn phẩm mới nhất của B&igrave;nh Nguy&ecirc;n Trang đưa người đọc trở về những kh&ocirc;ng gian của k&iacute; ức, cuộc sống thường nhật đầy th&acirc;n thuộc, ấm &aacute;p v&agrave; gần gụi. L&agrave; một nh&agrave; thơ lu&ocirc;n t&acirc;m niệm &ldquo;việc ngồi v&agrave;o b&agrave;n v&agrave; viết một điều g&igrave; đ&oacute; l&ecirc;n trang giấy l&agrave; niềm an ủi, niềm h&acirc;n hoan đ&aacute;ng kể trong đời sống của m&igrave;nh&rdquo;, chị đ&atilde; s&aacute;ng t&aacute;c bằng cả l&ograve;ng thiết tha sống, v&agrave; t&igrave;nh y&ecirc;u đ&oacute; đ&atilde; lan tỏa trong từng c&acirc;u từ, nhịp điệu ng&ocirc;n ngữ của chị.<br />\r\n<br />\r\nNổi tiếng l&agrave; một nh&agrave; thơ, đ&atilde; mạnh dạn lấn s&acirc;n sang k&yacute; ch&acirc;n dung, truyện ngắn, v&agrave; đ&acirc;y l&agrave; lần đầu ti&ecirc;n&nbsp;<strong>B&igrave;nh Nguy&ecirc;n Trang</strong>&nbsp;đến với thể loại tản văn với sự ra đời của tập Hoa gạo cuối trời n&agrave;y. Với thế mạnh của một nh&agrave; thơ, chị đi v&agrave;o những c&acirc;u chuyện thường nhật bằng giọng điệu thủ thỉ, nhẹ nh&agrave;ng: B&aacute;nh m&igrave; của l&ograve;ng tin, L&agrave; &ocirc;ng chủ của ch&iacute;nh m&igrave;nh, con nh&eacute;, Y&ecirc;u lấy m&igrave;nh, T&agrave;i sản của t&acirc;m hồn...<br />\r\n<br />\r\nTập tản văn nhẹ nh&agrave;ng, thấm đượm triết l&iacute; sống, sống cho bản th&acirc;n v&agrave; sống để l&agrave; một người tử tế: &ldquo;Năm th&aacute;ng khiến ch&uacute;ng ta gi&agrave; đi, v&agrave; những ph&uacute;t gi&acirc;y tận hưởng y&ecirc;u thương cũng mất dần theo năm th&aacute;ng. Ch&uacute;ng ta nh&igrave;n xuống đ&ocirc;i tay chai sần của m&igrave;nh v&agrave; tự hỏi, phải chăng ch&uacute;ng ta đ&atilde; qu&yacute; trọng những ph&uacute;t gi&acirc;y lau nh&agrave;, giặt giũ, những đồng xu lẻ t&iacute;ch c&oacute;p... hơn l&agrave; những ph&uacute;t gi&acirc;y ngồi cạnh người bạn đời uống một ly tr&agrave; buổi s&aacute;ng, hay một chiếc &ocirc;m, một lời th&igrave; thầm l&uacute;c đ&ecirc;m khuya. Y&ecirc;u lấy m&igrave;nh, bạn sẽ thấy cuộc đời đẹp hơn v&agrave; bạn đẹp hơn. Khi bạn trở n&ecirc;n đẹp hơn, th&igrave; bạn sẽ được y&ecirc;u thương nhiều hơn. V&agrave; bạn hạnh ph&uacute;c...&rdquo; (Y&ecirc;u lấy m&igrave;nh).<br />\r\n<br />\r\nKh&ocirc;ng ồn &agrave;o, kh&ocirc;ng khoa trương, như ch&iacute;nh b&uacute;t danh của chị,&nbsp;<strong>B&igrave;nh Nguy&ecirc;n Trang&nbsp;</strong>cứ dịu d&agrave;ng, nhẹ nh&agrave;ng thế để dấn th&acirc;n v&agrave;o tr&ograve; chơi của chữ nghĩa, v&agrave; c&ugrave;ng với Những người đ&agrave;n b&agrave; trở về, Hoa gạo cuối trời, chắc hẳn chị sẽ c&ograve;n tiến xa hơn nữa tr&ecirc;n con đường văn chương. Những bạn đọc đ&atilde; y&ecirc;u mến một B&igrave;nh Nguy&ecirc;n Trang từ thuở đ&ocirc;i mươi, gặp lại chị sau hai mươi năm, vẫn sẽ thấy sự gần gũi m&agrave; kh&ocirc;ng k&eacute;m tươi mới của một c&acirc;y b&uacute;t kh&aacute;t khao được sống v&agrave; tận hưởng cuộc sống trong từng ng&ocirc;n từ.</p>\r\n', 'Bình Nguyên Trang', '28-02-2017', 5000, 'http://anybooks.vn/images/book/image/hoa_gao_cuoi_troi.jpg', '[""]', 1492742284, 0, 0, 'Hoa Gạo Cuối Trời', 'Hoa Gạo Cuối Trời', '', 0, 0, 0, 0, 'Phụ Nữ', 'Phụ Nữ', 'Hoa Gạo Cuối Trời', '0', 0, 0, 'Bìa mềm', '12 x 20 cm', '', '150 gram', '', 128),
(516, 269, 0, 'Tuyển Thơ Lục Bát', 'tuyen-tho-luc-bat', 0, 110000, '<p><em>Duy phải l&ograve;ng lục b&aacute;t. Duy thấy giữa m&igrave;nh v&agrave; lục b&aacute;t biết bao nhi&ecirc;u nghĩa cũ c&agrave;ng. Trong tay Duy chẳng những lục b&aacute;t được l&agrave;m mới m&agrave; c&ograve;n lẩy l&ecirc;n được cả những t&acirc;m t&igrave;nh ở đ&agrave;ng sau t&acirc;m t&igrave;nh. V&agrave; rồi, cũng hảo t&acirc;m như thần đ&egrave;n, thần đ&agrave;n đ&atilde; lu&ocirc;n đền b&ugrave; cho Duy một c&aacute;ch h&agrave;o ph&oacute;ng. C&acirc;y đ&agrave;n n&agrave;y của Duy chơi điệu mới, nhịp mới, hồn mới. Giai điệu lục b&aacute;t của Duy c&oacute; cổ điển, c&oacute; d&acirc;n gian. Duy mạnh tay đốc qu&acirc;n, đưa những lời n&oacute;i, lối n&oacute;i đời mới x&acirc;m nhập v&agrave;o cấu tr&uacute;c lục b&aacute;t, khiến n&oacute; phải nới m&igrave;nh ra, d&agrave;n xếp lại, t&igrave;m đến những dạng h&agrave;i h&ograve;a cũng theo lối mới. V&agrave; ở lục b&aacute;t hồn v&iacute;a Nguyễn Duy mới dậy men nổi gi&oacute; l&agrave;m &quot;trời lao đao đất lao đao lừ đừ&quot; đến thế.</em></p>\r\n', 'Nguyễn Duy', '22-02-2017', 10000, 'http://anybooks.vn/images/book/image/nguyen_duy_tuyen_tho_luc_bat.jpg', '[""]', 1492742358, 0, 1, 'Tuyển Thơ Lục Bát', 'Tuyển Thơ Lục Bát', '', 0, 0, 0, 0, 'Văn Hóa Văn Nghệ', 'Phương Nam', 'Tuyển Thơ Lục Bát', '0', 0, 0, 'Bìa mềm', '18 x 18 cm', '', '400 gram', '', 203),
(517, 268, 0, 'Yêu Hà Nội Thích Sài Gòn', 'yeu-ha-noi-thich-sai-gon', 0, 79000, '<p><strong>&quot;Y&ecirc;u H&agrave; Nội Th&iacute;ch S&agrave;i G&ograve;n&quot; l&agrave; một tựa đề cảm x&uacute;c, v&agrave; to&agrave;n bộ cuốn s&aacute;ch l&agrave; những cảm nhận tinh tế của một nữ nh&agrave; b&aacute;o c&oacute; c&aacute;i nh&igrave;n s&acirc;u sắc, nh&acirc;n văn v&agrave; nhiều trăn trở về cuộc sống, gi&aacute; trị, văn h&oacute;a, x&atilde; hội v&agrave; kinh tế ở H&agrave; Nội v&agrave; S&agrave;i G&ograve;n.</strong>&nbsp;Những kỷ niệm v&agrave; suy tư về hai th&agrave;nh phố n&agrave;y được chắt lọc từ c&aacute;i nh&igrave;n vừa kh&aacute;ch quan vừa cởi mở, tạo th&agrave;nh một bức khảm sinh động về h&igrave;nh ảnh hai th&agrave;nh phố n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Xuy&ecirc;n suốt cuốn s&aacute;ch c&ograve;n l&agrave; một h&igrave;nh ảnh về đất nước qua hai th&agrave;nh phố. Cuốn s&aacute;ch l&agrave; bản b&uacute;t k&yacute; về cuộc sống, từ những n&eacute;t đẹp văn h&oacute;a, từ những ứng xử tử tế, từ t&acirc;m tư nguyện vọng của người d&acirc;n cho đến những vấn đề vĩ m&ocirc; về văn h&oacute;a, kinh tế... Tr&ecirc;n tất cả v&agrave; trong tất cả l&agrave; một t&acirc;m hồn nhạy cảm, một tr&iacute; tuệ sắc sảo, rất truyền thống nhưng cũng rất hiện đại.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Đ&acirc;y l&agrave; một cuốn s&aacute;ch được viết n&ecirc;n bởi &ldquo;một người di cư&rdquo;, sống tuổi trẻ ở H&agrave; Nội v&agrave; trưởng th&agrave;nh ở S&agrave;i G&ograve;n. Di chuyển giữa hai kh&ocirc;ng gian đ&ocirc; thị đối lập ấy lại l&agrave; một t&acirc;m hồn s&acirc;u sắc, tinh tế. N&oacute;i c&aacute;ch kh&aacute;c, đ&acirc;y l&agrave; cuốn s&aacute;ch của một linh hồn đ&ocirc; thị nhạy cảm.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cuốn s&aacute;ch vừa l&agrave; cảm nhận c&aacute; nh&acirc;n, nhưng lại l&agrave; nhận thức x&atilde; hội. Đ&aacute;nh gi&aacute; của t&aacute;c giả rất x&aacute;c đ&aacute;ng v&agrave; l&agrave; cảm nhận chung cho rất nhiều &ldquo;t&acirc;m hồn đ&ocirc; thị&rdquo; kh&aacute;c, rất nhiều người S&agrave;i G&ograve;n, người H&agrave; Nội, người đến S&agrave;i G&ograve;n, người đến H&agrave; Nội&hellip;Với những người nghi&ecirc;n cứu đ&ocirc; thị hoặc viết về đ&ocirc; thị, đ&acirc;y l&agrave; một cuốn s&aacute;ch n&ecirc;n đọc v&agrave; phải c&oacute;.</p>\r\n', 'Hồng Phúc', '06-03-2017', 12000, 'http://anybooks.vn/images/book/image/yeu_ha_noi_thich_sai_gon.jpg', '[""]', 1492742466, 0, 1, 'Yêu Hà Nội Thích Sài Gòn', 'Yêu Hà Nội Thích Sài Gòn', '', 0, 0, 0, 0, 'Lao Động', 'Alphabooks', 'Yêu Hà Nội Thích Sài Gòn', '0', 0, 1, 'Bìa mềm', '14 x 20.5 cm', '', '400 gram', '', 0),
(518, 268, 0, 'Tính Dân Tộc Trong Âm Nhạc Phạm Duy & Tình Bạn Duy - Khê', 'tinh-dan-toc-trong-am-nhac-pham-duy-&-tinh-ban-duy-khe', 0, 82000, '<p><strong>Cuốn s&aacute;ch n&agrave;y viết về &ldquo;t&iacute;nh d&acirc;n tộc&rdquo; trong &acirc;m nhạc Phạm Duy như minh chứng cho &ldquo;t&igrave;nh y&ecirc;u nước nồng n&agrave;n&rdquo; được thể hiện suốt cuộc đời cũng như sự nghiệp của một người đ&atilde; gửi gắm t&igrave;nh tự v&agrave;o cung bậc thanh &acirc;m v&agrave; nội dung những ca từ trong c&aacute;c t&aacute;c phẩm.</strong>&nbsp;Bằng chất liệu hồi ức, phần đầu cuốn s&aacute;ch n&oacute;i về t&igrave;nh bạn giữa hai người chạy d&agrave;i suốt những năm th&aacute;ng cuộc đời cho đến khi cả hai đ&atilde; bước qua ngưỡng tuổi 90. Phần tiếp theo l&agrave; sự ph&acirc;n t&iacute;ch bằng ng&ocirc;n ngữ nghề nghiệp của một nh&agrave; nghi&ecirc;n cứu &acirc;m nhạc truyền thống d&acirc;n tộc, cho người đọc nhận thức được rằng trong gia t&agrave;i &acirc;m nhạc rất đa dạng, phong ph&uacute; v&agrave; đồ sộ của Phạm Duy, c&aacute;i cốt l&otilde;i cơ bản nhất, s&acirc;u sắc nhất h&igrave;nh th&agrave;nh n&ecirc;n gi&aacute; trị di sản của &ocirc;ng ch&iacute;nh l&agrave; gốc rễ văn h&oacute;a Việt Nam đ&atilde; ăn s&acirc;u v&agrave;o huyết quản, v&agrave;o tr&aacute;i tim, v&agrave;o k&yacute; ức với những h&igrave;nh ảnh qu&ecirc; hương kh&oacute; phai nh&ograve;a trong l&ograve;ng Phạm Duy để &ocirc;ng c&oacute; thể t&igrave;nh tự qua &acirc;m nhạc m&agrave; gắn b&oacute; cả đời m&igrave;nh với d&acirc;n tộc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ngo&agrave;i ra t&aacute;c giả c&ograve;n nhận định về những kh&iacute;a cạnh thật đặc biệt trong con người Phạm Duy m&agrave; &iacute;t ai thấy: Phạm Duy l&agrave; một nhạc sĩ to&agrave;n diện vừa viết nhạc lại c&oacute; khả năng viết cả lời ca rất hay, lại tự m&igrave;nh biểu diễn tr&ecirc;n s&acirc;n khấu những s&aacute;ng t&aacute;c của m&igrave;nh như một ca sĩ chuy&ecirc;n nghiệp, đồng thời c&ograve;n l&agrave; một người dẫn chương tr&igrave;nh duy&ecirc;n d&aacute;ng đầy sức cuốn h&uacute;t trong c&aacute;c buổi giới thiệu về c&aacute;c s&aacute;ng t&aacute;c của m&igrave;nh. Trong c&aacute;i nh&igrave;n của Gi&aacute;o sư Trần Văn Kh&ecirc; - một người chuy&ecirc;n nghi&ecirc;n cứu &acirc;m nhạc th&igrave; bản th&acirc;n Nhạc sĩ Phạm Duy mang trong m&igrave;nh một &oacute;c nghi&ecirc;n cứu rất khoa học v&agrave; tinh tế kh&ocirc;ng thua g&igrave; những nh&agrave; nghi&ecirc;n cứu thực thụ, điều đ&oacute; được thể hiện qua những g&igrave; Phạm Duy t&igrave;m t&ograve;i, ghi ch&eacute;p, hệ thống v&agrave; cho ra đời những thi&ecirc;n đặc khảo vể &acirc;m nhạc được nhiều người biết đến.</p>\r\n', 'Trần Văn Khê', '15-03-2017', 8000, 'http://anybooks.vn/images/book/image/tinh_dan_toc_trong_am_nhac_pham_duy_tinh_ban_duy_khe.jpg', '[""]', 1492742525, 0, 0, 'Tính Dân Tộc Trong Âm Nhạc Phạm Duy & Tình Bạn Duy - Khê', 'Tính Dân Tộc Trong Âm Nhạc Phạm Duy & Tình Bạn Duy - Khê', '', 0, 0, 0, 0, 'Thế Giới', 'Phương Nam', 'Tính Dân Tộc Trong Âm Nhạc Phạm Duy & Tình Bạn Duy - Khê', '0', 0, 0, 'Bìa mềm', '13 x 20.5 cm', '', '286 gram', '', 224),
(519, 268, 0, 'Đặc Khảo Về Dân Nhạc Ở Việt Nam', 'dac-khao-ve-dan-nhac-o-viet-nam', 0, 95000, '<p><strong>Đặc Khảo Về D&acirc;n Nhạc Ở Việt Nam</strong>&nbsp;được in lần đầu c&aacute;ch đ&acirc;y khoảng 50 năm, được nhiều thế hệ chuyền tay nhau đọc. Hơn 200 trang s&aacute;ch, t&aacute;c giả l&agrave;m hướng dẫn vi&ecirc;n đưa bạn đọc đi khắp v&ugrave;ng miền đất nước. Đi đến v&ugrave;ng trung du nghe c&aacute;c bộ tộc Trường Sơn g&otilde; đ&agrave;n T&rsquo;rưng, tiếng cồng chi&ecirc;ng vang vọng giữa đại ng&agrave;n, đi l&ecirc;n v&ugrave;ng Thượng du Bắc Việt t&igrave;m lại dấu v&ecirc;t xưa của Trống đồng Đ&ocirc;ng Sơn, tiếng kh&egrave;n của người M&egrave;o, tiếng đ&agrave;n t&iacute;nh phụ hoạ cho c&aacute;c thiếu nữ Th&aacute;i huyền ảo trong điệu m&uacute;a xoe. V&agrave;o miền Nam nghe c&acirc;u vọng cổ. C&oacute; những loại h&igrave;nh s&acirc;n khấu đ&atilde; h&igrave;nh th&agrave;nh c&aacute;ch đ&acirc;y h&agrave;ng mấy thế kỷ nay vẫn c&ograve;n tồn tại như Ch&egrave;o (Bắc bộ), H&aacute;t bội (Trung bộ) hoặc non trẻ hơn l&agrave; Cải lương (Nam bộ).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nhiều nh&agrave; nghi&ecirc;n cứu, nhiều thế hệ sinh vi&ecirc;n chuy&ecirc;n ng&agrave;nh &acirc;m nhạc d&acirc;n gian đ&atilde; sử dụng s&aacute;ch n&agrave;y để l&agrave;m t&agrave;i liệu tham khảo cho nghi&ecirc;n cứu của họ. Ch&iacute;nh t&aacute;c giả cũng vận dụng từ kho t&agrave;ng d&acirc;n ca khi viết những b&agrave;i t&igrave;nh ca qu&ecirc; hương, từng ca kh&uacute;c mang hơi thở của l&agrave;n điệu d&acirc;n ca Việt với &acirc;m gia ngũ cung được vận dụng mượt m&agrave;, uyển chuyển.</p>\r\n', 'Phạm Duy', '15-03-2017', 9000, 'http://anybooks.vn/images/book/image/dac_khao_ve_dan_nhac_o_viet_nam.jpg', '[""]', 1492742589, 0, 3, 'Đặc Khảo Về Dân Nhạc Ở Việt Nam', 'Đặc Khảo Về Dân Nhạc Ở Việt Nam', '', 0, 0, 0, 0, 'Thế Giới', 'Phương Nam', 'Đặc Khảo Về Dân Nhạc Ở Việt Nam', '0', 0, 0, 'Bìa mềm', '16 x 24 cm', '', '330 gram', '', 204),
(520, 268, 0, 'Đừng Từ Bỏ', 'dung-tu-bo', 0, 68000, '<p>Nếu gặp thất bại &ndash; Xin đừng tuyệt vọng, bởi v&igrave; &ldquo;C&aacute;nh cửa n&agrave;y kh&eacute;p lại, sẽ c&oacute; c&aacute;nh cửa kh&aacute;c mở ra&rdquo;, chỉ bạn mới c&oacute; thể mở ra c&aacute;nh cửa mới để m&igrave;nh bước tiếp.</p>\r\n\r\n<p><br />\r\nNếu gặp thất bại &ndash; Xin h&atilde;y l&agrave;m lại từ đầu, đừng từ bỏ đam m&ecirc; của m&igrave;nh, h&atilde;y cứ vững bước m&agrave; đi, như người ta thường n&oacute;i: &ldquo;H&atilde;y cứ y&ecirc;u như chưa y&ecirc;u bao giờ&rdquo;, bạn h&atilde;y &ldquo;H&atilde;y cứ nỗ lực như chưa từng thất bại.&quot;</p>\r\n\r\n<p><br />\r\nCần phải mạnh mẽ quyết đo&aacute;n xem m&igrave;nh n&ecirc;n học g&igrave; để l&agrave;m g&igrave;, x&aacute;c định ước mơ, đam m&ecirc;, kh&aacute;t vọng. Cuộc sống lu&ocirc;n chứa đựng mu&ocirc;n v&agrave;n kh&oacute; khăn v&agrave; th&aacute;ch thức, thất bại lẫn th&agrave;nh c&ocirc;ng. H&atilde;y dũng cảm vượt qua để lu&ocirc;n l&agrave; ch&iacute;nh m&igrave;nh, v&agrave; đừng để điều g&igrave; c&oacute; thể che khuất ước mơ, niềm tin v&agrave; ho&agrave;i b&atilde;o.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ch&uacute; l&aacute;i xe ba g&aacute;c m&aacute;y hay chở s&aacute;ch cho t&ocirc;i c&oacute; hai người con, một h&ocirc;m ch&uacute; khoe con g&aacute;i ch&uacute; l&agrave;m kế to&aacute;n ở một si&ecirc;u thị điện m&aacute;y quận 10 đ&atilde; đ&aacute;m cưới rồi, em ấy lấy con trai &ocirc;ng chủ của si&ecirc;u thị điện m&aacute;y ấy, giờ ch&uacute; chỉ c&ograve;n lo cho thằng con trai vừa mới đi nghĩa vụ qu&acirc;n sự về th&ocirc;i.</p>\r\n\r\n<p><br />\r\nCh&uacute; chở gần hay xa đều lấy t&ocirc;i 500 ngh&igrave;n một chuyến, đắt hơn người ta 100 &ndash; 150 ngh&igrave;n, nhưng t&ocirc;i vẫn nhờ ch&uacute; ấy chở gi&uacute;p, v&igrave; hiện tại t&ocirc;i kiếm được 100 ngh&igrave;n hay 150 ngh&igrave;n dễ hơn ch&uacute; ấy một ch&uacute;t... hy vọng l&agrave; mai mốt ch&uacute; ấy sẽ kiếm được 100 ngh&igrave;n hay 150 ngh&igrave;n dễ hơn t&ocirc;i...</p>\r\n\r\n<p><br />\r\nCuộc sống l&agrave; những điều k&igrave; diệu v&agrave; người ta kh&ocirc;ng ngừng cố gắng để đạt được những điều k&igrave; diệu ấy. Phải cố gắng nhiều hơn nữa th&ocirc;i.</p>\r\n', 'Minh Anh', '18-04-2017', 10000, 'http://anybooks.vn/images/book/image/dung_tu_bo.jpg', '[""]', 1492742671, 0, 41, 'Đừng Từ Bỏ', 'Đừng Từ Bỏ', '', 0, 0, 0, 0, 'Thanh Niên', 'KABooks', 'Đừng Từ Bỏ', '0', 0, 0, 'Bìa mềm', '13 x 20.5 cm', '', '610 gram', '', 142),
(521, 265, 0, 'Làm Mẹ Không Áp Lực', 'lam-me-khong-ap-luc', 0, 99000, '<h4>Cuốn s&aacute;ch&nbsp;<strong>L&Agrave;M MẸ KH&Ocirc;NG &Aacute;P LỰC</strong>&nbsp;được ra đời dựa tr&ecirc;n những giải đ&aacute;p thắc mắc của c&aacute;c bậc cha mẹ thường đối mặt khi nu&ocirc;i dạy trẻ. Quyển s&aacute;ch kh&ocirc;ng chỉ dừng lại ở việc cung cấp cho cha mẹ những hướng dẫn chăm s&oacute;c theo phương ph&aacute;p khoa học m&agrave; c&ograve;n gi&uacute;p ch&uacute;ng ta nhận ra những điểm quan trọng để trẻ kh&ocirc;ng mất cơ hội ph&aacute;t triển tối đa về thể chất v&agrave; tr&iacute; tuệ. Đ&acirc;y l&agrave; một quyển cẩm nang hướng dẫn chăm s&oacute;c b&eacute; ph&aacute;t triển một c&aacute;ch TO&Agrave;N DIỆN nhất.</h4>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>K&egrave;m với những tr&ograve; chơi được minh họa dễ hiểu gi&uacute;p c&aacute;c bậc cha mẹ c&oacute; những họat động vui đ&ugrave;a gần gũi với con, cuốn s&aacute;ch l&agrave; một m&oacute;n qu&agrave; th&acirc;n thương gửi tặng đến mọi gia đ&igrave;nh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Giới thiệu t&aacute;c giả:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>B&aacute;c sĩ dinh dưỡng Anh Nguyễn</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Chức hiệu chuy&ecirc;n khoa &ldquo;Registered Nutritional Therapy Practitioner&rdquo; c&ocirc;ng nhận tại Anh v&agrave; ch&acirc;u &Acirc;u</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- L&agrave; hội vi&ecirc;n của Hiệp hội Dinh dưỡng L&acirc;m sang Anh Quốc&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Đại sứ Y tế năm 2015 v&agrave; 2016 cho chăm s&oacute;c sức khỏe trẻ em tại Anh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Gi&aacute;m đốc bộ phận tư vấn Nhi khoa của HIDADDI Nutrition for Family &amp; Child</p>\r\n', 'Anh Nguyễn', '2016', 19000, 'http://anybooks.vn/images/book/image/lam_me_khong_ap_luc.jpg', '[""]', 1492743482, 0, 2, 'Làm Mẹ Không Áp Lực', 'Làm Mẹ Không Áp Lực', '', 0, 0, 0, 0, 'Thế Giới', '1980 Books', 'Làm Mẹ Không Áp Lực', '0', 0, 0, 'Bìa mềm', '', '', '400 gram', '', 0),
(522, 265, 0, 'Nghệ Thuật Tư Duy Rành Mạch (Giúp bạn có định hướng đúng)', 'nghe-thuat-tu-duy-ranh-mach', 0, 105000, '<h4><strong>&quot;Nghệ thuật tư duy r&agrave;nh mạch&#39; gi&uacute;p bạn c&oacute; định hướng đ&uacute;ng&quot;</strong><br />\r\n&nbsp;</h4>\r\n\r\n<p><strong>T&aacute;c giả Rofl Dobelli</strong>&nbsp;được biết đến l&agrave; một doanh nh&acirc;n Thuỵ Sĩ. C&ocirc; bắt đầu sự nghiệp viết l&aacute;ch năm 2002 v&agrave; trở n&ecirc;n nổi tiếng khắp thế giới với cuốn s&aacute;ch Nghệ thuật tư duy r&agrave;nh mạch (xuất bản năm 2011 v&agrave; dịch sang tiếng Anh năm 2013).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong cuộc sống, mọi người đều c&oacute; những l&uacute;c mắc sai lầm. Việc quyết định sai lầm đều bắt nguồn từ c&aacute;c lỗi tư duy tưởng như đơn giản, nhưng dần d&agrave; ch&uacute;ng t&iacute;ch tụ th&agrave;nh những th&agrave;nh kiến kh&oacute; bỏ. Hiếm khi, ta d&aacute;m nh&igrave;n nhận điều đ&oacute; n&ecirc;n dễ c&oacute; những suy nghĩ lệch lạc, sai lầm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Điều đ&oacute; sẽ khiến ch&uacute;ng ta thấy hối tiếc với những quyết định kh&ocirc;ng đ&uacute;ng. Đ&oacute; l&agrave; việc cứ m&atilde;i đeo b&aacute;m một c&ocirc;ng việc d&ugrave; bản th&acirc;n kh&ocirc;ng th&iacute;ch th&uacute;, đam m&ecirc; hay kh&ocirc;ng nhận lại được điều g&igrave;. V&agrave; sau mỗi thất bại, bạn thường đổ lỗi cho kh&aacute;ch quan, kh&ocirc;ng bao giờ chịu nhận lỗi l&agrave; do suy nghĩ sai lầm của bản th&acirc;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Bằng những v&iacute; dụ minh hoạ thiết thực, t&aacute;c giả muốn chỉ ra cho bạn đọc hiểu được những sai lầm hay mắc phải trong cuộc sống, biết c&aacute;ch nh&igrave;n nhận v&agrave; đối diện với ch&uacute;ng qua 99 chương s&aacute;ch.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Nghệ thuật tư duy r&agrave;nh mạch&nbsp;</strong>l&agrave; cuốn s&aacute;ch gi&uacute;p bạn nhận ra những lỗi nhận thức in s&acirc;u trong tiềm thức của ch&iacute;nh ta. Những lối tư duy sai lầm rất kh&oacute; để loại bỏ v&agrave; cũng kh&ocirc;ng cần thiết phải ti&ecirc;u diệt ch&uacute;ng ho&agrave;n to&agrave;n. Bởi trong số đ&oacute;, kh&ocirc;ng &iacute;t lỗi nhận thức kh&ocirc;ng g&acirc;y ảnh hưởng m&agrave; c&ograve;n gi&uacute;p ta sống tốt hơn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Cuốn s&aacute;ch kh&ocirc;ng phải l&agrave; kim chỉ nam, l&agrave; ch&igrave;a kho&aacute; hay b&iacute; quyết để gi&uacute;p bạn hạnh ph&uacute;c hơn trong cuộc sống, n&oacute; chỉ c&oacute; thể gi&uacute;p bạn đương đầu với những lỗi lầm m&igrave;nh tự g&acirc;y ra.</em></p>\r\n\r\n<p><br />\r\n<strong>&quot;Nghệ thuật tư duy r&agrave;nh mạch&quot; của t&aacute;c giả Rofl Dobelli c&oacute; thể gi&uacute;p bạn đọc thay đổi c&aacute;ch suy nghĩ, quyết định s&aacute;ng suốt hơn mỗi ng&agrave;y ở bất cứ đ&acirc;u, trong bất cứ t&igrave;nh huống n&agrave;o.</strong></p>\r\n', 'Rolf Dobelli', '2016', 17000, 'http://anybooks.vn/images/book/image/nghe_thuat_tu_duy_ranh_mach.jpg', '[""]', 1492743603, 0, 0, 'Nghệ Thuật Tư Duy Rành Mạch', 'Nghệ Thuật Tư Duy Rành Mạch', '', 0, 0, 0, 0, 'Thế Giới', 'Nhã Nam', 'Nghệ Thuật Tư Duy Rành Mạch', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '600 gram', '', 422),
(523, 265, 0, 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', 'kheo-an-noi-se-co-duoc-thien-ha', 0, 99000, '<h4>X&atilde; hội hiện đại, từ xin việc đến thăng chức, từ t&igrave;nh y&ecirc;u đến h&ocirc;n nh&acirc;n, từ giao lưu đến hợp t&aacute;c&hellip; kh&ocirc;ng việc g&igrave; kh&ocirc;ng cần t&agrave;i ăn n&oacute;i.<br />\r\n<br />\r\nKh&eacute;o ăn n&oacute;i giống như sở hữu loại &ldquo;dầu b&ocirc;i trơn&rdquo; đảm bảo c&aacute;c mối quan hệ của bạn &ldquo;vận h&agrave;nh&rdquo; trơn tru. Kh&ocirc;ng kh&eacute;o ăn n&oacute;i, gặp chuyện nhỏ mắc trở ngại, gặp chuyện lớn vấp thất bại.<br />\r\n<br />\r\nL&agrave;m thế n&agrave;o để n&oacute;i năng tr&ocirc;i chảy? L&agrave;m thế n&agrave;o để n&oacute;i lời &ldquo;đi v&agrave;o l&ograve;ng người&rdquo;? Trong những dịp kh&aacute;c nhau, với những người kh&aacute;c nhau, ở những t&igrave;nh huống kh&ocirc;ng giống nhau&hellip; c&oacute; cuốn s&aacute;ch n&agrave;y gợi &yacute;, bạn sẽ th&agrave;nh người kh&eacute;o ăn n&oacute;i.</h4>\r\n', 'Trác Nhã', '2014', 14000, 'http://anybooks.vn/images/book/image/kheo_an_noi_se_co_duoc_thien_ha.jpg', '[""]', 1492743673, 0, 0, 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', '', 0, 0, 0, 0, 'Văn Học', 'Minh Long', 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', '0', 0, 1, 'Bìa mềm', '16 x 23 cm', '', '450 gram', '', 344),
(524, 265, 0, 'Tuổi Trẻ Không Bao Giờ Quay Lại', 'tuoi-tre-khong-bao-gio-quay-lai', 0, 98000, '<p><strong>Tuyển Chọn Những Truyện Ngắn Hay Nhất<br />\r\nHạt Giống T&acirc;m Hồn</strong><br />\r\n&nbsp;</p>\r\n\r\n<p>Trong cuộc sống của mỗi người, c&oacute; những con đường đi qua kh&ocirc;ng nhớ nổi t&ecirc;n, c&oacute; những h&agrave;nh tr&igrave;nh sẽ kh&ocirc;ng bao giờ qu&ecirc;n. Những năm th&aacute;ng m&agrave;u xanh như m&acirc;y tr&ecirc;n bầu trời v&agrave; tự do bay lượn, đ&oacute; l&agrave; tuổi trẻ. Khi đ&atilde; đi qua, ngoảnh đầu nh&igrave;n lại mới thấy đ&aacute;ng để n&acirc;ng niu v&agrave; tr&acirc;n trọng. V&agrave; những con đường ấy đ&atilde; được trải nghi&ecirc;m qua những c&acirc;u chuyện rất đơn giản v&agrave; đời thường trong &ldquo;Tuổi trẻ kh&ocirc;ng bao giờ quay lại&rdquo;.<br />\r\n<br />\r\nVới những c&acirc;u chuyện thật &yacute; nghĩa v&agrave; s&acirc;u lắng, n&oacute; như l&agrave; những bước đệm cho những bạn trẻ mạnh mẽ bước tiếp tr&ecirc;n những chặng đường ph&iacute;a trước đang chờ đ&oacute;n ch&uacute;ng ta. H&atilde;y tin v&agrave;o cuộc sống, d&ugrave; cho c&oacute; kh&oacute; khăn n&agrave;o đi nữa khi ta c&ograve;n hy vọng, ước mơ th&igrave; h&atilde;y cứ bước tiếp. Bởi lẽ, sống l&agrave; kh&ocirc;ng chờ đợi h&atilde;y ch&aacute;y hết m&igrave;nh với những đam m&ecirc;, rồi đến một ng&agrave;y n&agrave;o đ&oacute; khi ch&uacute;ng ta nh&igrave;n lại bạn phải cảm ơn cuộc đời, cuộc sống n&agrave;y đ&atilde; cho bạn ở lại để trải nghiệm những &acirc;m vị của cuộc sống n&agrave;y m&agrave; bạn đ&atilde; đi qua với bi&ecirc;t bao thăng trầm vui, buồn, sướng , khổ, đắng cay, ngọt ng&agrave;o của cuộc sống.V&agrave; ch&iacute;nh v&igrave; những điều đ&oacute; bạn đ&atilde; th&agrave;nh c&ocirc;ng, th&agrave;nh c&ocirc;ng với ch&iacute;nh bản th&acirc;n m&igrave;nh v&agrave; với cuộc sống rằng bạn đ&atilde; vượt qua v&agrave; sống thật với cuộc sống đầy gai g&oacute;c n&agrave;y.<br />\r\n<br />\r\nTuổi trẻ l&agrave; để kh&aacute;t khao, mơ uớc v&agrave; để cống hiến ch&iacute;nh v&igrave; vậy ch&uacute;ng ta h&atilde;y để cho m&igrave;nh được tự do l&agrave;m những g&igrave; m&igrave;nh muốn v&agrave; m&igrave;nh mong đợi.<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;<strong>&nbsp;&ldquo;Tuổi trẻ kh&ocirc;ng bao giờ quay lại&rdquo;</strong>&nbsp;l&agrave; một lời nhắn gửi, một m&oacute;n qu&agrave; tinh thần, một c&aacute;i hộp nhỏ chứa bảy t&uacute;i hạt giống, với bảy sắc m&agrave;u nu&ocirc;i dưỡng sức mạnh v&agrave; l&ograve;ng dũng cảm cho bạn trẻ. Ch&uacute;ng t&ocirc;i hy vọng c&oacute; thể tiếp tục truyền lửa, tạo th&ecirc;m động lực, chắp c&aacute;nh ước mơ,&hellip;lấy đ&oacute; l&agrave;m gi&aacute; trị cốt l&otilde;i dẫn bước bạn trẻ v&agrave;o đời, c&ugrave;ng c&aacute;c bạn đối mặt với cuộc sống v&agrave; vượt qua những thử th&aacute;ch<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H&atilde;y ước mơ v&igrave; ước mơ sẽ chỉ đường cho ta lao về đ&iacute;ch. Cho d&ugrave; tr&ecirc;n đường đi c&oacute; thể c&oacute; vấp ng&atilde; nhưng ch&iacute;nh ước mơ sẽ n&acirc;ng ch&uacute;ng ta đứng dậy đi tiếp... Tuổi trẻ l&agrave; tuổi tươi đẹp nhất của ước mơ. Tuổi đ&ocirc;i mươi l&agrave; giai đoạn thể lực v&agrave; tinh thần của con người dồi d&agrave;o nhất để nu&ocirc;i dưỡng ho&agrave;i b&atilde;o. V&igrave; vậy, c&aacute;c bạn trẻ n&ecirc;n c&oacute; nhiều ước mơ, nhiều kh&aacute;t vọng để rồi ta sẽ dấn th&acirc;n tr&ecirc;n con đường sự nghiệp của cả đời người.</p>\r\n', 'Nhiều Tác Giả', '2016', 14000, 'http://anybooks.vn/images/book/image/tuoi_tre_khong_bao_gio_quay_lai.jpg', '[""]', 1492743781, 0, 0, 'Tuổi Trẻ Không Bao Giờ Quay Lại', 'Tuổi Trẻ Không Bao Giờ Quay Lại', '', 0, 0, 0, 0, 'Tổng Hợp TPHCM', 'Trí Việt', 'Tuổi Trẻ Không Bao Giờ Quay Lại', '0', 0, 0, 'Bìa mềm', '14.5 x 20.5 cm', '', '500 gam', '', 269),
(525, 264, 0, 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Bố Kể Con Nghe', 'cam-nang-danh-cho-me-bau-va-thai-nhi-bo-ke-con-nghe', 0, 68000, '<p>Đừng nghĩ sai lầm rằng thai gi&aacute;o chỉ l&agrave; việc của người mẹ!<br />\r\n&nbsp;</p>\r\n\r\n<p>C&ugrave;ng với c&aacute;c mẹ bầu, c&aacute;c &ocirc;ng bố h&atilde;y tham gia v&agrave;o qu&aacute; tr&igrave;nh thai gi&aacute;o bằng việc l&agrave;m theo những gợi &yacute; trong cuốn s&aacute;ch n&agrave;y!<br />\r\n&nbsp;</p>\r\n\r\n<p>C&aacute;c nghi&ecirc;n cứu đ&atilde; chỉ ra rằng kh&ocirc;ng phải &acirc;m nhạc, m&agrave; giọng n&oacute;i dịu d&agrave;ng, ấm &aacute;p của mẹ v&agrave; giọng n&oacute;i trầm ấm, mạnh mẽ của cha mới l&agrave; &acirc;m thanh b&eacute; đặc biệt y&ecirc;u th&iacute;ch khi c&ograve;n nằm trong bụng mẹ.<br />\r\n&nbsp;</p>\r\n\r\n<p><em>Nếu hoạt động thai gi&aacute;o được thực hiện tốt, th&igrave; chắc chắn em b&eacute; sẽ ph&aacute;t triển to&agrave;n diện về cả thế chất, tr&iacute; tuệ v&agrave; cảm x&uacute;c. Hơn thế nữa, c&ograve;n gi&uacute;p cho người mẹ qu&ecirc;n đi mệt mỏi, để cảm nhận hết niềm hạnh ph&uacute;c khi mang thai.</em></p>\r\n', 'Nhiều Tác Giả', '2016', 11000, 'http://anybooks.vn/images/book/image/cam_nang_danh_cho_me_bau_va_thai_nhi_bo_ke_con_nghe.jpg', '[""]', 1492743879, 0, 0, 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Bố Kể Con Nghe', 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Bố Kể Con Nghe', '', 0, 0, 0, 0, 'Kim Đồng', 'Kim Đồng', 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Bố Kể Con Nghe', '0', 0, 0, 'Bìa mềm', '18.5 x 17 cm', '', '300 gram', '', 172),
(526, 264, 0, 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Mẹ Kể Con Nghe', 'cam-nang-danh-cho-me-bau-va-thai-nhi-me-ke-con-nghe', 0, 68000, '<p>H&atilde;y y&ecirc;u thương b&eacute;, bằng tất cả sự quan t&acirc;m v&agrave; l&ograve;ng ki&ecirc;n tr&igrave;! Ngay từ khi b&eacute; c&ograve;n trong bụng mẹ.<br />\r\n&nbsp;</p>\r\n\r\n<p>C&aacute;c chuy&ecirc;n gia về thai gi&aacute;o khuy&ecirc;n rằng: Mỗi ng&agrave;y, mẹ h&atilde;y đọc truyện cho b&eacute; nghe v&agrave; n&oacute;i với b&eacute; những suy nghĩ, t&igrave;nh cảm của m&igrave;nh. Để khi b&eacute; ch&agrave;o đời, b&eacute; sẽ l&agrave; một em b&eacute; khỏe mạnh cả về thế chất lẫn tinh thần.<br />\r\n&nbsp;</p>\r\n\r\n<p><em>Đ&acirc;y l&agrave; cuốn s&aacute;ch tuyển những c&acirc;u chuyện ph&ugrave; hợp nhất để mẹ kể cho b&eacute; nghe. Xin h&atilde;y đọc kĩ phần &quot;Lời n&oacute;i đầu&quot; của ch&uacute;ng t&ocirc;i để biết c&aacute;ch kể chuyện hiệu quả nhất cho c&aacute;c em b&eacute; trong bụng mẹ.</em></p>\r\n', 'Nhiều Tác Giả', '2016', 11000, 'http://anybooks.vn/images/book/image/cam_nang_danh_cho_me_bau_va_thai_nhi_me_ke_con_nghe.jpg', '[""]', 1492743959, 0, 0, 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Mẹ Kể Con Nghe', 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Mẹ Kể Con Nghe', '', 0, 0, 0, 0, 'Kim Đồng', 'Kim Đồng', 'Cẩm Nang Dành Cho Mẹ Bầu Và Thai Nhi - Mẹ Kể Con Nghe', '0', 0, 1, 'Bìa mềm', '18.5 x 17 cm', '', '450 gram', '', 172);
INSERT INTO `product` (`id`, `catalog_id`, `address_id`, `name`, `slug`, `maker_id`, `price`, `content`, `tac_gia`, `xuat_ban`, `discount`, `image_link`, `image_list`, `created`, `created_new`, `view`, `meta_key`, `site_title`, `warranty`, `total`, `buyed`, `rate_total`, `rate_count`, `nxb`, `nph`, `meta_desc`, `feature`, `status`, `noi_bat`, `dang_bia`, `kich_thuoc`, `ma_sp`, `khoi_luong`, `gifts`, `so_trang`) VALUES
(527, 264, 0, 'Thực đơn cho phụ nữ mang thai và sinh con', 'thuc-don-cho-phu-nu-mang-thai-va-sinh-con', 0, 37000, '<p>&nbsp;Đối với thai phụ, dinh dưỡng đ&oacute;ng vai tr&ograve; rất quan trọng bởi khi mang thai cơ thể b&agrave; bầu cần nhiều dinh dưỡng hơn để nu&ocirc;i thai nhi. Thai nhi chỉ ph&aacute;t triển tốt khi được cung cấp đủ dưỡng chất.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sau khi sinh, c&aacute;c b&agrave; mẹ cũng cần ch&uacute; &yacute; tới dinh dưỡng cho cơ thể bởi đ&acirc;y kh&ocirc;ng chỉ l&agrave; thời gian cho con b&uacute; m&agrave; c&ograve;n l&agrave; l&uacute;c cơ thể phục hồi sau cơn &quot;vượt cạn&quot; đầy kh&oacute; khăn</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cuốn s&aacute;ch được tr&igrave;nh b&agrave;y kh&aacute; r&otilde; r&agrave;ng: Phần đầu cung cấp kiến thức về những m&oacute;n ăn đầy đủ chất dinh dưỡng d&agrave;nh cho thai phụ. Đ&acirc;y kh&ocirc;ng chỉ l&agrave; những m&oacute;n ăn ph&ugrave; hợp với khẩu vị của c&aacute;c b&agrave; bầu m&agrave; c&ograve;n gi&uacute;p b&agrave; bầu trị c&aacute;c chứng &quot;kh&oacute; ở&quot; thường gặp trong giai đoạn ốm ngh&eacute;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Phần sau của cuốn s&aacute;ch tr&igrave;nh b&agrave;y những thực đơn gi&uacute;p c&aacute;c b&agrave; mẹ đang cho con b&uacute; c&oacute; được nguồn sữa dồi d&agrave;o v&agrave; chất lượng nhất. Đi k&egrave;m theo đ&oacute; l&agrave; c&aacute;c m&oacute;n ăn gi&uacute;p c&aacute;c bệnh thường gặp ở phụ nữ mới sinh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Mục lục:</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lời n&oacute;i đầu</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Phần 1: M&oacute;n ăn d&agrave;nh cho thai phụ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>I. Thực đơn bổ dưỡng cho những người chuẩn bị l&agrave;m mẹ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>II. M&oacute;n ăn để cải thiện sức khoẻ phụ nữ mang thai</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>III. Chế độ ăn của thai phụ v&agrave;o m&ugrave;a đ&ocirc;ng</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Phần 2: Thực đơn d&agrave;nh cho sản phụ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>I. Hướng dẫn c&aacute;ch ăn uống sau khi sinh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>II. Thực đơn d&agrave;nh cho phụ nữ sau khi sinh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>III. M&oacute;n ăn d&agrave;nh cho người nu&ocirc;i con bằng sữa mẹ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>IV. M&oacute;n ăn trị bệnh, bồi dưỡng sức khoẻ của sản phụ</p>\r\n', 'Trương Anh Thiệu', '2012', 7000, 'http://anybooks.vn/images/book/image/Thuc_don_cho_phu_nu_mang_thai_va_sinh_con.jpg', '[""]', 1492744027, 0, 0, 'Thực đơn cho phụ nữ mang thai và sinh con', 'Thực đơn cho phụ nữ mang thai và sinh con', '', 0, 0, 0, 0, 'Phụ Nữ', 'NXB Phụ Nữ', 'Thực đơn cho phụ nữ mang thai và sinh con', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '320 gam', '', 188),
(528, 264, 0, 'Hành Trình Thai Giáo 280 Ngày', 'h-nh-trinh-thai-giao-280-ng-y', 0, 80000, '<p>Thai gi&aacute;o theo nghĩa rộng ch&iacute;nh l&agrave; th&ocirc;ng qua chế độ dinh dưỡng, m&ocirc;i trường v&agrave; tinh thần để th&uacute;c đẩy sự ph&aacute;t triển to&agrave;n diện của trẻ. Theo nghĩa hẹp thai gi&aacute;o l&agrave; căn cứ v&agrave;o thời điểm cụ thể để &aacute;p dụng c&aacute;c biện ph&aacute;p như: nghe nhạc, chiếu s&aacute;ng, tắm nắng, n&oacute;i chuyện... để gi&uacute;p b&eacute; ch&agrave;o đời khỏe, đẹp, th&ocirc;ng minh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cuốn s&aacute;ch n&agrave;y theo s&aacute;t h&agrave;nh tr&igrave;nh ph&aacute;t triển của thai nhi, kh&ocirc;ng bỏ qua bất cứ thời khắc quan trọng n&agrave;o. Bạn sẽ chủ động v&agrave; tự tin suốt chặng đường mang thai với chỉ dẫn thai gi&aacute;o chi tiết tới từng ng&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&quot;Cuốn s&aacute;ch đưa ra rất nhiều phương ph&aacute;p để b&agrave; bầu vận động c&ugrave;ng thai nhi. Trong qu&aacute; tr&igrave;nh vận động, t&ocirc;i cảm nhận được r&otilde; r&agrave;ng rằng bản th&acirc;n m&igrave;nh đang giao lưu với thai nhi, đ&uacute;ng l&agrave; một điều vừa k&igrave; diệu vừa hạnh ph&uacute;c!&quot;</p>\r\n', 'Hán Trúc', '2014', 12000, 'http://anybooks.vn/images/book/image/hanh_trinh_thai_giao_280_ngay.jpg', '[""]', 1492748899, 0, 0, 'Hành Trình Thai Giáo 280 Ngày', 'Hành Trình Thai Giáo 280 Ngày', '', 0, 0, 0, 0, 'Phụ Nữ', 'Minh Long', 'Hành Trình Thai Giáo 280 Ngày', '0', 0, 0, 'Bìa mềm', '17 x 23 cm', '', '450 gram', '', 262),
(529, 263, 0, 'Cuốn sổ vàng (Giải Nobel văn chương)', 'cuon-so-vang', 0, 156000, '<p>Lần đầu ti&ecirc;n được xuất bản năm 1962 v&agrave; hiện đ&atilde; trở th&agrave;nh một trong c&aacute;c t&aacute;c phẩm vĩ đại nhất thế kỷ hai mươi,&nbsp;<strong>Cuốn Sổ V&agrave;ng</strong>&nbsp;l&agrave; c&acirc;u chuyện của Anna Wulf, một người mẹ đơn th&acirc;n với h&agrave;ng loạt c&aacute;c mối quan hệ bế tắc, một nh&agrave; văn từng th&agrave;nh danh nhưng hiện cũng bế tắc với một cuốn tiểu thuyết dở dang. Sợ m&igrave;nh ph&aacute;t đi&ecirc;n, c&ocirc; đ&atilde; ghi lại c&aacute;c trải nghiệm của m&igrave;nh trong bốn cuốn sổ c&oacute; m&agrave;u kh&aacute;c nhau. Nhưng cuốn sổ thứ năm,&nbsp;<strong>Cuốn Sổ V&agrave;ng,</strong>&nbsp;mới l&agrave; thứ kết nối c&aacute;c mảnh cuộc sống của c&ocirc; lại v&agrave; l&agrave; ch&igrave;a kh&oacute;a gi&uacute;p c&ocirc; b&igrave;nh phục về mặt tinh thần.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cuốn tiểu thuyết đồ sộ n&agrave;y l&agrave; h&agrave;nh tr&igrave;nh nội t&acirc;m của Anna qua những mảnh vỡ của bản th&acirc;n trong một thế giới cũng đang tan r&atilde;: T&igrave;nh y&ecirc;u, tự do, c&aacute;i chết, t&iacute;n điều, đặt giữa hỗn loạn c&aacute;c hệ tư tưởng, trong tiếng ầm &igrave; của chiến tranh, mối đe dọa hủy diệt của bom H, qu&aacute; tr&igrave;nh phi thực d&acirc;n h&oacute;a của nước Anh, sự h&igrave;nh th&agrave;nh của c&aacute;c quốc gia mới. Phức tạp nhưng vẫn thanh t&uacute; đến kỳ lạ, t&aacute;c phẩm dẫn người đọc theo bước Anna đến những trang cuối c&ugrave;ng, kh&ocirc;ng phải tới một đ&aacute;p &aacute;n to&agrave;n năng cho to&agrave;n bộ c&aacute;c vấn đề của c&aacute; nh&acirc;n v&agrave; nh&acirc;n loại, m&agrave; khả thi hơn thế, dễ chịu hơn thế, tới một ch&uacute;t khai s&aacute;ng, cảm gi&aacute;c mới mẻ như vừa t&aacute;i sinh, khi nhận ra những thất bại v&agrave; thiếu s&oacute;t trong qu&aacute; khứ, cả hỗn loạn của hiện tại hay u &aacute;m của tương lai, vẻ đẹp v&agrave; sự ph&ugrave; phiếm của ch&uacute;ng, tất cả đều đ&aacute;ng gi&aacute; từng gi&acirc;y ta sống tr&ecirc;n đời.</p>\r\n', 'Doris May Lessing', '2016', 30000, 'http://anybooks.vn/images/book/image/cuon_so_vang.jpg', '[""]', 1492744182, 0, 0, 'Cuốn sổ vàng', 'Cuốn sổ vàng', '', 0, 0, 0, 0, 'Văn Học', 'Nhã Nam', 'Cuốn sổ vàng', '0', 0, 0, 'Bìa mềm', '15 x 24 cm', '', '850 gram', '', 667),
(530, 263, 0, 'Nghiệt duyên (Cuốn sách bán chạy suốt 45 năm của văn học Thái Lan)', 'nghiet-duyen', 0, 140000, '<p>Angsumalin từ biệt người bạn trai th&acirc;n thiết từ thuở thiếu thời để anh l&ecirc;n đường sang Anh quốc du học, với lời hứa chờ đợi anh về v&agrave; trả lời c&acirc;u hỏi:&quot;&nbsp;<em>Em sẽ cưới anh chứ?</em>&quot; Nhưng rồi, Đại chiến Thế giới thứ hai nổ ra, qu&acirc;n Nhật tiến v&agrave;o chiếm đ&oacute;ng đất nước Th&aacute;i Lan, v&agrave; nhất l&agrave; sự xuất hiện của sĩ quan Nhật trẻ tuổi, đẹp trai, h&agrave;o hiệp Kobpori đ&atilde; l&agrave;m đảo lộn mọi thứ trong cuộc đời c&ocirc; g&aacute;i...<br />\r\n&nbsp;</p>\r\n\r\n<p><em>&quot;Một mặt, Nghiệt duy&ecirc;n l&agrave; c&acirc;u chuyện t&igrave;nh cao đẹp v&agrave; tinh tế; mặt kh&aacute;c n&oacute; l&agrave;m tấm gương phản chiếu hậu quả &aacute;c nghiệt của chiến tranh, đồng thời của phản &aacute;nh một c&aacute;ch ch&acirc;n thực v&agrave; s&acirc;u sắc cốt l&otilde;i của nền văn h&oacute;a Th&aacute;i Lan để ta nghi&ecirc;n cứu t&igrave;m hiểu.&quot;</em></p>\r\n\r\n<p><strong>- Tr&iacute;ch lời tựa cho lần xuất bản thứ 11 của Nh&agrave; xuất bản Baanwannagum -&nbsp;</strong></p>\r\n', 'Thommayanti', '2015', 21000, 'http://anybooks.vn/images/book/image/nghiet_duyen.jpg', '[""]', 1492744236, 0, 0, 'Nghiệt duyên', 'Nghiệt duyên', '', 0, 0, 0, 0, 'Thanh Niên', 'Nhã Nam', 'Nghiệt duyên', '0', 0, 0, 'Bìa mềm', '15 x 24 cm', '', '700 gram', '', 572),
(531, 263, 0, 'Những người vay mượn tí hon (Tái bản 2015)', 'nhung-nguoi-vay-muon-ti-hon', 0, 48000, '<p>Biết bao c&acirc;u chuyện về người t&iacute; hon đ&atilde; từng l&agrave;m say đắm cả thế giới. Nhưng chẳng phải ai cũng biết rằng họ thực sự tồn tại. V&agrave; trong c&acirc;u chuyện n&agrave;y họ lại l&agrave; những người vay mượn sinh sống b&ecirc;n dưới thế giới con người.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ở dưới s&agrave;n nh&agrave; căn bếp của một t&ograve;a l&acirc;u đ&agrave;i cổ c&oacute; gia đ&igrave;nh Clock t&iacute; hon, gồm &ocirc;ng Pod, b&agrave; Homily v&agrave; con g&aacute;i họ, Arrietty. Hễ cần c&aacute;i g&igrave;, &ocirc;ng Pod chỉ việc l&ecirc;n &ldquo;mượn&rdquo; con người. Nhưng chỉ m&igrave;nh &ocirc;ng được ngao du l&ecirc;n tr&ecirc;n, bởi lu&ocirc;n c&ograve;n đ&oacute; nguy cơ người vay mượn bị &ldquo;nh&igrave;n thấy&rdquo; v&agrave; kh&ocirc;ng thể trở về nh&agrave;. Cuộc sống của nh&agrave; Clock dễ d&agrave;ng, nhưng lại qu&aacute; buồn tẻ với một đứa trẻ như Arrietty. C&ocirc; chỉ c&oacute; thể nh&igrave;n trời xanh qua &ocirc; lưới sắt, h&iacute;t thở từ khe v&aacute;n gỗ, lủi thủi chơi một m&igrave;nh. Arrietty đang v&ocirc; c&ugrave;ng khao kh&aacute;t được kết bạn Trong khi ở tr&ecirc;n kia c&oacute; m&acirc;y rợp bay, c&acirc;y cối m&aacute;t rượi, những c&aacute;nh đồng hoa b&aacute;t ng&aacute;t. V&agrave; c&oacute; cả một cậu b&eacute; tốt bụng &hellip;</p>\r\n', 'Mary Norton', '2015', 8000, 'http://anybooks.vn/images/book/image/nhung_nguoi_vay_muon_ti_hon_tai_ban_2015_.jpg', '[""]', 1492744296, 0, 2, 'Những người vay mượn tí hon', 'Những người vay mượn tí hon', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Những người vay mượn tí hon', '0', 0, 1, 'Bìa mềm', '13 x 20.5 cm', '', '300 gram', '', 204),
(532, 263, 0, 'Người đua diều ( Tái bản )', 'nguoi-dua-dieu', 0, 92000, '<p>T&ocirc;i &ndash; Amir, một nh&agrave; văn người Afghanistan đang sống tr&ecirc;n đất Mỹ nhưng m&atilde;i kh&ocirc;ng ngu&ocirc;i &aacute;m ảnh về tuổi thơ. Một ng&agrave;y, anh trở về Kabul chưa gi&acirc;y ph&uacute;t n&agrave;o y&ecirc;n b&igrave;nh, để chuộc lại lỗi lầm qu&aacute; khứ.</p>\r\n\r\n<p>Amir sinh ra trong một gia đ&igrave;nh gi&agrave;u c&oacute;. Cả phần tuổi thơ lớn l&ecirc;n trong xa hoa, nhung lụa. Gắn b&oacute; với Amir suốt qu&atilde;ng đời đ&oacute; l&agrave; Hassan, con của người quản gia Ali. Hassan, cậu b&eacute; trong s&aacute;ng, vui vẻ, dũng cảm, đ&atilde; hết l&ograve;ng chăm s&oacute;c v&agrave; bảo vệ Amir.</p>\r\n\r\n<p>Thế nhưng v&agrave;o năm 1975 m&agrave; Amir m&atilde;i m&atilde;i kh&ocirc;ng qu&ecirc;n ấy, một việc đ&atilde; xảy ra. Bọn trẻ con đua diều, thi nhau hạ gục những c&aacute;nh diều của đối thủ tr&ecirc;n trời. V&igrave; d&agrave;nh lại c&aacute;nh diều chiến lợi phẩm cho Amir, Hassan đ&atilde; bị đ&aacute;nh v&agrave; sỉ nhục. Qu&aacute; yếu h&egrave;n, Amir đ&atilde; kh&ocirc;ng cứu bạn, v&agrave; c&ograve;n bịa chuyện n&oacute;i dối để đuổi cha con Ali ra khỏi nh&agrave;.</p>\r\n\r\n<p>Hai mươi s&aacute;u năm đ&atilde; tr&ocirc;i qua, nhưng mặc cảm về lỗi lầm cũ vẫn khắc khoải, khiến Amir chưa ph&uacute;t gi&acirc;y n&agrave;o thanh thản. Anh quyết định trở về, để sửa đổi sai lầm cũ đ&oacute;.</p>\r\n', 'Khaled Hosseini', '2013', 18000, 'http://anybooks.vn/images/book/image/Nguoi_dua_dieu_Tai_ban_.jpg', '[""]', 1492744347, 0, 2, 'Người đua diều', 'Người đua diều', '', 0, 0, 0, 0, 'Phụ Nữ', 'Nhã Nam', 'Người đua diều', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '550 gram', '', 460),
(533, 266, 0, 'Yêu Đi Đừng Sợ', 'yeu-di-dung-so', 0, 79000, '<p><strong>M&oacute;n qu&agrave; Vanlentine d&agrave;nh tặng ch&iacute;nh m&igrave;nh của c&aacute;c c&ocirc; g&aacute;i.</strong><br />\r\n<br />\r\n<em>&quot;Thanh xu&acirc;n c&ograve;n g&igrave; đ&acirc;u nếu thiếu đi những cuồng nhiệt đi&ecirc;n rồ...&quot;</em><br />\r\n<br />\r\nCuốn s&aacute;ch d&agrave;nh tặng những tr&aacute;i tim c&ograve;n lẻ b&oacute;ng, c&ograve;n nhiều ho&agrave;i nghi nhiều ngần ngại. Thanh xu&acirc;n ngắn ngủi, SỢ G&Igrave; KH&Ocirc;NG Y&Ecirc;U.<br />\r\n<br />\r\nNgọt ng&agrave;o hay đắng ch&aacute;t?<br />\r\n<br />\r\nDịu m&aacute;t hay gắt nồng?<br />\r\n<br />\r\nBạn bỏ g&igrave; trong t&aacute;ch tr&agrave; t&igrave;nh y&ecirc;u của m&igrave;nh?<br />\r\n<br />\r\nBạn biết kh&ocirc;ng:<br />\r\n<br />\r\nT&aacute;ch tr&agrave; của ai đ&oacute; c&oacute; thể c&oacute; vị ngọt ng&agrave;o thơm nồng của mối t&igrave;nh đầu, của tuổi trẻ đầy bồng bột nhưng cũng đầy đam m&ecirc;.<br />\r\n<br />\r\nT&aacute;ch tr&agrave; của ai đ&oacute; c&oacute; thể c&oacute; vị đắng ch&aacute;t của ho&agrave;i nghi, tổn thương v&agrave; sợ h&atilde;i.<br />\r\n<br />\r\nNhưng &iacute;t nhất họ đều d&aacute;m y&ecirc;u, d&aacute;m cho đi đều can đảm để bước v&agrave;o t&igrave;nh y&ecirc;u, hết m&igrave;nh v&igrave; t&igrave;nh y&ecirc;u v&agrave; dẫu c&oacute; thất bại cũng đừng ngại đứng dậy.<br />\r\n<br />\r\nBạn c&oacute; thể sợ h&atilde;i c&aacute;i nắm tay của một ai đ&oacute; bởi sợ rằng người một mai sẽ bu&ocirc;ng tay . Bạn c&oacute; thể tổn thương v&igrave; một lần bu&ocirc;ng bỏ. Bạn cũng c&oacute; thể lu&ocirc;n cho rằng hạnh ph&uacute;c chỉ đến một lần, để vụt mất nghĩa l&agrave; kh&ocirc;ng c&oacute; cơ hội t&igrave;m lại.Bạn c&oacute; thể sợ rất nhiều thứ, ho&agrave;i nghi rất nhiều thứ.<br />\r\n<br />\r\nNhưng bạn biết kh&ocirc;ng: bạn c&ograve;n trẻ. V&agrave; nếu bạn kh&ocirc;ng y&ecirc;u, nghĩa l&agrave; bạn đ&aacute;nh mất đi những đặc quyền đi&ecirc;n rồ m&agrave; tuyệt vời nhất của tuổi trẻ.<br />\r\n<br />\r\nSợ g&igrave; kh&ocirc;ng rung động.<br />\r\n<br />\r\nSợ g&igrave; kh&ocirc;ng mở l&ograve;ng m&igrave;nh.<br />\r\n<br />\r\nSợ g&igrave; kh&ocirc;ng đ&oacute;n nhận một ai đ&oacute;.<br />\r\n<br />\r\nC&ocirc; g&aacute;i &agrave;, rồi sẽ đến một ng&agrave;y, bạn sẽ lại được y&ecirc;u, được n&acirc;ng niu v&agrave; mọi vết thương sẽ được chữa l&agrave;nh. C&ocirc; g&aacute;i &agrave;, đừng cố chấp, đừng gạt bỏ mọi cơ hội đến với bạn. Đừng kh&oacute; t&iacute;nh qu&aacute; với ch&iacute;nh bản th&acirc;n v&agrave; tr&aacute;i tim m&igrave;nh. Tr&aacute;i tim n&agrave;o cũng cần y&ecirc;u thương, cần điểm tựa cần mảnh gh&eacute;p ph&ugrave; hợp với ch&iacute;nh m&igrave;nh .<br />\r\n<br />\r\nMột c&ocirc; g&aacute;i th&ocirc;ng minh, l&agrave; một c&ocirc; g&aacute;i biết chọn những hương vị tuyệt nhất cho t&aacute;ch tr&agrave; t&igrave;nh y&ecirc;u của m&igrave;nh.<br />\r\n<br />\r\n<strong>Y&ecirc;u đi đừng sợ! H&atilde;y cứ y&ecirc;u như chưa từng tổn thương đến thế!</strong></p>\r\n', 'Kim Oanh', '14-02-2017', 16000, 'http://anybooks.vn/images/book/image/yeu_di_dung_so.jpg', '[""]', 1492744402, 0, 2, 'Yêu Đi Đừng Sợ', 'Yêu Đi Đừng Sợ', '', 0, 0, 0, 0, 'Lao Động', 'Skybooks', 'Yêu Đi Đừng Sợ', '0', 0, 1, 'Bìa mềm', '12 x 20 cm', '', '250 gam', '', 216),
(534, 266, 0, 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình', 'chung-ta-dau-chi-song-cho-rieng-minh', 0, 82000, '<p>Mọi chuyện sẽ chẳng thể tốt đẹp l&ecirc;n nếu như ch&uacute;ng ta kh&ocirc;ng h&agrave;nh động. Bạn kh&ocirc;ng thể đ&ograve;i hỏi người kh&aacute;c l&agrave;m những điều tốt đẹp khi bản th&acirc;n th&igrave; đang khoanh tay đứng y&ecirc;n. Thay v&igrave; th&uacute;c giục, đổ lỗi hay o&aacute;n tr&aacute;ch người kh&aacute;c, h&atilde;y bắt đầu bằng việc bạn c&oacute; thể l&agrave;m. Những điều tử tế v&agrave; tốt đẹp như c&aacute;nh hoa bồ c&ocirc;ng anh, tự ch&uacute;ng sẽ lan đi&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Ch&uacute;ng ta đ&acirc;u chỉ sống cho ri&ecirc;ng m&igrave;nh! L&agrave;m một điều tốt, mỗi ch&uacute;ng ta sẽ nhận được một b&ocirc;ng hoa hạnh ph&uacute;c v&agrave; như thế thế giới n&agrave;y sẽ l&agrave; một rừng hoa hạnh ph&uacute;c&hellip;</strong></p>\r\n', 'Dương Thụy', '17-01-2017', 15000, 'http://anybooks.vn/images/book/image/chung_ta_dau_chi_song_cho_rieng_minh.jpg', '[""]', 1492744459, 0, 70, 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình', 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình', '', 0, 0, 0, 0, 'Hà Nội', 'Bão', 'Chúng Ta Đâu Chỉ Sống Cho Riêng Mình`', '0', 0, 0, 'Bìa mềm', '12 x 19 cm', '', '400 gram', '', 192),
(535, 266, 0, 'Anh Không Thích Thế Giới Này, Anh Chỉ Thích Em', 'anh-khong-thich-the-gioi-n-y-anh-chi-thich-em', 0, 99000, '<p><strong>Anh Kh&ocirc;ng Th&iacute;ch Thế Giới N&agrave;y, Anh Chỉ Th&iacute;ch Em</strong>&nbsp;l&agrave; một trong những topic hot nhất tr&ecirc;n Tianya, được rất nhiều cư d&acirc;n mạng y&ecirc;u th&iacute;ch. Đ&acirc;y l&agrave; hồi ức t&igrave;nh y&ecirc;u của một đ&ocirc;i t&igrave;nh nh&acirc;n, ghi lại những c&acirc;u chuyện nhỏ vừa ấm &aacute;p vừa dễ thương giữa hai người y&ecirc;u nhau. T&aacute;c giả ghi lại một c&aacute;ch ch&acirc;n thực mọi vấn đề m&agrave; một c&ocirc; g&aacute;i gặp phải trong qu&aacute; tr&igrave;nh trưởng th&agrave;nh của m&igrave;nh, từ từ trở n&ecirc;n ki&ecirc;n cường, độc lập v&agrave; sự bảo vệ đợi chờ mười năm của một ch&agrave;ng trai bằng ng&ograve;i b&uacute;t nhẹ nh&agrave;ng h&agrave;i hước. Từ sự non nớt ng&acirc;y thơ thời học sinh đến những chuyện th&uacute; vị ngọt ng&agrave;o sau h&ocirc;n nh&acirc;n, mọi thứ b&igrave;nh thường nhưng kh&ocirc;ng tầm thường. Những mẩu chuyện đầy th&uacute; vị mang theo t&igrave;nh y&ecirc;u v&agrave; sức mạnh từ những điều nhỏ nhặt b&igrave;nh thường của cuộc sống khiến độc giả đọc xong đều bất gi&aacute;c mỉm cười. Khiến người ta hiểu rằng t&igrave;nh y&ecirc;u c&oacute; thể ngọt ng&agrave;o đến thế, cuộc sống c&oacute; thể ấm &aacute;p đến thế.</p>\r\n', 'Kiều Nhất', '01-01-2017', 19000, 'http://anybooks.vn/images/book/image/anh_khong_thich_the_gioi_nay_anh_chi_thich_em.jpg', '[""]', 1493536000, 0, 29, 'Anh Không Thích Thế Giới Này, Anh Chỉ Thích Em', 'Anh Không Thích Thế Giới Này, Anh Chỉ Thích Em', '', 0, 0, 0, 0, 'Văn Học', 'TiHaBooks', 'Anh Không Thích Thế Giới Này, Anh Chỉ Thích Em', '0', 0, 0, 'Bìa mềm', '', '', '200 gram', '', 0),
(536, 266, 0, 'Phụ Nữ Là Phải Đẹp', 'phu-nu-la-phai-dep', 0, 169000, '<p>Từ cuốn cẩm nang gi&uacute;p bạn trở n&ecirc;n xinh đẹp m&agrave; kh&ocirc;ng qu&aacute; tốn k&eacute;m!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Xuất ph&aacute;t từ niềm tin rằng mọi người phụ nữ tr&ecirc;n đời đều c&oacute; thể trở n&ecirc;n xinh đẹp nếu c&oacute; đủ sự quan t&acirc;m v&agrave; chăm s&oacute;c đ&uacute;ng c&aacute;ch,&nbsp;<strong>STYLORY&nbsp;</strong>v&agrave; t&aacute;c giả&nbsp;<strong>Trang L&ecirc;</strong>&nbsp;đ&atilde; c&ugrave;ng bắt tay thực hiện cuốn s&aacute;ch &ldquo; Phụ nữ l&agrave; phải Đẹp&rdquo;, với một điều t&acirc;m niệm đ&acirc;y sẽ l&agrave; một cuốn cẩm nang hữu &iacute;ch về đề t&agrave;i L&agrave;m đẹp &amp; Thời trang d&agrave;nh cho mọi phụ nữ Việt Nam.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Được chia th&agrave;nh 3 chương với 3 chủ đề cụ thế:&nbsp;<strong>Chăm s&oacute;c da &ndash; Trang điểm &ndash; Phong c&aacute;ch thời trang,</strong>&nbsp;cuốn s&aacute;ch kh&ocirc;ng chỉ rất dễ d&agrave;ng cho bạn đọc ở lần đầu ti&ecirc;n, m&agrave; c&ograve;n rất thuận lợi để sau n&agrave;y bạn lật ngược lại v&agrave; tra cứu những th&ocirc;ng tin cần thiết. Mặc d&ugrave; trong thời đại Internet, chỉ với một c&uacute; click tr&ecirc;n thanh c&ocirc;ng cụ Google l&agrave; phụ nữ c&oacute; thể dễ d&agrave;ng t&igrave;m ra bất cứ mẹo vặt hoặc b&iacute; quyết n&agrave;o họ muốn, nhưng với &ldquo; Phụ nữ l&agrave; phải Đẹp&rdquo; th&igrave; kh&aacute;c. Đ&acirc;y l&agrave; cuốn s&aacute;ch đầu ti&ecirc;n v&agrave; duy nhất tại Việt Nam &ndash; t&iacute;nh cho đến thời điểm n&agrave;y &ndash; cung cấp cho bạn một c&aacute;i nh&igrave;n cơ bản, trọn vẹn v&agrave; dễ &aacute;p dụng về chuyện chăm s&oacute;c ngoại h&igrave;nh: từ việc n&ecirc;n kẻ l&ocirc;ng m&agrave;y thế n&agrave;o cho ph&ugrave; hợp với đ&ocirc;i mắt, n&ecirc;n chọn kem chống nắng ra sao hoặc d&aacute;ng người n&agrave;o sẽ ph&ugrave; hợp với kiểu trang phục n&agrave;o&hellip;v&hellip;v&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>V&agrave; điều ch&acirc;n thực hơn cả l&agrave; tất cả những b&iacute; quyết L&agrave;m đẹp &amp; Thời trang được r&uacute;t ra trong cuốn s&aacute;ch đều l&agrave; những kinh nghiệm thực tế của ch&iacute;nh t&aacute;c giả Trang Le, h&ograve;ng t&igrave;m ra được phương &aacute;n tốt nhất v&agrave; dễ thực h&agrave;nh nhất, vậy n&ecirc;n chắc chắn cuốn s&aacute;ch sẽ gi&uacute;p bạn tiết kiệm được v&ocirc; khối thời gian v&agrave; ho&agrave;n to&agrave;n kh&ocirc;ng &nbsp;qu&aacute; tốn k&eacute;m trong việc x&acirc;y dựng lộ tr&igrave;nh l&agrave;m đẹp v&agrave; phong c&aacute;ch thời trang cho ri&ecirc;ng m&igrave;nh.</p>\r\n', 'Trang Lê', '2016', 29000, 'http://anybooks.vn/images/book/image/phu_nu_la_phai_dep.jpg', '[""]', 1492744542, 0, 11, 'Phụ Nữ Là Phải Đẹp', 'Phụ Nữ Là Phải Đẹp', '', 0, 0, 0, 0, 'Thế Giới', 'STYLORY', 'Phụ Nữ Là Phải Đẹp', '0', 0, 0, 'Bìa mềm', '16 x 24 cm', '', '500 gam', '', 184),
(537, 275, 0, 'Siêu Lầy, Siêu Nai Và Điên Giật', 'sieu-lay-sieu-nai-va-dien-giat', 0, 85000, '<p>Ở một th&agrave;nh phố n&agrave;o đ&oacute;, trong một khu nh&agrave; n&agrave;o đ&oacute; tr&ecirc;n đất nước Việt Nam tươi đẹp, &nbsp;c&oacute; ba đứa con g&aacute;i độ tuổi ba mươi, xinh b&igrave;nh thường, ngoan b&igrave;nh thường, giỏi b&igrave;nh thường, thu nhập b&igrave;nh thường chơi th&acirc;n với nhau như keo d&iacute;nh chuột. M&agrave; bộ ba b&igrave;nh thường ấy, cứ d&iacute;nh lấy nhau l&agrave; lại xẩy ra những chuyện&hellip; bất b&igrave;nh thường kh&aacute;c khiến &ldquo; nh&acirc;n loại&rdquo; vừa cười đau mồm, vừa nghĩ đau đầu, vừa nghe rất r&aacute;t tai.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tất nhi&ecirc;n, bất chấp những kh&oacute; chịu của &ldquo; nh&acirc;n loại&rdquo;, ba c&ocirc; g&aacute;i ấy vẫn &ldquo;ngang nhi&ecirc;n&rdquo; tồn tại, sống phất phơ giữa đời. Ba c&ocirc; ấy l&agrave; ai ? Tạm thời c&oacute; một m&agrave;n l&iacute; lịch tr&iacute;ch ngang như sau.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Si&ecirc;u Lầy &ndash; t&ecirc;n thật l&agrave; Huyền L&ecirc;, ba mươi tuổi, dốt to&aacute;n, nhiều chữ, lầy lội v&ocirc; số tội! Lầy t&ocirc;n thờ chủ nghĩa độc th&acirc;n v&agrave; kh&ocirc;ng ph&acirc;n v&acirc;n trước những gi&agrave;nh giật, tham vọng ở đời cuộc đời.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Si&ecirc;u Nai &ndash; t&ecirc;n thật Ngọc Mai, si&ecirc;u điệu đ&agrave; v&agrave; v&ocirc; c&ugrave;ng thảo mai, cũng ba mươi tuổi, giỏi to&aacute;n, l&agrave;m kế to&aacute;n cho một c&ocirc;ng ty x&acirc;y dựng, t&iacute;nh to&aacute;n rất nhanh nhưng n&oacute;i chuyện cực chậm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Điện Giật &ndash; t&ecirc;n thật l&agrave; Mai Ly, ba mươi tuổi, l&agrave; đứa duy nhất c&oacute; chồng trong bộ ba &ldquo;h&agrave;ng lỗi của nh&acirc;n loại&rdquo;, Điện Giật b&aacute;n mỹ phẩm online, c&oacute; một cửa h&agrave;ng mỹ phẩm tr&ecirc;n phố, nhanh nhẹn v&agrave; bao đồng, rất h&acirc;m nhưng lại tốt t&acirc;m, lu&ocirc;n l&agrave;m hộ người kh&aacute;c, nếu người ta nhờ, kiểu như đi chợ hộ, tr&ocirc;ng trẻ hộ, đ&aacute;nh ghen hộ&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&ldquo;Bộ ba h&agrave;ng lỗi&rdquo; đ&atilde; tạo n&ecirc;n v&ocirc; số phen h&agrave;i đến chảy nước mắt, nhưng cũng khiến người ta ngẫm ra những b&agrave;i học s&acirc;u sắc về cuộc sống từ những trải nghiệm phong ph&uacute; của nh&acirc;n vật.</p>\r\n', 'Huyền Lê', '13-04-2017', 13000, 'http://anybooks.vn/images/book/image/sieu_lay_sieu_nai_va_dien_giat.jpg', '[""]', 1492746152, 0, 4, 'Siêu Lầy, Siêu Nai Và Điện Giật', 'Siêu Lầy, Siêu Nai Và Điện Giật', '', 0, 0, 0, 0, 'Dân Trí', 'Bách Việt', 'Siêu Lầy, Siêu Nai Và Điện Giật', '0', 0, 1, 'Bìa mềm', '13 x 20.5 cm', '', '350 gam', '', 352),
(538, 275, 0, 'Chỉ Nhớ Người Thôi, Đủ Hết Đời', 'chi-nho-nguoi-thoi-du-het-doi', 0, 135000, '<p>Hầu hết những t&ugrave;y b&uacute;t trong tập n&agrave;y được t&aacute;c giả viết ở dạng b&aacute;n-hồi-k&yacute;, phản ảnh &iacute;t nhiều phần đời ri&ecirc;ng, tựa t&aacute;c giả soi gương, nh&igrave;n lại cuộc lữ h&agrave;nh nh&acirc;n sinh ch&igrave;m nổi gập ghềnh, khi &ocirc;ng đ&atilde; bước v&agrave;o tuổi 70, ở xứ người.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tuy kh&ocirc;ng sắp xếp theo thứ tự thời gian, nhưng c&aacute;c t&ugrave;y b&uacute;t vẫn c&oacute; chung mạch chảy giữa đời thường v&agrave; văn chương. Giữa mất - c&ograve;n. Giữa hạnh ph&uacute;c - khổ đau... Giữa sống - chết của một đồng tiền hai mặt.</p>\r\n\r\n<h4>GỬI Đ&Aacute;NH GI&Aacute; CỦA BẠN</h4>\r\n', 'Du Tử Lê', '25-04-2017', 19000, 'http://anybooks.vn/images/book/image/chi_nho_nguoi_thoi_du_het_doi.jpg', '[""]', 1492744642, 0, 0, 'Chỉ Nhớ Người Thôi, Đủ Hết Đời', 'Chỉ Nhớ Người Thôi, Đủ Hết Đời', '', 0, 0, 0, 0, 'Văn Học', 'Phương Nam', 'Chỉ Nhớ Người Thôi, Đủ Hết Đời', '0', 0, 0, 'Bìa mềm', '14.5 x 20.5 cm', '', '340 gam', '', 300),
(539, 275, 0, 'Trời Vẫn Còn Xanh, Em Vẫn Còn Anh', 'troi-van-con-xanh-em-van-con-anh', 0, 89000, '<p><strong>Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh</strong>&nbsp;l&agrave; quyển s&aacute;ch thứ s&aacute;u của t&aacute;c giả best-seller&nbsp;<strong>Anh Khang</strong>&nbsp;(Hội vi&ecirc;n Hội Nh&agrave; văn TP.HCM, v&agrave; cũng l&agrave; chủ nh&acirc;n của hai tựa s&aacute;ch b&aacute;n chạy nhất nh&igrave; trong cả hai kỳ Hội s&aacute;ch TP.HCM lần 8 &amp; 9 v&agrave;o năm 2014 - 2016). T&aacute;c phẩm n&agrave;y đ&aacute;nh dấu chặng đường năm năm kể từ ng&agrave;y đầu ti&ecirc;n Anh Khang xuất hiện tr&ecirc;n văn đ&agrave;n v&agrave;o năm 2012 với những trang viết như n&oacute;i thay t&acirc;m t&igrave;nh của bao người trẻ Việt.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Gần 5 năm qua,&nbsp;<strong>Anh Khang</strong>&nbsp;đang dần tiến gần đến vị tr&iacute; &ldquo;nh&agrave; văn triệu bản&rdquo; khi đ&atilde; c&oacute; hơn 600.000 bản s&aacute;ch được ti&ecirc;u thụ tr&ecirc;n thị trường: Ng&agrave;y tr&ocirc;i về ph&iacute;a cũ (Tản văn - 2012), Đường hai ngả, người thương th&agrave;nh lạ (Tập truyện ngắn - 2013), Buồn l&agrave;m sao bu&ocirc;ng (Tản văn - 2014), Đi đ&acirc;u cũng nhớ S&agrave;i G&ograve;n v&agrave; em (Du k&yacute; - 2015), Thương mấy cũng l&agrave; người dưng (Tản văn - 2016). Vậy, t&acirc;m t&igrave;nh của&nbsp;<strong>Anh Khang</strong>&nbsp;ở năm 2017 với tập truyện ngắn Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh c&oacute; điều g&igrave; kh&aacute;c biệt so với Anh Khang của những năm trước đ&oacute;?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Qua năm t&aacute;c phẩm đ&atilde; xuất bản trước đ&acirc;y, người đọc dễ d&agrave;ng t&igrave;m được sự đồng cảm với&nbsp;<strong>Anh Khang</strong>&nbsp;ở những d&ograve;ng chữ mang nhiều m&agrave;u sắc ho&agrave;i niệm, trầm mặc trong những c&acirc;u chuyện về t&igrave;nh y&ecirc;u dở dang, hồi ức về một người từng y&ecirc;u thương gắn b&oacute;. Khi g&otilde; google bốn chữ &ldquo;nh&agrave; văn Anh Khang&rdquo;, dễ d&agrave;ng thấy b&aacute;o giới truyền th&ocirc;ng đ&atilde; ưu &aacute;i d&agrave;nh cho anh những lời khen như &ldquo;ho&agrave;ng tử l&agrave;ng s&aacute;ch&rdquo;, &ldquo;nh&agrave; văn của nỗi buồn&rdquo;&hellip; Thế n&ecirc;n dễ hiểu, &ldquo;nỗi buồn&rdquo; đ&atilde; gắn m&aacute;c với t&ecirc;n tuổi của ch&agrave;ng văn sĩ thư sinh n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong&nbsp;<strong>Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh</strong>&nbsp;&ndash; tập truyện ngắn thứ hai của Anh Khang, được v&iacute; như phần tiếp theo của tập truyện Đường hai ngả, người thương th&agrave;nh lạ - Anh Khang vẫn viết về t&igrave;nh y&ecirc;u với những c&acirc;u chữ dịu d&agrave;ng, suy tư. Tuy nhi&ecirc;n, Anh Khang của 2017 c&oacute; lẽ đ&atilde; trưởng th&agrave;nh hơn trong ng&ograve;i b&uacute;t lẫn t&acirc;m t&igrave;nh khi anh chọn đối diện với nỗi buồn bằng th&aacute;i độ b&igrave;nh thản, lạc quan v&agrave; hướng người đọc tin tưởng v&agrave;o ch&iacute;nh sức mạnh &yacute; ch&iacute; của bản th&acirc;n. Những nh&acirc;n vật của anh điềm đạm hơn khi nghĩ về mất m&aacute;t qu&aacute; khứ v&agrave; họ cố gắng để sống t&iacute;ch cực hơn ở hiện tại, những c&acirc;u chuyện d&ugrave; kết th&uacute;c vui hay buồn đều ươm mầm trong đ&oacute; một tia s&aacute;ng hi vọng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tinh thần n&agrave;y to&aacute;t ra ngay từ ti&ecirc;u đề của t&aacute;c phẩm với lối văn biền ngẫu v&agrave; điệp từ &ldquo;vẫn c&ograve;n&rdquo; được nhấn mạnh hai lần như muốn khẳng định rằng những điều tốt đẹp &ldquo;vẫn c&ograve;n&rdquo; tồn tại v&agrave; sẽ lu&ocirc;n c&ograve;n tồn tại. Nếu v&iacute; những t&aacute;c phẩm trước đ&acirc;y của Anh Khang như những cơn mưa trĩu nặng nỗi niềm th&igrave; Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh ch&iacute;nh l&agrave; bầu trời trong xanh hơn, an l&agrave;nh hơn sau những cơn mưa ấy. Bởi như ch&iacute;nh t&aacute;c giả tự nhận x&eacute;t về bản th&acirc;n: &ldquo;Trong mắt người ngo&agrave;i, t&ocirc;i l&agrave; một nh&agrave; văn quẩn quanh b&ecirc;n s&aacute;ch vở. Trong mắt bạn b&egrave;, t&ocirc;i l&agrave; một kẻ khờ lắm điều mộng mơ. Trong mắt bố mẹ, t&ocirc;i l&agrave; một đứa trẻ kh&ocirc;ng bao giờ chịu lớn. Trong mắt người t&ocirc;i thương, t&ocirc;i l&agrave; một tiếng thở d&agrave;i cũ kỹ. Trong mắt ch&iacute;nh m&igrave;nh, t&ocirc;i chỉ l&agrave; một bầu trời xanh, lu&ocirc;n mong m&igrave;nh trở lại m&agrave;u trong vắt v&agrave; thanh t&acirc;n - dẫu sau bao lần mưa giăng m&acirc;y x&aacute;m&rdquo;. V&agrave; &ldquo;bầu trời xanh&rdquo; mang t&ecirc;n Anh Khang n&agrave;y đang từng bước soi chiếu thứ &aacute;nh s&aacute;ng của niềm tin, lan toả những ước nguyện trong l&agrave;nh v&agrave; gieo v&agrave;o l&ograve;ng người đọc những dư vị cảm x&uacute;c dễ chịu - b&ecirc;n cạnh nỗi buồn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nếu nỗi buồn trước đ&acirc;y trong trang s&aacute;ch của anh Khang l&agrave; một thứ cảm x&uacute;c rất con người, rất nh&acirc;n văn m&agrave; bất kỳ một người trẻ n&agrave;o cũng phải trải qua tr&ecirc;n h&agrave;nh tr&igrave;nh trưởng th&agrave;nh, th&igrave; nỗi buồn trong Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh lại ch&iacute;nh l&agrave; sự c&acirc;n bằng an nhi&ecirc;n của một người đ&atilde; bước qua thăng trầm v&agrave; đ&oacute;n nhận nỗi buồn như một cố nh&acirc;n tri kỷ. Anh bảo: &ldquo;T&ocirc;i xem nỗi buồn ng&agrave;y cũ như một h&agrave;nh trang cần thiết để đến gặp niềm vui trong tương lai. Bởi phải l&agrave;m l&agrave;nh với qu&aacute; khứ, th&igrave; ch&uacute;ng ta mới c&oacute; thể nhẹ nh&otilde;m t&igrave;m thấy hạnh ph&uacute;c ở hiện tại&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ecirc;n cạnh những c&acirc;u văn xu&ocirc;i trầm bổng như thơ - thế mạnh đặc trưng trong văn của Anh Khang - th&igrave; Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh cho thấy r&otilde; người viết trẻ n&agrave;y rất c&oacute; &yacute; thức trong việc x&acirc;y dựng cấu tr&uacute;c h&igrave;nh thức truyện. Anh Khang kh&ocirc;ng vội v&atilde; để người đọc tiếp x&uacute;c ngay với nội dung ch&iacute;nh trong c&aacute;c truyện ngắn của anh. Như một người bạn dẫn đường ch&acirc;n th&agrave;nh, anh chậm r&atilde;i hướng dẫn người đọc những bước chuẩn bị cần thiết trước khi th&acirc;m nhập v&agrave;o t&acirc;m t&igrave;nh s&acirc;u k&iacute;n của c&aacute;c nh&acirc;n vật. Mười truyện ngắn trong tập truyện n&agrave;y đều bắt đầu bằng một đoạn tr&iacute;ch dẫn ngắn thể hiện quan điểm nhất qu&aacute;n của c&acirc;u chuyện, n&oacute; như một lời tự sự của ch&iacute;nh t&aacute;c giả để khởi nguồn suy nghĩ cho nh&acirc;n vật chia sẻ về cuộc sống, về t&igrave;nh y&ecirc;u. Sau khoảnh khắc lắng đọng s&uacute;c t&iacute;ch ấy l&agrave; phần &ldquo;Dẫn đề&rdquo; với những chia sẻ quan điểm của Anh Khang về c&acirc;u chuyện, vừa dưới g&oacute;c nh&igrave;n của người ngo&agrave;i cuộc, vừa dưới g&oacute;c nh&igrave;n của người trong cuộc đ&atilde; từng trải. Qua hai bước chuẩn bị tr&ecirc;n, cuối c&ugrave;ng độc giả mới ch&iacute;nh thức bước v&agrave;o c&acirc;u chuyện anh kể. C&oacute; thể tạm chia cấu tr&uacute;c một truyện ngắn của Anh Khang th&agrave;nh ba phần như sau: Lời tựa &ndash; Dẫn đề &ndash; C&acirc;u chuyện. Ba phần n&agrave;y như ba g&oacute;c kh&aacute;c nhau của một &ldquo;kim tự th&aacute;p cảm x&uacute;c&rdquo;, ch&uacute;ng va đập v&agrave;o nhau tạo ra vọng &acirc;m đa thanh cho c&acirc;u chuyện. C&oacute; thể n&oacute;i, Anh Khang l&agrave; nh&agrave; văn trẻ hiếm hoi tr&ecirc;n thị trường s&aacute;ch trẻ hiện nay c&oacute; thể biến h&oacute;a ng&ograve;i b&uacute;t đa dạng với nhiều thể loại kh&aacute;c nhau, chứ kh&ocirc;ng đơn thuần chỉ viết s&aacute;ch tản văn để &ldquo;chiều l&ograve;ng&rdquo; thị hiếu như nhiều c&acirc;y b&uacute;t trẻ đương thời.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Những c&acirc;u chuyện trong Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh diễn ra dưới nhiều nơi chốn m&agrave; Anh Khang đ&atilde; đi qua, thể hiện nhiều cảm thức văn h&oacute;a kh&aacute;c nhau: Trời vẫn c&ograve;n xanh (Hy Lạp), Kinh th&agrave;nh k&yacute; ức (Ph&aacute;p), Rồi sẽ c&oacute; một ai đ&oacute; thương em (H&agrave;n Quốc), Kh&oacute;c dưới ch&acirc;n Nguyệt L&atilde;o (Hong Kong), Đừng nhắc chuyện đ&atilde; từng (Nhật Bản), Đ&ocirc;i l&uacute;c cũng n&ecirc;n hoang đường (&Uacute;c)&hellip; Nhưng những nh&acirc;n vật của Anh Khang d&ugrave; đi xa đến đ&acirc;u cũng lu&ocirc;n giữ trong tim một b&oacute;ng h&igrave;nh, một t&igrave;nh y&ecirc;u. V&igrave; vậy, kh&ocirc;ng gian thay đổi li&ecirc;n tục trong truyện của Anh Khang kh&ocirc;ng phải l&agrave; để nh&acirc;n vật kh&aacute;m ph&aacute; những điều mới mẻ của ngoại cảnh, ngược lại, đi xa dường như l&agrave; c&aacute;ch để họ nh&igrave;n lại bản th&acirc;n m&igrave;nh trong s&acirc;u thẳm, l&agrave; c&aacute;ch để họ gặp gỡ lại một-phần-đ&atilde;-mất-của-m&igrave;nh v&agrave; cũng l&agrave; cơ hội để họ gặp gỡ những con người sẽ-l&agrave;-một-phần-của-m&igrave;nh. Đ&oacute; l&agrave; c&aacute;ch họ vượt qua mất m&aacute;t.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&ldquo;Sau tất cả, m&agrave;u trời tr&ecirc;n đầu ch&uacute;ng ta vẫn mỗi ng&agrave;y c&ograve;n đ&oacute; thanh t&acirc;n, th&igrave; cũng sẽ lu&ocirc;n c&ograve;n đ&oacute; một người v&igrave; ta m&agrave; ở lại. Bởi đến cuối c&ugrave;ng, cho d&ugrave; bất kỳ điều g&igrave; xảy ra, th&igrave; chỉ cần c&ograve;n nhau l&agrave; sẽ c&ograve;n tất cả, c&oacute; phải kh&ocirc;ng?&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Anh Khang đ&atilde; viết như thế ở phần lời tựa của t&aacute;c phẩm n&agrave;y. V&agrave; dường như, những truyện ngắn anh viết trong Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh l&agrave; để trả lời cho c&acirc;u hỏi ấy. Đ&aacute;p &aacute;n ấy c&oacute; thể sẽ kh&aacute;c nhau với mỗi người, nhưng c&oacute; lẽ khi đọc xong Trời Vẫn C&ograve;n Xanh, Em Vẫn C&ograve;n Anh v&agrave; gấp lại quyển s&aacute;ch n&agrave;y, v&agrave;o khoảnh khắc ấy, bạn sẽ mỉm cười hạnh ph&uacute;c với c&acirc;u trả lời trong l&ograve;ng m&igrave;nh. Chỉ cần c&ograve;n nhau l&agrave; sẽ c&ograve;n tất cả.</p>\r\n', 'Anh Khang', '25-04-2017', 14000, 'http://anybooks.vn/images/book/image/troi_van_con_xanh_em_van_con_anh.jpg', '[""]', 1492744675, 0, 0, 'Trời Vẫn Còn Xanh, Em Vẫn Còn Anh', 'Trời Vẫn Còn Xanh, Em Vẫn Còn Anh', '', 0, 0, 0, 0, 'Văn Học', 'Phương Nam', 'Trời Vẫn Còn Xanh, Em Vẫn Còn Anh', '0', 0, 1, 'Bìa mềm', '12 x 20 cm', '', '250 gam', '', 192),
(540, 275, 0, 'Em Là Nhà', 'em-la-nha', 0, 98000, '<p>&ldquo;Em chẳng sợ cuộc đời nhiều biến cố, chỉ sợ kh&ocirc;ng c&oacute; anh siết chặt tay em.&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- D&agrave;nh cho những ai trải qua bao nhi&ecirc;u vụn vỡ, vẫn muốn một lần nữa tin v&agrave;o t&igrave;nh y&ecirc;u</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Cuốn tiểu thuyết đạt tới 4,2 triệu view của t&aacute;c giả&nbsp;<strong>Lan R&ugrave;a</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Ngoại truyện chưa từng được c&ocirc;ng bố của&nbsp;<strong>Em L&agrave; Nh&agrave;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Đằng sau một cuộc t&igrave;nh tan vỡ l&agrave; điều g&igrave;?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lời xin lỗi liệu c&oacute; l&agrave; đủ để l&agrave;m ngu&ocirc;i ngoai nỗi đau của người bị bỏ lại?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&igrave;nh y&ecirc;u thời nay , chỉ y&ecirc;u th&ocirc;i chưa bao giờ l&agrave; đủ?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nếu bạn c&ograve;n chưa thể chắc chắn khi đưa ra c&acirc;u trả lời của m&igrave;nh, vậy th&igrave; h&atilde;y c&ugrave;ng đi t&igrave;m đ&aacute;p &aacute;n cho những c&acirc;u hỏi tr&ecirc;n trong&nbsp;<strong>Em L&agrave; Nh&agrave;</strong>&nbsp;&ndash; cuốn tiểu thuyết viết về những mối t&igrave;nh đan xen, l&agrave; m&oacute;n qu&agrave;, l&agrave; lời nhắn nhủ của một người trẻ, gửi đến nhiều người trẻ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Xoay quanh những đổ vỡ t&igrave;nh cảm, những th&aacute;ch thức, những sự lừa dối m&agrave; c&ocirc; g&aacute;i trẻ Như Nguyệt phải chịu đựng, chuyện t&igrave;nh y&ecirc;u trong&nbsp;<strong>Em L&agrave; Nh&agrave;</strong>&nbsp;sẽ đưa bạn qua những cung bậc cảm x&uacute;c từ ngọt ng&agrave;o đến cao tr&agrave;o uất hận, từ b&igrave;nh y&ecirc;n &ecirc;m ấm đến những nỗi đau chỉ c&oacute; thể &acirc;m thầm chịu đựng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&igrave;nh y&ecirc;u l&agrave; điều duy nhất tr&ecirc;n đời n&agrave;y kh&ocirc;ng thể l&ecirc;n kế hoạch, kh&ocirc;ng thể lường trước. Thời gian của một cuộc t&igrave;nh dường như chẳng thể đảm bảo về một c&aacute;i kết hạnh ph&uacute;c, giống như mối t&igrave;nh k&eacute;o d&agrave;i suốt 7 năm của Như Nguyệt v&agrave; Việt An . Hai con người đ&atilde; d&agrave;nh cả thanh xu&acirc;n ở b&ecirc;n nhau, sau c&ugrave;ng đ&atilde; trở th&agrave;nh những người xa lạ. Ch&agrave;ng trai quay lưng, kết h&ocirc;n với người bạn th&acirc;n nhất của người con g&aacute;i m&igrave;nh từng y&ecirc;u. Đ&oacute; l&agrave; H&agrave; Vi&ndash; c&ocirc; g&aacute;i xinh đẹp v&agrave; ph&iacute;a sau l&agrave; cả một gia đ&igrave;nh bề thế. S&oacute;ng gi&oacute; từ đ&oacute; cứ đổ ập v&agrave;o đời Như Nguyệt. B&igrave;nh y&ecirc;n hết lần n&agrave;y đến lần kh&aacute;c rời bỏ c&ocirc; m&agrave; đi.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Em L&agrave; Nh&agrave;</strong>&nbsp;l&agrave; c&acirc;u chuyện t&igrave;nh với nhiều nước mắt, nhiều th&ugrave; hận, nhưng cũng kh&ocirc;ng thiếu những điều ngọt ng&agrave;o v&agrave; những hạnh ph&uacute;c b&igrave;nh dị. Mỗi trang s&aacute;ch bạn lật mở, mỗi nỗi đau bạn cảm nhận c&ugrave;ng những nh&acirc;n vật ch&iacute;nh l&agrave; mỗi lần bạn x&oacute;a đi lớp sương m&ugrave; đang giăng trong m&igrave;nh về t&igrave;nh y&ecirc;u. V&agrave; những c&acirc;u hỏi ở tr&ecirc;n sẽ trở n&ecirc;n dễ d&agrave;ng trả lời hơn bao giờ hết.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chẳng phải tự nhi&ecirc;n m&agrave; Việt An bỏ Như Nguyệt để đến với H&agrave; Vi.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chẳng phải tự nhi&ecirc;n m&agrave; Mai v&agrave; Như Nguyệt trở th&agrave;nh đối thủ v&agrave; nh&igrave;n nhau bằng &aacute;nh mắt h&igrave;nh vi&ecirc;n đạn, d&ugrave; trước đ&oacute; họ từng rất th&acirc;n.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cũng chẳng phải tự nhi&ecirc;n m&agrave; Như Nguyệt c&oacute; thể dễ d&agrave;ng bước qua những đổ vỡ của đời m&igrave;nh.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Vậy đ&oacute;. Chuyện t&igrave;nh y&ecirc;u trong&nbsp;<strong>Em L&agrave; Nh&agrave;</strong>&nbsp;kh&ocirc;ng chỉ đơn thuần l&agrave; những lần y&ecirc;u &ndash; chia tay , cũng kh&ocirc;ng hẳn l&agrave; những th&ugrave; hằn hay những mưu kế trả th&ugrave;. Đ&oacute; l&agrave; cuộc sống của những người trẻ ch&ocirc;ng ch&ecirc;nh, mỏng manh v&agrave; đơn độc giữa những th&aacute;ng ng&agrave;y b&atilde;o tố. Tuổi trẻ của họ được y&ecirc;u, được n&ocirc;ng nổi, được khờ dại, được nếm trải những nỗi đau để rồi nhận ra rằng: T&igrave;nh y&ecirc;u th&ocirc;i l&agrave; kh&ocirc;ng đủ để l&agrave;m n&ecirc;n một cuộc đời hạnh ph&uacute;c. Em L&agrave; Nh&agrave; nhẹ nh&agrave;ng như vị t&igrave;nh y&ecirc;u đầu đời, đắng ch&aacute;t như m&ugrave;i th&ugrave; hận v&agrave; bất ngờ với những b&iacute; mật thẳm s&acirc;u.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>H&atilde;y đọc, cảm nhận để tự t&igrave;m đ&aacute;p &aacute;n cho những c&acirc;u hỏi vẫn c&ograve;n đang bỏ ngỏ trong tr&aacute;i tim bạn.</p>\r\n', 'Lan Rùa', '11-04-2017', 17000, 'http://anybooks.vn/images/book/image/em_la_nha.jpg', '[""]', 1492744696, 0, 0, 'Em Là Nhà', 'Em Là Nhà', '', 0, 0, 0, 0, 'Hà Nội', 'Skybooks', 'Em Là Nhà', '0', 0, 0, 'Bìa mềm', '13.5 x 20 cm', '', '380 gam', '', 368),
(541, 273, 0, 'Tôn Tử Binh Pháp', 'ton-tu-binh-phap', 0, 65000, '<p>Được xưng tụng l&agrave; tuyệt t&aacute;c binh thư h&agrave;ng đầu của thế giới cổ đại, binh thư kinh điển vĩ đại nhất trong lịch sử nh&acirc;n loại,&nbsp;<strong>T&ocirc;n Tử binh ph&aacute;p</strong>&nbsp;l&agrave; một cuốn cổ thư &ldquo;kỳ qu&aacute;i&rdquo;, &ldquo;để trong vườn sẽ tỏa m&ugrave;i thơm của hoa qu&yacute;, n&eacute;m xuống đất sẽ vang tiếng k&ecirc;u của bạc v&agrave;ng&rdquo;. N&oacute; kh&ocirc;ng chỉ được c&aacute;c vua ch&uacute;a từ đ&ocirc;ng sang t&acirc;y xem như s&aacute;ch gối đầu giường, b&iacute; k&iacute;p qu&acirc;n sự kh&ocirc;ng thể thiếu, m&agrave; c&ograve;n được nhiều chuy&ecirc;n gia trong c&aacute;c lĩnh vực như triết học, kinh doanh, t&acirc;m l&yacute; học, ng&ocirc;n ngữ học, thể dục thể thao&hellip; ứng dụng để nghi&ecirc;n cứu v&agrave; đạt được nhiều th&agrave;nh tựu đ&aacute;ng kể.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>T&ocirc;n Tử binh ph&aacute;p</strong>&nbsp;với văn từ gọn ghẽ, nghĩa l&yacute; s&acirc;u xa, &acirc;m điệu bay bổng, nhờ đ&oacute; sức lan tỏa v&agrave; tầm ảnh hưởng của &ldquo;th&aacute;nh điển binh học&rdquo; n&agrave;y v&ocirc; c&ugrave;ng rộng lớn, được dịch ra tr&ecirc;n 100 thứ tiếng v&agrave; xuất bản hầu khắp tr&ecirc;n to&agrave;n thế giới.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>&ldquo;Biết người biết m&igrave;nh, trăm trận kh&ocirc;ng nguy.</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>Kh&ocirc;ng biết người chỉ biết m&igrave;nh, một được một thua.</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>Kh&ocirc;ng biết người kh&ocirc;ng biết m&igrave;nh, hễ đ&aacute;nh l&agrave; nguy.&rdquo;</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Thi&ecirc;n Mưu c&ocirc;ng,&nbsp;<em>T&ocirc;n Tử binh ph&aacute;p</em></p>\r\n', 'Tôn Tử', '12-04-2017', 11000, 'http://anybooks.vn/images/book/image/ton_tu_binh_phap.jpg', '[""]', 1492744737, 0, 1, 'Tôn Tử Binh Pháp', 'Tôn Tử Binh Pháp', '', 0, 0, 0, 0, 'Hồng Đức', 'Nhã Nam', 'Tôn Tử Binh Pháp', '0', 0, 1, 'Bìa mềm', '14 x 20.5 cm', '', '320 gam', '', 272),
(542, 273, 0, 'Thế Giới Của Dư Bảo', 'the-gioi-cua-du-bao', 0, 87000, '<p>Dư Bảo c&oacute; gi&aacute;c quan thứ s&aacute;u.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cậu được mệnh danh l&agrave; người c&oacute; &ldquo;đ&ocirc;i mắt quỷ&rdquo; bởi linh cảm được việc xấu sắp xảy ra. Thế nhưng cậu kh&ocirc;ng c&oacute; khả năng thay đổi n&oacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong một chuyến h&agrave;nh tr&igrave;nh tr&ecirc;n chiếc xe tải c&ugrave;ng bố m&igrave;nh, &ldquo;đ&ocirc;i mắt quỷ&rdquo; của Dư Bảo một lần nữa lại ph&aacute;t huy t&aacute;c dụng. Cậu thực sự kh&ocirc;ng ngờ rằng cuộc đời bố cậu v&agrave; gia đ&igrave;nh lại gặp nhiều biến cố tới vậy&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dư Bảo vốn l&agrave; một cậu b&eacute; 11 tuổi, bố l&agrave; l&aacute;i xe tải, mẹ l&agrave; lao c&ocirc;ng, ng&agrave;y ng&agrave;y đi học qua con đường Thi&ecirc;n sứ đầy c&aacute;t bụi v&agrave; r&aacute;c rưởi. Mỗi ng&agrave;y cậu được chứng kiến bao mảnh đời của những người lao động ngh&egrave;o khổ bỏ qu&ecirc; hương l&ecirc;n th&agrave;nh phố gắng gượng b&aacute;m lại kiếm sống, trải qua kh&ocirc;ng &iacute;t khổ cực. Bố mẹ cậu cũng nằm trong số đ&oacute;, chỉ lu&ocirc;n t&acirc;m nguyện cho con c&aacute;i được ăn học, mong t&igrave;m ra tương lai tươi s&aacute;ng hơn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&ldquo;C&oacute; lẽ cả cuộc đời n&agrave;y t&ocirc;i phải hối hận. C&aacute;i buổi đ&ecirc;m h&ocirc;m đ&oacute; trong kỳ nghỉ h&egrave;, c&ugrave;ng bố l&aacute;i xe đường d&agrave;i, tại sao t&ocirc;i kh&ocirc;ng khuy&ecirc;n bố dừng xe ở một trạm nghỉ n&agrave;o đ&oacute; một l&uacute;c, h&uacute;t th&ecirc;m một điếu thuốc g&igrave; đ&oacute;. Hoặc l&agrave;, l&uacute;c đi đường, t&ocirc;i dứt kho&aacute;t x&uacute;i giục &ocirc;ng ấy l&aacute;i xe nhanh một đoạn, chạy nhanh như bay, cho d&ugrave; bị camera gi&aacute;m s&aacute;t chụp lại, cho d&ugrave; bị cảnh s&aacute;t giao th&ocirc;ng giữ lại phạt tiền v&agrave; giữ bằng l&aacute;i xe tại chỗ, đều tốt hơn rất nhiều so với những chuyện đ&aacute;ng sợ m&agrave; ch&uacute;ng t&ocirc;i trải qua sau đ&oacute;.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Bởi v&igrave;, nếu kh&ocirc;ng phải kh&ocirc;ng vừa kh&eacute;o chạm phải sự kiện m&agrave; t&ocirc;i sẽ kể sau đ&acirc;y, th&igrave; biến cố kinh t&acirc;m động ph&aacute;ch tiếp theo sẽ kh&ocirc;ng thể xảy ra, v&agrave; bố t&ocirc;i cũng kh&ocirc;ng v&igrave; thế m&agrave; rơi vực thẳm.&rdquo;</em></p>\r\n', 'Hoàng Bội Giai', '12-04-2017', 15000, 'http://anybooks.vn/images/book/image/the_gioi_cua_du_bao.jpg', '[""]', 1492745941, 0, 2, 'Thế Giới Của Dư Bảo', 'Thế Giới Của Dư Bảo', '', 0, 0, 0, 0, 'Phụ Nữ', 'ChiBooks', 'Thế Giới Của Dư Bảo', '0', 1, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '396 gram', '', 332),
(543, 273, 0, 'Đêm Trường Tăm Tối', 'dem-truong-tam-toi', 0, 115000, '<p>Nghi can giết người, vứt x&aacute;c, nhưng kh&ocirc;ng ngờ lại bị bắt quả tang ngay giữa chốn c&ocirc;ng cộng đ&ocirc;ng người. L&uacute;c đ&oacute; &iacute;t nhất c&oacute; đến v&agrave;i trăm người tận mắt chứng kiến, hắn cũng đ&atilde; khai nhận to&agrave;n bộ qu&aacute; tr&igrave;nh phạm tội. Tất cả chuỗi chứng cứ đều đầy đủ: nh&acirc;n chứng, vật chứng, lời khai, nhưng đ&uacute;ng v&agrave;o thời điểm cơ quan kiểm s&aacute;t ch&iacute;nh thức đưa ra khởi tố, th&igrave; t&igrave;nh tiết vụ &aacute;n c&oacute; sự thay đổi đột ngột to lớn..<br />\r\n<br />\r\nĐằng sau sự việc n&agrave;y rốt cục ẩn giấu t&igrave;nh h&igrave;nh vụ &aacute;n kinh thi&ecirc;n động địa đến nhường n&agrave;o? Những nh&acirc;n vật trong truyện đứng giữa ranh giới giữa c&aacute;i thiện v&agrave; c&aacute;i &aacute;c, giữa sự sống v&agrave; c&aacute;i chết, mỗi quyết định đều thay đổi vận mệnh cả đời họ. Liệu họ sẽ rẽ về hướng n&agrave;o? Liệu c&aacute;i thiện c&oacute; l&ecirc;n ng&ocirc;i v&agrave; c&aacute;i &aacute;c c&oacute; phải chịu sự trừng phạt...</p>\r\n', 'Tử Kim Trần', '13-04-2017', 20000, 'http://anybooks.vn/images/book/image/dem_truong_tam_toi.jpg', '[""]', 1492746066, 0, 2, 'Đêm Trường Tăm Tối', 'Đêm Trường Tăm Tối', '', 0, 0, 0, 0, 'Văn Học', 'Cổ Nguyệt', 'Đêm Trường Tăm Tối', '0', 0, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '510 gram', '', 465),
(544, 273, 0, 'Tội Lỗi Không Chứng Cứ', 'toi-loi-khong-chung-cu', 0, 125000, '<p>S&aacute;t thủ li&ecirc;n ho&agrave;n, d&agrave;n dựng hiện trường vụ &aacute;n, hắn n&oacute;i giết người l&agrave; để cứu người, bạn c&oacute; tin kh&ocirc;ng?</p>\r\n\r\n<p>Ph&iacute;a sau h&agrave;nh vi tội &aacute;c m&aacute;u lạnh, lại l&agrave; một tr&aacute;i tim bị t&igrave;nh y&ecirc;u v&agrave; nỗi hận th&ugrave; gi&agrave;y v&ograve; suốt gần mười năm qua.</p>\r\n\r\n<p><br />\r\nChốn đ&ocirc; thị phồn hoa li&ecirc;n tiếp xảy ra những vụ &aacute;n mạng. Tại hiện trường vụ &aacute;n, hung thủ lu&ocirc;n cố &yacute; để lại dấu v&acirc;n tay v&agrave; một tờ giấy ghi &ldquo;H&atilde;y đến bắt ta&rsquo;. Ngo&agrave;i ra, kh&ocirc;ng c&oacute; ch&uacute;t sơ hở hay manh nối n&agrave;o cả.</p>\r\n\r\n<p><br />\r\nĐối diện với t&ecirc;n s&aacute;t thủ li&ecirc;n ho&agrave;n hu&ecirc;nh hoang như vậy, tổ chuy&ecirc;n &aacute;n được th&agrave;nh lập bốn lần nhưng đều phải giải t&aacute;n, kh&ocirc;ng c&oacute; ch&uacute;t manh mối n&agrave;o, chỉ c&oacute; thể nhờ đến vị chuy&ecirc;n gia logic học Ngi&ecirc;m Lương. Vụ &aacute;n n&agrave;y b&iacute; ẩn giống như một hệ phương tr&igrave;nh kh&ocirc;ng c&oacute; c&aacute;ch giải, liệu &ocirc;ng phải bắt tay từ đ&acirc;u để t&igrave;m ra lời giải?</p>\r\n\r\n<p><br />\r\nHung thủ thực sự đ&atilde; tỉ mỉ sắp xếp vụ &aacute;n phạm tội kh&ocirc;ng c&oacute; chứng cứ, tại sao lại cố t&igrave;nh để lại manh mối? Đ&acirc;y l&agrave; một &acirc;m mưu to lớn hay l&agrave; một c&aacute;i bẫy, cũng c&oacute; thể l&agrave; một b&iacute; mật được cất giấu rất kỹ kh&ocirc;ng ai hay biết?</p>\r\n\r\n<p><br />\r\n<strong>&ldquo;Tội lỗi kh&ocirc;ng chứng cứ&rdquo;</strong>&nbsp;được bố tr&iacute; như một m&ecirc; trận, một kẻ tội phạm cao tay, một nh&agrave; trinh th&aacute;m cao cường, k&igrave; ph&ugrave;ng địch thủ, liệu ai sẽ l&agrave; người chiến thắng trong cuộc đọ tr&iacute; n&agrave;y?</p>\r\n', 'Tử Kim Trần', '01-03-2017', 19000, 'http://anybooks.vn/images/book/image/toi_loi_khong_chung_cu.jpg', '[""]', 1492746090, 0, 0, 'Tội Lỗi Không Chứng Cứ', 'Tội Lỗi Không Chứng Cứ', '', 0, 0, 0, 0, 'Văn Học', 'Cổ Nguyệt', 'Tội Lỗi Không Chứng Cứ', '0', 0, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '530 gram', '', 500);
INSERT INTO `product` (`id`, `catalog_id`, `address_id`, `name`, `slug`, `maker_id`, `price`, `content`, `tac_gia`, `xuat_ban`, `discount`, `image_link`, `image_list`, `created`, `created_new`, `view`, `meta_key`, `site_title`, `warranty`, `total`, `buyed`, `rate_total`, `rate_count`, `nxb`, `nph`, `meta_desc`, `feature`, `status`, `noi_bat`, `dang_bia`, `kich_thuoc`, `ma_sp`, `khoi_luong`, `gifts`, `so_trang`) VALUES
(545, 253, 0, ' Cuộc chiến Disney', 'cuoc-chien-disney', 0, 179000, '<p>Đ&acirc;y l&agrave; c&acirc;u chuyện m&ecirc; hoặc về một trong những c&ocirc;ng ty giải tr&iacute; v&agrave; truyền th&ocirc;ng quyền lực nhất nước Mỹ, về những người l&atilde;nh đạo n&oacute; cũng như những người muốn lật đổ chế độ cai trị đ&oacute;. Một c&acirc;u chuyện đầy những n&uacute;t thắt, những nh&acirc;n vật để đời v&agrave; đạt tới đỉnh cao ly kỳ, hồi hộp đến mức ho&agrave;n to&agrave;n c&oacute; thể l&agrave; chủ đề cho một bộ phim thần thoại về Disney, chỉ c&oacute; điều ch&uacute;ng ho&agrave;n to&agrave;n l&agrave; sự thật. C&aacute;c bạn sẽ được chứng kiến qu&aacute; tr&igrave;nh ra đời của những bộ phim huyền thoại như&nbsp;<em>N&agrave;ng ti&ecirc;n c&aacute;, Người đẹp v&agrave; Qu&aacute;i th&uacute;, Vua Sư tử, Aladdin v&agrave; c&acirc;y đ&egrave;n thần, C&acirc;u chuyện đồ chơi, Cướp biển v&ugrave;ng Ca-ri-b&ecirc;</em>. C&aacute;c bạn sẽ được gặp lại những c&aacute;i t&ecirc;n đ&igrave;nh đ&aacute;m như Tom Hanks, Steve Jobs, Pixar, Johnny Depp. C&ugrave;ng với đ&oacute; l&agrave; lịch sử hoạt động suốt 20 năm của Disney, từ năm 1984 đến năm 2003, dưới sự dẫn dắt của Michael Eisner, tr&agrave;n đầy những thăng trầm, những cuộc chiến phe c&aacute;nh, tranh gi&agrave;nh quyền lợi, chức vụ, những chiến lược kinh doanh, v.v. C&oacute; thể n&oacute;i, to&agrave;n bộ cuốn s&aacute;ch l&agrave; một vở kịch bi tr&aacute;ng v&agrave; sống động về qu&aacute; tr&igrave;nh ph&aacute;t triển của Disney, một trong những đế chế c&oacute; ảnh hưởng nhất thế giới. &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><em>Mục lục:</em></strong><br />\r\n&nbsp;</p>\r\n\r\n<p>Phần 1: Thế giới kỳ diệu của Disney</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Phần 2: Vương quốc vỡ mộng</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Phần 3: Cuộc chiến Disney</p>\r\n', 'James B.Stewart', '14-04-2017', 35000, 'http://anybooks.vn/images/book/image/cuoc_chien_disney.jpg', '[""]', 1492746106, 0, 0, 'Cuộc chiến Disney', 'Cuộc chiến Disney', '', 0, 0, 0, 0, 'Lao Động', 'Thái Hà Books', 'Cuộc chiến Disney', '0', 0, 0, 'Bìa mềm', '15.5 x 24 cm', '', '720 gram', '', 663),
(546, 253, 0, 'Yêu Lầm Anh?', 'yeu-lam-anh', 0, 112000, '<p>T&aacute;c phẩm xo&aacute;y quanh c&acirc;u chuyện tiểu thư&nbsp;<strong>Rebecca Marshall&nbsp;</strong>được chọn v&agrave;o cung l&agrave;m thị nữ. Với một thi&ecirc;n kim tiểu thư mới mười t&aacute;m tuổi như n&agrave;ng, đ&acirc;y l&agrave; một cơ hội qu&yacute; gi&aacute;, c&oacute; thể s&aacute;nh ngang với việc được nhận v&agrave;o học tại những ng&ocirc;i trường danh gi&aacute; nhất thế giới. Tuy nhi&ecirc;n, n&agrave;ng nhanh ch&oacute;ng bị cuốn v&agrave;o những &acirc;m mưu đen tối của chốn ho&agrave;ng cung v&agrave; một t&igrave;nh y&ecirc;u m&ugrave; qu&aacute;ng chưa t&igrave;m ra lối tho&aacute;t&hellip;<br />\r\n<br />\r\nT&igrave;nh y&ecirc;u của n&agrave;ng d&agrave;nh trọn cho&nbsp;<strong>Rupert St. John</strong>, một ch&agrave;ng qu&yacute; tộc gi&agrave;u c&oacute;, nổi tiếng l&agrave; đểu giả v&agrave; khả năng săn g&aacute;i rất cừ. Anh c&oacute; thể dễ d&agrave;ng chiếm trọn tr&aacute;i tim của bất kỳ c&ocirc; g&aacute;i n&agrave;o anh từng gặp qua.&nbsp;<strong>Rebecca Marshall&nbsp;</strong>cũng l&agrave; một trong số đ&oacute; v&agrave; kết cục, n&agrave;ng mang trong m&igrave;nh đứa con của anh. Thoạt đầu, anh kh&ocirc;ng chịu tin v&igrave; cho rằng đ&acirc;y chỉ l&agrave; c&aacute;i bẫy n&agrave;ng giăng ra để anh phải cưới n&agrave;ng. Sau c&ugrave;ng, anh cũng đồng &yacute; lấy n&agrave;ng với điều kiện cuộc h&ocirc;n nh&acirc;n ấy chỉ tr&ecirc;n danh nghĩa, cho đến thời điểm anh c&oacute; được chứng cứ l&agrave; n&agrave;ng kh&ocirc;ng hề c&oacute; thai. Tới l&uacute;c đ&oacute;, anh sẽ hủy h&ocirc;n v&agrave; n&agrave;ng sẽ phải rời khỏi anh - m&atilde;i m&atilde;i.</p>\r\n', 'Johanna Lindsey', '2016', 22000, 'http://anybooks.vn/images/book/image/yeu_lam_anh_.jpg', '[""]', 1492746115, 0, 0, 'Yêu Lầm Anh?', 'Yêu Lầm Anh?', '', 0, 0, 0, 0, 'Lao Động', 'Bách Việt', 'Yêu Lầm Anh?', '0', 0, 1, 'Bìa mềm', '14 .5 x 20.5 cm', '', '410 gram', '', 408),
(547, 253, 0, 'Đối Diện Với Tình Yêu', 'doi-dien-voi-tinh-yeu', 0, 129000, '<p>Dez - nh&acirc;n vi&ecirc;n cảnh s&aacute;t thuộc lực lượng &ldquo;si&ecirc;u cảnh s&aacute;t&rdquo; New York biết bản th&acirc;n m&igrave;nh đ&atilde; thay đổi rất nhiều kể từ khi c&ocirc; ph&aacute;t ngấy v&igrave; người bạn thuở thơ ấu, Mace, lu&ocirc;n t&igrave;m c&aacute;ch quấn lấy m&igrave;nh. C&ocirc;ng bằng m&agrave; n&oacute;i th&igrave; Mace mới l&agrave; người thay đổi nhiều hơn với đ&ocirc;i mắt v&agrave;ng tuyệt đẹp c&ugrave;ng một cơ thể quyến rũ chết người. &nbsp;Dez phải thừa nhận l&agrave; c&ocirc; c&oacute; một cảm gi&aacute;c kỳ lạ khi g&atilde; đ&agrave;n &ocirc;ng n&agrave;y lại gần c&ocirc;, cố t&igrave;nh chạm v&agrave;o cổ hay cơ thể c&ocirc;. Nhưng c&ocirc; kh&ocirc;ng muốn m&igrave;nh c&oacute; cảm gi&aacute;c đ&oacute; ch&uacute;t n&agrave;o.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Trong khi đ&oacute;, đối với Tennessean Ronnie Lee Reed, c&ocirc; lu&ocirc;n muốn t&igrave;m một người bạn đời để c&oacute; cuộc sống ổn định, chấm dứt những mối quan hệ với đ&aacute;m đ&agrave;n &ocirc;ng lạ mặt. Trong một lần do bị &eacute;p, c&ocirc; phải chăm s&oacute;c cho Brendon Shaw đang bị thương. &nbsp;Shaw tr&uacute;ng tiếng s&eacute;t &aacute;i t&igrave;nh với c&ocirc; ngay từ c&aacute;i nh&igrave;n đầu ti&ecirc;n nhưng c&ocirc; lại t&igrave;m c&aacute;ch chạy trốn khỏi mối quan hệ n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Liệu rằng hai c&ocirc; g&aacute;i sẽ l&agrave;m g&igrave; để đối diện những t&igrave;nh cảm phức tạp n&agrave;y đ&acirc;y?</p>\r\n', 'Shelly Laurenston', '2016', 22000, 'http://anybooks.vn/images/book/image/doi_dien_voi_tinh_yeu.jpg', '[""]', 1492746167, 0, 0, 'Đối Diện Với Tình Yêu', 'Đối Diện Với Tình Yêu', '', 0, 0, 0, 0, 'Lao Động', 'Bách Việt', 'Đối Diện Với Tình Yêu', '0', 0, 0, 'Bìa mềm', '16 x 24 cm', '', '500 gam', '', 484),
(548, 253, 0, 'Chân Trời Đảo Ngược', 'chan-troi-dao-nguoc', 0, 108000, '<p><strong>Hope</strong>,&nbsp;<strong>Josh&nbsp;</strong>v&agrave;&nbsp;<strong>Luke</strong>, ba sinh vi&ecirc;n xuất sắc chuy&ecirc;n ng&agrave;nh thần kinh học, đ&atilde; tạo n&ecirc;n một bộ ba kh&ocirc;ng thể chia l&igrave;a, gắn kết với nhau bởi t&igrave;nh bạn, t&igrave;nh y&ecirc;u v&agrave; một &yacute; tưởng đi&ecirc;n rồ: Sao ch&eacute;p to&agrave;n bộ k&yacute; ức của con người v&agrave;o m&aacute;y t&iacute;nh để lưu trữ như một dạng dữ liệu, sau đ&oacute; truyền lại từ m&aacute;y chủ v&agrave;o một th&acirc;n x&aacute;c mới, đảo ngược quy luật khắc nghiệt về sự sống hữu hạn của con người trong thời gian v&agrave; kh&ocirc;ng gian&hellip;.<br />\r\n<br />\r\nTrong qu&aacute; tr&igrave;nh nghi&ecirc;n cứu, họ v&ocirc; t&igrave;nh vấp phải một trở ngại dẫn đến nguy hiểm. L&uacute;c n&agrave;y họ quyết định c&ugrave;ng nhau kh&aacute;m ph&aacute; những điều kh&ocirc;ng thể v&agrave; đạt được giấc mơ ng&ocirc;ng cuồng nhất của họ. Ở những trang giữa chừng của cuốn s&aacute;ch, một c&acirc;u chuyện t&igrave;nh y&ecirc;u đẹp v&agrave; t&igrave;nh bạn c&ugrave;ng mối quan hệ cảm động về một người cha v&agrave; con g&aacute;i.<br />\r\n<strong>Nhận định</strong><br />\r\n&nbsp;<br />\r\n<em>&ldquo;Một trong những tiểu thuyết x&uacute;c động nhất của Marc Levy. Người đẹp ngủ trong rừng phi&ecirc;n bản 2.0, với một trong những nh&acirc;n vật nữ th&agrave;nh c&ocirc;ng nhất.&rdquo;</em><br />\r\n<br />\r\n<strong>- RTL</strong></p>\r\n', 'Marc Levy', '2016', 19000, 'http://anybooks.vn/images/book/image/chan_troi_dao_nguoc.jpg', '[""]', 1492746186, 0, 0, 'Chân Trời Đảo Ngược', 'Chân Trời Đảo Ngược', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Chân Trời Đảo Ngược', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '430 gram', '', 394),
(549, 252, 0, 'Romeo và Juliet', 'romeo-v-juliet', 0, 49000, '<p>&ldquo;Ng&agrave;y xưa, ở th&agrave;nh Verona tươi đẹp,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&oacute; hai nh&agrave; thuộc d&ograve;ng thế phiệt tr&acirc;m anh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mối th&ugrave; xưa bỗng g&acirc;y cảnh bất b&igrave;nh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>M&aacute;u lương thiện, tay người l&agrave;nh nhuộm đỏ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Số phận &eacute;o le, th&acirc;m th&ugrave; hai họ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lại kh&eacute;o xui sinh hạ đ&ocirc;i t&igrave;nh nh&acirc;n,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mối t&igrave;nh ai th&ecirc; thảm mu&ocirc;n phần</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ch&ocirc;n cừu hận, chỉ c&ograve;n đ&agrave;nh một th&aacute;c.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&igrave;nh lứa đ&ocirc;i thảm thương tan n&aacute;t</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tr&ecirc;n x&aacute;c con cha mẹ mới qu&ecirc;n th&ugrave;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chuyện thương t&acirc;m, tr&igrave;nh diễn đ&ocirc;i giờ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Xin qu&yacute; vị ki&ecirc;n t&acirc;m chiếu cố</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sức mọn t&agrave;i h&egrave;n, ch&uacute;ng t&ocirc;i xin gắng trổ.&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>- Hồi I, Tự ng&ocirc;n</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&nbsp;&ldquo;Virgile đ&atilde; s&aacute;ng tạo ra người thiếu phụ y&ecirc;u đương, Shakespeare đ&atilde; s&aacute;ng tạo ra người thiếu nữ y&ecirc;u đương. Tất cả những thiếu phụ v&agrave; thiếu nữ y&ecirc;u đương kh&aacute;c chỉ l&agrave; m&ocirc; phỏng theo hai nh&acirc;n vật Didon v&agrave; Juliet.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>- Flaubert</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>&ldquo;Về hai mặt ph&oacute;ng t&uacute;ng v&agrave; bạo n&oacute;i, Shakespeare chẳng thua g&igrave; Rabelais.&rdquo;</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>- Victor Hugo</strong></p>\r\n', 'William Shakespeare', '2016', 7000, 'http://anybooks.vn/images/book/image/romeo_va_juliet.jpg', '[""]', 1492746214, 0, 10, 'Romeo và Juliet', 'Romeo và Juliet', '', 0, 0, 0, 0, 'Hội Nhà Văn', 'Nhã Nam', 'Romeo và Juliet', '0', 0, 1, 'Bìa mềm', '14 x 20.5 cm', '', '200 gram', '', 160),
(550, 252, 0, 'Ta thuộc về nhau', 'ta-thuoc-ve-nhau', 0, 98000, '', 'Alan Brogan', '2016', 17000, 'http://anybooks.vn/images/book/image/ta_thuoc_ve_nhau.jpg', '[""]', 1492746225, 0, 0, 'Ta thuộc về nhau', 'Ta thuộc về nhau', '', 0, 0, 0, 0, 'Lao Động', 'Nhà Sách Phương Thu', 'Ta thuộc về nhau', '0', 0, 0, 'Bìa mềm', '', '', '300 gram', '', 0),
(551, 252, 0, 'Ghét, thân, thương, yêu, cưới', 'ghet-than-thuong-yeu-cuoi', 0, 96000, '<p><em>Mỗi khi nhấc một tập truyện mới của Alice Munro l&ecirc;n, người ta lu&ocirc;n biết điều g&igrave; đang chờ đợi m&igrave;nh. Vẫn những thị trấn nhỏ v&agrave; những th&agrave;nh phố mới ở Ontario v&agrave; British Columbia. Vẫn những người trẻ đầy gai g&oacute;c v&agrave; m&acirc;u thuẫn. Vẫn những người gi&agrave; đối mặt với c&aacute;i chết v&agrave; mối t&igrave;nh muộn. Vẫn giọng kể thấu suốt sắc lạnh của một người quan s&aacute;t tỉ mỉ tinh tường. Ấy thế nhưng, dường như mỗi trang lại mang đến một loạt những điều ta kh&ocirc;ng hề lường trước: h&agrave;nh động bất ngờ, cảm x&uacute;c bất ngờ, ng&ocirc;n ngữ bất ngờ, chi tiết bất ngờ. V&agrave; cốt truyện th&igrave; lu&ocirc;n qu&aacute; tinh vi phức tạp để c&oacute; thể t&oacute;m tắt lại.</em></p>\r\n\r\n<p><em>&nbsp;</em></p>\r\n\r\n<p><em>H&atilde;y đọc ch&iacute;n truyện ngắn trong&nbsp;<strong>Gh&eacute;t th&acirc;n thương y&ecirc;u cưới.</strong>&nbsp;Đ&oacute; l&agrave; c&aacute;ch duy nhất để thật sự hiểu những điều kỳ diệu m&agrave; bậc ph&ugrave; thủy t&acirc;m l&yacute; v&agrave; ng&ocirc;n từ Alice Munro tạo t&aacute;c n&ecirc;n.</em></p>\r\n\r\n<p><em>&nbsp;</em></p>\r\n\r\n<p><em>&nbsp;&ldquo;Mỗi c&acirc;u chuyện trong ch&iacute;n truyện ngắn đều vừa thấm th&iacute;a, vừa gay gắt, vừa h&agrave;i hước, vừa u ho&agrave;i, vừa mỉa mai, vừa kịch t&iacute;nh.&rdquo;&nbsp;</em></p>\r\n\r\n<p><em><strong>&ndash; Library Journal</strong></em></p>\r\n\r\n<p><em>Bạn c&oacute; mong chờ cuốn s&aacute;ch mới n&agrave;y của Alice Munro, t&aacute;c giả &quot;<strong>Trốn chạy</strong>&quot;? - người từng đạt giải&nbsp;<strong>Nobel văn chương năm 2013</strong></em></p>\r\n', 'Alice Munro', '2016', 15000, 'http://anybooks.vn/images/book/image/ghet_than_thuong_yeu_cuoi.jpg', '[""]', 1492746242, 0, 1, 'Ghét, thân, thương, yêu, cưới', 'Ghét, thân, thương, yêu, cưới', '', 0, 0, 0, 0, 'Văn Học', 'Nhã Nam', 'Ghét, thân, thương, yêu, cưới', '0', 0, 0, 'Bìa mềm', '14 x 20.5 cm', '', '400 gram', '', 378),
(552, 252, 0, 'Đứa con xa lạ', 'dua-con-xa-la', 0, 120000, '<p>C&acirc;u chuyện mở đầu bằng một vụ tai nạn v&agrave;o một buổi tối kh&ocirc;ng trăng, b&agrave; mẹ trẻ Caroline Joseph đang l&aacute;i xe c&ugrave;ng c&ocirc; con g&aacute;i 6 tuổi Natasha trở về nh&agrave; sau bữa tối c&ugrave;ng họ h&agrave;ng. Vụ tai nạn kh&oacute; hiểu đ&atilde; cướp đi mất sinh mệnh của Caroline, nhưng c&ocirc; con g&aacute;i lại biến mất kh&ocirc;ng dấu t&iacute;ch ở hiện trường.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>S&aacute;u năm sau, chồng của Caroline l&agrave; David đ&atilde; kết h&ocirc;n với Emma v&agrave; cả hai đ&atilde; c&oacute; một b&eacute; trai dễ thương Olive. Cuộc sống đang y&ecirc;n b&igrave;nh, Emma hạnh ph&uacute;c với gia đ&igrave;nh nhỏ của m&igrave;nh th&igrave; một ng&agrave;y đột nhi&ecirc;n c&oacute; một c&ocirc; b&eacute; g&aacute;i khoảng chừng 12 tuổi xuất hiện trong căn bếp nh&agrave; m&igrave;nh. C&ocirc; b&eacute; Natasha đ&atilde; trở về một c&aacute;ch đột ngột v&agrave; đầy b&iacute; ẩn, sự trở về sau 6 năm r&uacute;t cục sẽ thay đổi những g&igrave;. V&igrave; sao c&ocirc; b&eacute; lại mất t&iacute;ch trong vụ tai nạn 6 năm trước, sự thực đằng sau vụ tai nạn đ&oacute; l&agrave; g&igrave;? C&oacute; b&iacute; mật n&agrave;o đang được cất giấu?</p>\r\n', 'Rachel Abbott', '2016', 18000, 'http://anybooks.vn/images/book/image/dua_con_xa_la.jpg', '[""]', 1492746256, 0, 26, 'Đứa con xa lạ', 'Đứa con xa lạ', '', 0, 0, 0, 0, 'Văn Học', 'Văn Việt', 'Đứa con xa lạ', '0', 0, 0, 'Bìa mềm', '14 .5 x 20.5 cm', '', '600 gram', '', 500);

-- --------------------------------------------------------

--
-- Table structure for table `seopage_baohanh`
--

CREATE TABLE `seopage_baohanh` (
  `id` int(5) NOT NULL,
  `favicon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seopage_baohanh`
--

INSERT INTO `seopage_baohanh` (`id`, `favicon`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/gustore/upload/images/icon.png', 'title bảo hành', 'desc bảo hành', 'keywork bảo hành');

-- --------------------------------------------------------

--
-- Table structure for table `seopage_dichvu`
--

CREATE TABLE `seopage_dichvu` (
  `id` int(5) NOT NULL,
  `favicon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seopage_dichvu`
--

INSERT INTO `seopage_dichvu` (`id`, `favicon`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/gustore/upload/images/icon.png', 'title trang dịch vụ', 'desc trang dịch vụ', 'keyword trang dịch vụ');

-- --------------------------------------------------------

--
-- Table structure for table `seopage_gioithieu`
--

CREATE TABLE `seopage_gioithieu` (
  `id` int(5) NOT NULL,
  `favicon` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seopage_gioithieu`
--

INSERT INTO `seopage_gioithieu` (`id`, `favicon`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/gustore/upload/images/icon.png', 'title trang giới thiệu update', 'desc trang giới thiệu thanh bình', 'key trang giới thiệu');

-- --------------------------------------------------------

--
-- Table structure for table `seopage_tintuc`
--

CREATE TABLE `seopage_tintuc` (
  `id` int(5) NOT NULL,
  `favicon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seopage_tintuc`
--

INSERT INTO `seopage_tintuc` (`id`, `favicon`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/gustore/upload/images/icon.png', 'title trang tin tức', 'desc trang tin tức', 'keyword trang tin tức');

-- --------------------------------------------------------

--
-- Table structure for table `seopage_tuyendung`
--

CREATE TABLE `seopage_tuyendung` (
  `id` int(5) NOT NULL,
  `favicon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `site_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seopage_tuyendung`
--

INSERT INTO `seopage_tuyendung` (`id`, `favicon`, `site_title`, `site_desc`, `site_key`) VALUES
(1, 'http://localhost/gustore/upload/images/icon.png', 'title tuyển dụng', 'desc tuyển dụng', 'keyword tuyển dụng');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `sort_order` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `name`, `image_name`, `image_link`, `link`, `info`, `sort_order`) VALUES
(23, 'Sli_1', '', 'http://localhost/bookstore/upload/images/slide/sli_1.png', '', '', 1),
(24, 'Sli_2', '', 'http://localhost/bookstore/upload/images/slide/sli-4.png', '', '', 2),
(25, 'Sli_3', '', 'http://localhost/bookstore/upload/images/slide/sli-3.png', '', '', 3),
(26, 'Sli_4', '', 'http://localhost/bookstore/upload/images/slide/sli-2.png', '', '', 4),
(27, 'Sli_5', '', 'http://localhost/bookstore/upload/images/slide/sli_5.jpg', '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `slide_doitac`
--

CREATE TABLE `slide_doitac` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` text COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide_doitac`
--

INSERT INTO `slide_doitac` (`id`, `title`, `image_link`, `link`, `sort_order`) VALUES
(1, 'thương hiệu 1', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu1.png', 'http://youtube.com', 1),
(2, 'thương hiệu 2', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu2.png', 'http://youtube.com', 2),
(3, 'thương hiệu 3', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu3.png', 'http://youtube.com', 3),
(4, 'thương hiệu 4', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu4.png', 'http://youtube.com', 4),
(5, 'thương hiệu 5', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu5.png', 'http://youtube.com', 5),
(6, 'thương hiệu 6', 'http://phongdat.com/giay123/upload/images/slide_thuonghieu/thuonghieu7.png', 'http://youtube.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `slide_main`
--

CREATE TABLE `slide_main` (
  `id` int(3) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide_main`
--

INSERT INTO `slide_main` (`id`, `name`, `image_link`, `link`, `sort_order`) VALUES
(8, 'Banner_Right_2', 'http://localhost/bookstore/upload/images/banner-right/bann_1.jpg', '', 2),
(7, 'Banner_Right_1', 'http://localhost/bookstore/upload/images/banner-right/bann_3.jpg', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social`
--

CREATE TABLE `social` (
  `id` int(5) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(5) NOT NULL,
  `image_social` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social`
--

INSERT INTO `social` (`id`, `name`, `link`, `sort_order`, `image_social`) VALUES
(1, 'Facebook', 'http://facebook.com', 1, '<i class="fa fa-facebook-square" aria-hidden="true"></i>'),
(2, 'G+', 'http://google.com', 2, '<i class="fa fa-google-plus-square" aria-hidden="true"></i>'),
(3, 'Twitter', 'http://twitter.com', 3, '<i class="fa fa-twitter-square" aria-hidden="true"></i>'),
(4, 'YouTube', 'http://youtube.com', 4, '<i class="fa fa-youtube-square" aria-hidden="true"></i>');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `phi` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_info` text COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `security` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `type`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `address`, `amount`, `phi`, `payment`, `payment_info`, `message`, `security`, `created`) VALUES
(77, 0, 0, 0, 'Phan Văn Quí', 'binbiphanth11@gmail.com', '01668185092', 'Hương Trà - Thừa Thiên-Huế<', '204000.0000', '20000.0000', 'Thanh toán khi nhận hàng', 'Giao tận nơi', '', '', 1493475785),
(78, 0, 0, 0, 'Nguyễn Văn An', 'an@gmail.com', '02354545454', 'Quảng Điền - Đà Nẵng', '140000.0000', '20000.0000', 'Thanh toán khi nhận hàng', 'Giao tận nơi', '', '', 1493477208);

-- --------------------------------------------------------

--
-- Table structure for table `tuvanmuahang`
--

CREATE TABLE `tuvanmuahang` (
  `id` int(5) NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(20) NOT NULL,
  `created` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tuvanmuahang`
--

INSERT INTO `tuvanmuahang` (`id`, `email`, `phone`, `created`) VALUES
(6, 'binbiphanth11@gmail.com', 1668185092, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tuyendung`
--

CREATE TABLE `tuyendung` (
  `id` int(5) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `count_view` int(11) NOT NULL,
  `content` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(2) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `email`, `phone`, `address`, `password`, `created`) VALUES
(1, 'mua', 'nguoimua', 'nguoimua@gmail.com', '01686039488', 'TP Huế', '2104', 0);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(255) NOT NULL,
  `count_view` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `feature` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `view` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_group`
--
ALTER TABLE `admin_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chinh_sach`
--
ALTER TABLE `chinh_sach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_static`
--
ALTER TABLE `content_static`
  ADD PRIMARY KEY (`id`,`key`);

--
-- Indexes for table `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gioithieu`
--
ALTER TABLE `gioithieu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `info` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `maker`
--
ALTER TABLE `maker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `news` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `product` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `seopage_baohanh`
--
ALTER TABLE `seopage_baohanh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seopage_dichvu`
--
ALTER TABLE `seopage_dichvu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seopage_gioithieu`
--
ALTER TABLE `seopage_gioithieu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seopage_tintuc`
--
ALTER TABLE `seopage_tintuc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seopage_tuyendung`
--
ALTER TABLE `seopage_tuyendung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide_doitac`
--
ALTER TABLE `slide_doitac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide_main`
--
ALTER TABLE `slide_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tuvanmuahang`
--
ALTER TABLE `tuvanmuahang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tuyendung`
--
ALTER TABLE `tuyendung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `admin_group`
--
ALTER TABLE `admin_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;
--
-- AUTO_INCREMENT for table `chinh_sach`
--
ALTER TABLE `chinh_sach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `content_static`
--
ALTER TABLE `content_static`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gioithieu`
--
ALTER TABLE `gioithieu`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `maker`
--
ALTER TABLE `maker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;
--
-- AUTO_INCREMENT for table `seopage_baohanh`
--
ALTER TABLE `seopage_baohanh`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `seopage_dichvu`
--
ALTER TABLE `seopage_dichvu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `seopage_gioithieu`
--
ALTER TABLE `seopage_gioithieu`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `seopage_tintuc`
--
ALTER TABLE `seopage_tintuc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `seopage_tuyendung`
--
ALTER TABLE `seopage_tuyendung`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `slide_doitac`
--
ALTER TABLE `slide_doitac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `slide_main`
--
ALTER TABLE `slide_main`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `social`
--
ALTER TABLE `social`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `tuvanmuahang`
--
ALTER TABLE `tuvanmuahang`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tuyendung`
--
ALTER TABLE `tuyendung`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
