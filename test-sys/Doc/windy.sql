/*
SQLyog v10.2 
MySQL - 5.5.24 : Database - windy_1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`windy_1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `windy_1`;

/*Table structure for table `ad_browse_info` */

DROP TABLE IF EXISTS `ad_browse_info`;

CREATE TABLE `ad_browse_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_id` bigint(20) DEFAULT NULL,
  `browse_id` bigint(20) DEFAULT NULL COMMENT '浏览人id',
  `browse_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `ad_browse_info` */

/*Table structure for table `ad_info` */

DROP TABLE IF EXISTS `ad_info`;

CREATE TABLE `ad_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '广告类型：1、首页轮播图 2、页面插播',
  `title` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '内容类型：1、广告内容 2、外部链接',
  `content` text COLLATE utf8_bin,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '只显示有效广告',
  `attr0` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `ad_info` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL COMMENT '类别',
  `name` varchar(200) DEFAULT NULL COMMENT '商品名字',
  `thumbnail_url` varchar(200) DEFAULT NULL COMMENT '商品缩略图',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `rate_price` decimal(10,2) DEFAULT NULL COMMENT '拼团价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `unit` varchar(30) DEFAULT NULL COMMENT '商品单位(如：个/件/包)',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价',
  `content` text COMMENT '商品内容描述',
  `board_id` int(10) DEFAULT NULL COMMENT '版块id',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `status` int(2) DEFAULT NULL COMMENT '商品状态id（上架或下架）',
  `shop_id` int(30) DEFAULT NULL COMMENT '商铺id（二期用）',
  `hot` int(1) DEFAULT NULL,
  `key_words` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `transportation_cost` decimal(10,2) DEFAULT NULL COMMENT '运费，0为包邮',
  `delisting_time` varchar(20) DEFAULT NULL COMMENT '商品下架时间',
  `ad` varchar(200) DEFAULT NULL COMMENT '广告词',
  `service_description` varchar(50) DEFAULT NULL COMMENT '服务说明(服务说明id，多个用逗号隔开)',
  `tag_eval` varchar(50) DEFAULT NULL COMMENT '该商品对应的评价标签的id',
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `attr0` varchar(128) DEFAULT NULL,
  `attr1` varchar(128) DEFAULT NULL,
  `attr2` varchar(128) DEFAULT NULL,
  `attr3` varchar(128) DEFAULT NULL,
  `attr4` varchar(128) DEFAULT NULL,
  `attr5` varchar(128) DEFAULT NULL,
  `attr6` varchar(128) DEFAULT NULL,
  `attr7` varchar(128) DEFAULT NULL,
  `attr8` varchar(128) DEFAULT NULL,
  `attr9` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `goods_attribute` */

DROP TABLE IF EXISTS `goods_attribute`;

CREATE TABLE `goods_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `attr0` varchar(128) DEFAULT NULL,
  `attr1` varchar(128) DEFAULT NULL,
  `attr2` varchar(128) DEFAULT NULL,
  `attr3` varchar(128) DEFAULT NULL,
  `attr4` varchar(128) DEFAULT NULL,
  `attr5` varchar(128) DEFAULT NULL,
  `attr6` varchar(128) DEFAULT NULL,
  `attr7` varchar(128) DEFAULT NULL,
  `attr8` varchar(128) DEFAULT NULL,
  `attr9` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods_attribute` */

/*Table structure for table `goods_attribute_info` */

DROP TABLE IF EXISTS `goods_attribute_info`;

CREATE TABLE `goods_attribute_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attr_id` bigint(20) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods_attribute_info` */

/*Table structure for table `goods_attribute_value` */

DROP TABLE IF EXISTS `goods_attribute_value`;

CREATE TABLE `goods_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL COMMENT '分',
  `price1` int(11) DEFAULT NULL,
  `picture` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods_attribute_value` */

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pid` bigint(20) DEFAULT '0',
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods_category` */

/*Table structure for table `goods_label` */

DROP TABLE IF EXISTS `goods_label`;

CREATE TABLE `goods_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `goods_label` */

/*Table structure for table `merchant_info` */

DROP TABLE IF EXISTS `merchant_info`;

CREATE TABLE `merchant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_name` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `address` varchar(256) COLLATE utf32_bin DEFAULT NULL,
  `remark` varchar(512) COLLATE utf32_bin DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf32_bin DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) COLLATE utf32_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf32_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf32_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf32_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

/*Data for the table `merchant_info` */

/*Table structure for table `merchant_label` */

DROP TABLE IF EXISTS `merchant_label`;

CREATE TABLE `merchant_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `merchant_label` */

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `short_title` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL COMMENT '分类',
  `is_vedio` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '是否视频',
  `special` bigint(11) DEFAULT NULL COMMENT '所属专题',
  `cover` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `summary` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `tag` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `source` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '来源',
  `is_top` varchar(10) COLLATE utf8_bin DEFAULT '0',
  `top_days` int(11) DEFAULT NULL COMMENT '固顶时间',
  `is_recommend` varchar(10) COLLATE utf8_bin DEFAULT '0' COMMENT '是否添加到首页推荐',
  `is_bill` varchar(10) COLLATE utf8_bin DEFAULT '1' COMMENT '是否收费',
  `bill` int(11) DEFAULT NULL COMMENT '费用',
  `is_comment` varchar(10) COLLATE utf8_bin DEFAULT '1' COMMENT '是否可以评论',
  `author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_bin DEFAULT '1' COMMENT '状态值0，暂存 1已发送 2删除',
  `city` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`short_title`,`type`,`is_vedio`,`special`,`cover`,`summary`,`content`,`tag`,`source`,`is_top`,`top_days`,`is_recommend`,`is_bill`,`bill`,`is_comment`,`author`,`state`,`city`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'习近平同中央政治局常委集体瞻仰中共一大会址',NULL,1,NULL,NULL,NULL,'习近平同中央政治局常委集体瞻仰中共一大会址','<p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">&nbsp;&nbsp;两天七省市省级党委书记调整&nbsp;交接时省委书记说了啥？</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　十九大闭幕之后的首个双休日，广东、福建、河北、辽宁、上海、江苏、陕西等七省市省级党委书记先后调整。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　新华社北京10月28日消息，日前，中共中央决定：胡春华同志不再兼任广东省委书记、常委、委员职务；李希同志兼任广东省委委员、常委、书记，不再兼任辽宁省委书记、常委、委员职务。尤权同志不再兼任福建省委书记、常委、委员职务，于伟国同志任福建省委书记。赵克志同志不再担任河北省委书记、常委、委员职务，另有任用；王东峰同志任河北省委委员、常委、书记。陈求发同志任辽宁省委书记。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　新华社10月29日消息，日前，中共中央决定：韩正同志不再兼任上海市委书记、常委、委员职务；李强同志兼任上海市委委员、常委、书记，不再兼任江苏省委书记、常委、委员职务。娄勤俭同志任江苏省委委员、常委、书记，不再担任陕西省委书记、常委、委员职务。胡和平同志任陕西省委书记。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>七省市省级党委书记调整</strong></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　（按任职发布时间排序，统计截至2017年10月30日）</p><p><img src=\"/ueditor/jsp/upload/image/20171031/1509437649073068658.jpg\" alt=\"\"/></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　随后，七省市先后召开领导干部大会，宣布中共中央决定。会上，新任省委书记和上一任省委书记纷纷发言。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>广东</strong></p><p><img src=\"/ueditor/jsp/upload/image/20171031/1509437649090071267.jpg\" alt=\" 10月28日，胡春华同志和李希同志在广东省领导干部会议上亲切握手。\"/></p><p><span class=\"img_descr\" style=\"line-height: 20px; display: inline-block; zoom: 1; color: rgb(102, 102, 102); padding: 15px 0px 0px; margin: 5px auto; font-size: 14px;\">&nbsp; &nbsp;10月28日，胡春华同志和李希同志在广东省领导干部会议上亲切握手。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　胡春华：在广东工作是我人生一段难忘的经历。广东的干部讲政治、开拓进取意识强、抓市场经济的能力强、作风务实。五年来，我适应了广东，也喜欢上了广东，喜欢南岭的山、珠江的水，喜欢广东不仅不落叶而且繁花似锦的冬天。我将永远珍惜这段美好的温暖回忆，永远珍惜和大家在这些年里结下的情谊。衷心祝愿广东各项事业蓬勃发展，人民生活更加幸福安康，相信在以习近平同志为核心的党中央坚强领导下，广东一定能够按照习近平总书记对广东工作作出的“四个坚持、三个支撑、两个走在前列”重要批示要求，在全面建成小康社会、加快建设社会主义现代化新征程上走在前列。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　李希：全省工作千头万绪，我们要做到纲举而目张。当前最重要的“纲”，最紧迫、最关键的任务就是认真学习宣传、贯彻落实党的十九大精神。学习贯彻党的十九大精神，要从省委班子做起，从我做起，从自己做起，以上率下，发挥带头表率作用。要坚定不移推进全面从严治党，坚决维护以习近平同志为核心的党中央权威和集中统一领导，深入学习贯彻习近平新时代中国特色社会主义思想，锲而不舍抓正风肃纪。要用“三个定位、两个率先”和“四个坚持、三个支撑、两个走在前列”总揽广东工作全局，在决胜全面建成小康社会、加快建设社会主义现代化新征程上走在前列，用广东的创造性实践，让习近平新时代中国特色社会主义思想在南粤大地落地生根、开花结果；用广东建设中国特色社会主义的生动实践和丰硕成果，有力地证明习近平新时代中国特色社会主义思想无往而不胜的强大真理力量、思想力量，改造客观世界、造福人民的磅礴实践力量。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>福建</strong></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　尤权：我在福建工作生活了近五年，光阴似箭，五年时光一闪而过。此时此刻就要离开福建的工作岗位，心中的不舍和感恩之情难以言表。福建人杰地灵，是习近平总书记工作过近18年的地方。我一生能够有幸在福建工作，在这块土地上贡献力量，是中央对我的信任，更是我的福分。这几年，我走遍了福建的所有市、县（市、区）和大多数乡镇，和同志们一起坦诚相待，互相支持，融洽共事，愉快相处，结下了深厚情谊。可以说，在福建工作的这几年，是我人生中难忘的一段岁月。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　于伟国：接过新的“接力棒”，我深感这是党中央对我的信任更是鞭策，深感责任重大。我将继续同大家一道，不忘初心、牢记使命，深入学习贯彻习近平新时代中国特色社会主义思想，以钉钉子精神做实做细做好各项工作；我将以中央对“关键少数”的严格要求约束自己，严格依法秉公用权，自觉接受各方监督；我将扑下身子、沉到一线、马上就办，紧紧依靠全省广大干部群众全力推进“机制活、产业优、百姓富、生态美”的新福建建设。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>河北</strong></p><p><img src=\"/ueditor/jsp/upload/image/20171031/1509437649102022962.jpg\" alt=\"\"/></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　10月28日，河北省委在石家庄召开全省领导干部会议。这是会后赵克志同志和王东峰同志亲切握手。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　赵克志：回首在河北工作两年零3个月的日日夜夜，我深深感到，党的十八大以来，以习近平同志为核心的党中央坚持党要管党、从严治党，励精图治、砥砺奋进，营造了干事创业的大环境，特别是总书记对河北知之深、爱之切，对燕赵大地、对河北人民充满深情，多次视察河北并发表重要讲话，多次作出重要指示，给了我们极大的关怀、有力的指引、强大的力量。我深深感到，河北人民勤劳淳朴、真诚善良、重情尚义、可敬可爱，河北的干部队伍讲政治、顾大局、讲责任、敢担当，河北的领导班子忠诚坚定、团结战斗，河北老领导老同志对河北工作非常关心、大力支持。能够同大家共事，共同为河北发展努力，共同为河北人民服务，我感到非常荣幸、非常自豪，从中汲取的丰厚营养、经受的诸多磨炼，将使我终身受益。在河北工作期间，我对这里的山山水水产生了很深的感情，与这里的干部群众结下了深厚的友谊。河北也是我的家乡故土，河北人民是我的父老乡亲。两年河北人，一生河北情。虽然我就要离开河北工作了，但深深铸就的“燕赵底色”永远不会改变，蕴藏内心的“河北情结”永远不会改变。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　王东峰：我作为河北省委主要负责人，自己要切实担负起管党治党第一责任人责任，牢固树立和自觉践行“四个意识”，坚定维护党的集中统一领导和党中央权威，不折不扣贯彻落实党中央决策部署，严守政治纪律和政治规矩，带头严格落实中央八项规定精神和廉政各项规定，管住自己、管住亲属、管住身边工作人员，自觉接受广大干部群众和社会各界的监督，并恳请大家多监督、多批评、多帮助，自觉经受考验，与同志们一道努力工作，担当担责，拼搏奋进，为建设经济强省、美丽河北和实现“两个一百年”奋斗目标、实现中华民族伟大复兴中国梦而努力奋斗。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>辽宁</strong></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　陈求发：中央决定由我接任省委书记，深感任务艰巨、责任重大、使命光荣。我将倍加珍惜中央的信任和重托，倍加珍惜全省干部群众的厚爱和期望，决心在以习近平同志为核心的党中央坚强领导下，紧紧依靠省委一班人的团结共事，依靠四大班子的同心协力，依靠老领导老同志的关心支持，依靠4300万辽宁人民的智慧和力量，接好辽宁振兴发展薪火相传的“接力棒”，始终保持干事创业的激情，坚持一张好的蓝图绘到底，不提不切实际的“空口号”，不做华而不实的表面文章，不搞大轰大嗡的政绩工程，以功成不必在我的境界和功成必须有我的担当，多做打基础、利长远的事情，为辽宁新一轮振兴发展贡献全部力量，不辜负以习近平同志为核心的党中央的期望和重托。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>上海</strong></p><p><img src=\"/ueditor/jsp/upload/image/20171031/1509437649115069121.jpg\" alt=\"十月二十九日上午，韩正和李强在上海市领导干部会议上。\"/><span class=\"img_descr\" style=\"line-height: 20px; display: inline-block; zoom: 1; color: rgb(102, 102, 102); padding: 15px 0px 0px; margin: 5px auto; font-size: 14px;\">十月二十九日上午，韩正和李强在上海市领导干部会议上。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　韩正：我生在上海、长在上海，长期工作生活在上海，熟悉这里的每一个地方，我深爱着上海人民，深深眷恋这座光荣的城市，亲身见证、经历和参与了上海的发展进步与变化，打心底里为上海的成就感到高兴，为上海的进步感到自豪。我深深感到，上海是全国的上海，在全国发展中具有特殊地位，上海工作责任重大。上海有今天的成就，归功于历届市委一棒接一棒、接续奋斗打下的坚实基础。自己能够有幸担负我们这座城市的领导重任，能够与同志们一起，为上海发展贡献一份力量，是党和人民给了我干事创业的舞台。真诚感谢大家长期以来的关心、支持和帮助，到了新的岗位以后，我会想念同志们、惦记着上海，尽力支持上海工作，衷心祝福上海的明天更好、人民生活更好。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　李强：以习近平同志为核心的党中央决定我到上海工作，是对我的巨大信任与厚爱。我将始终保持“一命而偻，再命而伛，三命而俯”的敬畏之心，以身作则、率先垂范，牢记为民宗旨、坚持勤政实干，带头学习贯彻习近平新时代中国特色社会主义思想，带头履行全面从严治党第一责任人责任，带头贯彻执行民主集中制，带头严守党纪党规和廉洁自律各项规定，带头坚决抵制和反对一切消极腐败现象，始终做到坚定清醒有为，以实际行动向党和人民交上一份合格的答卷。我在这里郑重声明，决不允许任何亲友和身边工作人员在上海图方便、求特权，如果有人打着我的旗号来办事，请大家一律不要理睬、一律不要帮忙、一律不要办理，对任何违法违规现象必须从严查处。恳请大家对我严格监督。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>江苏</strong></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　娄勤俭：打铁必须自身硬。作为江苏省委班子新的带头人，我将带头加强学习，带头真抓实干，带头发扬民主，带头廉洁自律，和大家一起，低调务实不张扬，撸起袖子加油干，努力创造实实在在的业绩，自觉接受同志们监督并恳请广大干部群众予以监督。</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　<strong>陕西</strong></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　胡和平：2015年到陕西工作后，便深深爱上了这片土地和这里的人民，从内心深处把陕西视为第二故乡，说陕西话、吼秦腔、唱陕北陕南民歌，以作为一个老陕而自豪。两年半来，我走遍了三秦大地的山山水水，几乎到过全省所有县区，与广大干部群众一道努力，一起见证了陕西发生的巨大变化。陕西是一个美丽神奇的地方，有勤劳质朴的人民，有美好灿烂的发展前景，在全国发展大局中居于重要地位，我深感责任重大、使命崇高。我一定倍加珍惜为陕西人民服务的机会，为陕西的发展恪尽职守、勤勉工作，一心一意当好人民公仆，千方百计为群众办实事、做好事、解难事。（姚茜）</p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; line-height: 2em; font-family: \">　　来源：中国共产党新闻网</p><p><br/></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2017-10-31 16:14:12',NULL,'2017-10-31 16:17:39');

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '评论人',
  `comment` varchar(4096) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shou_customer_id` bigint(20) DEFAULT NULL COMMENT '接收人id',
  `shou_create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '回复时间',
  `pid` bigint(50) DEFAULT NULL COMMENT '回复的该条评论的id',
  `like_num` bigint(50) DEFAULT NULL COMMENT '点赞数',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '删除状态',
  `flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '审核情况',
  `is_elite` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否精华',
  `attr0` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

/*Data for the table `news_comment` */

/*Table structure for table `news_ext` */

DROP TABLE IF EXISTS `news_ext`;

CREATE TABLE `news_ext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) DEFAULT NULL,
  `comment_num` int(11) DEFAULT '0' COMMENT '评论数',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数',
  `like_num` int(11) DEFAULT '0' COMMENT '点赞数',
  `collect_num` int(11) DEFAULT '0' COMMENT '收藏数',
  `browse_num` int(11) DEFAULT '0' COMMENT '浏览数',
  `attr0` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `news_ext` */

/*Table structure for table `news_option_info` */

DROP TABLE IF EXISTS `news_option_info`;

CREATE TABLE `news_option_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '需要参考数据字典收藏、分享等',
  `customer_id` bigint(20) DEFAULT NULL,
  `news_id` bigint(20) DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `news_option_info` */

/*Table structure for table `news_special` */

DROP TABLE IF EXISTS `news_special`;

CREATE TABLE `news_special` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `news_special` */

/*Table structure for table `news_type` */

DROP TABLE IF EXISTS `news_type`;

CREATE TABLE `news_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `pid` bigint(20) DEFAULT '0',
  `icon` bigint(20) DEFAULT NULL COMMENT '分类图标',
  `dir` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '分类目录',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `display` int(11) DEFAULT '0' COMMENT '排序值',
  `status` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '有效性',
  `is_static` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '是否静态化',
  `template` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '模板url',
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `news_type` */

insert  into `news_type`(`id`,`name`,`code`,`pid`,`icon`,`dir`,`remark`,`display`,`status`,`is_static`,`template`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'招工','zg',NULL,NULL,'aa','招工',23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'消息','msg',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sfb_consumer` */

DROP TABLE IF EXISTS `sfb_consumer`;

CREATE TABLE `sfb_consumer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `real_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_encrypt` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qq_no` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商家类型大于消费者',
  `flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weChat` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weChat_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `QQ` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qq_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weibo` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `weibo_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `balance` int(11) DEFAULT NULL COMMENT '余额',
  `insurance` int(11) DEFAULT NULL COMMENT '保险金',
  `credits` int(11) DEFAULT NULL COMMENT '信用',
  `cash` int(11) DEFAULT NULL COMMENT '返现金额不可提现',
  `rate_per` int(11) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

/*Data for the table `sfb_consumer` */

insert  into `sfb_consumer`(`id`,`account`,`name`,`real_name`,`password`,`is_encrypt`,`mobile`,`email`,`qq_no`,`birthday`,`type`,`flag`,`pic`,`weChat`,`weChat_name`,`QQ`,`qq_name`,`weibo`,`weibo_name`,`balance`,`insurance`,`credits`,`cash`,`rate_per`,`add_user`,`add_time`,`update_user`,`update_time`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`) values (6,'3434','34',NULL,'34',NULL,'34',NULL,NULL,NULL,'1',NULL,'images/new.jpg','test',NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,'2017-11-03 11:10:45',NULL,NULL,'34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sfb_expense_info` */

DROP TABLE IF EXISTS `sfb_expense_info`;

CREATE TABLE `sfb_expense_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consumer_id` bigint(20) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '消费类型',
  `money` int(11) DEFAULT NULL COMMENT '消费金额',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '在哪个商家消费',
  `order_id` bigint(20) DEFAULT NULL,
  `kind` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '消费种类：积分、现金、卡',
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `sfb_expense_info` */

/*Table structure for table `sfb_order_info` */

DROP TABLE IF EXISTS `sfb_order_info`;

CREATE TABLE `sfb_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `ammount` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `flag` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `sfb_order_info` */

/*Table structure for table `sfb_order_line_info` */

DROP TABLE IF EXISTS `sfb_order_line_info`;

CREATE TABLE `sfb_order_line_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `commodity_id` bigint(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `sfb_order_line_info` */

/*Table structure for table `wechat_menu` */

DROP TABLE IF EXISTS `wechat_menu`;

CREATE TABLE `wechat_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `btn_key` varchar(30) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `app_id` varchar(50) DEFAULT NULL,
  `pagepath` varchar(128) DEFAULT NULL,
  `pid` bigint(11) DEFAULT '0',
  `attr0` varchar(128) DEFAULT NULL,
  `attr1` varchar(128) DEFAULT NULL,
  `attr2` varchar(128) DEFAULT NULL,
  `attr3` varchar(128) DEFAULT NULL,
  `attr4` varchar(128) DEFAULT NULL,
  `attr5` varchar(128) DEFAULT NULL,
  `attr6` varchar(128) DEFAULT NULL,
  `attr7` varchar(128) DEFAULT NULL,
  `attr8` varchar(128) DEFAULT NULL,
  `attr9` varchar(128) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `btn_key` (`btn_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `wechat_menu` */

insert  into `wechat_menu`(`id`,`name`,`type`,`btn_key`,`url`,`app_id`,`pagepath`,`pid`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'注册','view','adf','','','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'登录','view','343434','http://www.chuizhijiaoyu.com/cdz/admin/cdz/weixin/scanCode.htm','','',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'个人中心','view','3223232323','','','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `wechat_setting` */

DROP TABLE IF EXISTS `wechat_setting`;

CREATE TABLE `wechat_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `appid` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `secret` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `mch_id` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `mch_key` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `alipay_id` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `alipay_key` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `bd_id` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `bd_key` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `wechat_setting` */

insert  into `wechat_setting`(`id`,`company`,`appid`,`token`,`secret`,`mch_id`,`mch_key`,`alipay_id`,`alipay_key`,`bd_id`,`bd_key`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'郑州垂直',NULL,'asdf','sadf','','','','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_attachment` */

DROP TABLE IF EXISTS `windy_attachment`;

CREATE TABLE `windy_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attachment_type` varchar(10) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL COMMENT '业务尖',
  `name` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` varchar(20) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr0` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr1` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr2` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr3` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr4` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr5` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr6` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr7` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr8` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  `attr9` varchar(128) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `windy_attachment` */

/*Table structure for table `windy_data_permission` */

DROP TABLE IF EXISTS `windy_data_permission`;

CREATE TABLE `windy_data_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `permission` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_data_permission` */

/*Table structure for table `windy_item` */

DROP TABLE IF EXISTS `windy_item`;

CREATE TABLE `windy_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_item` */

insert  into `windy_item`(`id`,`name`,`code`,`type`,`value`,`remark`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (18,'菜单有效性','1','menu_flag','1','有效',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'菜单有效性','0','menu_flag','0','无效',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'是否弹窗-弹出窗口添加','1','add_is_dialog','1','是弹窗',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'是否弹窗-弹出窗口添加','0','add_is_dialog','0','非弹窗',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'是否管理组织','0','org_is_use','0','不管理组织',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'是否管理组织','1','org_is_use','1','管理组织',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'view','view','btn_type','view','查看网页',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'首页轮播图','0','ad_info','0','首页轮播图',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'页面插播','1','ad_info','1','页面插播',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'广告内容','0','ad_content','0','广告内容',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'外部链接','1','ad_content','1','外部链接',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'不打开链接','-1','ad_content','-1','不打开链接',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'商家帮用户类型','usertype','usertype','1','普通用户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'商家帮用户类型','usertype','usertype','2','商户',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_menu` */

DROP TABLE IF EXISTS `windy_menu`;

CREATE TABLE `windy_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pid` bigint(20) unsigned zerofill DEFAULT NULL,
  `flag` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `data_permission` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_menu` */

insert  into `windy_menu`(`id`,`name`,`icon`,`type`,`url`,`pid`,`flag`,`data_permission`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'系统管理','fa-list',NULL,'#',00000000000000000000,'1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'菜单管理','fa-list','1','menu/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'字典管理','fa-list',NULL,'item/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'角色管理','fa-list','1','role/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'组织管理','fa-list','1','org/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'用户管理','fa-list','1','user/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'系统设置','fa-list','1','setting/list.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'微信公众号设置','fa-list','1','#',00000000000000000000,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'微信基本信息设置','fa-list','1','weChat/setting/add.htm?cmd=0',00000000000000000012,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'公众号菜单','fa-list','1','weChat/menu/list.htm',00000000000000000012,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'商家帮','fa-list','1','#',00000000000000000000,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'顾客（消费者）管理','fa-list','1','sfb/consumer/list.htm?type=1',00000000000000000015,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'商户管理','fa-list','1','sfb/consumer/list.htm?type=0',00000000000000000015,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'广告管理','fa-list','1','#',00000000000000000000,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'轮播图','fa-list','','ad/adInfo/list.htm',00000000000000000018,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'信息管理','fa-list','','#',00000000000000000000,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'信息列表','fa-list','','news/news/list.htm',00000000000000000020,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'分类管理','fa-list','','news/type/list.htm',00000000000000000020,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'清理缓存','fa-list','','cache/clear.htm',00000000000000000001,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_org` */

DROP TABLE IF EXISTS `windy_org`;

CREATE TABLE `windy_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `pid` bigint(20) unsigned zerofill DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_org` */

insert  into `windy_org`(`id`,`name`,`code`,`pid`,`remark`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'垂直公司','vertical',00000000000000000000,'1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_orgs_users` */

DROP TABLE IF EXISTS `windy_orgs_users`;

CREATE TABLE `windy_orgs_users` (
  `oid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  PRIMARY KEY (`oid`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_orgs_users` */

/*Table structure for table `windy_picture` */

DROP TABLE IF EXISTS `windy_picture`;

CREATE TABLE `windy_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_bin NOT NULL,
  `service_id` bigint(11) NOT NULL COMMENT '业务id',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_picture` */

/*Table structure for table `windy_role` */

DROP TABLE IF EXISTS `windy_role`;

CREATE TABLE `windy_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `data_permission` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_role` */

insert  into `windy_role`(`id`,`name`,`code`,`remark`,`data_permission`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'超级管理员','super',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_roles_menus` */

DROP TABLE IF EXISTS `windy_roles_menus`;

CREATE TABLE `windy_roles_menus` (
  `rid` bigint(20) NOT NULL,
  `mid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_roles_menus` */

insert  into `windy_roles_menus`(`rid`,`mid`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6);

/*Table structure for table `windy_setting` */

DROP TABLE IF EXISTS `windy_setting`;

CREATE TABLE `windy_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `short_name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `domain` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `record_number` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `add_is_dialog` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `org_is_use` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_setting` */

insert  into `windy_setting`(`id`,`name`,`short_name`,`domain`,`record_number`,`add_is_dialog`,`org_is_use`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'垂直后台管理系统','垂直后台','localhsot',NULL,'0','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_user` */

DROP TABLE IF EXISTS `windy_user`;

CREATE TABLE `windy_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `nick_name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `real_name` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `is_encrypt` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `birthday` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `flag` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `card_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `card_no` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `open_id` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `weChat_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `attr0` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr1` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr2` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr3` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr4` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr5` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr6` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr7` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr8` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `attr9` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `add_user` bigint(20) DEFAULT NULL,
  `add_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_user` */

insert  into `windy_user`(`id`,`account`,`name`,`nick_name`,`real_name`,`code`,`password`,`is_encrypt`,`mobile`,`email`,`qq`,`sex`,`birthday`,`flag`,`address`,`card_type`,`card_no`,`user_type`,`open_id`,`weChat_name`,`attr0`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`,`attr6`,`attr7`,`attr8`,`attr9`,`add_user`,`add_time`,`update_user`,`update_time`) values (1,'admin','admin','管理员','管理员','admin','admin','0','13523039627','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `windy_users_roles` */

DROP TABLE IF EXISTS `windy_users_roles`;

CREATE TABLE `windy_users_roles` (
  `uid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  PRIMARY KEY (`uid`,`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

/*Data for the table `windy_users_roles` */

insert  into `windy_users_roles`(`uid`,`rid`) values (1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
