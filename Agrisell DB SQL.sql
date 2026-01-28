CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `acc_status` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','FARMER','BUYER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_email` (`email`)
);


CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_address` (`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);


CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_category_name` (`name`),
  FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
);


CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stock_quantity` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);


CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `payment_status` enum('PENDING','PAID','FAILED') DEFAULT NULL,
  `status` enum('PENDING','CONFIRMED','SHIPPED','DELIVERED','CANCELLED') DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);


CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` enum('PENDING','PAID','FAILED') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_payment_order` (`order_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
);


CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int NOT NULL,
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);


CREATE TABLE `password_reset_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_time` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_reset_user` (`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);


CREATE TABLE `order_status_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `status` enum('PENDING','CONFIRMED','SHIPPED','DELIVERED','CANCELLED') DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
);


INSERT INTO users 
(id, created_at, updated_at, acc_status, email, name, password, phone, profile_url, role)
VALUES

(5, '2025-12-30 14:30:00', '2025-12-30 15:00:00', 'INACTIVE', 'buyer2@gmail.com', 'Buyer Neha', 'pass123', '9999990005', NULL, 'BUYER'),

(6, '2026-01-01 09:00:00', '2026-01-01 10:00:00', 'ACTIVE', 'farmer3@gmail.com', 'Farmer Kiran', 'pass123', '9999990006', NULL, 'FARMER'),

(7, '2026-01-02 11:15:00', '2026-01-02 12:10:00', 'ACTIVE', 'buyer3@gmail.com', 'Buyer Rohit', 'pass123', '9999990007', NULL, 'BUYER'),

(8, '2026-01-03 13:40:00', '2026-01-03 14:00:00', 'ACTIVE', 'farmer4@gmail.com', 'Farmer Deepak', 'pass123', '9999990008', NULL, 'FARMER'),

(9, '2026-01-04 10:30:00', '2026-01-04 11:20:00', 'ACTIVE', 'buyer4@gmail.com', 'Buyer Priya', 'pass123', '9999990009', NULL, 'BUYER'),

(10, '2026-01-05 15:50:00', '2026-01-05 16:10:00', 'ACTIVE', 'farmer5@gmail.com', 'Farmer Manish', 'pass123', '9999990010', NULL, 'FARMER'),

(11, '2026-01-06 08:10:00', '2026-01-06 09:00:00', 'ACTIVE', 'buyer5@gmail.com', 'Buyer Sanjay', 'pass123', '9999990011', NULL, 'BUYER'),

(12, '2026-01-07 09:45:00', '2026-01-07 10:30:00', 'ACTIVE', 'farmer6@gmail.com', 'Farmer Vishal', 'pass123', '9999990012', NULL, 'FARMER'),

(13, '2026-01-08 12:05:00', '2026-01-08 13:00:00', 'ACTIVE', 'buyer6@gmail.com', 'Buyer Meera', 'pass123', '9999990013', NULL, 'BUYER'),

(14, '2026-01-09 14:20:00', '2026-01-09 15:00:00', 'ACTIVE', 'farmer7@gmail.com', 'Farmer Arjun', 'pass123', '9999990014', NULL, 'FARMER'),

(15, '2026-01-10 10:55:00', '2026-01-10 11:40:00', 'INACTIVE', 'buyer7@gmail.com', 'Buyer Sneha', 'pass123', '9999990015', NULL, 'BUYER'),

(16, '2026-01-11 09:30:00', '2026-01-11 10:10:00', 'ACTIVE', 'farmer8@gmail.com', 'Farmer Sunil', 'pass123', '9999990016', NULL, 'FARMER'),

(17, '2026-01-12 11:50:00', '2026-01-12 12:30:00', 'ACTIVE', 'buyer8@gmail.com', 'Buyer Nikhil', 'pass123', '9999990017', NULL, 'BUYER'),

(18, '2026-01-13 13:10:00', '2026-01-13 14:00:00', 'ACTIVE', 'farmer9@gmail.com', 'Farmer Mahesh', 'pass123', '9999990018', NULL, 'FARMER'),

(19, '2026-01-14 15:25:00', '2026-01-14 16:00:00', 'ACTIVE', 'buyer9@gmail.com', 'Buyer Riya', 'pass123', '9999990019', NULL, 'BUYER'),

(20, '2026-01-15 08:40:00', '2026-01-15 09:15:00', 'ACTIVE', 'farmer10@gmail.com', 'Farmer Ajay', 'pass123', '9999990020', NULL, 'FARMER'),

(21, '2026-01-16 10:10:00', '2026-01-16 11:00:00', 'ACTIVE', 'buyer10@gmail.com', 'Buyer Karan', 'pass123', '9999990021', NULL, 'BUYER'),

(22, '2026-01-17 12:45:00', '2026-01-17 13:20:00', 'ACTIVE', 'farmer11@gmail.com', 'Farmer Ramesh', 'pass123', '9999990022', NULL, 'FARMER'),

(23, '2026-01-18 14:30:00', '2026-01-18 15:10:00', 'ACTIVE', 'buyer11@gmail.com', 'Buyer Pooja', 'pass123', '9999990023', NULL, 'BUYER'),

(24, '2026-01-19 09:15:00', '2026-01-19 10:00:00', 'ACTIVE', 'farmer12@gmail.com', 'Farmer Gopal', 'pass123', '9999990024', NULL, 'FARMER'),

(25, '2026-01-20 11:05:00', '2026-01-20 12:00:00', 'INACTIVE', 'buyer12@gmail.com', 'Buyer Anjali', 'pass123', '9999990025', NULL, 'BUYER'),

(26, '2026-01-21 13:35:00', '2026-01-21 14:20:00', 'ACTIVE', 'farmer13@gmail.com', 'Farmer Satish', 'pass123', '9999990026', NULL, 'FARMER'),

(27, '2026-01-22 15:10:00', '2026-01-22 16:00:00', 'ACTIVE', 'buyer13@gmail.com', 'Buyer Rahul', 'pass123', '9999990027', NULL, 'BUYER'),

(28, '2026-01-23 09:50:00', '2026-01-23 10:30:00', 'ACTIVE', 'farmer14@gmail.com', 'Farmer Prakash', 'pass123', '9999990028', NULL, 'FARMER'),

(29, '2026-01-24 11:40:00', '2026-01-24 12:10:00', 'ACTIVE', 'buyer14@gmail.com', 'Buyer Simran', 'pass123', '9999990029', NULL, 'BUYER'),

(30, '2026-01-25 14:15:00', '2026-01-25 15:00:00', 'ACTIVE', 'farmer15@gmail.com', 'Farmer Dinesh', 'pass123', '9999990030', NULL, 'FARMER');


INSERT INTO addresses
(id, created_at, updated_at, city, country, district, postal_code, state, street, user_id)
VALUES
(1, '2025-12-25 10:00:00', '2025-12-25 10:30:00', 'Pune', 'India', 'Hinjewadi', '411057', 'Maharashtra', 'Phase 1 Street', 1),

(2, '2025-12-27 11:10:00', '2025-12-27 11:45:00', 'Nashik', 'India', 'CIDCO', '422009', 'Maharashtra', 'Main Road', 2),

(5, '2025-12-30 15:10:00', '2025-12-30 15:45:00', 'Aurangabad', 'India', 'CIDCO', '431003', 'Maharashtra', 'Station Road', 5),

(6, '2026-01-01 10:25:00', '2026-01-01 11:00:00', 'Kolhapur', 'India', 'Shivaji Nagar', '416003', 'Maharashtra', 'Market Street', 6),

(7, '2026-01-02 13:40:00', '2026-01-02 14:15:00', 'Satara', 'India', 'Powai Naka', '415001', 'Maharashtra', 'Ring Road', 7),

(8, '2026-01-03 09:10:00', '2026-01-03 09:50:00', 'Solapur', 'India', 'Railway Lines', '413001', 'Maharashtra', 'South Street', 8),

(9, '2026-01-04 14:30:00', '2026-01-04 15:00:00', 'Thane', 'India', 'Ghodbunder', '400615', 'Maharashtra', 'Express Highway', 9),

(10, '2026-01-05 11:15:00', '2026-01-05 11:40:00', 'Amravati', 'India', 'Rajapeth', '444601', 'Maharashtra', 'College Road', 10),

(11, '2026-01-06 08:50:00', '2026-01-06 09:20:00', 'Jalgaon', 'India', 'MIDC', '425001', 'Maharashtra', 'Industrial Area', 11),

(12, '2026-01-07 10:00:00', '2026-01-07 10:40:00', 'Sangli', 'India', 'Vishrambag', '416415', 'Maharashtra', 'MG Road', 12),

(13, '2026-01-08 12:45:00', '2026-01-08 13:15:00', 'Latur', 'India', 'Udgir', '413517', 'Maharashtra', 'Main Chowk', 13),

(14, '2026-01-09 15:20:00', '2026-01-09 15:55:00', 'Beed', 'India', 'Shivaji Nagar', '431122', 'Maharashtra', 'Bus Stand Road', 14),

(15, '2026-01-10 09:30:00', '2026-01-10 10:00:00', 'Nanded', 'India', 'Old City', '431601', 'Maharashtra', 'Fort Area', 15),

(16, '2026-01-11 11:40:00', '2026-01-11 12:10:00', 'Parbhani', 'India', 'Basmat Road', '431401', 'Maharashtra', 'Market Yard', 16),

(17, '2026-01-12 14:00:00', '2026-01-12 14:30:00', 'Akola', 'India', 'Tilak Nagar', '444001', 'Maharashtra', 'Civil Lines', 17),

(18, '2026-01-13 10:20:00', '2026-01-13 10:55:00', 'Wardha', 'India', 'Gandhi Nagar', '442001', 'Maharashtra', 'Main Street', 18),

(19, '2026-01-14 12:10:00', '2026-01-14 12:45:00', 'Bhandara', 'India', 'Tumsar', '441904', 'Maharashtra', 'Highway Road', 19),

(20, '2026-01-15 15:00:00', '2026-01-15 15:40:00', 'Gondia', 'India', 'Civil Area', '441601', 'Maharashtra', 'Lake Road', 20),

(21, '2026-01-16 09:45:00', '2026-01-16 10:15:00', 'Chandrapur', 'India', 'Ballarpur', '442701', 'Maharashtra', 'Coal City Road', 21),

(22, '2026-01-17 11:30:00', '2026-01-17 12:05:00', 'Ratnagiri', 'India', 'Ganpatipule', '415639', 'Maharashtra', 'Beach Road', 22),

(23, '2026-01-18 14:50:00', '2026-01-18 15:20:00', 'Sindhudurg', 'India', 'Malvan', '416606', 'Maharashtra', 'Coastal Street', 23),

(24, '2026-01-19 10:05:00', '2026-01-19 10:45:00', 'Ahmednagar', 'India', 'Savedi', '414003', 'Maharashtra', 'Pipeline Road', 24),

(25, '2026-01-20 13:30:00', '2026-01-20 14:00:00', 'Dhule', 'India', 'Deopur', '424002', 'Maharashtra', 'Temple Lane', 25),

(26, '2026-01-21 09:15:00', '2026-01-21 09:50:00', 'Osmanabad', 'India', 'Tuljapur', '413601', 'Maharashtra', 'Main Mandir Road', 26),

(27, '2026-01-22 11:55:00', '2026-01-22 12:25:00', 'Palghar', 'India', 'Virar', '401303', 'Maharashtra', 'Station Street', 27),

(28, '2026-01-23 14:10:00', '2026-01-23 14:40:00', 'Raigad', 'India', 'Alibaug', '402201', 'Maharashtra', 'Beach Highway', 28),

(29, '2026-01-24 09:35:00', '2026-01-24 10:05:00', 'Jalna', 'India', 'Old Market', '431203', 'Maharashtra', 'Ring Lane', 29),

(30, '2026-01-25 12:25:00', '2026-01-25 13:00:00', 'Washim', 'India', 'City Center', '444505', 'Maharashtra', 'Main Square Road', 30);


INSERT INTO category
(id, created_at, updated_at, img_url, name, parent_id, is_active)
VALUES
-- ✅ Main Categories
(1, '2025-12-25 09:00:00', '2025-12-25 09:20:00', 'img/vegetables.png', 'Vegetables', NULL, 1),
(2, '2025-12-26 10:00:00', '2025-12-26 10:15:00', 'img/fruits.png', 'Fruits', NULL, 1),
(3, '2025-12-27 11:10:00', '2025-12-27 11:30:00', 'img/beans.png', 'Beans & Pulses', NULL, 1),
(4, '2025-12-28 12:05:00', '2025-12-28 12:25:00', 'img/dairy.png', 'Dairy Products', NULL, 1),
(5, '2025-12-29 13:15:00', '2025-12-29 13:40:00', 'img/grains.png', 'Grains & Cereals', NULL, 1),
(6, '2025-12-30 14:10:00', '2025-12-30 14:30:00', 'img/spices.png', 'Spices', NULL, 1),
(7, '2026-01-01 09:30:00', '2026-01-01 09:50:00', 'img/oilseeds.png', 'Oil Seeds', NULL, 1),
(8, '2026-01-02 10:40:00', '2026-01-02 11:00:00', 'img/organic.png', 'Organic Products', NULL, 1),

-- ✅ Vegetables Subcategories
(9,  '2026-01-03 09:10:00', '2026-01-03 09:30:00', 'img/tomato.png', 'Tomatoes', 1, 1),
(10, '2026-01-04 10:20:00', '2026-01-04 10:45:00', 'img/potato.png', 'Potatoes', 1, 1),
(11, '2026-01-05 11:15:00', '2026-01-05 11:40:00', 'img/onion.png', 'Onions', 1, 1),
(12, '2026-01-06 12:25:00', '2026-01-06 12:55:00', 'img/cabbage.png', 'Cabbage', 1, 1),
(13, '2026-01-07 13:10:00', '2026-01-07 13:40:00', 'img/carrot.png', 'Carrots', 1, 1),

-- ✅ Fruits Subcategories
(14, '2026-01-08 09:00:00', '2026-01-08 09:20:00', 'img/apple.png', 'Apples', 2, 1),
(15, '2026-01-09 10:15:00', '2026-01-09 10:40:00', 'img/banana.png', 'Bananas', 2, 1),
(16, '2026-01-10 11:25:00', '2026-01-10 11:50:00', 'img/mango.png', 'Mangoes', 2, 1),
(17, '2026-01-11 12:35:00', '2026-01-11 13:00:00', 'img/grapes.png', 'Grapes', 2, 1),
(18, '2026-01-12 14:10:00', '2026-01-12 14:40:00', 'img/orange.png', 'Oranges', 2, 1),

-- ✅ Beans & Pulses Subcategories
(19, '2026-01-13 09:25:00', '2026-01-13 09:50:00', 'img/chickpeas.png', 'Chickpeas', 3, 1),
(20, '2026-01-14 10:40:00', '2026-01-14 11:05:00', 'img/lentils.png', 'Lentils', 3, 1),
(21, '2026-01-15 12:00:00', '2026-01-15 12:20:00', 'img/greenpeas.png', 'Green Peas', 3, 1),
(22, '2026-01-16 13:15:00', '2026-01-16 13:40:00', 'img/blackbeans.png', 'Black Beans', 3, 1),

-- ✅ Dairy Products Subcategories
(23, '2026-01-17 09:10:00', '2026-01-17 09:35:00', 'img/milk.png', 'Milk', 4, 1),
(24, '2026-01-18 10:30:00', '2026-01-18 10:55:00', 'img/curd.png', 'Curd', 4, 1),
(25, '2026-01-19 11:45:00', '2026-01-19 12:10:00', 'img/paneer.png', 'Paneer', 4, 1),
(26, '2026-01-20 13:00:00', '2026-01-20 13:30:00', 'img/butter.png', 'Butter', 4, 1),

-- ✅ Grains Subcategories
(27, '2026-01-21 09:40:00', '2026-01-21 10:05:00', 'img/rice.png', 'Rice', 5, 1),
(28, '2026-01-22 11:00:00', '2026-01-22 11:25:00', 'img/wheat.png', 'Wheat', 5, 1),
(29, '2026-01-23 12:15:00', '2026-01-23 12:40:00', 'img/maize.png', 'Maize', 5, 1),

-- ✅ Spices Subcategories
(30, '2026-01-24 14:10:00', '2026-01-24 14:40:00', 'img/chilli.png', 'Chilli Powder', 6, 1),
(31, '2026-01-25 09:20:00', '2026-01-25 09:50:00', 'img/turmeric.png', 'Turmeric', 6, 1),
(32, '2026-01-26 10:30:00', '2026-01-26 11:00:00', 'img/cumin.png', 'Cumin Seeds', 6, 1);


INSERT INTO products
(id, created_at, updated_at, description, img_url, name, price, stock_quantity, category_id, user_id)
VALUES
-- ✅ Vegetables
(1, '2025-12-26 09:30:00', '2025-12-26 10:00:00', 'Fresh red tomatoes from farm', 'img/tomato.jpg', 'Tomatoes 1kg', 40, 200, 9, 2),

(2, '2025-12-27 10:15:00', '2025-12-27 10:40:00', 'Organic potatoes high quality', 'img/potato.jpg', 'Potatoes 1kg', 35, 180, 10, 4),

(3, '2025-12-28 11:10:00', '2025-12-28 11:30:00', 'Farm fresh onions', 'img/onion.jpg', 'Onions 1kg', 30, 250, 11, 6),

(4, '2025-12-29 12:00:00', '2025-12-29 12:25:00', 'Green cabbage fresh harvest', 'img/cabbage.jpg', 'Cabbage 1pc', 45, 120, 12, 8),

(5, '2025-12-30 13:15:00', '2025-12-30 13:40:00', 'Sweet carrots for salad', 'img/carrot.jpg', 'Carrots 1kg', 50, 100, 13, 10),

-- ✅ Fruits
(6, '2026-01-01 09:45:00', '2026-01-01 10:10:00', 'Fresh Kashmir apples', 'img/apple.jpg', 'Apples 1kg', 120, 90, 14, 2),

(7, '2026-01-02 10:30:00', '2026-01-02 10:50:00', 'Naturally ripened bananas', 'img/banana.jpg', 'Bananas 1 dozen', 60, 150, 15, 4),

(8, '2026-01-03 11:20:00', '2026-01-03 11:45:00', 'Alphonso mangoes premium', 'img/mango.jpg', 'Mangoes 1kg', 200, 75, 16, 6),

(9, '2026-01-04 12:10:00', '2026-01-04 12:40:00', 'Sweet grapes from Nashik', 'img/grapes.jpg', 'Grapes 1kg', 90, 110, 17, 8),

(10, '2026-01-05 13:30:00', '2026-01-05 14:00:00', 'Juicy oranges rich in vitamin C', 'img/orange.jpg', 'Oranges 1kg', 80, 100, 18, 10),

-- ✅ Beans & Pulses
(11, '2026-01-06 09:15:00', '2026-01-06 09:40:00', 'High protein chickpeas', 'img/chickpeas.jpg', 'Chickpeas 1kg', 95, 140, 19, 2),

(12, '2026-01-07 10:05:00', '2026-01-07 10:30:00', 'Premium lentils dal', 'img/lentils.jpg', 'Lentils 1kg', 110, 160, 20, 4),

(13, '2026-01-08 11:10:00', '2026-01-08 11:35:00', 'Fresh green peas', 'img/peas.jpg', 'Green Peas 1kg', 70, 90, 21, 6),

(14, '2026-01-09 12:20:00', '2026-01-09 12:50:00', 'Healthy black beans', 'img/blackbeans.jpg', 'Black Beans 1kg', 130, 80, 22, 8),

-- ✅ Dairy Products
(15, '2026-01-10 09:00:00', '2026-01-10 09:25:00', 'Pure cow milk fresh', 'img/milk.jpg', 'Milk 1L', 55, 300, 23, 10),

(16, '2026-01-11 10:15:00', '2026-01-11 10:40:00', 'Homemade curd', 'img/curd.jpg', 'Curd 500g', 40, 200, 24, 2),

(17, '2026-01-12 11:30:00', '2026-01-12 11:55:00', 'Soft paneer fresh', 'img/paneer.jpg', 'Paneer 500g', 150, 90, 25, 4),

(18, '2026-01-13 12:40:00', '2026-01-13 13:10:00', 'Organic butter', 'img/butter.jpg', 'Butter 200g', 120, 70, 26, 6),

-- ✅ Grains & Cereals
(19, '2026-01-14 09:20:00', '2026-01-14 09:50:00', 'Basmati rice premium', 'img/rice.jpg', 'Rice 5kg', 350, 50, 27, 8),

(20, '2026-01-15 10:35:00', '2026-01-15 11:00:00', 'Whole wheat grains', 'img/wheat.jpg', 'Wheat 5kg', 280, 60, 28, 10),

(21, '2026-01-16 12:00:00', '2026-01-16 12:25:00', 'Maize for flour', 'img/maize.jpg', 'Maize 5kg', 220, 55, 29, 2),

-- ✅ Spices
(22, '2026-01-17 09:50:00', '2026-01-17 10:20:00', 'Pure chilli powder spicy', 'img/chilli.jpg', 'Chilli Powder 200g', 90, 120, 30, 4),

(23, '2026-01-18 11:05:00', '2026-01-18 11:35:00', 'Turmeric powder organic', 'img/turmeric.jpg', 'Turmeric 200g', 80, 90, 6, 6),

(24, '2026-01-19 12:20:00', '2026-01-19 12:50:00', 'Coriander powder fresh', 'img/coriander.jpg', 'Coriander 200g', 75, 85, 6, 8),

-- ✅ Organic Products
(25, '2026-01-20 09:15:00', '2026-01-20 09:40:00', 'Organic jaggery', 'img/jaggery.jpg', 'Jaggery 1kg', 100, 70, 8, 10),

(26, '2026-01-21 10:25:00', '2026-01-21 10:55:00', 'Natural honey', 'img/honey.jpg', 'Honey 500g', 250, 60, 8, 2),

(27, '2026-01-22 11:40:00', '2026-01-22 12:10:00', 'Organic groundnut oil', 'img/oil.jpg', 'Groundnut Oil 1L', 220, 45, 7, 4),

-- ✅ Extra Products
(28, '2026-01-23 13:00:00', '2026-01-23 13:30:00', 'Fresh spinach leaves', 'img/spinach.jpg', 'Spinach 1 bunch', 25, 200, 1, 6),

(29, '2026-01-24 09:10:00', '2026-01-24 09:40:00', 'Sweet papaya', 'img/papaya.jpg', 'Papaya 1kg', 60, 90, 2, 8),

(30, '2026-01-25 11:20:00', '2026-01-25 11:50:00', 'Farm fresh cow ghee', 'img/ghee.jpg', 'Ghee 500ml', 300, 40, 4, 10);


INSERT INTO orders
(id, created_at, updated_at, city, country, district, postal_code, state, street,
 payment_status, status, total_amount, user_id)
VALUES
(1, '2025-12-26 10:15:00', '2025-12-26 10:45:00',
 'Mumbai', 'India', 'Andheri', '400053', 'Maharashtra', 'Link Road',
 'PAID', 'CONFIRMED', 350, 3),

(2, '2025-12-27 11:30:00', '2025-12-27 12:10:00',
 'Pune', 'India', 'Hinjewadi', '411057', 'Maharashtra', 'Phase 1 Street',
 'PAID', 'SHIPPED', 500, 5),

(3, '2025-12-28 09:20:00', '2025-12-28 09:50:00',
 'Nashik', 'India', 'CIDCO', '422009', 'Maharashtra', 'Main Road',
 'PENDING', 'PENDING', 220, 7),

(4, '2025-12-29 14:10:00', '2025-12-29 15:00:00',
 'Nagpur', 'India', 'Dharampeth', '440010', 'Maharashtra', 'Central Avenue',
 'PAID', 'DELIVERED', 410, 9),

(5, '2025-12-30 12:00:00', '2025-12-30 12:40:00',
 'Aurangabad', 'India', 'CIDCO', '431003', 'Maharashtra', 'Station Road',
 'FAILED', 'CANCELLED', 190, 11),

(6, '2026-01-01 10:30:00', '2026-01-01 11:05:00',
 'Kolhapur', 'India', 'Shivaji Nagar', '416003', 'Maharashtra', 'Market Street',
 'PAID', 'CONFIRMED', 720, 13),

(7, '2026-01-02 09:15:00', '2026-01-02 10:00:00',
 'Satara', 'India', 'Powai Naka', '415001', 'Maharashtra', 'Ring Road',
 'PAID', 'SHIPPED', 850, 15),

(8, '2026-01-03 13:10:00', '2026-01-03 13:40:00',
 'Thane', 'India', 'Ghodbunder', '400615', 'Maharashtra', 'Express Highway',
 'PENDING', 'PENDING', 300, 17),

(9, '2026-01-04 11:45:00', '2026-01-04 12:30:00',
 'Amravati', 'India', 'Rajapeth', '444601', 'Maharashtra', 'College Road',
 'PAID', 'DELIVERED', 950, 19),

(10, '2026-01-05 15:20:00', '2026-01-05 16:00:00',
 'Jalgaon', 'India', 'MIDC', '425001', 'Maharashtra', 'Industrial Area',
 'PAID', 'CONFIRMED', 420, 21),

(11, '2026-01-06 09:00:00', '2026-01-06 09:40:00',
 'Sangli', 'India', 'Vishrambag', '416415', 'Maharashtra', 'MG Road',
 'PAID', 'SHIPPED', 610, 23),

(12, '2026-01-07 10:25:00', '2026-01-07 11:10:00',
 'Latur', 'India', 'Udgir', '413517', 'Maharashtra', 'Main Chowk',
 'PAID', 'DELIVERED', 1200, 25),

(13, '2026-01-08 12:30:00', '2026-01-08 13:05:00',
 'Beed', 'India', 'Shivaji Nagar', '431122', 'Maharashtra', 'Bus Stand Road',
 'FAILED', 'CANCELLED', 260, 27),

(14, '2026-01-09 14:10:00', '2026-01-09 14:45:00',
 'Nanded', 'India', 'Old City', '431601', 'Maharashtra', 'Fort Area',
 'PAID', 'CONFIRMED', 890, 29),

(15, '2026-01-10 11:10:00', '2026-01-10 12:00:00',
 'Parbhani', 'India', 'Basmat Road', '431401', 'Maharashtra', 'Market Yard',
 'PENDING', 'PENDING', 450, 3),

(16, '2026-01-11 09:45:00', '2026-01-11 10:25:00',
 'Akola', 'India', 'Tilak Nagar', '444001', 'Maharashtra', 'Civil Lines',
 'PAID', 'SHIPPED', 670, 5),

(17, '2026-01-12 13:00:00', '2026-01-12 13:40:00',
 'Wardha', 'India', 'Gandhi Nagar', '442001', 'Maharashtra', 'Main Street',
 'PAID', 'DELIVERED', 980, 7),

(18, '2026-01-13 11:20:00', '2026-01-13 12:05:00',
 'Bhandara', 'India', 'Tumsar', '441904', 'Maharashtra', 'Highway Road',
 'PAID', 'CONFIRMED', 350, 9),

(19, '2026-01-14 14:30:00', '2026-01-14 15:10:00',
 'Gondia', 'India', 'Civil Area', '441601', 'Maharashtra', 'Lake Road',
 'PAID', 'SHIPPED', 760, 11),

(20, '2026-01-15 10:10:00', '2026-01-15 10:50:00',
 'Chandrapur', 'India', 'Ballarpur', '442701', 'Maharashtra', 'Coal City Road',
 'PAID', 'DELIVERED', 1150, 13),

(21, '2026-01-16 12:00:00', '2026-01-16 12:40:00',
 'Ratnagiri', 'India', 'Ganpatipule', '415639', 'Maharashtra', 'Beach Road',
 'FAILED', 'CANCELLED', 200, 15),

(22, '2026-01-17 09:30:00', '2026-01-17 10:15:00',
 'Sindhudurg', 'India', 'Malvan', '416606', 'Maharashtra', 'Coastal Street',
 'PAID', 'CONFIRMED', 540, 17),

(23, '2026-01-18 11:00:00', '2026-01-18 11:45:00',
 'Ahmednagar', 'India', 'Savedi', '414003', 'Maharashtra', 'Pipeline Road',
 'PAID', 'SHIPPED', 870, 19),

(24, '2026-01-19 13:10:00', '2026-01-19 13:50:00',
 'Dhule', 'India', 'Deopur', '424002', 'Maharashtra', 'Temple Lane',
 'PAID', 'DELIVERED', 1400, 21),

(25, '2026-01-20 09:20:00', '2026-01-20 10:00:00',
 'Osmanabad', 'India', 'Tuljapur', '413601', 'Maharashtra', 'Main Mandir Road',
 'PENDING', 'PENDING', 320, 23),

(26, '2026-01-21 11:15:00', '2026-01-21 11:55:00',
 'Palghar', 'India', 'Virar', '401303', 'Maharashtra', 'Station Street',
 'PAID', 'CONFIRMED', 600, 25),

(27, '2026-01-22 14:00:00', '2026-01-22 14:40:00',
 'Raigad', 'India', 'Alibaug', '402201', 'Maharashtra', 'Beach Highway',
 'PAID', 'SHIPPED', 920, 27),

(28, '2026-01-23 09:10:00', '2026-01-23 09:50:00',
 'Jalna', 'India', 'Old Market', '431203', 'Maharashtra', 'Ring Lane',
 'PAID', 'DELIVERED', 1250, 29),

(29, '2026-01-24 12:30:00', '2026-01-24 13:10:00',
 'Washim', 'India', 'City Center', '444505', 'Maharashtra', 'Main Square Road',
 'FAILED', 'CANCELLED', 180, 3),

(30, '2026-01-25 15:00:00', '2026-01-25 15:45:00',
 'Mumbai', 'India', 'Andheri', '400053', 'Maharashtra', 'Link Road',
 'PAID', 'CONFIRMED', 760, 5);


INSERT INTO order_items
(id, city, country, district, postal_code, state, street,
 price, product_id, quantity, order_id)
VALUES
-- ✅ Order 1 Items
(1, 'Mumbai', 'India', 'Andheri', '400053', 'Maharashtra', 'Link Road',
 40, 1, 2, 1),

(2, 'Mumbai', 'India', 'Andheri', '400053', 'Maharashtra', 'Link Road',
 120, 6, 1, 1),

-- ✅ Order 2 Items
(3, 'Pune', 'India', 'Hinjewadi', '411057', 'Maharashtra', 'Phase 1 Street',
 35, 2, 3, 2),

(4, 'Pune', 'India', 'Hinjewadi', '411057', 'Maharashtra', 'Phase 1 Street',
 200, 8, 1, 2),

-- ✅ Order 3 Items
(5, 'Nashik', 'India', 'CIDCO', '422009', 'Maharashtra', 'Main Road',
 30, 3, 2, 3),

-- ✅ Order 4 Items
(6, 'Nagpur', 'India', 'Dharampeth', '440010', 'Maharashtra', 'Central Avenue',
 90, 9, 2, 4),

(7, 'Nagpur', 'India', 'Dharampeth', '440010', 'Maharashtra', 'Central Avenue',
 150, 17, 1, 4),

-- ✅ Order 5 Items
(8, 'Aurangabad', 'India', 'CIDCO', '431003', 'Maharashtra', 'Station Road',
 45, 4, 1, 5),

-- ✅ Order 6 Items
(9, 'Kolhapur', 'India', 'Shivaji Nagar', '416003', 'Maharashtra', 'Market Street',
 95, 11, 2, 6),

(10, 'Kolhapur', 'India', 'Shivaji Nagar', '416003', 'Maharashtra', 'Market Street',
 110, 12, 1, 6),

-- ✅ Order 7 Items
(11, 'Satara', 'India', 'Powai Naka', '415001', 'Maharashtra', 'Ring Road',
 70, 13, 3, 7),

-- ✅ Order 8 Items
(12, 'Thane', 'India', 'Ghodbunder', '400615', 'Maharashtra', 'Express Highway',
 55, 15, 2, 8),

(13, 'Thane', 'India', 'Ghodbunder', '400615', 'Maharashtra', 'Express Highway',
 40, 16, 1, 8),

-- ✅ Order 9 Items
(14, 'Amravati', 'India', 'Rajapeth', '444601', 'Maharashtra', 'College Road',
 350, 19, 1, 9),

(15, 'Amravati', 'India', 'Rajapeth', '444601', 'Maharashtra', 'College Road',
 80, 10, 2, 9),

-- ✅ Order 10 Items
(16, 'Jalgaon', 'India', 'MIDC', '425001', 'Maharashtra', 'Industrial Area',
 90, 22, 1, 10),

-- ✅ Order 11 Items
(17, 'Sangli', 'India', 'Vishrambag', '416415', 'Maharashtra', 'MG Road',
 250, 26, 1, 11),

(18, 'Sangli', 'India', 'Vishrambag', '416415', 'Maharashtra', 'MG Road',
 60, 7, 2, 11),

-- ✅ Order 12 Items
(19, 'Latur', 'India', 'Udgir', '413517', 'Maharashtra', 'Main Chowk',
 280, 20, 1, 12),

(20, 'Latur', 'India', 'Udgir', '413517', 'Maharashtra', 'Main Chowk',
 150, 17, 2, 12),

-- ✅ Order 13 Items
(21, 'Beed', 'India', 'Shivaji Nagar', '431122', 'Maharashtra', 'Bus Stand Road',
 120, 18, 1, 13),

-- ✅ Order 14 Items
(22, 'Nanded', 'India', 'Old City', '431601', 'Maharashtra', 'Fort Area',
 75, 24, 2, 14),

(23, 'Nanded', 'India', 'Old City', '431601', 'Maharashtra', 'Fort Area',
 100, 25, 1, 14),

-- ✅ Order 15 Items
(24, 'Parbhani', 'India', 'Basmat Road', '431401', 'Maharashtra', 'Market Yard',
 35, 2, 5, 15),

-- ✅ Order 16 Items
(25, 'Akola', 'India', 'Tilak Nagar', '444001', 'Maharashtra', 'Civil Lines',
 200, 8, 2, 16),

(26, 'Akola', 'India', 'Tilak Nagar', '444001', 'Maharashtra', 'Civil Lines',
 55, 15, 1, 16),

-- ✅ Order 17 Items
(27, 'Wardha', 'India', 'Gandhi Nagar', '442001', 'Maharashtra', 'Main Street',
 120, 6, 2, 17),

-- ✅ Order 18 Items
(28, 'Bhandara', 'India', 'Tumsar', '441904', 'Maharashtra', 'Highway Road',
 110, 12, 2, 18),

-- ✅ Order 19 Items
(29, 'Gondia', 'India', 'Civil Area', '441601', 'Maharashtra', 'Lake Road',
 130, 14, 1, 19),

(30, 'Gondia', 'India', 'Civil Area', '441601', 'Maharashtra', 'Lake Road',
 60, 29, 2, 19),

-- ✅ Order 20 Items
(31, 'Chandrapur', 'India', 'Ballarpur', '442701', 'Maharashtra', 'Coal City Road',
 300, 30, 1, 20),

-- ✅ Order 21 Items
(32, 'Ratnagiri', 'India', 'Ganpatipule', '415639', 'Maharashtra', 'Beach Road',
 45, 4, 2, 21),

-- ✅ Order 22 Items
(33, 'Sindhudurg', 'India', 'Malvan', '416606', 'Maharashtra', 'Coastal Street',
 220, 27, 1, 22),

(34, 'Sindhudurg', 'India', 'Malvan', '416606', 'Maharashtra', 'Coastal Street',
 80, 10, 1, 22),

-- ✅ Order 23 Items
(35, 'Ahmednagar', 'India', 'Savedi', '414003', 'Maharashtra', 'Pipeline Road',
 95, 11, 3, 23),

-- ✅ Order 24 Items
(36, 'Dhule', 'India', 'Deopur', '424002', 'Maharashtra', 'Temple Lane',
 150, 17, 1, 24),

-- ✅ Order 25 Items
(37, 'Osmanabad', 'India', 'Tuljapur', '413601', 'Maharashtra', 'Main Mandir Road',
 70, 13, 2, 25),

-- ✅ Order 26 Items
(38, 'Palghar', 'India', 'Virar', '401303', 'Maharashtra', 'Station Street',
 90, 22, 2, 26),

-- ✅ Order 27 Items
(39, 'Raigad', 'India', 'Alibaug', '402201', 'Maharashtra', 'Beach Highway',
 200, 8, 1, 27),

-- ✅ Order 28 Items
(40, 'Jalna', 'India', 'Old Market', '431203', 'Maharashtra', 'Ring Lane',
 250, 26, 1, 28);


INSERT INTO payments
(id, created_at, updated_at, amount, payment_method, status, transaction_id, order_id)
VALUES
(1,  '2025-12-26 10:20:00', '2025-12-26 10:45:00', 350,  'STRIPE', 'PAID',   'txn_STRIPE_10001', 1),

(2,  '2025-12-27 11:40:00', '2025-12-27 12:10:00', 500,  'STRIPE', 'PAID',   'txn_STRIPE_10002', 2),

(3,  '2025-12-28 09:30:00', '2025-12-28 09:50:00', 220,  'STRIPE', 'PENDING','txn_STRIPE_10003', 3),

(4,  '2025-12-29 14:20:00', '2025-12-29 15:00:00', 410,  'STRIPE', 'PAID',   'txn_STRIPE_10004', 4),

(5,  '2025-12-30 12:10:00', '2025-12-30 12:40:00', 190,  'STRIPE', 'FAILED', 'txn_STRIPE_10005', 5),

(6,  '2026-01-01 10:40:00', '2026-01-01 11:05:00', 720,  'STRIPE', 'PAID',   'txn_STRIPE_10006', 6),

(7,  '2026-01-02 09:30:00', '2026-01-02 10:00:00', 850,  'STRIPE', 'PAID',   'txn_STRIPE_10007', 7),

(8,  '2026-01-03 13:20:00', '2026-01-03 13:40:00', 300,  'STRIPE', 'PENDING','txn_STRIPE_10008', 8),

(9,  '2026-01-04 11:55:00', '2026-01-04 12:30:00', 950,  'STRIPE', 'PAID',   'txn_STRIPE_10009', 9),

(10, '2026-01-05 15:30:00', '2026-01-05 16:00:00', 420,  'STRIPE', 'PAID',   'txn_STRIPE_10010', 10),

(11, '2026-01-06 09:10:00', '2026-01-06 09:40:00', 610,  'STRIPE', 'PAID',   'txn_STRIPE_10011', 11),

(12, '2026-01-07 10:40:00', '2026-01-07 11:10:00', 1200, 'STRIPE', 'PAID',   'txn_STRIPE_10012', 12),

(13, '2026-01-08 12:40:00', '2026-01-08 13:05:00', 260,  'STRIPE', 'FAILED', 'txn_STRIPE_10013', 13),

(14, '2026-01-09 14:20:00', '2026-01-09 14:45:00', 890,  'STRIPE', 'PAID',   'txn_STRIPE_10014', 14),

(15, '2026-01-10 11:25:00', '2026-01-10 12:00:00', 450,  'STRIPE', 'PENDING','txn_STRIPE_10015', 15),

(16, '2026-01-11 09:55:00', '2026-01-11 10:25:00', 670,  'STRIPE', 'PAID',   'txn_STRIPE_10016', 16),

(17, '2026-01-12 13:10:00', '2026-01-12 13:40:00', 980,  'STRIPE', 'PAID',   'txn_STRIPE_10017', 17),

(18, '2026-01-13 11:35:00', '2026-01-13 12:05:00', 350,  'STRIPE', 'PAID',   'txn_STRIPE_10018', 18),

(19, '2026-01-14 14:40:00', '2026-01-14 15:10:00', 760,  'STRIPE', 'PAID',   'txn_STRIPE_10019', 19),

(20, '2026-01-15 10:20:00', '2026-01-15 10:50:00', 1150, 'STRIPE', 'PAID',   'txn_STRIPE_10020', 20),

(21, '2026-01-16 12:10:00', '2026-01-16 12:40:00', 200,  'STRIPE', 'FAILED', 'txn_STRIPE_10021', 21),

(22, '2026-01-17 09:40:00', '2026-01-17 10:15:00', 540,  'STRIPE', 'PAID',   'txn_STRIPE_10022', 22),

(23, '2026-01-18 11:15:00', '2026-01-18 11:45:00', 870,  'STRIPE', 'PAID',   'txn_STRIPE_10023', 23),

(24, '2026-01-19 13:20:00', '2026-01-19 13:50:00', 1400, 'STRIPE', 'PAID',   'txn_STRIPE_10024', 24),

(25, '2026-01-20 09:30:00', '2026-01-20 10:00:00', 320,  'STRIPE', 'PENDING','txn_STRIPE_10025', 25),

(26, '2026-01-21 11:25:00', '2026-01-21 11:55:00', 600,  'STRIPE', 'PAID',   'txn_STRIPE_10026', 26),

(27, '2026-01-22 14:10:00', '2026-01-22 14:40:00', 920,  'STRIPE', 'PAID',   'txn_STRIPE_10027', 27),

(28, '2026-01-23 09:20:00', '2026-01-23 09:50:00', 1250, 'STRIPE', 'PAID',   'txn_STRIPE_10028', 28),

(29, '2026-01-24 12:40:00', '2026-01-24 13:10:00', 180,  'STRIPE', 'FAILED', 'txn_STRIPE_10029', 29),

(30, '2026-01-25 15:10:00', '2026-01-25 15:45:00', 760,  'STRIPE', 'PAID',   'txn_STRIPE_10030', 30);



INSERT INTO order_status_history
(id, created_at, updated_at, status, order_id)
VALUES
-- ✅ Order 1
(1,  '2025-12-26 10:15:00', '2025-12-26 10:20:00', 'PENDING',   1),
(2,  '2025-12-26 10:40:00', '2025-12-26 10:45:00', 'CONFIRMED', 1),

-- ✅ Order 2
(3,  '2025-12-27 11:30:00', '2025-12-27 11:35:00', 'PENDING',   2),
(4,  '2025-12-27 12:05:00', '2025-12-27 12:10:00', 'SHIPPED',   2),

-- ✅ Order 3
(5,  '2025-12-28 09:20:00', '2025-12-28 09:25:00', 'PENDING',   3),
(6,  '2025-12-28 09:45:00', '2025-12-28 09:50:00', 'CONFIRMED', 3),

-- ✅ Order 4
(7,  '2025-12-29 14:10:00', '2025-12-29 14:15:00', 'PENDING',    4),
(8,  '2025-12-29 14:55:00', '2025-12-29 15:00:00', 'DELIVERED',  4),

-- ✅ Order 5
(9,  '2025-12-30 12:00:00', '2025-12-30 12:05:00', 'PENDING',    5),
(10, '2025-12-30 12:35:00', '2025-12-30 12:40:00', 'CANCELLED',  5),

-- ✅ Order 6
(11, '2026-01-01 10:30:00', '2026-01-01 10:35:00', 'PENDING',    6),
(12, '2026-01-01 11:00:00', '2026-01-01 11:05:00', 'CONFIRMED',  6),

-- ✅ Order 7
(13, '2026-01-02 09:15:00', '2026-01-02 09:20:00', 'PENDING',    7),
(14, '2026-01-02 09:55:00', '2026-01-02 10:00:00', 'SHIPPED',    7),

-- ✅ Order 8
(15, '2026-01-03 13:10:00', '2026-01-03 13:15:00', 'PENDING',    8),
(16, '2026-01-03 13:35:00', '2026-01-03 13:40:00', 'CONFIRMED',  8),

-- ✅ Order 9
(17, '2026-01-04 11:45:00', '2026-01-04 11:50:00', 'PENDING',    9),
(18, '2026-01-04 12:25:00', '2026-01-04 12:30:00', 'DELIVERED',  9),

-- ✅ Order 10
(19, '2026-01-05 15:20:00', '2026-01-05 15:25:00', 'PENDING',    10),
(20, '2026-01-05 15:55:00', '2026-01-05 16:00:00', 'CONFIRMED',  10),

-- ✅ Order 11
(21, '2026-01-06 09:00:00', '2026-01-06 09:05:00', 'PENDING',    11),
(22, '2026-01-06 09:35:00', '2026-01-06 09:40:00', 'SHIPPED',    11),

-- ✅ Order 12
(23, '2026-01-07 10:25:00', '2026-01-07 10:30:00', 'PENDING',    12),
(24, '2026-01-07 11:05:00', '2026-01-07 11:10:00', 'DELIVERED',  12),

-- ✅ Order 13
(25, '2026-01-08 12:30:00', '2026-01-08 12:35:00', 'PENDING',    13),
(26, '2026-01-08 13:00:00', '2026-01-08 13:05:00', 'CANCELLED',  13),

-- ✅ Order 14
(27, '2026-01-09 14:10:00', '2026-01-09 14:15:00', 'PENDING',    14),
(28, '2026-01-09 14:40:00', '2026-01-09 14:45:00', 'CONFIRMED',  14),

-- ✅ Order 15
(29, '2026-01-10 11:10:00', '2026-01-10 11:15:00', 'PENDING',    15),
(30, '2026-01-10 11:55:00', '2026-01-10 12:00:00', 'SHIPPED',    15),

-- ✅ Order 16
(31, '2026-01-11 09:45:00', '2026-01-11 09:50:00', 'PENDING',    16),
(32, '2026-01-11 10:20:00', '2026-01-11 10:25:00', 'DELIVERED',  16),

-- ✅ Order 17
(33, '2026-01-12 13:00:00', '2026-01-12 13:05:00', 'PENDING',    17),
(34, '2026-01-12 13:35:00', '2026-01-12 13:40:00', 'CONFIRMED',  17),

-- ✅ Order 18
(35, '2026-01-13 11:20:00', '2026-01-13 11:25:00', 'PENDING',    18),
(36, '2026-01-13 12:00:00', '2026-01-13 12:05:00', 'SHIPPED',    18),

-- ✅ Order 19
(37, '2026-01-14 14:30:00', '2026-01-14 14:35:00', 'PENDING',    19),
(38, '2026-01-14 15:05:00', '2026-01-14 15:10:00', 'DELIVERED',  19),

-- ✅ Order 20
(39, '2026-01-15 10:10:00', '2026-01-15 10:15:00', 'PENDING',    20),
(40, '2026-01-15 10:45:00', '2026-01-15 10:50:00', 'CONFIRMED',  20),

-- ✅ Order 21
(41, '2026-01-16 12:00:00', '2026-01-16 12:05:00', 'PENDING',    21),
(42, '2026-01-16 12:35:00', '2026-01-16 12:40:00', 'CANCELLED',  21),

-- ✅ Order 22
(43, '2026-01-17 09:30:00', '2026-01-17 09:35:00', 'PENDING',    22),
(44, '2026-01-17 10:10:00', '2026-01-17 10:15:00', 'SHIPPED',    22),

-- ✅ Order 23
(45, '2026-01-18 11:00:00', '2026-01-18 11:05:00', 'PENDING',    23),
(46, '2026-01-18 11:40:00', '2026-01-18 11:45:00', 'DELIVERED',  23),

-- ✅ Order 24
(47, '2026-01-19 13:10:00', '2026-01-19 13:15:00', 'PENDING',    24),
(48, '2026-01-19 13:45:00', '2026-01-19 13:50:00', 'CONFIRMED',  24),

-- ✅ Order 25
(49, '2026-01-20 09:20:00', '2026-01-20 09:25:00', 'PENDING',    25),
(50, '2026-01-20 09:55:00', '2026-01-20 10:00:00', 'SHIPPED',    25),

-- ✅ Order 26
(51, '2026-01-21 11:15:00', '2026-01-21 11:20:00', 'PENDING',    26),
(52, '2026-01-21 11:50:00', '2026-01-21 11:55:00', 'DELIVERED',  26),

-- ✅ Order 27
(53, '2026-01-22 14:00:00', '2026-01-22 14:05:00', 'PENDING',    27),
(54, '2026-01-22 14:35:00', '2026-01-22 14:40:00', 'CONFIRMED',  27),

-- ✅ Order 28
(55, '2026-01-23 09:10:00', '2026-01-23 09:15:00', 'PENDING',    28),
(56, '2026-01-23 09:45:00', '2026-01-23 09:50:00', 'SHIPPED',    28),

-- ✅ Order 29
(57, '2026-01-24 12:30:00', '2026-01-24 12:35:00', 'PENDING',    29),
(58, '2026-01-24 13:05:00', '2026-01-24 13:10:00', 'CANCELLED',  29),

-- ✅ Order 30
(59, '2026-01-25 15:00:00', '2026-01-25 15:05:00', 'PENDING',    30),
(60, '2026-01-25 15:40:00', '2026-01-25 15:45:00', 'CONFIRMED',  30);



INSERT INTO reviews
(id, comment, created_at, rating, user_id, product_id)
VALUES
(1,  'Fresh tomatoes, very good quality',        '2025-12-27 10:00:00', 5, 3, 1),
(2,  'Potatoes were clean and fresh',            '2025-12-28 11:15:00', 4, 5, 2),
(3,  'Onions arrived on time, good packaging',   '2025-12-29 12:20:00', 4, 7, 3),
(4,  'Cabbage was a bit small but fresh',        '2025-12-30 13:10:00', 3, 9, 4),
(5,  'Carrots were sweet and crunchy',           '2026-01-01 09:45:00', 5, 11, 5),

(6,  'Apples were premium quality',              '2026-01-02 10:30:00', 5, 13, 6),
(7,  'Bananas were ripe and tasty',              '2026-01-03 11:10:00', 4, 15, 7),
(8,  'Mangoes were delicious and fresh',         '2026-01-04 12:00:00', 5, 17, 8),
(9,  'Grapes were sweet but slightly soft',      '2026-01-05 13:15:00', 4, 19, 9),
(10, 'Oranges were juicy and fresh',             '2026-01-06 14:20:00', 5, 21, 10),

(11, 'Chickpeas are good quality, worth price',  '2026-01-07 09:30:00', 5, 23, 11),
(12, 'Lentils were clean and well packed',       '2026-01-08 10:45:00', 4, 25, 12),
(13, 'Green peas tasted fresh',                  '2026-01-09 12:15:00', 4, 27, 13),
(14, 'Black beans quality was average',          '2026-01-10 13:25:00', 3, 29, 14),

(15, 'Milk was pure and fresh',                  '2026-01-11 09:10:00', 5, 3, 15),
(16, 'Curd was thick and tasty',                 '2026-01-12 10:20:00', 5, 5, 16),
(17, 'Paneer was soft and fresh',                '2026-01-13 11:40:00', 5, 7, 17),
(18, 'Butter quality was good',                  '2026-01-14 12:50:00', 4, 9, 18),

(19, 'Rice grains were long and aromatic',       '2026-01-15 14:00:00', 5, 11, 19),
(20, 'Wheat was fresh and good for flour',       '2026-01-16 15:10:00', 4, 13, 20),
(21, 'Maize was packed well',                    '2026-01-17 09:25:00', 4, 15, 21),

(22, 'Chilli powder is spicy and pure',          '2026-01-18 10:40:00', 5, 17, 22),
(23, 'Turmeric powder has strong color',         '2026-01-19 11:50:00', 4, 19, 23),
(24, 'Coriander powder smells fresh',            '2026-01-20 13:05:00', 4, 21, 24),

(25, 'Jaggery was organic and tasty',            '2026-01-21 09:15:00', 5, 23, 25),
(26, 'Honey was pure and authentic',             '2026-01-22 10:35:00', 5, 25, 26),
(27, 'Groundnut oil is healthy and fresh',       '2026-01-23 11:55:00', 4, 27, 27),

(28, 'Spinach was very fresh and green',         '2026-01-24 09:30:00', 5, 29, 28),
(29, 'Papaya was sweet and ripe',                '2026-01-25 12:00:00', 4, 3, 29),
(30, 'Ghee was pure and aromatic',               '2026-01-26 14:10:00', 5, 5, 30);
