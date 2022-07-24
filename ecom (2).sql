-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 03:55 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'admin', 'admin', 0, '', '', 1),
(3, 'vishal', 'vishal', 1, '', '', 1),
(4, 'sufi', 'sufi', 1, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `btn_link` varchar(55) DEFAULT NULL,
  `image` varchar(355) NOT NULL,
  `order_no` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `btn_link`, `image`, `order_no`, `status`) VALUES
(3, 'cart.php', '738656838_b42.jpg', 2, 1),
(4, 'cart.php', '341502450_sl2.png', 1, 1),
(5, 'mobile.php', '747321557_b43.png', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(11, 'Men', 1),
(12, 'Women', 1),
(13, 'Mobile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `color_master`
--

CREATE TABLE `color_master` (
  `id` int(11) NOT NULL,
  `color` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `color_master`
--

INSERT INTO `color_master` (`id`, `color`, `status`) VALUES
(1, 'Red', 1),
(2, 'Blue', 1),
(8, 'green', 1),
(9, 'pink', 1),
(10, 'yellow', 1),
(11, 'maroon', 1),
(12, 'purple', 1),
(13, 'black', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(22, 'Aamir khan', 'aamir.k7199@gmail.com', '9561371297', 'hello testing comment', '2022-02-03 08:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 100, 'Rupee', 600, 1),
(2, 'First60', 10, 'Percentage', 400, 1),
(3, 'First70', 200, 'Rupee', 400, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(200) NOT NULL,
  `mihpayid` varchar(200) NOT NULL,
  `instamojo_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `instamojo_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 14, 'joges', 'mumbai', 562322, 'COD', 22495, 'success', 2, '', '', '', 0, '', '', '2022-05-25 11:49:43'),
(2, 14, 'joges', 'mumbai', 562322, 'instamojo', 342, 'pending', 1, '', '', '', 0, '', '', '2022-05-26 11:44:49'),
(3, 14, 'joges', 'mumbai', 562322, 'instamojo', 342, 'pending', 1, '', '', '', 0, '', '', '2022-05-26 12:07:48'),
(4, 14, 'joges', 'mumbai', 562322, 'instamojo', 342, 'complete', 1, 'dc8362e9459b4858ac50897764e9c33d', 'MOJO2526I05A24465738', '', 0, '', '', '2022-05-26 12:10:54'),
(5, 14, 'joges', 'mumbai', 562322, 'instamojo', 1999, 'complete', 1, '35b5194ee4484b84b18740fab04445af', 'MOJO2526R05A24465747', '', 0, '', '', '2022-05-26 12:26:02'),
(6, 14, 'joges', 'mumbai', 562322, 'instamojo', 2200, 'pending', 1, '602d5c4a700a489da4ef3bf2a60e66d8', '', '', 0, '', '', '2022-05-26 12:29:16'),
(7, 14, 'joges', 'mumbai', 562322, 'instamojo', 1400, 'complete', 1, '9eab0d3d8958414dbf07ada228d4089b', 'MOJO2526K05A24465753', '', 0, '', '', '2022-05-26 12:31:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_attr_id`, `qty`, `price`) VALUES
(1, 0, 33, 12, 1, 350),
(2, 1, 32, 17, 5, 4499),
(3, 2, 36, 7, 1, 342),
(4, 3, 36, 7, 1, 342),
(5, 4, 36, 7, 1, 342),
(6, 5, 34, 16, 1, 1999),
(7, 6, 33, 14, 4, 550),
(8, 7, 33, 12, 4, 350);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Cancelled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_decs` varchar(2500) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2500) NOT NULL,
  `meta_keyword` varchar(2500) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `image`, `short_decs`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(11, 13, 10, 'OPPO', '661015055_opp.png', 'OPPO A11 RAM 4GB ROM 64GB', 'OPPO A11 RAM 4GB ROM 64GB OPPO Mobile Battery 6000mh', 0, 'electronics product', 'OPPO A11 RAM 4GB ROM 64GB OPPO Mobile Battery 6000mh electronics product', 'electronics product', 0, 1),
(12, 14, 5, 'Watch mi3', '692512908_mi3.jpg', 'Digital watch mi3', 'Digital watch mi3 RAM 2GB ROM 16GB', 0, 'Digital watch mi3 RAM 2GB ROM 16GB', 'Digital watch mi3 RAM 2GB ROM 16GB Band Watch', 'Digital watch mi3 RAM 2GB ROM 16GB Band Watch electronic', 0, 1),
(13, 14, 5, 'Watch mi2', '229054572_mi2.jpg', 'Digital watch mi2', 'Digital watch mi2 RAM 2GB ROM 16GB Band Watch', 0, 'Digital watch mi2 RAM 2GB ROM', 'Digital watch mi2 RAM 2GB ROM 16GB', 'Digital watch mi2 RAM 2GB ROM 16GB Band Watch', 0, 1),
(14, 13, 13, 'Realme', '895318591_rel.png', 'Realme x7 RAM 6GB ROM 64GB', 'RAM 4GB ROM 64GB Realme Mobile Battery 6000mh 5G Supported', 0, 'RAM 4GB ROM 64GB Realme Mobile Battery 6000mh 5G Supported', 'RAM 4GB ROM 64GB Realme Mobile Battery 6000mh 5G Supported 128GB External Supported', 'RAM 4GB ROM 64GB Realme Mobile Battery 6000mh 5G Supported', 0, 1),
(15, 11, 3, 'T-shirt', '614402222_3xl-t2-seven-rocks-original-imafzbptgchwstcx.jpeg', 'Available color green,black,red', 'Available color green,black,red\r\nAvailable size L,XL,XXL\r\nBlack tshirt full sleve', 0, 'Available color green,black,red\r\nAvailable size L,XL,XXL\r\nBlack tshirt full sleve', 'Available color green,black,red\r\nAvailable size L,XL,XXL\r\nBlack tshirt full sleve', 'Available color green,black,red\r\nAvailable size L,XL,XXL\r\nBlack tshirt full sleve', 0, 1),
(16, 11, 0, 'Black White Shoe', '858725604_6-ccrr1-blk-6-absolute-comfort-black-white-original-imag6tkuzjkgfhvf.jpeg', 'Black White Shoe size are available 6,7,8,9', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red', 1, 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red', 0, 1),
(17, 11, 1, 'Blue Shoes', '290921363_6-cubic-1-blue-snk-aircum-blue-original-imaf8zxyywruz98g.jpeg', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red,blue,navy blue', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red,blue,navy blue', 1, 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red,blue,navy blue', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red,blue,navy blue', 'Black White Shoe size are available 6,7,8,9\r\ncolor are available black, white,grey,red,blue,navy blue', 0, 1),
(18, 12, 4, 'Saree', '989629943_free-1051b-fashion-day-original-imafnmt93zgkktmz.jpeg', 'Embroidered Fashion Vichitra, Cotton Silk Saree', 'Embroidered Fashion Vichitra, Cotton Silk Saree Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 0, 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 0, 1),
(19, 12, 4, 'Velvet Blue Saree', '584005362_free-velvet-blue-120-anugrah-textile-unstitched-original-imagykf7jfhv9vhh.jpeg', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 0, 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 'Style Code\r\nWedding Saree\r\nPattern\r\nEmbroidered\r\nPack of\r\n1\r\nSecondary Color\r\nGold, Beige\r\nOccasion\r\nParty & Festive\r\nType of Embroidery\r\nZarodosi Embroidery\r\nDecorative Material\r\nZari\r\nFabric Care\r\nHand Wash, Dry Clean Only\r\nOther Details\r\nWhether it is a wedding or an occasion for religious festivity at home, wear this lovely sari from Krishna r Fashion to look beautiful and sophisticated. Crafted from Silk, this sari will fall beautifully on your silhouette. The floral embroidery adds more charm to this sari. It also comes with a matching blouse piece that you can get tailored according to your liking. And Pure Silk Georgette saris and fabric in embroidery work and his work shown in a image.\r\nFabric\r\nVichitra, Cotton Silk\r\nType\r\nFashion\r\nBlouse Piece\r\nUnstitched\r\nSari Style\r\nRegular Sari\r\nSari Length\r\n5.5m\r\nBlouse Piece Length\r\n0.8 m\r\nWeight\r\n0.4 kg\r\nKrishna R Fashion Art Silk Embroidery Sari. This Beautiful Traditional sari is elegantly decorated with gorgeous Embroidery and pattern that gives a perfect look to the outfit. This sari is an ideal for Marriage functions and social gathering. Sari comes along with matching fabric un-stitched blouse piece. Sari Length : 5.5 mtr, Fabric: Art Silk, Blouse Length : 0.80 mtr.', 0, 1),
(20, 13, 12, 'Apple Iphone 12 pro max', '800946806_942626953_iphone.jpg', 'APPLE iPhone 12 Pro Max (Silver, 128 GB)', 'APPLE iPhone 12 Pro Max (Silver, 128 GB)\r\n\r\n₹1,19,900\r\n\r\nBrand Warranty for 1 YearKnow More\r\nColor\r\n\r\n\r\n\r\nStorage\r\n128 GB\r\n256 GB\r\n512 GB\r\nDelivery\r\n224153\r\nChangeCheck pincode✕\r\nCurrently out of stock in this area.\r\nHighlights\r\n128 GB ROM\r\n17.02 cm (6.7 inch) Super Retina XDR Display\r\n12MP + 12MP + 12MP | 12MP Front Camera\r\nA14 Bionic Chip with Next Generation Neural Engine Processor\r\nCeramic Shield | Industry-leading IP68 Water Resistance\r\nAll Screen OLED Display\r\nLiDAR Scanner for Improved AR Experiences, Night Mode Portraits', 0, 'APPLE iPhone 12 Pro Max (Silver, 128 GB)\r\n\r\n₹1,19,900\r\n\r\nBrand Warranty for 1 YearKnow More\r\nColor\r\n\r\n\r\n\r\nStorage\r\n128 GB\r\n256 GB\r\n512 GB\r\nDelivery\r\n224153\r\nChangeCheck pincode✕\r\nCurrently out of stock in this area.\r\nHighlights\r\n128 GB ROM\r\n17.02 cm (6.7 inch) Super Retina XDR Display\r\n12MP + 12MP + 12MP | 12MP Front Camera\r\nA14 Bionic Chip with Next Generation Neural Engine Processor\r\nCeramic Shield | Industry-leading IP68 Water Resistance\r\nAll Screen OLED Display\r\nLiDAR Scanner for Improved AR Experiences, Night Mode Portraits', 'APPLE iPhone 12 Pro Max (Silver, 128 GB)\r\n\r\n₹1,19,900\r\n\r\nBrand Warranty for 1 YearKnow More\r\nColor\r\n\r\n\r\n\r\nStorage\r\n128 GB\r\n256 GB\r\n512 GB\r\nDelivery\r\n224153\r\nChangeCheck pincode✕\r\nCurrently out of stock in this area.\r\nHighlights\r\n128 GB ROM\r\n17.02 cm (6.7 inch) Super Retina XDR Display\r\n12MP + 12MP + 12MP | 12MP Front Camera\r\nA14 Bionic Chip with Next Generation Neural Engine Processor\r\nCeramic Shield | Industry-leading IP68 Water Resistance\r\nAll Screen OLED Display\r\nLiDAR Scanner for Improved AR Experiences, Night Mode Portraits', 'APPLE iPhone 12 Pro Max (Silver, 128 GB)\r\n\r\n₹1,19,900\r\n\r\nBrand Warranty for 1 YearKnow More\r\nColor\r\n\r\n\r\n\r\nStorage\r\n128 GB\r\n256 GB\r\n512 GB\r\nDelivery\r\n224153\r\nChangeCheck pincode✕\r\nCurrently out of stock in this area.\r\nHighlights\r\n128 GB ROM\r\n17.02 cm (6.7 inch) Super Retina XDR Display\r\n12MP + 12MP + 12MP | 12MP Front Camera\r\nA14 Bionic Chip with Next Generation Neural Engine Processor\r\nCeramic Shield | Industry-leading IP68 Water Resistance\r\nAll Screen OLED Display\r\nLiDAR Scanner for Improved AR Experiences, Night Mode Portraits', 0, 1),
(21, 13, 0, 'APPLE iPhone 11 Pro (Space Grey, 64 GB)', '397932890_iphone-11-pro-512-u-mwcd2hn-a-apple-0-original-imafkg2fhzhzzh5s.jpeg', 'APPLE iPhone 11 Pro (Space Grey, 64 GB)', 'APPLE iPhone 11 Pro (Space Grey, 64 GB)\\\\r\\\\n4.68,561 Ratings & 624 Reviews\\\\r\\\\nExtra ₹26601 off\\\\r\\\\n₹79,999₹1,06,60024% off\\\\r\\\\n\\\\r\\\\nSold Out\\\\r\\\\nThis item is currently out of stock\\\\r\\\\n\\\\r\\\\nBrand Warranty for 1 YearKnow More\\\\r\\\\nColor\\\\r\\\\n\\\\r\\\\n\\\\r\\\\nStorage\\\\r\\\\n64 GB\\\\r\\\\n256 GB\\\\r\\\\n512 GB\\\\r\\\\nHighlights\\\\r\\\\n64 GB ROM\\\\r\\\\n14.73 cm (5.8 inch) Super Retina XDR Display\\\\r\\\\n12MP + 12MP + 12MP | 12MP Front Camera\\\\r\\\\nA13 Bionic Chip Processor', 0, 'APPLE iPhone 11 Pro (Space Grey, 64 GB)\\\\r\\\\n4.68,561 Ratings & 624 Reviews\\\\r\\\\nExtra ₹26601 off\\\\r\\\\n₹79,999₹1,06,60024% off\\\\r\\\\n\\\\r\\\\nSold Out\\\\r\\\\nThis item is currently out of stock\\\\r\\\\n\\\\r\\\\nBrand Warranty for 1 YearKnow More\\\\r\\\\nColor\\\\r\\\\n\\\\r\\\\n\\\\r\\\\nStorage\\\\r\\\\n64 GB\\\\r\\\\n256 GB\\\\r\\\\n512 GB\\\\r\\\\nHighlights\\\\r\\\\n64 GB ROM\\\\r\\\\n14.73 cm (5.8 inch) Super Retina XDR Display\\\\r\\\\n12MP + 12MP + 12MP | 12MP Front Camera\\\\r\\\\nA13 Bionic Chip Processor', 'APPLE iPhone 11 Pro (Space Grey, 64 GB)\\\\r\\\\n4.68,561 Ratings & 624 Reviews\\\\r\\\\nExtra ₹26601 off\\\\r\\\\n₹79,999₹1,06,60024% off\\\\r\\\\n\\\\r\\\\nSold Out\\\\r\\\\nThis item is currently out of stock\\\\r\\\\n\\\\r\\\\nBrand Warranty for 1 YearKnow More\\\\r\\\\nColor\\\\r\\\\n\\\\r\\\\n\\\\r\\\\nStorage\\\\r\\\\n64 GB\\\\r\\\\n256 GB\\\\r\\\\n512 GB\\\\r\\\\nHighlights\\\\r\\\\n64 GB ROM\\\\r\\\\n14.73 cm (5.8 inch) Super Retina XDR Display\\\\r\\\\n12MP + 12MP + 12MP | 12MP Front Camera\\\\r\\\\nA13 Bionic Chip Processor', 'APPLE iPhone 11 Pro (Space Grey, 64 GB)\\\\r\\\\n4.68,561 Ratings & 624 Reviews\\\\r\\\\nExtra ₹26601 off\\\\r\\\\n₹79,999₹1,06,60024% off\\\\r\\\\n\\\\r\\\\nSold Out\\\\r\\\\nThis item is currently out of stock\\\\r\\\\n\\\\r\\\\nBrand Warranty for 1 YearKnow More\\\\r\\\\nColor\\\\r\\\\n\\\\r\\\\n\\\\r\\\\nStorage\\\\r\\\\n64 GB\\\\r\\\\n256 GB\\\\r\\\\n512 GB\\\\r\\\\nHighlights\\\\r\\\\n64 GB ROM\\\\r\\\\n14.73 cm (5.8 inch) Super Retina XDR Display\\\\r\\\\n12MP + 12MP + 12MP | 12MP Front Camera\\\\r\\\\nA13 Bionic Chip Processor', 0, 1),
(22, 11, 1, 'shoes', '761814371_aac-9064-7-tying-gray-original-imafz5dzkmtxmv69.jpeg', 'grey and white shoe', 'grey and white shoe', 1, 'grey and white shoe all size are available', 'grey and white shoe all size are available', 'grey and white shoe all size are available', 0, 1),
(23, 11, 1, 'Black shoes', '128795135_6-mrj1643-6-aadi-blue-original-imag3wchzprvgsm3.jpeg', 'Black Shoes all Size Are Availabel', 'Black Shoes all Size Are Availabel and Two Color Availabe white and Black', 1, 'Black Shoes all Size Are Availabel and Two Color Availabe white and Black\r\nShoes Black Shoes White Shoes', 'Black Shoes all Size Are Availabel and Two Color Availabe white and Black\r\nShoes Black Shoes White Shoes', 'Black Shoes all Size Are Availabel and Two Color Availabe white and Black\r\nShoes Black Shoes White Shoes', 0, 1),
(24, 11, 3, 'Black Tshirt', '653413773_931830512__8-(1)-E5x-104831-NJD.jpg', 'tshirt', 'tshirt', 0, 'tshirt', 'tshirt', 'tshirt', 0, 1),
(25, 14, 6, 'HP Core i3 10th Gen', '525316192_pr18.png', 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Home) 15s-DU1516TU Thin and Light Laptop  (15.6 inch, Jet Black, 1.74 kg, With MS Office)', 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Home) 15s-DU1516TU Thin and Light Laptop  (15.6 inch, Jet Black, 1.74 kg, With MS Office) \r\nSales Package, Laptop, Power Adaptor, User Guide, Model Number: 15s-DU1516TU, Part Number:45W89PA#ACJ, Color:Jet Black, Type: Thin and Light Laptop Suitable For Processing & Multitasking Battery Backup: Upto 12 hours Battery Cell: 3 cell\r\nMS Office Provided\r\nYes\r\nProcessor And Memory Features\r\nProcessor Brand\r\nIntel\r\nProcessor Name\r\nCore i3\r\nProcessor Generation\r\n10th Gen\r\nSSD\r\nYes\r\nSSD Capacity\r\n512 GB\r\nRAM\r\n8 GB\r\nRAM Type\r\nDDR4\r\nProcessor Variant\r\n10110U\r\nClock Speed\r\n2.1 GHz with Turbo Boost Upto 4.1 GHz\r\nRAM Frequency\r\n2666 MHz\r\nCache\r\n4 MB\r\nGraphic Processor\r\nIntel Integrated UHD\r\nNumber of Cores\r\n2\r\nOperating System\r\nOS Architecture\r\n64 bit\r\nOperating System\r\nWindows 10 Home\r\nSystem Architecture\r\n64 bit\r\nPort And Slot Features\r\nMic In\r\nYes\r\nRJ45\r\nYes\r\nUSB Port\r\n1 x SuperSpeed USB Type C (5 Gbps Signaling Rate), 2 x SuperSpeed USB Type A (5 Gbps Signaling Rate)\r\nHDMI Port\r\n1 x HDMI Port (v1.4b)\r\nMulti Card Slot\r\n3-in-1 Card Reader (SD, SDHC, SDxC)\r\nHardware Interface\r\nPCIe NVMe M.2\r\nDisplay And Audio Features\r\nTouchscreen\r\nNo\r\nScreen Size\r\n39.62 cm (15.6 inch)\r\nScreen Resolution\r\n1920 x 1080 Pixel\r\nScreen Type\r\nFull HD LED Backlit Anti-glare Micro-edge Display (220 nits Brightness, 45% NTSC Color Gamut, 141 PPI)\r\nSpeakers\r\nBuilt-in Dual Speakers\r\nInternal Mic\r\nIntegrated Dual Array Digital Microphone\r\nConnectivity Features\r\nWireless LAN\r\nRealtek RTL8822CE 802.11a/b/g/n/ac (2x2)\r\nBluetooth:v5.0\r\nEthernet: Integrated 10/100/1000 Gigabit LAN\r\nDimensions:Dimensions:358 x 242 x 19.9 mm\r\nWeight: 1.74 kg\r\nAdditional Features\r\nDisk Drive\r\nNot Available: Web CameraHP True Vision 720p HD Webcam\r\nFinger Print Sensor No\r\nKeyboard\r\nFull-size, Jet Black Keyboard with Numeric Keypad\r\nBacklit Keyboard No\r\nPointer Device Touchpad with Multi-Touch Gesture Support\r\nIncluded Software: Microsoft Office Home and Student 2019, HP Documentation, HP BIOS Recovery, HP Smart, HP Support Assistant, Dropbox\r\nAdditional Features 41 WHr Li-ion Battery with Fast Charge Support, MU-MIMO Supported, Miracast Compatible\r\nWarranty Warranty Summary 1 Year Onsite Warranty Warranty Service Type Onsite Covered in Warranty  Manufacturing Defects Not Covered in Warranty Physical Damage\r\nDomestic Warranty:1 Year', 0, 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Home) 15s-DU1516TU Thin and Light Laptop  (15.6 inch, Jet Black, 1.74 kg, With MS Office) \r\nSales Package, Laptop, Power Adaptor, User Guide, Model Number: 15s-DU1516TU, Part Number:45W89PA#ACJ, Color:Jet Black, Type: Thin and Light Laptop Suitable For Processing & Multitasking Battery Backup: Upto 12 hours Battery Cell: 3 cell\r\nMS Office Provided\r\nYes\r\nProcessor And Memory Features\r\nProcessor Brand\r\nIntel\r\nProcessor Name\r\nCore i3\r\nProcessor Generation\r\n10th Gen\r\nSSD\r\nYes\r\nSSD Capacity\r\n512 GB\r\nRAM\r\n8 GB\r\nRAM Type\r\nDDR4\r\nProcessor Variant\r\n10110U\r\nClock Speed\r\n2.1 GHz with Turbo Boost Upto 4.1 GHz\r\nRAM Frequency\r\n2666 MHz\r\nCache\r\n4 MB\r\nGraphic Processor\r\nIntel Integrated UHD\r\nNumber of Cores\r\n2\r\nOperating System\r\nOS Architecture\r\n64 bit\r\nOperating System\r\nWindows 10 Home\r\nSystem Architecture\r\n64 bit\r\nPort And Slot Features\r\nMic In\r\nYes\r\nRJ45\r\nYes\r\nUSB Port\r\n1 x SuperSpeed USB Type C (5 Gbps Signaling Rate), 2 x SuperSpeed USB Type A (5 Gbps Signaling Rate)\r\nHDMI Port\r\n1 x HDMI Port (v1.4b)\r\nMulti Card Slot\r\n3-in-1 Card Reader (SD, SDHC, SDxC)\r\nHardware Interface\r\nPCIe NVMe M.2\r\nDisplay And Audio Features\r\nTouchscreen\r\nNo\r\nScreen Size\r\n39.62 cm (15.6 inch)\r\nScreen Resolution\r\n1920 x 1080 Pixel\r\nScreen Type\r\nFull HD LED Backlit Anti-glare Micro-edge Display (220 nits Brightness, 45% NTSC Color Gamut, 141 PPI)\r\nSpeakers\r\nBuilt-in Dual Speakers\r\nInternal Mic\r\nIntegrated Dual Array Digital Microphone\r\nConnectivity Features\r\nWireless LAN\r\nRealtek RTL8822CE 802.11a/b/g/n/ac (2x2)\r\nBluetooth:v5.0\r\nEthernet: Integrated 10/100/1000 Gigabit LAN\r\nDimensions:Dimensions:358 x 242 x 19.9 mm\r\nWeight: 1.74 kg\r\nAdditional Features\r\nDisk Drive\r\nNot Available: Web CameraHP True Vision 720p HD Webcam\r\nFinger Print Sensor No\r\nKeyboard\r\nFull-size, Jet Black Keyboard with Numeric Keypad\r\nBacklit Keyboard No\r\nPointer Device Touchpad with Multi-Touch Gesture Support\r\nIncluded Software: Microsoft Office Home and Student 2019, HP Documentation,', 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Home) 15s-DU1516TU Thin and Light Laptop  (15.6 inch, Jet Black, 1.74 kg, With MS Office) \r\nSales Package, Laptop, Power Adaptor, User Guide, Model Number: 15s-DU1516TU, Part Number:45W89PA#ACJ, Color:Jet Black, Type: Thin and Light Laptop Suitable For Processing & Multitasking Battery Backup: Upto 12 hours Battery Cell: 3 cell\r\nMS Office Provided\r\nYes\r\nProcessor And Memory Features\r\nProcessor Brand\r\nIntel\r\nProcessor Name\r\nCore i3\r\nProcessor Generation\r\n10th Gen\r\nSSD\r\nYes\r\nSSD Capacity\r\n512 GB\r\nRAM\r\n8 GB\r\nRAM Type\r\nDDR4\r\nProcessor Variant\r\n10110U\r\nClock Speed\r\n2.1 GHz with Turbo Boost Upto 4.1 GHz\r\nRAM Frequency\r\n2666 MHz\r\nCache\r\n4 MB\r\nGraphic Processor\r\nIntel Integrated UHD\r\nNumber of Cores\r\n2\r\nOperating System\r\nOS Architecture\r\n64 bit\r\nOperating System\r\nWindows 10 Home\r\nSystem Architecture\r\n64 bit\r\nPort And Slot Features\r\nMic In\r\nYes\r\nRJ45\r\nYes\r\nUSB Port\r\n1 x SuperSpeed USB Type C (5 Gbps Signaling Rate), 2 x SuperSpeed USB Type A (5 Gbps Signaling Rate)\r\nHDMI Port\r\n1 x HDMI Port (v1.4b)\r\nMulti Card Slot\r\n3-in-1 Card Reader (SD, SDHC, SDxC)\r\nHardware Interface\r\nPCIe NVMe M.2\r\nDisplay And Audio Features\r\nTouchscreen\r\nNo\r\nScreen Size\r\n39.62 cm (15.6 inch)\r\nScreen Resolution\r\n1920 x 1080 Pixel\r\nScreen Type\r\nFull HD LED Backlit Anti-glare Micro-edge Display (220 nits Brightness, 45% NTSC Color Gamut, 141 PPI)\r\nSpeakers\r\nBuilt-in Dual Speakers\r\nInternal Mic\r\nIntegrated Dual Array Digital Microphone\r\nConnectivity Features\r\nWireless LAN\r\nRealtek RTL8822CE 802.11a/b/g/n/ac (2x2)\r\nBluetooth:v5.0\r\nEthernet: Integrated 10/100/1000 Gigabit LAN\r\nDimensions:Dimensions:358 x 242 x 19.9 mm\r\nWeight: 1.74 kg\r\nAdditional Features\r\nDisk Drive\r\nNot Available: Web CameraHP True Vision 720p HD Webcam\r\nFinger Print Sensor No\r\nKeyboard\r\nFull-size, Jet Black Keyboard with Numeric Keypad\r\nBacklit Keyboard No\r\nPointer Device Touchpad with Multi-Touch Gesture Support\r\nIncluded Software: Microsoft Office Home and Student 2019, HP Documentation, HP BIOS Recovery, HP Smart, HP Support Assistant, Dropbox\r\nAdditional Features 41 WHr Li-ion Battery with Fast Charge Support, MU-MIMO Supported, Miracast Compatible\r\nWarranty Warranty Summary 1 Year Onsite Warranty Warranty Service Type Onsite Covered in Warranty  Manufacturing Defects Not Covered in Warranty Physical Damage\r\nDomestic Warranty:1 Year', 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Home) 15s-DU1516TU Thin and Light Laptop  (15.6 inch, Jet Black, 1.74 kg, With MS Office) \r\nSales Package, Laptop, Power Adaptor, User Guide, Model Number: 15s-DU1516TU, Part Number:45W89PA#ACJ, Color:Jet Black, Type: Thin and Light Laptop Suitable For Processing & Multitasking Battery Backup: Upto 12 hours Battery Cell: 3 cell\r\nMS Office Provided\r\nYes\r\nProcessor And Memory Features\r\nProcessor Brand\r\nIntel\r\nProcessor Name\r\nCore i3\r\nProcessor Generation\r\n10th Gen\r\nSSD\r\nYes\r\nSSD Capacity\r\n512 GB\r\nRAM\r\n8 GB\r\nRAM Type\r\nDDR4\r\nProcessor Variant\r\n10110U\r\nClock Speed\r\n2.1 GHz with Turbo Boost Upto 4.1 GHz\r\nRAM Frequency\r\n2666 MHz\r\nCache\r\n4 MB\r\nGraphic Processor\r\nIntel Integrated UHD\r\nNumber of Cores\r\n2\r\nOperating System\r\nOS Architecture\r\n64 bit\r\nOperating System\r\nWindows 10 Home\r\nSystem Architecture\r\n64 bit\r\nPort And Slot Features\r\nMic In\r\nYes\r\nRJ45\r\nYes\r\nUSB Port\r\n1 x SuperSpeed USB Type C (5 Gbps Signaling Rate), 2 x SuperSpeed USB Type A (5 Gbps Signaling Rate)\r\nHDMI Port\r\n1 x HDMI Port (v1.4b)\r\nMulti Card Slot\r\n3-in-1 Card Reader (SD, SDHC, SDxC)\r\nHardware Interface\r\nPCIe NVMe M.2\r\nDisplay And Audio Features\r\nTouchscreen\r\nNo\r\nScreen Size\r\n39.62 cm (15.6 inch)\r\nScreen Resolution\r\n1920 x 1080 Pixel\r\nScreen Type\r\nFull HD LED Backlit Anti-glare Micro-edge Display (220 nits Brightness, 45% NTSC Color Gamut, 141 PPI)\r\nSpeakers\r\nBuilt-in Dual Speakers\r\nInternal Mic\r\nIntegrated Dual Array Digital Microphone\r\nConnectivity Features\r\nWireless LAN\r\nRealtek RTL8822CE 802.11a/b/g/n/ac (2x2)\r\nBluetooth:v5.0\r\nEthernet: Integrated 10/100/1000 Gigabit LAN\r\nDimensions:Dimensions:358 x 242 x 19.9 mm\r\nWeight: 1.74 kg\r\nAdditional Features\r\nDisk Drive\r\nNot Available: Web CameraHP True Vision 720p HD Webcam\r\nFinger Print Sensor No\r\nKeyboard\r\nFull-size, Jet Black Keyboard with Numeric Keypad\r\nBacklit Keyboard No\r\nPointer Device Touchpad with Multi-Touch Gesture Support\r\nIncluded Software: Microsoft Office Home and Student 2019, HP Documentation, HP BIOS Recovery, HP Smart, HP Support Assistant, Dropbox\r\nAdditional Features 41 WHr Li-ion Battery with Fast Charge Support, MU-MIMO Supported, Miracast Compatible\r\nWarranty Warranty Summary 1 Year Onsite Warranty Warranty Service Type Onsite Covered in Warranty  Manufacturing Defects Not Covered in Warranty Physical Damage\r\nDomestic Warranty:1 Year', 0, 1),
(26, 14, 6, 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H', '699288454_pr1.png', 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H - (16 GB/1 TB HDD/256 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce 1650Ti/144 Hz) 15-EC1512AX Gaming Laptop  (15.6 inch, Shadow Black, 2.19 kg, With MS Office)', 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H - (16 GB/1 TB HDD/256 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce 1650Ti/144 Hz) 15-EC1512AX Gaming Laptop  (15.6 inch, Shadow Black, 2.19 kg, With MS Office) \r\n15.6 inch Full HD WLED Backlit Anti-glare Micro-edge IPS Display (144 Hz Refresh Rate, Brightness: 250 nits, 141 PPI, Color Gamut: 45% NTSC) Light Laptop without Optical Disk Drive Pre-installed Genuine Windows 10 OS Preloaded with MS Office', 0, 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H - (16 GB/1 TB HDD/256 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce 1650Ti/144 Hz) 15-EC1512AX Gaming Laptop  (15.6 inch, Shadow Black, 2.19 kg, With MS Office) \r\n15.6 inch Full HD WLED Backlit Anti-glare Micro-edge IPS Display (144 Hz Refresh Rate, Brightness: 250 nits, 141 PPI, Color Gamut: 45% NTSC) Light Laptop without Optical Disk Drive Pre-installed Genuine Windows 10 OS Preloaded with MS Office', 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H - (16 GB/1 TB HDD/256 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce 1650Ti/144 Hz) 15-EC1512AX Gaming Laptop  (15.6 inch, Shadow Black, 2.19 kg, With MS Office) \r\n15.6 inch Full HD WLED Backlit Anti-glare Micro-edge IPS Display (144 Hz Refresh Rate, Brightness: 250 nits, 141 PPI, Color Gamut: 45% NTSC) Light Laptop without Optical Disk Drive Pre-installed Genuine Windows 10 OS Preloaded with MS Office', 'HP Pavilion Gaming Ryzen 7 Octa Core 4800H - (16 GB/1 TB HDD/256 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce 1650Ti/144 Hz) 15-EC1512AX Gaming Laptop  (15.6 inch, Shadow Black, 2.19 kg, With MS Office) \r\n15.6 inch Full HD WLED Backlit Anti-glare Micro-edge IPS Display (144 Hz Refresh Rate, Brightness: 250 nits, 141 PPI, Color Gamut: 45% NTSC) Light Laptop without Optical Disk Drive Pre-installed Genuine Windows 10 OS Preloaded with MS Office', 0, 1),
(27, 12, 4, 'Printed Bandhani Art Silk Saree  (Maroon)', '625395212_pr8.png', 'Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.', 'Printed Bandhani Art Silk Saree  (Maroon) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 'Printed Bandhani Art Silk Saree  (Maroon) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Printed Bandhani Art Silk Saree  (Maroon) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Printed Bandhani Art Silk Saree  (Maroon) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 1),
(28, 12, 4, 'Woven Kanjivaram Poly Silk Saree  (Green)', '743514552_pr9.png', 'Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.', 'Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 'Woven Kanjivaram Poly Silk Saree  (Green) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Woven Kanjivaram Poly Silk Saree  (Green) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.Woven Kanjivaram Poly Silk Saree  (Green) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Woven Kanjivaram Poly Silk Saree  (Green) Shipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 1),
(29, 12, 4, 'Embroidered Bollywood Silk Blend Saree  (Pink, Black)', '495906375_pr10.png', 'Embroidered Bollywood Silk Blend Saree  (Pink, Black)', 'Embroidered Bollywood Silk Blend Saree  (Pink, Black) Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 'Embroidered Bollywood Silk Blend Saree  (Pink, Black) Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Embroidered Bollywood Silk Blend Saree  (Pink, Black) Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 'Embroidered Bollywood Silk Blend Saree  (Pink, Black) Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', 0, 1),
(30, 12, 7, 'Half Seleves t-shirt', '676099203_309027777_Floral-Print-Polo-T-shirt.jpg', 'Black T-shirt,three color are availabel', 'Black T-shirt,three color are availabel and all size are avilabel', 0, 'Black T-shirt,three color are availabel and all size are avilabel', 'Black T-shirt,three color are availabel and all size are avilabel', 'Black T-shirt,three color are availabel and all size are avilabel', 0, 1),
(31, 12, 7, 'Half Seleves t-shirt (white)', '727735610_651584201_Floral-Embroidered-Polo-T-shirt.jpg', 'White T-shirt,three color are availabel', 'White T-shirt,three color are availabel and all size are avilabel', 0, 'White T-shirt,three color are availabel and all size are avilabel', 'White T-shirt,three color are availabel and all size are avilabel', 'White T-shirt,three color are availabel and all size are avilabel', 0, 1),
(32, 12, 4, 'Woven Bollywood Georgette, Crepe Georgette Saree', '347679838_pr12.png', 'Woven Bollywood Georgette, Crepe Georgette Saree  weightless georgette', 'Woven Bollywood Georgette, Crepe Georgette Saree  weightless georgette ten color are availabel', 1, 'Woven Bollywood Georgette, Crepe Georgette Saree  weightless georgette ten color are availabel', 'Woven Bollywood Georgette, Crepe Georgette Saree  weightless georgette ten color are availabel', 'Woven Bollywood Georgette, Crepe Georgette Saree  weightless georgette ten color are availabel', 0, 1),
(33, 11, 9, 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White)', '835097371_pr3.png', 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White)', 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White) six Different color are available (Black pink White),(Black blue White),(Black yellow White),(Black Orange White),(Black Gery White)', 1, 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White) six Different color are available (Black pink White),(Black blue White),(Black yellow White),(Black Orange White),(Black Gery White)', 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White) six Different color are available (Black pink White),(Black blue White),(Black yellow White),(Black Orange White),(Black Gery White)', 'Men Regular Fit Dyed Slim Collar Casual Shirt(Black Green White) six Different color are available (Black pink White),(Black blue White),(Black yellow White),(Black Orange White),(Black Gery White)', 0, 1),
(34, 12, 8, 'Lace Casual Boots For Girl(White)', '585733619_pr13.png', 'Lace Casual Boots For Girl(White)', 'Lace Casual Boots For Girl(White)', 1, 'Lace Casual Boots For Girl(White)', 'Lace Casual Boots For Girl(White)', 'Lace Casual Boots For Girl(White)', 0, 1),
(35, 11, 2, 'Analog Watch For Men', '955794163_pr17.png', 'Water Resistant Display Type Analog Occasion Casual Watch Type Wrist Dial Color Brown', 'Water Resistant Display Type Analog Occasion Casual Watch Type Wrist Dial Color Brown Strap Type Braclet Power Source Battery Powered', 1, 'Water Resistant Display Type Analog Occasion Casual Watch Type Wrist Dial Color Brown Strap Type Braclet Power Source Battery Powered', 'Water Resistant Display Type Analog Occasion Casual Watch Type Wrist Dial Color Brown Strap Type Braclet Power Source Battery Powered', 'Water Resistant Display Type Analog Occasion Casual Watch Type Wrist Dial Color Brown Strap Type Braclet Power Source Battery Powered', 0, 1),
(36, 11, 9, 'shirt (GREEN)', '260324645_pr4.png', 'GREEN SHIRT AVAILABLE SIZE M,L,XL,XXL', 'GREEN SHIRT AVAILABLE SIZE M,L,XL,XXL  AND COLOR IS GREEN YELLOW GREY', 0, 'GREEN SHIRT AVAILABLE SIZE M,L,XL,XXL  AND COLOR IS GREEN YELLOW GREY', 'GREEN SHIRT AVAILABLE SIZE M,L,XL,XXL  AND COLOR IS GREEN YELLOW GREY', 'GREEN SHIRT AVAILABLE SIZE M,L,XL,XXL  AND COLOR IS GREEN YELLOW GREY', 0, 1),
(37, 14, 5, 'ladies watch', '703893585_6-ccrr1-blk-6-absolute-comfort-black-white-original-imag6tkuzjkgfhvf.jpeg', 'fossil', 'fossil', 1, 'fossil watch', '', 'foss', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `mrp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `size_id`, `color_id`, `mrp`, `price`, `qty`) VALUES
(1, 45, 4, 2, 767, 3424, 9),
(3, 45, 3, 2, 435, 232, 34),
(4, 0, 4, 8, 435, 232, 3),
(5, 0, 1, 9, 767, 232, 9),
(6, 36, 2, 8, 767, 342, 34),
(7, 36, 3, 1, 767, 342, 9),
(8, 35, 0, 2, 5500, 3399, 8),
(9, 35, 0, 1, 5500, 3399, 5),
(10, 35, 0, 12, 5500, 3399, 8),
(11, 35, 0, 13, 5500, 3399, 3),
(12, 33, 1, 0, 400, 350, 34),
(13, 33, 2, 0, 500, 450, 0),
(14, 33, 3, 0, 600, 550, 8),
(15, 24, 0, 0, 1000, 699, 7),
(16, 34, 0, 0, 3000, 1999, 5),
(17, 32, 0, 0, 5500, 4499, 8);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_image`) VALUES
(1, 34, '886408586_401-blus-40-bruton-blue-original-imafvbyzut93n9zf.jpeg'),
(2, 34, '614541832_6-cubic-1-blue-snk-aircum-blue-original-imaf8zxyywruz98g.jpeg'),
(3, 0, '363800332_567328558_samsung-galaxy-s10-plus-1tb-ceramic-white-12gb-ram-.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(30) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `size_master`
--

CREATE TABLE `size_master` (
  `id` int(11) NOT NULL,
  `size` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` tinyint(4) NOT NULL,
  `order_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size_master`
--

INSERT INTO `size_master` (`id`, `size`, `status`, `order_by`) VALUES
(1, 'M', 1, 2),
(2, 'L', 1, 3),
(3, 'XL', 1, 4),
(4, 'S', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(200) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 11, 'Shoes', 1),
(2, 11, 'Watch', 1),
(3, 11, 'T-shirt', 1),
(4, 12, 'saree', 1),
(5, 14, 'Watch', 1),
(6, 14, 'Laptop', 1),
(7, 12, 'T-shirt', 1),
(8, 12, 'Shoes', 1),
(9, 11, 'Shirt', 1),
(10, 13, 'OPPO', 1),
(11, 13, 'MI', 1),
(12, 13, 'APPLE', 1),
(13, 13, 'REALME', 1),
(14, 15, 'Sofa', 1),
(15, 12, 'rytyb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `added_on`) VALUES
(14, 'Aamir khan', 'aamir.k7199@gmail.com', 'aamir11', '09561371297', '2022-01-20 03:26:33'),
(17, 'vishal', 'vy264109@gmail.com', 'vy264109', '8691921862', '2022-04-15 08:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(37, 14, 35, '2022-05-25 12:09:32'),
(38, 14, 34, '2022-05-25 12:09:33'),
(39, 14, 33, '2022-05-25 12:09:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color_master`
--
ALTER TABLE `color_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size_master`
--
ALTER TABLE `size_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `color_master`
--
ALTER TABLE `color_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `size_master`
--
ALTER TABLE `size_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
