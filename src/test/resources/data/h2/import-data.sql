INSERT INTO `t_user` VALUES (1, 'system', 'System', 'admin@163.com', '13900008888', 'a31ae4be5ba8d4d077d440b5abbdfb922ad893db', '2ab6b18dbb02b728', 'system_admin', '2014-9-5 18:21:36', '2014-9-5 18:21:36', 0, 1, 0);
INSERT INTO `t_user` VALUES (2, 'admin', 'Admin', 'admin@163.com', '13900008888', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'super_admin', '2014-9-5 21:22:06', '2014-9-5 18:21:36', 0, 1, 0);
INSERT INTO `t_user` VALUES (3, 'plantfromA', '平台管理员A', 'calvin@163.com', '+86 13999996666', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'plantform_admin', '2014-9-5 21:25:57', '2012-6-4 02:00:00', 0, 1, 0);
INSERT INTO `t_user` VALUES (4, 'plantfromB', '平台管理员B', 'calvin@163.com', '+86 13999996666', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'plantform_admin', '2014-9-5 21:24:55', '2012-6-4 02:00:00', 0, 1, 0);
INSERT INTO `t_user` VALUES (5, 'proxyadminA', '代理管理员A', 'calvin@163.com', '13900008888', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'proxy_admin', '2014-9-5 21:25:07', '2014-9-5 18:21:36', 0, 1, 1);
INSERT INTO `t_user` VALUES (6, 'proxyadminB', '代理管理员B', 'calvin@163.com', '+86 13999996666', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'proxy_admin', '2014-9-5 21:25:10', '2012-6-4 02:00:00', 0, 1, 2);
INSERT INTO `t_user` VALUES (7, 'proxyuserA', '代理人员A', 'calvin@163.com', '+86 13999996666', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'proxy_user', '2014-9-5 21:25:21', '2012-6-4 02:00:00', 0, 1, 1);
INSERT INTO `t_user` VALUES (8, 'proxyuserB', '代理人员B', 'calvin@163.com', '+86 13999996666', '4f69e8cf3caf29ff7ee9c6015d0d2ea58a061aa0', '85c2d4b36df07a27', 'proxy_user', '2014-9-5 21:25:29', '2012-6-4 02:00:00', 0, 1, 2);

INSERT INTO `t_proxy` VALUES (1, '2014-9-1 15:47:36', '2014-9-1 15:47:38', 1, 1, '9001001', '农代理A', 'proxy company A', '1111111', '2222222', '农业 食品加工', '私企', '2014-9-1 15:48:41', '小麦、大豆、玉米、大米', 10000, 5, '张飞', '农业银行', '622500980098767', 0, 'www.proxycompany.com', '北京十里屯', '北京王府井200号', '210000', '张飞', '13700009999', NULL, 0);
INSERT INTO `t_proxy` VALUES (2, '2014-9-1 15:47:36', '2014-9-1 15:47:38', 1, 1, '9001002', '农代理B', 'proxy company B', '1111111', '2222222', '农业 食品加工', '私企', '2014-9-1 15:48:41', '小麦、大豆、玉米、大米', 10000, 5, '张飞', '农业银行', '622500980098767', 0, 'www.proxycompany.com', '北京十里屯', '北京王府井200号', '210000', '张飞', '13700009999', NULL, 1);
INSERT INTO `t_proxy` VALUES (3, '2014-9-1 15:47:36', '2014-9-1 15:47:38', 1, 1, '9001003', '农代理C', 'proxy company C', '1111111', '2222222', '农业 食品加工', '私企', '2014-9-1 15:48:41', '小麦、大豆、玉米、大米', 10000, 5, '张飞', '农业银行', '622500980098767', 0, 'www.proxycompany.com', '北京十里屯', '北京王府井200号', '210000', '张飞', '13700009999', NULL, 1);

INSERT INTO `t_image` VALUES (1, '2014-9-5 20:45:07', '2014-9-5 20:45:07', 2, 1, 't_company', 1, NULL, '领导合影.jpg', 23208, '04d41a2c-77be-417f-aa46-ab3a63a675c7.jpg', '04d41a2c-77be-417f-aa46-ab3a63a675c7-thumbnail.png', 128954);
INSERT INTO `t_image` VALUES (2, '2014-9-5 20:45:07', '2014-9-5 20:45:07', 2, 1, 't_company', 1, NULL, '整体规划图.jpg', 34446, '4aaa54bb-e836-4a9f-8bd4-f36b2ef69928.jpg', '4aaa54bb-e836-4a9f-8bd4-f36b2ef69928-thumbnail.png', 148402);
INSERT INTO `t_image` VALUES (3, '2014-9-5 20:45:07', '2014-9-5 20:45:07', 2, 1, 't_company', 1, NULL, '公司大门.jpg', 15963, 'e8c0f877-392f-4413-ae84-d80f065912c6.jpg', 'e8c0f877-392f-4413-ae84-d80f065912c6-thumbnail.png', 114223);
INSERT INTO `t_image` VALUES (4, '2014-9-5 20:45:07', '2014-9-5 20:45:07', 2, 1, 't_company', 1, NULL, 'logo.jpg', 15089, '689d44f9-7ca6-476b-b18e-d2c4767020e3.jpg', '689d44f9-7ca6-476b-b18e-d2c4767020e3-thumbnail.png', 156415);
INSERT INTO `t_image` VALUES (5, '2014-9-5 21:01:25', '2014-9-5 21:01:25', 8, 1, 't_company', 2, NULL, '领导视察.jpg', 14546, '518e2f65-67f7-4b06-875c-852e57fbaceb.jpg', '518e2f65-67f7-4b06-875c-852e57fbaceb-thumbnail.png', 116178);
INSERT INTO `t_image` VALUES (6, '2014-9-5 21:01:25', '2014-9-5 21:01:25', 8, 1, 't_company', 2, NULL, '观摩会.jpg', 11658, 'ebd18b18-66a6-431e-bfce-4f69a03671ca.jpg', 'ebd18b18-66a6-431e-bfce-4f69a03671ca-thumbnail.png', 137258);
INSERT INTO `t_image` VALUES (7, '2014-9-5 21:01:25', '2014-9-5 21:01:25', 8, 1, 't_company', 2, NULL, '研究合作.jpg', 12046, '78052b99-c85f-4dcf-98ed-87c154486df6.jpg', '78052b99-c85f-4dcf-98ed-87c154486df6-thumbnail.png', 130442);
INSERT INTO `t_image` VALUES (8, '2014-9-5 21:01:26', '2014-9-5 21:01:26', 8, 1, 't_company', 2, NULL, '大丰收.jpg', 23560, '15979b67-0727-4808-9dd6-ef3f9db605c7.jpg', '15979b67-0727-4808-9dd6-ef3f9db605c7-thumbnail.png', 141710);

INSERT INTO `t_company` VALUES (1, '2014-9-5 20:56:06', '2014-9-5 20:42:37', 2, 1, '88020006-9', '北京新发地农产品批发市场', '', '88020006-1', '88020006-2', '农、林、牧、渔业', '国有', '2010-9-1 00:00:00', '', 2000000, 200, '', '', '', NULL, '', '北京新发地', '北京新发地', '100015', '', '010-83719090', '999999999', 4, 0, 0);
INSERT INTO `t_company` VALUES (2, '2014-9-5 20:59:04', '2014-9-5 20:59:04', 8, 1, '88020001-8', '河北保定硕丰农产股份有限公司', '', '88020001-1', '88020001-2', '农、林、牧、渔业', '合作', '2012-9-21 00:00:00', '', NULL, NULL, '', '', '', NULL, '', '河北省保定高阳县庞诠镇', '', '', '李英杰', '0312-6755560', NULL, 0, 0, 0);