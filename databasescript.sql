CREATE DATABASE `delta`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';


CREATE TABLE `facturas` (
  `idfactura` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `numerofactura` INTEGER(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `tipodepago` ENUM('efectivo','credito') COLLATE utf8_general_ci NOT NULL,
  `documentocliente` VARCHAR(15) COLLATE utf8_general_ci NOT NULL,
  `nombrecliente` VARCHAR(80) COLLATE utf8_general_ci NOT NULL,
  `subtotal` DECIMAL(11,0) DEFAULT NULL,
  `descuento` INTEGER(11) DEFAULT NULL,
  `iva` INTEGER(11) DEFAULT NULL,
  `totaldescuento` DECIMAL(11,0) DEFAULT NULL,
  `totalimpuesto` DECIMAL(11,0) DEFAULT NULL,
  `total` DECIMAL(11,0) DEFAULT NULL,
  PRIMARY KEY (`idfactura`) USING BTREE,
  UNIQUE KEY `idfactura` (`idfactura`) USING BTREE,
  UNIQUE KEY `documentocliente` (`documentocliente`) USING BTREE,
  UNIQUE KEY `numerofactura` (`numerofactura`) USING BTREE
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;


CREATE TABLE `productos` (
  `idproducto` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(80) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idproducto`) USING BTREE,
  UNIQUE KEY `idproducto` (`idproducto`) USING BTREE
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

CREATE TABLE `facturaproducto` (
  `idfacturaproducto` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `idfactura` INTEGER(11) DEFAULT NULL,
  `idproducto` INTEGER(11) DEFAULT NULL,
  PRIMARY KEY (`idfacturaproducto`) USING BTREE,
  UNIQUE KEY `idfacturaproducto` (`idfacturaproducto`) USING BTREE,
  KEY `fkfactura` (`idfactura`) USING BTREE,
  KEY `fkproducto` (`idproducto`) USING BTREE,
  CONSTRAINT `fkfactura` FOREIGN KEY (`idfactura`) REFERENCES `facturas` (`idfactura`),
  CONSTRAINT `fkproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;


/* Data for the 'facturas' table  (Records 1 - 20) */

INSERT INTO facturas (idfactura, numerofactura, fecha, tipodepago, documentocliente, nombrecliente, subtotal, descuento, iva, totaldescuento, totalimpuesto, total) VALUES

  (1, 1, '2020-01-12', 'efectivo', '59-4095950', 'Montague Bamell', 774, 27, 19, 11779, 19835, 10561),
  (2, 3, '2021-06-08', 'efectivo', '26-7008831', 'Lynnelle Giacomozzo', 564, 15, 19, 17298, 21778, 340346),
  (3, 4, '2021-10-07', 'credito', '33-9755843', 'Janine McBlain', 550, 23, 19, 20892, 19323, 324083),
  (4, 5, '2021-07-03', 'credito', '03-2125068', 'Nicoli Templeton', 658, 20, 19, 24313, 14511, 498849),
  (5, 7, '2021-12-04', 'credito', '30-8913995', 'Niki Gashion', 648, 12, 19, 20846, 1302, 199352),
  (6, 8, '2021-06-04', 'credito', '39-4194099', 'Garrek Beardshall', 758, 21, 19, 18035, 3450, 217005),
  (7, 11, '2021-05-11', 'efectivo', '65-5777267', 'Elden Steanyng', 798, 12, 19, 23346, 4179, 15121),
  (8, 13, '2021-05-03', 'efectivo', '16-1179458', 'Paulie Kenrick', 767, 15, 19, 17048, 8857, 379845),
  (9, 16, '2020-06-12', 'credito', '96-2903538', 'Saree Ingon', 992, 19, 19, 12133, 11892, 88787),
  (10, 17, '2021-03-04', 'credito', '72-0424354', 'Leah Yeoland', 720, 19, 19, 16945, 24294, 57621),
  (11, 18, '2021-01-03', 'efectivo', '88-2334544', 'Dal Gladwish', 836, 13, 19, 14385, 2973, 391899),
  (12, 20, '2021-11-08', 'efectivo', '39-5565441', 'Perl Gahagan', 966, 12, 19, 15091, 20377, 80626),
  (13, 23, '2020-08-11', 'credito', '35-9098418', 'Zaneta Pusey', 625, 18, 19, 22658, 3248, 352845),
  (14, 24, '2021-06-05', 'efectivo', '99-3342836', 'Antoni Dowe', 696, 18, 19, 22556, 12358, 13889),
  (15, 29, '2021-05-01', 'credito', '33-6793053', 'Mose Krale', 515, 19, 19, 22470, 8820, 329499),
  (16, 35, '2021-07-01', 'credito', '81-3711656', 'Rogers Conan', 919, 23, 19, 8349, 23695, 219456),
  (17, 37, '2021-03-03', 'efectivo', '13-6002116', 'Alysa Laviss', 815, 28, 19, 6908, 23259, 429574),
  (18, 42, '2021-05-02', 'credito', '60-4340940', 'Ray Banaszczyk', 548, 24, 19, 7631, 13899, 298863),
  (19, 44, '2021-07-04', 'credito', '24-4011144', 'Damon Hagstone', 907, 30, 19, 14315, 12941, 326560),
  (20, 45, '2021-03-01', 'efectivo', '72-2247326', 'Osborn Ferronet', 648, 13, 19, 24364, 21419, 171357);



/* Data for the 'productos' table  (Records 1 - 50) */

INSERT INTO productos (idproducto, producto) VALUES

  (1, 'Sage Ground Wiberg'),
  (2, 'Veal - Inside'),
  (3, 'Broom And Broom Rack White'),
  (4, 'Cookies - Englishbay Wht'),
  (5, 'Breakfast Quesadillas'),
  (6, 'Bread - Roll, Calabrese'),
  (7, 'V8 - Tropical Blend'),
  (8, 'Mayonnaise - Individual Pkg'),
  (9, 'Sponge Cake Mix - Chocolate'),
  (10, 'Bar Special K'),
  (11, 'Hand Towel'),
  (12, 'Spinach - Packaged'),
  (13, 'Mushroom - King Eryingii'),
  (14, 'Cake Circle, Foil, Scallop'),
  (15, 'Ketchup - Tomato'),
  (16, 'Pears - Fiorelle'),
  (17, 'Creme De Menth - White'),
  (18, 'Lemon Pepper'),
  (19, 'Bagel - Everything'),
  (20, 'Asparagus - Frozen'),
  (21, 'Mousse - Passion Fruit'),
  (22, 'Crab - Meat Combo'),
  (23, 'Wine - Soave Folonari'),
  (24, 'Cheese - Brie, Cups 125g'),
  (25, 'Chevere Logs'),
  (26, 'Flour - Cake'),
  (27, 'Beef - Montreal Smoked Brisket'),
  (28, 'Mushroom - Morels, Dry'),
  (29, 'Beans - Kidney, Red Dry'),
  (30, 'Beer - Sleemans Cream Ale'),
  (31, 'Carrots - Purple, Organic'),
  (32, 'Bagelers - Cinn / Brown'),
  (33, 'Pineapple - Regular'),
  (34, 'Steampan Lid'),
  (35, 'Sauce - Salsa'),
  (36, 'Pickles - Gherkins'),
  (37, 'Beef - Ox Tongue'),
  (38, 'Potatoes - Instant, Mashed'),
  (39, 'Pork - Back, Long Cut, Boneless'),
  (40, 'Flour - Bran, Red'),
  (41, 'Wine - Carmenere Casillero Del'),
  (42, 'Oven Mitts 17 Inch'),
  (43, 'Green Scrubbie Pad H.duty'),
  (44, 'Wasabi Powder'),
  (45, 'Bread - Ciabatta Buns'),
  (46, 'Mangoes'),
  (47, 'Soup - Campbells, Lentil'),
  (48, 'Roe - Flying Fish'),
  (49, 'Beets - Pickled'),
  (50, 'Honey - Lavender');


/* Data for the 'facturaproducto' table  (Records 1 - 500) */

INSERT INTO `facturaproducto` (`idfacturaproducto`, `idfactura`, `idproducto`) VALUES

  (1, 9, 4),
  (2, 7, 26),
  (3, 4, 20),
  (4, 13, 44),
  (5, 6, 35),
  (6, 1, 24),
  (7, 18, 35),
  (8, 6, 38),
  (9, 14, 23),
  (10, 4, 24),
  (11, 9, 48),
  (12, 11, 49),
  (13, 11, 49),
  (14, 7, 8),
  (15, 11, 25),
  (16, 12, 41),
  (17, 12, 34),
  (18, 9, 20),
  (19, 11, 18),
  (20, 14, 4),
  (21, 1, 9),
  (22, 3, 22),
  (23, 2, 30),
  (24, 12, 49),
  (25, 15, 6),
  (26, 5, 32),
  (27, 5, 29),
  (28, 10, 32),
  (29, 8, 28),
  (30, 15, 45),
  (31, 3, 27),
  (32, 13, 48),
  (33, 3, 35),
  (34, 10, 46),
  (35, 10, 34),
  (36, 18, 28),
  (37, 10, 10),
  (38, 11, 23),
  (39, 15, 20),
  (40, 4, 4),
  (41, 16, 26),
  (42, 14, 20),
  (43, 6, 12),
  (44, 12, 31),
  (45, 5, 22),
  (46, 4, 23),
  (47, 7, 45),
  (48, 2, 4),
  (49, 9, 10),
  (50, 7, 30),
  (51, 20, 47),
  (52, 6, 24),
  (53, 19, 3),
  (54, 13, 7),
  (55, 7, 18),
  (56, 8, 36),
  (57, 4, 50),
  (58, 14, 39),
  (59, 10, 3),
  (60, 15, 47),
  (61, 5, 38),
  (62, 11, 45),
  (63, 10, 10),
  (64, 14, 17),
  (65, 8, 28),
  (66, 6, 47),
  (67, 12, 45),
  (68, 9, 10),
  (69, 5, 12),
  (70, 7, 37),
  (71, 17, 36),
  (72, 14, 43),
  (73, 11, 36),
  (74, 5, 18),
  (75, 12, 27),
  (76, 5, 28),
  (77, 7, 32),
  (78, 16, 8),
  (79, 4, 15),
  (80, 3, 19),
  (81, 17, 6),
  (82, 15, 36),
  (83, 12, 21),
  (84, 14, 46),
  (85, 8, 26),
  (86, 12, 23),
  (87, 7, 14),
  (88, 13, 30),
  (89, 6, 9),
  (90, 7, 39),
  (91, 20, 10),
  (92, 6, 1),
  (93, 19, 33),
  (94, 15, 24),
  (95, 3, 26),
  (96, 12, 29),
  (97, 5, 26),
  (98, 2, 7),
  (99, 12, 26),
  (100, 15, 46),
  (101, 16, 50),
  (102, 1, 49),
  (103, 18, 18),
  (104, 14, 27),
  (105, 9, 5),
  (106, 20, 7),
  (107, 9, 1),
  (108, 10, 24),
  (109, 7, 26),
  (110, 13, 21),
  (111, 2, 47),
  (112, 15, 39),
  (113, 9, 6),
  (114, 18, 31),
  (115, 3, 17),
  (116, 6, 23),
  (117, 16, 24),
  (118, 1, 1),
  (119, 18, 18),
  (120, 10, 12),
  (121, 11, 12),
  (122, 9, 27),
  (123, 14, 41),
  (124, 14, 34),
  (125, 19, 13),
  (126, 14, 18),
  (127, 20, 28),
  (128, 7, 29),
  (129, 2, 4),
  (130, 15, 1),
  (131, 3, 10),
  (132, 15, 4),
  (133, 9, 38),
  (134, 8, 18),
  (135, 10, 1),
  (136, 4, 48),
  (137, 20, 46),
  (138, 2, 27),
  (139, 4, 40),
  (140, 2, 21),
  (141, 12, 46),
  (142, 16, 8),
  (143, 2, 28),
  (144, 19, 45),
  (145, 17, 19),
  (146, 11, 9),
  (147, 7, 8),
  (148, 19, 49),
  (149, 1, 9),
  (150, 7, 40),
  (151, 11, 24),
  (152, 12, 25),
  (153, 1, 25),
  (154, 17, 30),
  (155, 13, 19),
  (156, 15, 17),
  (157, 9, 38),
  (158, 12, 6),
  (159, 20, 39),
  (160, 16, 32),
  (161, 14, 24),
  (162, 1, 49),
  (163, 4, 44),
  (164, 20, 44),
  (165, 5, 37),
  (166, 7, 17),
  (167, 1, 49),
  (168, 13, 22),
  (169, 14, 34),
  (170, 6, 4),
  (171, 8, 48),
  (172, 2, 16),
  (173, 15, 33),
  (174, 4, 1),
  (175, 4, 37),
  (176, 16, 5),
  (177, 14, 28),
  (178, 5, 45),
  (179, 9, 40),
  (180, 7, 9),
  (181, 18, 41),
  (182, 11, 11),
  (183, 16, 47),
  (184, 8, 47),
  (185, 12, 11),
  (186, 5, 42),
  (187, 8, 25),
  (188, 20, 11),
  (189, 20, 14),
  (190, 16, 26),
  (191, 16, 47),
  (192, 7, 40),
  (193, 15, 28),
  (194, 15, 2),
  (195, 1, 10),
  (196, 17, 16),
  (197, 19, 11),
  (198, 14, 21),
  (199, 11, 28),
  (200, 17, 7),
  (201, 18, 20),
  (202, 10, 16),
  (203, 7, 37),
  (204, 17, 20),
  (205, 9, 47),
  (206, 20, 19),
  (207, 14, 25),
  (208, 7, 48),
  (209, 18, 22),
  (210, 10, 42),
  (211, 18, 8),
  (212, 16, 44),
  (213, 10, 19),
  (214, 14, 32),
  (215, 15, 38),
  (216, 13, 16),
  (217, 7, 31),
  (218, 18, 41),
  (219, 8, 41),
  (220, 5, 11),
  (221, 1, 50),
  (222, 10, 15),
  (223, 2, 9),
  (224, 12, 5),
  (225, 13, 6),
  (226, 4, 49),
  (227, 14, 10),
  (228, 15, 49),
  (229, 6, 31),
  (230, 3, 40),
  (231, 20, 23),
  (232, 19, 17),
  (233, 15, 45),
  (234, 17, 42),
  (235, 4, 11),
  (236, 17, 44),
  (237, 11, 42),
  (238, 11, 49),
  (239, 14, 29),
  (240, 10, 8),
  (241, 3, 5),
  (242, 2, 17),
  (243, 13, 34),
  (244, 18, 2),
  (245, 20, 16),
  (246, 3, 8),
  (247, 3, 19),
  (248, 14, 43),
  (249, 10, 27),
  (250, 4, 4),
  (251, 9, 33),
  (252, 9, 26),
  (253, 5, 8),
  (254, 3, 21),
  (255, 15, 11),
  (256, 1, 35),
  (257, 13, 33),
  (258, 16, 8),
  (259, 4, 35),
  (260, 9, 31),
  (261, 12, 28),
  (262, 5, 2),
  (263, 17, 38),
  (264, 17, 13),
  (265, 9, 32),
  (266, 7, 39),
  (267, 16, 16),
  (268, 13, 45),
  (269, 15, 3),
  (270, 17, 14),
  (271, 18, 42),
  (272, 1, 47),
  (273, 6, 40),
  (274, 4, 26),
  (275, 20, 15),
  (276, 15, 44),
  (277, 15, 9),
  (278, 14, 48),
  (279, 20, 48),
  (280, 20, 2),
  (281, 16, 36),
  (282, 8, 13),
  (283, 5, 19),
  (284, 7, 38),
  (285, 7, 3),
  (286, 2, 12),
  (287, 13, 25),
  (288, 17, 34),
  (289, 15, 41),
  (290, 5, 29),
  (291, 5, 17),
  (292, 5, 13),
  (293, 11, 41),
  (294, 3, 4),
  (295, 16, 17),
  (296, 11, 37),
  (297, 7, 50),
  (298, 13, 48),
  (299, 8, 20),
  (300, 6, 15),
  (301, 3, 44),
  (302, 16, 38),
  (303, 14, 11),
  (304, 11, 9),
  (305, 3, 33),
  (306, 16, 23),
  (307, 15, 48),
  (308, 11, 50),
  (309, 6, 38),
  (310, 16, 49),
  (311, 20, 33),
  (312, 5, 42),
  (313, 13, 1),
  (314, 13, 8),
  (315, 16, 29),
  (316, 18, 43),
  (317, 19, 10),
  (318, 5, 41),
  (319, 8, 50),
  (320, 16, 49),
  (321, 6, 32),
  (322, 18, 44),
  (323, 13, 42),
  (324, 3, 6),
  (325, 20, 27),
  (326, 4, 23),
  (327, 19, 15),
  (328, 15, 10),
  (329, 11, 39),
  (330, 11, 9),
  (331, 20, 4),
  (332, 15, 36),
  (333, 12, 41),
  (334, 13, 50),
  (335, 16, 8),
  (336, 11, 14),
  (337, 7, 14),
  (338, 5, 17),
  (339, 19, 11),
  (340, 4, 38),
  (341, 2, 17),
  (342, 3, 36),
  (343, 18, 16),
  (344, 9, 6),
  (345, 4, 8),
  (346, 4, 6),
  (347, 12, 11),
  (348, 17, 37),
  (349, 14, 46),
  (350, 18, 45),
  (351, 14, 5),
  (352, 4, 14),
  (353, 12, 35),
  (354, 14, 49),
  (355, 14, 14),
  (356, 17, 44),
  (357, 19, 8),
  (358, 15, 27),
  (359, 1, 8),
  (360, 18, 21),
  (361, 5, 14),
  (362, 7, 17),
  (363, 5, 20),
  (364, 1, 39),
  (365, 11, 44),
  (366, 4, 31),
  (367, 17, 23),
  (368, 6, 4),
  (369, 4, 50),
  (370, 4, 11),
  (371, 11, 24),
  (372, 6, 9),
  (373, 18, 46),
  (374, 17, 16),
  (375, 5, 8),
  (376, 8, 43),
  (377, 5, 20),
  (378, 11, 5),
  (379, 13, 30),
  (380, 18, 15),
  (381, 18, 45),
  (382, 1, 37),
  (383, 19, 19),
  (384, 5, 25),
  (385, 14, 20),
  (386, 10, 35),
  (387, 13, 41),
  (388, 16, 2),
  (389, 6, 40),
  (390, 1, 36),
  (391, 7, 7),
  (392, 14, 33),
  (393, 14, 35),
  (394, 14, 6),
  (395, 7, 22),
  (396, 6, 2),
  (397, 7, 4),
  (398, 6, 44),
  (399, 16, 29),
  (400, 13, 3),
  (401, 13, 14),
  (402, 13, 3),
  (403, 19, 38),
  (404, 2, 45),
  (405, 5, 38),
  (406, 16, 12),
  (407, 10, 13),
  (408, 7, 40),
  (409, 19, 14),
  (410, 9, 45),
  (411, 9, 39),
  (412, 1, 27),
  (413, 5, 26),
  (414, 13, 48),
  (415, 20, 5),
  (416, 2, 44),
  (417, 19, 38),
  (418, 13, 43),
  (419, 6, 16),
  (420, 3, 32),
  (421, 11, 11),
  (422, 16, 37),
  (423, 2, 39),
  (424, 10, 37),
  (425, 14, 43),
  (426, 14, 25),
  (427, 16, 32),
  (428, 11, 26),
  (429, 15, 44),
  (430, 17, 37),
  (431, 6, 15),
  (432, 11, 18),
  (433, 16, 48),
  (434, 15, 22),
  (435, 2, 37),
  (436, 10, 32),
  (437, 14, 42),
  (438, 3, 5),
  (439, 16, 8),
  (440, 2, 43),
  (441, 13, 36),
  (442, 4, 48),
  (443, 1, 20),
  (444, 10, 42),
  (445, 17, 50),
  (446, 11, 45),
  (447, 1, 8),
  (448, 6, 21),
  (449, 14, 39),
  (450, 15, 30),
  (451, 4, 38),
  (452, 4, 41),
  (453, 12, 38),
  (454, 12, 33),
  (455, 13, 11),
  (456, 10, 29),
  (457, 8, 37),
  (458, 6, 23),
  (459, 4, 14),
  (460, 3, 38),
  (461, 20, 15),
  (462, 20, 37),
  (463, 16, 42),
  (464, 17, 30),
  (465, 6, 50),
  (466, 8, 12),
  (467, 17, 11),
  (468, 6, 11),
  (469, 12, 50),
  (470, 16, 2),
  (471, 1, 2),
  (472, 17, 8),
  (473, 14, 14),
  (474, 20, 43),
  (475, 15, 29),
  (476, 4, 11),
  (477, 17, 41),
  (478, 20, 29),
  (479, 14, 7),
  (480, 17, 31),
  (481, 1, 31),
  (482, 7, 15),
  (483, 13, 22),
  (484, 15, 47),
  (485, 2, 7),
  (486, 13, 5),
  (487, 5, 18),
  (488, 4, 12),
  (489, 20, 27),
  (490, 3, 37),
  (491, 8, 44),
  (492, 10, 16),
  (493, 18, 24),
  (494, 15, 38),
  (495, 20, 3),
  (496, 1, 5),
  (497, 19, 23),
  (498, 17, 2),
  (499, 13, 46),
  (500, 3, 30);


/* Data for the 'facturaproducto' table  (Records 501 - 1000) */

INSERT INTO `facturaproducto` (`idfacturaproducto`, `idfactura`, `idproducto`) VALUES

  (501, 7, 50),
  (502, 4, 49),
  (503, 16, 38),
  (504, 6, 11),
  (505, 11, 15),
  (506, 9, 10),
  (507, 5, 3),
  (508, 20, 16),
  (509, 5, 33),
  (510, 3, 40),
  (511, 7, 26),
  (512, 4, 10),
  (513, 20, 35),
  (514, 1, 12),
  (515, 6, 20),
  (516, 14, 25),
  (517, 7, 3),
  (518, 8, 24),
  (519, 16, 4),
  (520, 11, 18),
  (521, 16, 16),
  (522, 12, 41),
  (523, 2, 26),
  (524, 19, 34),
  (525, 5, 20),
  (526, 12, 46),
  (527, 16, 29),
  (528, 5, 38),
  (529, 14, 24),
  (530, 5, 27),
  (531, 10, 28),
  (532, 3, 45),
  (533, 10, 50),
  (534, 8, 37),
  (535, 4, 31),
  (536, 20, 13),
  (537, 4, 48),
  (538, 3, 10),
  (539, 8, 9),
  (540, 3, 45),
  (541, 4, 2),
  (542, 19, 3),
  (543, 7, 41),
  (544, 3, 24),
  (545, 18, 10),
  (546, 6, 46),
  (547, 20, 15),
  (548, 20, 15),
  (549, 14, 25),
  (550, 11, 32),
  (551, 13, 38),
  (552, 1, 7),
  (553, 5, 44),
  (554, 3, 45),
  (555, 5, 38),
  (556, 1, 37),
  (557, 13, 44),
  (558, 17, 16),
  (559, 13, 49),
  (560, 13, 12),
  (561, 5, 6),
  (562, 19, 2),
  (563, 8, 38),
  (564, 17, 42),
  (565, 19, 23),
  (566, 6, 23),
  (567, 12, 34),
  (568, 5, 37),
  (569, 1, 10),
  (570, 10, 44),
  (571, 12, 31),
  (572, 2, 46),
  (573, 4, 6),
  (574, 13, 3),
  (575, 4, 17),
  (576, 8, 49),
  (577, 7, 22),
  (578, 16, 17),
  (579, 18, 6),
  (580, 16, 49),
  (581, 8, 47),
  (582, 16, 40),
  (583, 10, 31),
  (584, 4, 27),
  (585, 4, 30),
  (586, 1, 4),
  (587, 12, 1),
  (588, 15, 1),
  (589, 14, 8),
  (590, 7, 21),
  (591, 11, 21),
  (592, 7, 40),
  (593, 12, 15),
  (594, 9, 15),
  (595, 10, 47),
  (596, 8, 4),
  (597, 17, 11),
  (598, 5, 9),
  (599, 9, 4),
  (600, 20, 4),
  (601, 15, 7),
  (602, 12, 9),
  (603, 7, 10),
  (604, 8, 33),
  (605, 18, 2),
  (606, 6, 38),
  (607, 15, 36),
  (608, 11, 29),
  (609, 6, 14),
  (610, 2, 34),
  (611, 17, 28),
  (612, 19, 28),
  (613, 20, 9),
  (614, 9, 34),
  (615, 15, 6),
  (616, 20, 50),
  (617, 5, 48),
  (618, 18, 34),
  (619, 1, 45),
  (620, 15, 28),
  (621, 14, 16),
  (622, 13, 23),
  (623, 2, 42),
  (624, 1, 17),
  (625, 17, 12),
  (626, 7, 13),
  (627, 6, 7),
  (628, 17, 28),
  (629, 18, 6),
  (630, 2, 13),
  (631, 17, 17),
  (632, 7, 18),
  (633, 16, 49),
  (634, 15, 25),
  (635, 19, 12),
  (636, 4, 37),
  (637, 19, 21),
  (638, 2, 18),
  (639, 7, 22),
  (640, 3, 11),
  (641, 17, 33),
  (642, 14, 7),
  (643, 16, 4),
  (644, 15, 43),
  (645, 16, 6),
  (646, 1, 21),
  (647, 15, 22),
  (648, 3, 46),
  (649, 20, 25),
  (650, 7, 40),
  (651, 2, 35),
  (652, 8, 24),
  (653, 1, 5),
  (654, 17, 47),
  (655, 10, 4),
  (656, 7, 8),
  (657, 13, 42),
  (658, 5, 15),
  (659, 14, 37),
  (660, 14, 35),
  (661, 12, 35),
  (662, 14, 12),
  (663, 9, 13),
  (664, 15, 49),
  (665, 14, 45),
  (666, 3, 46),
  (667, 18, 50),
  (668, 9, 27),
  (669, 9, 43),
  (670, 7, 30),
  (671, 5, 17),
  (672, 14, 26),
  (673, 2, 5),
  (674, 15, 26),
  (675, 13, 29),
  (676, 5, 33),
  (677, 9, 13),
  (678, 5, 14),
  (679, 15, 20),
  (680, 7, 17),
  (681, 13, 13),
  (682, 20, 30),
  (683, 14, 3),
  (684, 9, 4),
  (685, 7, 49),
  (686, 1, 10),
  (687, 14, 33),
  (688, 5, 23),
  (689, 20, 42),
  (690, 20, 30),
  (691, 10, 1),
  (692, 11, 30),
  (693, 15, 31),
  (694, 7, 5),
  (695, 4, 48),
  (696, 3, 44),
  (697, 11, 37),
  (698, 19, 43),
  (699, 7, 14),
  (700, 20, 21),
  (701, 12, 31),
  (702, 9, 32),
  (703, 6, 13),
  (704, 6, 9),
  (705, 6, 16),
  (706, 10, 28),
  (707, 11, 5),
  (708, 14, 38),
  (709, 7, 32),
  (710, 20, 8),
  (711, 7, 46),
  (712, 3, 33),
  (713, 15, 43),
  (714, 5, 45),
  (715, 18, 28),
  (716, 19, 45),
  (717, 4, 14),
  (718, 7, 19),
  (719, 15, 24),
  (720, 14, 32),
  (721, 13, 34),
  (722, 14, 33),
  (723, 2, 4),
  (724, 19, 50),
  (725, 19, 28),
  (726, 9, 28),
  (727, 19, 26),
  (728, 11, 16),
  (729, 2, 47),
  (730, 6, 7),
  (731, 12, 15),
  (732, 13, 3),
  (733, 5, 30),
  (734, 2, 12),
  (735, 16, 16),
  (736, 11, 34),
  (737, 1, 42),
  (738, 17, 30),
  (739, 7, 31),
  (740, 3, 3),
  (741, 8, 29),
  (742, 3, 38),
  (743, 15, 45),
  (744, 17, 18),
  (745, 14, 35),
  (746, 20, 29),
  (747, 12, 47),
  (748, 5, 40),
  (749, 2, 45),
  (750, 1, 46),
  (751, 20, 24),
  (752, 4, 19),
  (753, 7, 29),
  (754, 10, 17),
  (755, 17, 15),
  (756, 2, 25),
  (757, 4, 3),
  (758, 9, 44),
  (759, 6, 44),
  (760, 18, 5),
  (761, 6, 29),
  (762, 6, 27),
  (763, 12, 23),
  (764, 19, 42),
  (765, 12, 47),
  (766, 3, 3),
  (767, 16, 18),
  (768, 15, 20),
  (769, 2, 9),
  (770, 14, 24),
  (771, 13, 17),
  (772, 5, 6),
  (773, 7, 7),
  (774, 6, 3),
  (775, 19, 6),
  (776, 3, 12),
  (777, 2, 7),
  (778, 19, 9),
  (779, 2, 7),
  (780, 14, 19),
  (781, 14, 9),
  (782, 9, 48),
  (783, 1, 47),
  (784, 16, 24),
  (785, 17, 47),
  (786, 8, 36),
  (787, 7, 6),
  (788, 19, 7),
  (789, 3, 36),
  (790, 15, 15),
  (791, 6, 30),
  (792, 16, 16),
  (793, 4, 27),
  (794, 9, 31),
  (795, 8, 25),
  (796, 5, 33),
  (797, 10, 35),
  (798, 7, 39),
  (799, 1, 11),
  (800, 1, 6),
  (801, 17, 10),
  (802, 11, 43),
  (803, 13, 25),
  (804, 19, 49),
  (805, 4, 44),
  (806, 15, 25),
  (807, 15, 21),
  (808, 2, 3),
  (809, 4, 31),
  (810, 1, 25),
  (811, 15, 16),
  (812, 8, 34),
  (813, 4, 34),
  (814, 16, 38),
  (815, 9, 35),
  (816, 1, 46),
  (817, 10, 16),
  (818, 18, 14),
  (819, 14, 45),
  (820, 1, 45),
  (821, 3, 27),
  (822, 2, 8),
  (823, 13, 20),
  (824, 11, 29),
  (825, 18, 4),
  (826, 13, 9),
  (827, 5, 22),
  (828, 9, 9),
  (829, 10, 9),
  (830, 17, 44),
  (831, 16, 18),
  (832, 3, 13),
  (833, 20, 39),
  (834, 1, 46),
  (835, 17, 17),
  (836, 9, 37),
  (837, 10, 30),
  (838, 10, 45),
  (839, 10, 36),
  (840, 15, 42),
  (841, 19, 23),
  (842, 5, 5),
  (843, 7, 3),
  (844, 1, 41),
  (845, 17, 26),
  (846, 3, 27),
  (847, 14, 47),
  (848, 15, 47),
  (849, 16, 49),
  (850, 1, 27),
  (851, 16, 31),
  (852, 1, 15),
  (853, 4, 37),
  (854, 16, 32),
  (855, 2, 28),
  (856, 17, 33),
  (857, 15, 21),
  (858, 20, 13),
  (859, 9, 7),
  (860, 3, 22),
  (861, 6, 24),
  (862, 18, 11),
  (863, 4, 38),
  (864, 4, 21),
  (865, 18, 28),
  (866, 6, 24),
  (867, 1, 14),
  (868, 5, 23),
  (869, 1, 44),
  (870, 15, 50),
  (871, 11, 47),
  (872, 4, 29),
  (873, 12, 41),
  (874, 4, 21),
  (875, 1, 12),
  (876, 13, 42),
  (877, 1, 24),
  (878, 20, 17),
  (879, 5, 25),
  (880, 2, 9),
  (881, 8, 2),
  (882, 5, 34),
  (883, 13, 23),
  (884, 9, 45),
  (885, 14, 13),
  (886, 20, 33),
  (887, 6, 10),
  (888, 14, 6),
  (889, 1, 32),
  (890, 8, 49),
  (891, 3, 10),
  (892, 3, 43),
  (893, 19, 21),
  (894, 15, 19),
  (895, 14, 15),
  (896, 9, 29),
  (897, 3, 31),
  (898, 9, 8),
  (899, 1, 37),
  (900, 14, 24),
  (901, 12, 45),
  (902, 2, 30),
  (903, 11, 38),
  (904, 13, 11),
  (905, 6, 18),
  (906, 2, 27),
  (907, 6, 32),
  (908, 2, 49),
  (909, 1, 44),
  (910, 3, 4),
  (911, 15, 22),
  (912, 10, 12),
  (913, 20, 43),
  (914, 2, 4),
  (915, 6, 34),
  (916, 16, 23),
  (917, 1, 16),
  (918, 13, 28),
  (919, 7, 10),
  (920, 5, 14),
  (921, 9, 30),
  (922, 7, 45),
  (923, 2, 13),
  (924, 3, 35),
  (925, 2, 8),
  (926, 9, 5),
  (927, 20, 5),
  (928, 11, 23),
  (929, 2, 28),
  (930, 15, 40),
  (931, 1, 46),
  (932, 19, 34),
  (933, 20, 50),
  (934, 2, 23),
  (935, 5, 32),
  (936, 15, 18),
  (937, 17, 22),
  (938, 13, 20),
  (939, 11, 8),
  (940, 17, 49),
  (941, 3, 11),
  (942, 9, 40),
  (943, 11, 19),
  (944, 12, 48),
  (945, 12, 38),
  (946, 11, 31),
  (947, 8, 32),
  (948, 19, 43),
  (949, 2, 24),
  (950, 12, 19),
  (951, 3, 47),
  (952, 9, 4),
  (953, 4, 29),
  (954, 8, 43),
  (955, 10, 41),
  (956, 2, 50),
  (957, 14, 23),
  (958, 12, 12),
  (959, 9, 24),
  (960, 14, 26),
  (961, 2, 15),
  (962, 20, 44),
  (963, 6, 18),
  (964, 5, 33),
  (965, 1, 15),
  (966, 20, 18),
  (967, 17, 5),
  (968, 16, 22),
  (969, 8, 1),
  (970, 18, 31),
  (971, 11, 12),
  (972, 9, 23),
  (973, 4, 27),
  (974, 18, 24),
  (975, 14, 24),
  (976, 19, 6),
  (977, 12, 34),
  (978, 12, 37),
  (979, 5, 46),
  (980, 16, 23),
  (981, 13, 29),
  (982, 7, 36),
  (983, 4, 16),
  (984, 9, 1),
  (985, 17, 43),
  (986, 18, 6),
  (987, 15, 39),
  (988, 17, 12),
  (989, 9, 31),
  (990, 8, 24),
  (991, 6, 44),
  (992, 3, 21),
  (993, 18, 40),
  (994, 1, 13),
  (995, 16, 37),
  (996, 7, 40),
  (997, 4, 11),
  (998, 7, 47),
  (999, 14, 8),
  (1000, 14, 28);