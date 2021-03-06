/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : webstore

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2020-05-11 22:09:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(2) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'sa', 'admin');
INSERT INTO `admin` VALUES ('6', '小绿', 'admin');
INSERT INTO `admin` VALUES ('7', '小辉', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(80) NOT NULL,
  `category_descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '剧场动画', '主要播出海内外优秀动画片，给小朋友打造丰富的动画片观看平台');
INSERT INTO `category` VALUES ('2', '新番放送', '动画新番绝大多数开始放送时间在1月（冬季新番）、4月（春季新番）、7月（夏季新番）、10月（秋季新番）这四个月份中。');
INSERT INTO `category` VALUES ('3', '国产动漫', '中国动画起源于20世纪20年代，1926年摄制了中国第一部动画片《大闹画室》，揭开了中国动画史的一页。20世纪40年代，万氏兄弟创作了中国动画第一部长片《铁扇公主》，发行到东南亚和日本地区，受到人们的热烈欢迎，为中国动画走向国际作了很好的铺垫。');
INSERT INTO `category` VALUES ('4', '影视', '影视是以拷贝、磁带、胶片、存储器等为载体，以银幕、屏幕放映为目的，从而实现视觉与听觉综合观赏的艺术形式，是现代艺术的综合形态，包含了电影、电视剧、节目、动画等内容。');
INSERT INTO `category` VALUES ('5', '用户分享', '根据用户喜好分享视频');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `post_stprey_id` int(11) NOT NULL,
  `post_from_uid` int(11) NOT NULL,
  `post_to_uid` int(11) DEFAULT NULL,
  `post_content` varchar(100) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_from_name` varchar(100) NOT NULL,
  `post_to_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_to_uid` (`post_from_uid`),
  CONSTRAINT `post_from_uid` FOREIGN KEY (`post_from_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posting` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_to_uid` FOREIGN KEY (`post_from_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '1', '1', '4332', null, '我也想知道', '2019-12-12 12:26:05', '东', null);
INSERT INTO `post` VALUES ('2', '1', '1', '856', '4332', '什么时候出', '2019-12-12 12:26:25', '哆啦坤梦', '东');
INSERT INTO `post` VALUES ('3', '1', '1', '4396', '4332', '有链接吗？', '2019-12-12 12:26:48', '厂长', '东');
INSERT INTO `post` VALUES ('4', '1', '2', '4396', null, '楼主求链接', '2019-12-12 12:27:33', '厂长', null);
INSERT INTO `post` VALUES ('5', '2', '1', '856', null, '同问', '2019-12-12 12:28:01', '哆啦坤梦', null);
INSERT INTO `post` VALUES ('6', '1', '3', '856', null, '有哪位大佬链接共享一下呗！！', '2019-12-15 21:05:40', '哆啦坤梦', null);
INSERT INTO `post` VALUES ('7', '1', '3', '4396', '856', '我什么都要', '2019-12-15 22:07:10', '厂长', '哆啦坤梦');
INSERT INTO `post` VALUES ('8', '1', '2', '856', '4396', '什么链接多有，来我这里看吧', '2019-12-15 23:50:16', '哆啦坤梦', '厂长');
INSERT INTO `post` VALUES ('9', '1', '1', '4396', '4332', '我想要他下一部的链接', '2019-12-16 12:18:11', '厂长', '东');
INSERT INTO `post` VALUES ('10', '1', '1', '4396', '4332', '还有吗？', '2019-12-16 12:19:15', '厂长', '东');
INSERT INTO `post` VALUES ('11', '1', '2', '4396', '4396', '我也想知道', '2019-12-16 12:24:23', '厂长', '厂长');
INSERT INTO `post` VALUES ('12', '1', '3', '4396', '856', '什么时候出', '2019-12-16 12:26:36', '厂长', '哆啦坤梦');
INSERT INTO `post` VALUES ('16', '2', '1', '4396', '856', '有链接吗？', '2019-12-16 14:17:06', '厂长', '哆啦坤梦');
INSERT INTO `post` VALUES ('17', '2', '2', '4396', null, '楼主求链接', '2019-12-16 14:17:22', '厂长', null);
INSERT INTO `post` VALUES ('18', '2', '2', '4396', '4396', '同问', '2019-12-16 14:17:33', '厂长', '厂长');
INSERT INTO `post` VALUES ('19', '4', '1', '4396', null, '有哪位大佬链接共享一下呗！！', '2019-12-16 14:17:51', '厂长', null);
INSERT INTO `post` VALUES ('20', '4', '2', '4396', null, '我什么都要', '2019-12-16 14:18:06', '厂长', null);
INSERT INTO `post` VALUES ('21', '1', '1', '4396', '4332', '什么链接多有，来我这里看吧', '2019-12-17 10:32:04', '厂长', '东');
INSERT INTO `post` VALUES ('22', '1', '1', '4396', '4332', '什么时候出新番呀？', '2019-12-17 10:42:54', '厂长', '东');

-- ----------------------------
-- Table structure for posting
-- ----------------------------
DROP TABLE IF EXISTS `posting`;
CREATE TABLE `posting` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(100) NOT NULL,
  `post_uid` int(11) NOT NULL,
  `post_name` varchar(100) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_uid` (`post_uid`),
  CONSTRAINT `post_uid` FOREIGN KEY (`post_uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posting
-- ----------------------------
INSERT INTO `posting` VALUES ('1', '求出新番', '4396', '厂长');
INSERT INTO `posting` VALUES ('2', '什么时候才有全职猎人', '4332', '东');
INSERT INTO `posting` VALUES ('3', '火影忍者什么时候出后续更新？', '856', '哆啦坤梦');
INSERT INTO `posting` VALUES ('4', '求链接', '1000', '小红');
INSERT INTO `posting` VALUES ('6', '这里有动漫的大部分链接', '1002', '小花');
INSERT INTO `posting` VALUES ('8', '最近超级火的番有哪些？', '1004', '小云');
INSERT INTO `posting` VALUES ('9', '有什么时候比较少时间看的电影吗？', '1005', '小亮');
INSERT INTO `posting` VALUES ('10', '求出新番', '1006', '小王');
INSERT INTO `posting` VALUES ('11', '什么时候才有全职猎人', '1007', '绿谷');
INSERT INTO `posting` VALUES ('12', '火影忍者什么时候出后续更新？', '1008', '出久');
INSERT INTO `posting` VALUES ('13', '求链接', '1009', '欧尔麦特');
INSERT INTO `posting` VALUES ('14', '这里有动漫的大部分链接', '1010', '小胜');
INSERT INTO `posting` VALUES ('15', '圣诞节礼包', '1011', '郑大炳');
INSERT INTO `posting` VALUES ('16', '求出新番', '1000', '小红');
INSERT INTO `posting` VALUES ('17', '什么时候才有全职猎人', '1001', '小明');
INSERT INTO `posting` VALUES ('18', '火影忍者什么时候出后续更新？', '1002', '小花');
INSERT INTO `posting` VALUES ('20', '这里有动漫的大部分链接', '1004', '小云');
INSERT INTO `posting` VALUES ('21', '圣诞节礼包', '1005', '小亮');
INSERT INTO `posting` VALUES ('22', '最近超级火的番有哪些？', '1006', '小王');
INSERT INTO `posting` VALUES ('23', '有什么时候比较少时间看的电影吗？', '1007', '绿谷');
INSERT INTO `posting` VALUES ('24', '求链接', '1008', '出久');
INSERT INTO `posting` VALUES ('25', '这里有动漫的大部分链接', '1009', '欧尔麦特');

-- ----------------------------
-- Table structure for src
-- ----------------------------
DROP TABLE IF EXISTS `src`;
CREATE TABLE `src` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `category` varchar(255) DEFAULT NULL COMMENT '资源分类',
  `descn` varchar(1000) DEFAULT NULL COMMENT '资源详情',
  `code` varchar(255) DEFAULT NULL COMMENT '资源代码',
  `img` varchar(255) DEFAULT NULL COMMENT '资源预览图',
  `date` char(255) DEFAULT NULL COMMENT '资源上传时间',
  `uploader` int(255) DEFAULT NULL COMMENT '资源上传者id',
  `up` varchar(255) DEFAULT NULL COMMENT 'up主',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uploader` (`uploader`) USING BTREE,
  CONSTRAINT `uploader` FOREIGN KEY (`uploader`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of src
-- ----------------------------
INSERT INTO `src` VALUES ('64', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('65', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('66', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('67', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('68', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('69', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('70', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('71', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('72', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('73', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('74', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('79', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('80', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('81', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('82', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('83', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('84', '一拳超人', '国产动漫', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('85', '镇魂街', '国产动漫', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('87', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('88', '刺客五六七', '国产动漫', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('89', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('90', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('91', '我的英雄学院', '用户分享', '我的英雄学院', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191221/3773_aaac7e05/index.m3u8', 'img/1577187346037840058.jfif', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('92', '海贼王', '国产动漫', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('93', '东京食尸鬼', '国产动漫', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('94', '妖精的尾巴', '国产动漫', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('95', '火影忍者', '国产动漫', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('96', '一拳超人', '国产动漫', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('97', '镇魂街', '国产动漫', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('98', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('99', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('100', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('101', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('102', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('104', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('105', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('106', '妖精的尾巴', '剧场动画', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('107', '火影忍者', '剧场动画', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('108', '一拳超人', '剧场动画', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('109', '镇魂街', '剧场动画', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('110', '七大罪', '剧场动画', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('111', 'Fate', '剧场动画', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('112', '刺客五六七', '剧场动画', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('113', '闪电侠', '剧场动画', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('114', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('115', '我的英雄学院', '用户分享', '我的英雄学院', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191221/3773_aaac7e05/index.m3u8', 'img/1577187346037840058.jfif', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('116', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('117', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('118', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('119', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('120', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('121', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('122', '七大罪', '影视', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('123', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('124', '刺客五六七', '影视', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('125', '闪电侠', '影视', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('126', '神盾局特工', '影视', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('127', '我的英雄学院', '用户分享', '我的英雄学院', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191221/3773_aaac7e05/index.m3u8', 'img/1577187346037840058.jfif', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('128', '海贼王', '影视', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('129', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('130', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('131', '火影忍者', '影视', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('132', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('133', '镇魂街', '影视', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('134', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('135', 'Fate', '影视', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('136', '刺客五六七', '影视', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('137', '闪电侠', '影视', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('138', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('139', '我的英雄学院', '用户分享', '我的英雄学院', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191221/3773_aaac7e05/index.m3u8', 'img/1577187346037840058.jfif', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('140', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('141', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('142', '妖精的尾巴', '影视', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('143', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('144', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('145', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('146', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('147', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('148', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('149', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('150', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('151', '我的英雄学院', '用户分享', '我的英雄学院', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191221/3773_aaac7e05/index.m3u8', 'img/1577187346037840058.jfif', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('152', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('153', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('154', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('155', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('156', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('157', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('158', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('159', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('160', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('161', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('162', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('164', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('165', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('166', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('167', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('168', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('169', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('170', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('171', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('172', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('173', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('174', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('176', '海贼王', '新番放送', '《航海王》是日本漫画家尾田荣一郎作画的少年漫画作品，在《周刊少年Jump》1997年第34号开始连载。改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。\r\n2012年5月11日，《航海王》获得第41回日本漫画家协会赏 [1]  。截至2015年6月15日，《航海王》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画” [2]  。2017年7月21日，日本纪念日协会通过认证，将每年的7月22日设立为“ONE PIECE纪念日” [3]  。', '  https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3820_72f2ef12/index.m3u8', 'img/hzw.jpg', null, null, null);
INSERT INTO `src` VALUES ('177', '东京食尸鬼', '新番放送', '电视动画《东京食尸鬼》改编自石田翠原作的同名漫画。动画由Studio Pierrot负责制作，于2014年7月3日起每周四在TOKYO MX首播，全12话。 [1]  第2季《Tokyo Ghoul √A》于2015年1月播出。第3季上半期《Tokyo Ghoul:re》于2018年4月播出。第3季下半期《Tokyo Ghoul:reⅡ》于2018年10月播出。', 'https://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8\r\nhttps://8868.987jx.com/jj/?url=https://pptv.com-h-pptv.com/20181225/11822_d1f8c8b1/index.m3u8', 'img/东京食尸鬼.jpg', null, null, null);
INSERT INTO `src` VALUES ('178', '妖精的尾巴', '新番放送', '《妖精的尾巴》是日本漫画家真岛浩创作的少年漫画。该作品讲述了魔导士公会“妖精的尾巴”的成员露西、纳兹、哈比、格雷、艾露莎和他们的众多伙伴们在这个魔法世界中的一系列热血故事。', 'https://8868.987jx.com/jj/?url=https://www6.yuboyun.com/hls/2019/09/29/DQDmQUh7/playlist.m3u8', 'img/妖精的尾巴.jpg', null, null, null);
INSERT INTO `src` VALUES ('179', '火影忍者', '新番放送', '《火影忍者》（日语：NARUTO -ナルト-），通常简称为“火影”，为日本漫画家岸本齐史创作的少年漫画，讲述忍者世界里围绕着身为对手的漩涡鸣人和宇智波佐助两人，与其他角色的经历。\r\n\r\n漫画自1999年开始在日本集英社旗下的少年漫画杂志《周刊少年Jump》上连载。2002年，由日本动画工作室Studio Pierrot根据漫画原作所改编制作的电视动画版《火影忍者》开始在日本东京电视台播出。2004年，漫画进而改编成电影。2006年，漩涡鸣人入选美国《新闻周刊》日文版于10月18日发行的特集中选出的“全世界最受尊敬的100位日本人”。[1]\r\n\r\n2010年集英社宣布系列漫画的累计发行量已突破一亿册[2]。《火影忍者》在三十多个国家及地区被翻译并出版发行，截至2014年8月，系列漫画在全球的累计发行量已突破2亿本。[3]连载达15年的《火影忍者》已于2014年11月10日在该年第50期周刊少年Jump上，以700话完结篇划下句点。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/26/T7tnuptT/playlist.m3u8', 'img/火影忍者.jfif', null, null, null);
INSERT INTO `src` VALUES ('180', '一拳超人', '新番放送', '《一拳超人》是ONE原作，村田雄介作画，连载于网络漫画杂志《邻座的Young jump》上的漫画。 [1-2]  原为ONE在个人网站上连载的练笔之作， [3]  后被喜爱该作的另一漫画家村田雄介在征得ONE同意后重新绘制而成。\r\n电子版由哔哩哔哩漫画发布、漫番漫画同步日本连载发布。 [4] \r\n截至2016年11月27日，重制版日文单行销量累计突破1111万部。 [5]', 'https://8868.987jx.com/jj/?url=https://gss3.baidu.com/6LZ0ej3k1Qd3ote6lo7D0j9wehsv/tieba-smallvideo/607272_3ed03a5d09283051b1d5c0266cb0b706.mp4', 'img/一拳超人.jfif', null, null, null);
INSERT INTO `src` VALUES ('181', '镇魂街', '新番放送', '普通的应届大学毕业生夏铃在求职之际，收到了一条奇怪的面试通知，因此误入罗刹街并遭到了危险，幸而被镇魂将曹焱兵搭救。然而接触中，曹焱兵却发现，夏铃也是寄灵人。与此同时，夏铃开始遭到不明身份刺客的追杀，曹焱兵亦被卷入其中，二人的命运从此开始了交集，而在这一切的背后，似乎还隐藏着某些更加危险的秘密……', 'https://8868.987jx.com/jj/?url=https://ifeng.com-v-ifeng.com/20180723/24238_0ef7c6e5/index.m3u8', 'img/镇魂街.jpg', null, null, null);
INSERT INTO `src` VALUES ('182', '七大罪', '新番放送', '這是從人與非人尚存的世界流傳下來的古老傳說。在與經曆三千年後復活的，魔神族的精銳“十戒”的戰鬥中敗北，而梅利奧達斯也死了。於是，布里塔尼亞進入了黑暗時代。就在黛安、金、高瑟也行踪不明的時候，“十戒”的魔爪也在逼近著里昂妮絲王國。雖然艾斯卡諾擊退了艾斯塔羅薩，但是人類仍處於劣勢的狀況。然後，就在伊麗莎白陷入了絕境的時候，取回了壓倒性力量的梅利奧達斯從煉獄復活歸來，並幹掉了古雷伊羅德和弗拉烏德林，成功地守護了里昂妮絲王國。雖然被毀壞的建築能夠重建復原，但是人們受到傷害的心靈卻無法痊癒。而後，取回了力量的梅利奧達斯的精神狀態好像也逐漸回到被稱為最惡魔神的那個時代。與此同時，以卡美洛王國為根據地的“十戒”給世間的威脅卻依舊存...', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3636_ac9ad62e/index.m3u8', 'img/七大罪.jpg', null, null, null);
INSERT INTO `src` VALUES ('183', 'Fate', '新番放送', '作为「Fate/stay night」的前传，「Fate/Zero」的故事舞台设定在第五次圣杯战争的10年前，即第四次圣杯战争；而在「Fate/stay night」中充满神秘感的卫宫切嗣则会成为「Fate/Zero」的主角。在虚渊玄优秀的创作能力之下，「Fate/Zero」无论在剧情还是在生动流畅的战斗场面等方面都显得非常优秀。本片于2011年7月开播，分两季播出。动画制作将继续沿用自「空之境界」系列剧场版便开始合作的ufotable，监督则由在AIC及ufotable两间制作公司中 均有活跃表现的あおきえい担任。另外，在武内崇的人物原案之下，人设将交由须藤友德及碇谷敦负责。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191222/3801_fd363b73/index.m3u8', 'img/fate.jpg', null, null, null);
INSERT INTO `src` VALUES ('184', '刺客五六七', '新番放送', '在某个小岛上，有一个可以伪装成任何东西的廉价刺客，名叫伍六七。平时看上去是个理发师，其实背地里却做着刺客生意。热爱理发事业，喜欢给人剪头发，善用剪刀——剪刀也是他的刺杀武器。由于初入刺客行当，行情十分廉价，因此接到的都是些奇葩的刺杀任务。在执行刺杀任务的过程中，与刺杀对象发生一系列有趣的意外事件。', 'https://8868.987jx.com/jj/?url=https://iqiyi.cdn9-okzy.com/20191218/3530_c2b24de9/index.m3u8', 'img/刺客五六七.jpg', null, null, null);
INSERT INTO `src` VALUES ('185', '闪电侠', '新番放送', '《闪电侠》（The Flash）是由美国DC娱乐和华纳兄弟电视公司合作出品的科幻电视连续剧，格里格·伯兰蒂、安德鲁·克雷斯伯格和戈夫·约翰斯担任制作，由戴维·纳特执导首集，格兰特·古斯汀、坎迪斯·帕顿、杰西·马丁、汤姆·加瓦那、坎迪斯·帕顿、米歇尔·哈里逊、丹妮尔·帕娜贝克等主演。本片是《绿箭侠》的衍生剧，改编自同名DC漫画。', 'https://8868.987jx.com/jj/?url=https://cdn-2.haku88.com/hls/2018/12/04/1F1UqiEl/playlist.m3u8', 'img/闪电侠.jpg', null, null, null);
INSERT INTO `src` VALUES ('186', '神盾局特工', '新番放送', '《神盾局特工》（英语：Agents of S.H.I.E.L.D.）是一部美国广播公司于2013年制作并播出的电视剧，由乔斯·温登根据漫威漫画中的同名组织神盾局为蓝本创作，属于漫威电影宇宙的系列作品之一，从电影系列的第二阶段开始。“神盾局”（S.H.I.E.L.D.）是“国土战略防御攻击与后勤保障局”（Strategic Homeland Intervention，Enforcement and Logistics Division）的简称，前身为“战略科学军团”（Strategic Scientific Reserve, S.S.R.），在第二次世界大战期间，为了对抗“九头蛇”（HYDRA）而由同盟国联合组成。', 'https://8868.987jx.com/jj/?url=https://youku.com-youku.net/20180513/1684_b27d1e2d/index.m3u8', 'img/神盾局特工.jpg', null, null, null);
INSERT INTO `src` VALUES ('188', '你的答案mv', '用户分享', '你的答案mv', 'img/1577192277155516597.mp4', 'img/1577192277147718127.jpg', '2019-12-24', '4396', '厂长');
INSERT INTO `src` VALUES ('189', '你的答案', '用户分享', '你的答案', 'img/1577689659776355885.mp4', 'img/1577689659763839773.jpg', '2019-12-30', '4396', '厂长');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_selfdescn` varchar(255) DEFAULT NULL,
  `user_speak` int(11) NOT NULL,
  `user_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', '小黄', '123', '我是大东', '0', '13645645654');
INSERT INTO `user` VALUES ('856', '哆啦坤梦', '123', '我是哆啦坤梦', '0', '13699999999');
INSERT INTO `user` VALUES ('1000', '小红', '123', '我是小红', '1', '11111111111');
INSERT INTO `user` VALUES ('1001', '小明', '123', '我是小明', '0', '22222222222');
INSERT INTO `user` VALUES ('1002', '小花', '123', '我是小花', '0', '33333333333');
INSERT INTO `user` VALUES ('1004', '小云', '123', '我是小云', '1', '55555555555');
INSERT INTO `user` VALUES ('1005', '小亮', '123', '我是小亮', '1', '66666666666');
INSERT INTO `user` VALUES ('1006', '小王', '123', '我是小王', '1', '77777777777');
INSERT INTO `user` VALUES ('1007', '绿谷', '123', '我是绿谷', '1', '88888888888');
INSERT INTO `user` VALUES ('1008', '出久', '123', '我是出久', '0', '96999999999');
INSERT INTO `user` VALUES ('1009', '欧尔麦特', '123', '我是欧尔麦特', '1', '1010');
INSERT INTO `user` VALUES ('1010', '小胜', '123', '我是小胜', '1', '2020');
INSERT INTO `user` VALUES ('1011', '郑大炳', '123', '我是坤坤', '1', '3030');
INSERT INTO `user` VALUES ('1012', '正小兵', '123', '我是小兵', '0', '4040');
INSERT INTO `user` VALUES ('1013', '老王', '123', '我是老王', '1', '5050');
INSERT INTO `user` VALUES ('1234', '阿阿斯顿', '111', '阿斯顿', '1', '10086100861');
INSERT INTO `user` VALUES ('4332', '东', '123', '我是帅哥', '1', '6060');
INSERT INTO `user` VALUES ('4396', '厂长', '123', '我是厂长', '1', '7070');
INSERT INTO `user` VALUES ('4397', 'aaa', 'aaa', 'aaa', '1', '123123');
