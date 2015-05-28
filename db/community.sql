-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.20 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 community 的数据库结构
CREATE DATABASE IF NOT EXISTS `community` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `community`;


-- 导出  表 community.cm_comment 结构
CREATE TABLE IF NOT EXISTS `cm_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id,主键',
  `uid` bigint(20) NOT NULL COMMENT '评论用户的id',
  `pid` bigint(20) NOT NULL COMMENT '评论的帖子id',
  `content` text NOT NULL COMMENT '评论的内容',
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论的日期',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_comment 的数据：~15 rows (大约)
DELETE FROM `cm_comment`;
/*!40000 ALTER TABLE `cm_comment` DISABLE KEYS */;
INSERT INTO `cm_comment` (`id`, `uid`, `pid`, `content`, `createAt`) VALUES
	(2, 31232138, 3, '不知什么时候有得下载。。。', '2013-01-24 10:41:25'),
	(3, 31232138, 3, '吉姆·斯特加斯1993至1995年活跃于英国国立青音乐剧团，曾在曼城索尔福德大学主修媒体、音乐和表演。斯特加斯的表演事业起步于电视圈，也出演过一些广播剧，直到05年通过艾莲·佩奇主演的《嘴对嘴》中一个小角色才小范围地登上了大银幕', '2013-01-24 10:41:50'),
	(4, 31232138, 5, '<a href="http://baike.baidu.com/view/288447.htm"  target="_blank">莉莉·索博斯基</a>：生于纽约。父亲是个画家，母亲是作家，自幼接受艺术熏陶的气质不凡，一次在学校用餐时被星探发现，准备让其出演《造访吸血鬼》中的一角色，虽最终没有成功，但她却从此与演戏结下缘分。13岁时，她开始演出几部电视电影。她的银幕处女作是提姆·艾伦主演的《野蛮城市》，之后她在《天地大冲撞》中表现出明星潜质。', '2013-01-24 10:45:28'),
	(5, 31232138, 5, '<a href="http://baike.baidu.com/view/9202065.htm" target="_blank">爱德·斯托帕德</a>： 英国，伦敦', '2013-01-24 10:47:31'),
	(6, 31232141, 5, '好不好看？', '2013-01-26 22:20:40'),
	(8, 31232138, 8, '看起来像是。。。', '2013-02-01 18:10:07'),
	(14, 31232141, 19, '不错。<img src="http://localhost:8080/community/kindeditor/plugins/emoticons/images/13.gif" border="0" alt="" />', '2013-02-08 19:19:44'),
	(15, 31232138, 19, '<p>\n	评论？\n</p>', '2013-02-23 22:14:13'),
	(17, 31232145, 23, '<img src="/community/kindeditor/attached/image/20130224/20130224223312_434.jpg" alt="" />', '2013-02-24 22:33:13'),
	(18, 31232145, 23, '<img src="http://ww2.sinaimg.cn/bmiddle/62f87eb4tw1e24uwucxtpj.jpg" /><br />', '2013-02-24 22:33:43'),
	(20, 31232146, 20, '测试。', '2013-02-28 00:13:51'),
	(24, 31232138, 6, '还没看过呢。。', '2013-03-04 23:01:44'),
	(25, 31232155, 30, '&nbsp;&nbsp;&nbsp;&nbsp;痞子蔡和九把刀很适合作为台湾青春文学领域年龄分界标杆。在QQ刚刚开始兴起的时候，使用的人数算不得多，但光是叫轻舞飞扬的就有几十页，更不消说痞气甲乙丙丁，一时间半个QQ都在为《第一次亲密接触》的这对爱侣祭奠，可见痞子蔡作品的传播力之强。&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;如今距离我最后一次读他的小说已经过去了14年，这14年中蔡智恒变成了教书先生，他笔下的故事倒是从一而终，一直轻松温馨。他笔下的人物也都活在最美好的年华，无忧无虑，最大的困惑不过是关于情爱的迷思，好像时钟在他的虚拟世界里停止了运动。人还在成长，心却永远青春。&nbsp;', '2014-04-21 14:03:20'),
	(26, 31232156, 29, '123', '2015-05-12 10:51:43'),
	(28, 31232138, 31, '123', '2015-05-18 12:20:49'),
	(34, 31232138, 30, '1', '2015-05-26 14:38:33'),
	(35, 31232138, 30, '3', '2015-05-26 14:38:34'),
	(36, 31232138, 30, '2', '2015-05-26 14:38:38'),
	(37, 31232138, 30, '4', '2015-05-26 14:38:41'),
	(38, 31232138, 30, '6', '2015-05-26 14:38:47'),
	(39, 31232138, 30, '7', '2015-05-26 14:38:50'),
	(40, 31232138, 30, '8', '2015-05-26 14:38:54'),
	(41, 31232138, 30, '9', '2015-05-26 14:38:57'),
	(42, 31232138, 30, '10', '2015-05-26 14:39:01'),
	(43, 31232138, 30, '11', '2015-05-26 14:39:03'),
	(44, 31232138, 30, '12', '2015-05-26 14:39:06'),
	(45, 31232138, 30, '13', '2015-05-26 14:39:09'),
	(46, 31232138, 30, '14', '2015-05-26 14:39:12'),
	(47, 31232138, 30, '15', '2015-05-26 14:39:15'),
	(48, 31232138, 30, '16', '2015-05-26 14:39:20'),
	(49, 31232138, 30, '17', '2015-05-26 14:39:24'),
	(50, 31232156, 39, '<span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19.4400005340576px;background-color:#FFFFFF;">看着像敬一丹退休前的一本回忆录，可能由于年龄差距，对里面的内容共鸣不大，而且感觉内容也不够深刻</span>', '2015-05-27 10:38:11');
/*!40000 ALTER TABLE `cm_comment` ENABLE KEYS */;


-- 导出  表 community.cm_group 结构
CREATE TABLE IF NOT EXISTS `cm_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '群组id，主键',
  `name` char(40) NOT NULL COMMENT '群组名称',
  `description` text NOT NULL,
  `creator` bigint(20) NOT NULL COMMENT '群组创建者',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建群组时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_group 的数据：~9 rows (大约)
DELETE FROM `cm_group`;
/*!40000 ALTER TABLE `cm_group` DISABLE KEYS */;
INSERT INTO `cm_group` (`id`, `name`, `description`, `creator`, `createdAt`) VALUES
	(10, '电影', '电影社群提供最新的电影介绍及评论包括上映影片的影讯查询及购票服务。你可以记录想看、在看和看过的电影电视剧,顺便打分、写影评。', 31232138, '2013-01-19 17:25:45'),
	(11, '读书', '记录你读过的、想读和正在读的书,顺便打分,添加标签及个人附注,写评论。根据你的口味,豆瓣会推荐适合的书给你。', 31232138, '2013-01-19 17:30:06'),
	(12, '音乐', '记录你想听的、在听和听过的唱片,顺便打分、添加标签及个人附注、写评论。根据你的口味,豆瓣会推荐适合的唱片给你。', 31232138, '2013-01-19 17:30:06'),
	(13, '摄影', '把日常生活中稍纵即逝的平凡事物转化为不朽的视觉图像。', 31232138, '2013-02-08 18:20:06'),
	(14, '午夜', '恐怖。', 31232146, '2013-02-28 00:16:41'),
	(15, '六年五班', '2003，六年五班。 现在，2013', 31232138, '2013-03-04 20:25:23'),
	(16, '最近看的书', '最近看的书是？想看书，不知道哪一本？', 31232155, '2014-04-21 13:55:41'),
	(17, '逗比肖敏', '肖敏必须是逗比', 31232138, '2015-05-18 14:26:41'),
	(18, '美图', '分享美图', 31232138, '2015-05-18 18:49:01');
/*!40000 ALTER TABLE `cm_group` ENABLE KEYS */;


-- 导出  表 community.cm_message 结构
CREATE TABLE IF NOT EXISTS `cm_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '私信id，主键',
  `sender` bigint(20) NOT NULL COMMENT '私信发送者 ',
  `receiver` bigint(20) NOT NULL COMMENT '私信接受者',
  `content` text NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cm_message';

-- 正在导出表  community.cm_message 的数据：~0 rows (大约)
DELETE FROM `cm_message`;
/*!40000 ALTER TABLE `cm_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_message` ENABLE KEYS */;


-- 导出  表 community.cm_post 结构
CREATE TABLE IF NOT EXISTS `cm_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '帖子id，主键',
  `uid` bigint(20) NOT NULL COMMENT '帖子发布者',
  `gid` bigint(20) NOT NULL COMMENT '所属群组id',
  `title` tinytext NOT NULL COMMENT '帖子标题',
  `tags` varchar(50) NOT NULL DEFAULT '',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `viewCount` int(11) NOT NULL DEFAULT '0' COMMENT '帖子查看次数',
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '帖子发布时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_post 的数据：~19 rows (大约)
DELETE FROM `cm_post`;
/*!40000 ALTER TABLE `cm_post` DISABLE KEYS */;
INSERT INTO `cm_post` (`id`, `uid`, `gid`, `title`, `tags`, `content`, `viewCount`, `createAt`) VALUES
	(2, 31232138, 10, '007：大破天幕杀机的剧情简介', '007', '数月前军情六处一块记载了潜伏于全世界恐怖组织内部所有特工名单信息的硬盘丢失，而追索硬盘的行动也以失败告终。在此之后，行动主要负责人M（朱迪·丹奇 Judi Dench 饰）被高层解雇，而军情六处也遭到惨烈的袭击，伤亡惨重。为了查到幕后真凶，M召来佯死的传奇特工詹姆士·邦德（丹尼尔·克雷格 Daniel Craig 饰）。经过一轮严苛的特训和测试，邦德重新服役。在伊芙（娜奥米·哈里斯 Naomie Harris 饰）和新搭档Q（本·卫肖 Ben Whishaw 饰）的协助下，邦德追寻着某前CIA特工的踪迹来到繁华大都会上海。\r\n　　在这一过程中，特工的名单不断泄露，而邦德最新一次的生死冒险也拉开序幕……   ', 19, '2014-02-20 18:23:18'),
	(3, 31232139, 10, '云图', '科幻', '1850年，南太平洋，美国公证人亚当·尤因（吉姆·斯特吉斯 Jim Sturgess 饰）在船上被不明寄生虫病折磨，他用日记记录下自己所见所闻；1931年，苏格兰，落魄青年罗伯特·弗罗比舍（本·卫肖 Ben Whishaw 饰）为音乐大师记录曲谱，受到半本旅行日记的启发创作出了恢宏壮阔的《云图六重奏》；1975年，美国加州，小报记者路易莎·雷（哈莉·贝瑞 Halle Berry 饰）冒着生命危险调查一桩核电站丑闻，在老唱片店她被一首不知名的乐章打动；2012年，英国伦敦，被囚禁在养老院的出版商蒂莫西·卡文迪什（吉姆·布劳德本特 Jim Broadbent 饰）揣着一叠由女记者写成的纪实文学，打算将自己的“越狱经历”拍成电影；乌托邦未来，首尔，餐厅服务员克隆人星美-451（裴斗娜 Doona Bae 饰）开始形成自我意识和反抗人类，她在人类图书馆看了一部飞跃老人院的电影；文明毁灭后的未来，夏威夷，牧羊土着扎克里（汤姆·汉克斯 Tom Hanks 饰）对高科技文明的先知心怀敌意，他的部落唯一相信的女神叫星美……\n　　不同的人物、场景和事件在时空中更迭变幻，不变的是每个主角身上都带有彗星形状的胎记。它像亘古灵魂的烙印，将人性中的反抗精神代代延续，最终织成一幅浩瀚璀璨的云图。', 62, '2014-02-22 22:59:33'),
	(4, 31232140, 11, '我的父亲母亲', '诺贝尔;文学', '诺贝尔文学奖得主多丽丝•莱辛封笔之作\n\n在本书中，莱辛给她的父母送上了一份最非凡的礼物：他们本可以拥有的人生。除却愤怒和不动感情的明晰，还奉上了她作品中不常显露的东西：宽容和慈悲。——《纽约时报》\n\n通过让读者深切体味自传与虚构、形式与内容的关联，她再次肯定了小说的力量和可能性。——《华盛顿邮报》\n\n细致入微的观察，充满嘲弄的机智……虚构和回忆的非凡联姻诞下的迷人、惆怅和悲伤之作。——《书单》\n\n莱辛对于狼狈挫败的真实人生的偏爱一如既往地明显……和她以前的作品一样令人振奋，引人入胜。——《科克斯书评》\n\n耄耋之年的莱辛回望父母，用笔墨为他们编织了一段如意人生。没有一战。父母未相恋，亦未结合。父亲如愿成为一名农场主，在太平富庶中度过了一生。母亲放弃上大学的机会，跑去伦敦当了“给穷人洗屁股”的护士，职场顺遂，后觅得金龟婿，未几成为寡妇，最终重拾年轻时的风采，开创了一番事业。\n\n而在真实的世界里，父亲在一战中失去了一条腿，于伤兵医院结识了做护士的母亲。怀着开创新生活的希望，他们先赴波斯，后又携儿带女到了非洲南部的罗得西亚，在那里度过了生命中的大半时光。没有板球比赛，没有风光的职业生涯，有的只是战后殖民地丛林中的荒蛮窘迫……', 86, '2014-02-22 23:03:53'),
	(5, 31232138, 10, '莫斯科2017 Branded (2012)', '苏联', '旧体制垮台，庞大的苏联成为若日黄花。在时代变革的大潮下，历史学系毕业生米沙·盖尔金（爱德·斯托帕德 Ed Stoppard 饰）在工作中发现了自己的广告创意才能，他涉足这一全新领域，经美国人鲍勃·吉本斯（杰弗里·塔伯 Jeffrey Tambor 饰）的拉拢进入美俄广告公司。经过近20年的打拼，他逐渐成为业内响当当的人物，虽然始终不能正式成为公司的合伙人，但他与鲍勃美丽的侄女艾比（莉莉·索伯斯基 Leelee Sobieski 饰） 陷入爱河，不能自拔。在一次失败的广告策划之后，米沙的事业和爱情双双跌入谷底。曾经风光的他，从没想到自己会成为他人营销策略的棋子，也深刻意识到曾引以为傲的营销才能给自己和他人带来多么大的危害。\n　　六年后的2017年，世界发生天翻地覆的变化，而隐居荒野的米沙注定无法平凡了却此生……   ', 56, '2014-02-24 10:44:00'),
	(6, 31232142, 10, '少年派的奇幻漂流', '李安;印度', '少年派的奇幻漂流的剧情简介   · · · · · · \n　　故事开始于蒙特娄，也结束于蒙特娄。一名在找寻灵感的作家（拉菲·斯波 Rafe Spall 饰）无意间得知派·帕帖尔（伊尔凡·可汗 Irrfan Khan 饰）的传奇故事。派的父亲（阿迪勒·侯赛因 Adil Hussain 饰）开了一家动物园。因这样特殊的生活环境，少年派（苏拉·沙玛 Suraj Sharma 饰 ）对信仰与人的本性自有一套看法。在派17岁那一年，他的父母决定举家移民加拿大以追求更好的生活，而他也必须离开他的初恋情人。在前往加拿大的船上，他们遇见一位残忍成性的法国厨师（杰拉尔·德帕迪约 Gérard Depardieu 饰）。当天深夜在茫茫大海中，原本令派感到刺激无比的暴风雨一瞬间就成了吞噬货船的大灾难。派却奇迹般地活了下来，搭着救生船在太平洋上漂流，而且有一名最令人意想不到的同伴——理查德·帕克，一只孟加拉老虎。神奇的冒险旅程就这样意外开始了……　', 189, '2014-02-26 23:29:29'),
	(8, 31232138, 10, '一代宗师', '叶问;咏春', '　　广东佛山人叶问（梁朝伟 饰），年少时家境优渥，师从咏春拳第三代传人陈华顺学习拳法，师傅“一条腰带一口气”的告诫，支持他走过兵荒马乱、朝代更迭的混乱年代。妻子张永成（宋慧乔 饰）泼辣干练，二人夫唱妇随，琴瑟合壁。\n　　1936年，佛山武术界乱云激荡。八卦拳宗师宫羽田（王庆祥 饰）年事已高，承诺隐退。其所担任的中华武士会会长职位，自然引起武林高手的关注与觊觎。包括宫羽田的独生女宫二（章子怡 饰）在内，白猿马三（张晋 饰）、关东之鬼丁连山（赵本山 饰）、咏春叶问等高手无不将目光聚焦在正气凛然的宫羽田身上。拳有南北，国有南北乎？最有德行之人才堪会长重任，然这浮世虚名却引得无数迷乱之人狂醉奔忙，浪掷残生。生逢乱世，儿女情长埋藏心底，被冷若寒冰的车轮碾作碎泥…… ', 17, '2014-02-28 21:44:41'),
	(15, 31232138, 10, '百星酒店的剧照', '贺岁片', '<p>\n	<img src="http://img3.douban.com/view/photo/photo/public/p1858492603.jpg" alt="" />\n</p>\n<p>\n	郑中基\n</p>', 89, '2014-03-06 22:43:15'),
	(19, 31232141, 13, '我的新作《1314号电车》PS+SAI绘制', '手绘', '<img src="http://localhost:8080/community/kindeditor/attached/image/20130208/20130208191349_384.jpg" alt="" /><span></span>\n<p>\n	<span style="font-family:宋体;font-size:14px;line-height:24px;"><br />\n</span>\n</p>\n<p>\n	<span style="font-family:宋体;font-size:14px;line-height:24px;"><img src="http://localhost:8080/community/kindeditor/attached/image/20130208/20130208191433_771.jpg" alt="" /><br />\n</span>\n</p>\n<p>\n	<span style="font-family:宋体;font-size:14px;line-height:24px;"><img src="http://localhost:8080/community/kindeditor/attached/image/20130208/20130208191506_853.jpg" alt="" /><br />\n</span>\n</p>\n<p>\n	<span style="font-family:宋体;font-size:14px;line-height:24px;"><img src="http://localhost:8080/community/kindeditor/attached/image/20130208/20130208191525_408.jpg" alt="" /><br />\n</span>\n</p>\n<p>\n	<span style="font-family:宋体;font-size:14px;line-height:24px;">我的新作《1314号电车》PS+SAI绘制</span>\n</p>', 15, '2014-03-08 19:19:18'),
	(20, 31232145, 10, '西游降魔篇 (2013)', '周星驰;文章', '<h2 style="font-size:15px;font-weight:normal;font-family:Arial, Helvetica, sans-serif;color:#007722;background-color:#FFFFFF;">\n	西游降魔篇的剧情简介 &nbsp; ·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;\n</h2>\n<p>\n	<span class="all hidden">　　大唐年间妖魔横行，一小渔村因为饱受鱼妖之害请来道士（冯勉恒 饰）除妖，年轻驱魔人陈玄奘（文章 饰）前来帮忙却被误认为骗子，幸亏职业赏金驱魔人段小姐（舒淇 饰）帮助玄奘制服了鱼妖真身（李尚正 饰）。二人又在高家庄为制服猪妖猪刚鬣（陈炳强 饰） 而再次相遇，这次除妖没有成功 ，但是段小姐却对玄奘二见钟情。玄奘求助师父，得知除妖的办法是去找被压在五指山下的孙悟空（黄渤 饰）帮忙，于是他准备前往五指山，途中又遇到段小姐和手下五煞，段小姐连蒙带哄想与玄奘在一起却屡次遭拒，在四妹（周秀娜 饰）调教下想变得更有女人味却适得其反。二人决裂后玄奘独自上路，与此同时降魔师（释延能 饰）、天残脚（张超理 饰）、空虚公子（罗志祥 饰）也一同前往除妖。经过千辛万苦玄奘终于找到孙悟空，段小姐又再次出现并交给玄奘一件重要的东西，猪妖终于被降服，但是更大的危机又出现在了玄奘面前，原来孙悟空与传闻中不一样，玄奘的除魔之路能否继续？<br />\n</span>\n	<p>\n		<span class="all hidden">　　本片是周星驰多年之后的力作，演员阵容延续了以往，除了主演外，还请了诸如卢正雨、杨迪等网络红人加盟。</span>　<br />\n<img src="http://img3.douban.com/view/photo/photo/public/p1837865195.jpg" alt="" />\n	</p>\n	<p>\n		<br />\n	</p>\n</p>', 15, '2014-03-24 22:20:49'),
	(21, 31232145, 10, '霍比特人1：意外之旅 The Hobbit: An Unexpected Journey (2012)', '科幻;西方神话', '<span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19px;background-color:#FFFFFF;">根据英国作家J.R.R·托尔金1937年出版的同名长篇小说改编。又名《哈比特人历险记》或《去而复返-一个霍比特人的故事》。（原著中由比尔博本人亲自撰写。）<br />\n　　因此书而延伸出的《 魔戒 》和其后的故事，托尔金因此一举成名。<br />\n　　故事讲述记述霍比特人比尔博.巴金斯与巫师甘道夫和十三名矮人向东旅行横越中土大陆，寻找被恶龙抢占的属于矮人珍贵宝物的探险故事。</span><span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19px;background-color:#FFFFFF;">&nbsp;</span>', 5, '2014-02-24 22:22:09'),
	(22, 31232145, 10, '霍比特人', '科幻;西方神话', '<p>\n	<span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19px;background-color:#FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据英国作家J.R.R·托尔金1937年出版的同名长篇小说改编。又名《哈比特人历险记》或《去而复返-一个霍比特人的故事》。</span>\n</p>\n<p>\n	<span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19px;background-color:#FFFFFF;"><img src="http://img3.douban.com/view/photo/photo/public/p1716664799.jpg" alt="" /><br />\n</span>\n</p>', 15, '2014-03-24 22:23:37'),
	(23, 31232145, 10, '西游降魔篇 (2013)', '周星驰;文章', '<h2 style="font-size:15px;font-weight:normal;font-family:Arial, Helvetica, sans-serif;color:#007722;background-color:#FFFFFF;">\n	西游降魔篇的剧情简介 &nbsp; ·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;\n</h2>\n<p>\n	<span class="all hidden">　　大唐年间妖魔横行，一小渔村因为饱受鱼妖之害请来道士（冯勉恒 饰）除妖，年轻驱魔人陈玄奘（文章 饰）前来帮忙却被误认为骗子，幸亏职业赏金驱魔人段小姐（舒淇 饰）帮助玄奘制服了鱼妖真身（李尚正 饰）。二人又在高家庄为制服猪妖猪刚鬣（陈炳强 饰） 而再次相遇，这次除妖没有成功 ，但是段小姐却对玄奘二见钟情。玄奘求助师父，得知除妖的办法是去找被压在五指山下的孙悟空（黄渤 饰）帮忙，于是他准备前往五指山，途中又遇到段小姐和手下五煞，段小姐连蒙带哄想与玄奘在一起却屡次遭拒，在四妹（周秀娜 饰）调教下想变得更有女人味却适得其反。二人决裂后玄奘独自上路，与此同时降魔师（释延能 饰）、天残脚（张超理 饰）、空虚公子（罗志祥 饰）也一同前往除妖。经过千辛万苦玄奘终于找到孙悟空，段小姐又再次出现并交给玄奘一件重要的东西，猪妖终于被降服，但是更大的危机又出现在了玄奘面前，原来孙悟空与传闻中不一样，玄奘的除魔之路能否继续？<br />\n</span>\n	<p>\n		<span class="all hidden">　　本片是周星驰多年之后的力作，演员阵容延续了以往，除了主演外，还请了诸如卢正雨、杨迪等网络红人加盟。</span>　\n	</p>\n	<p>\n		<img src="http://img3.douban.com/view/photo/photo/public/p1837865195.jpg" alt="" />\n	</p>\n	<p>\n		<br />\n	</p>\n</p>', 39, '2014-03-24 22:24:29'),
	(24, 31232146, 14, '各种诡异的图片，让你恐慌!。。。。。。', '诡异', '<img src="/community/kindeditor/attached/image/20130228/20130228002551_187.gif" alt="" />', 39, '2014-03-28 00:25:56'),
	(25, 31232139, 14, '测试标签', '测试;标签', '测试内容', 50, '2014-03-03 18:33:51'),
	(26, 31232138, 10, '钢铁侠', '人气', '钢铁侠3', 10, '2014-04-03 12:59:24'),
	(27, 31232138, 10, '魔警 (2014)', '悬疑;张家辉; 2014;犯罪;香港;吴彦祖;动作;剧情', '<div id="mainpic" class="" style="margin:3px 12px 0px 0px;padding:0px;text-align:center;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	<a class="nbgnbg" href="http://movie.douban.com/subject/20515977/photos?type=R"><img src="http://img3.douban.com/view/movie_poster_cover/spst/public/p2177928873.jpg" title="点击看更多海报" alt="魔警" /></a>\n</div>\n<p>\n	<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">导演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1275075/">林超贤</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">编剧</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1275435/">吴炜伦</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1275075/">林超贤</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">主演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1027502/">吴彦祖</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1037273/">张家辉</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1317102/">思漩</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1045364/">安志杰</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1274268/">廖启智</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1321559/">林嘉华</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1274575/">李国麟</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1275712/">欧锦棠</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">类型:</span>&nbsp;<span>动作</span>&nbsp;/&nbsp;<span>悬疑</span>&nbsp;/&nbsp;<span>惊悚</span>&nbsp;/&nbsp;<span>犯罪</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">制片国家/地区:</span>&nbsp;香港 / 中国大陆<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">语言:</span>&nbsp;汉语普通话 / 粤语<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">上映日期:</span>&nbsp;<span>2014-04-18(中国大陆/香港)</span>&nbsp;/&nbsp;<span>2014-02-08(柏林电影节)</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">片长:</span>&nbsp;<span>112分钟</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">又名:</span>&nbsp;逆警 / That Demon Within<br />\n	<p>\n		<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">IMDb链接:</span>&nbsp;<a href="http://www.imdb.com/title/tt3511542" target="_blank">tt3511542</a>\n	</p>\n	<p>\n		<h2 style="font-size:15px;font-weight:normal;font-family:Arial, Helvetica, sans-serif;color:#007722;background-color:#FFFFFF;">\n			魔警的剧情简介&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·&nbsp;&nbsp;·\n		</h2>\n		<div class="indent" id="link-report" style="margin:0px 0px 30px;padding:0px;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n			<span class="">　　王伟业（吴彦祖 饰）是香港警察中的另类，追求正义到了偏执的地步，在一次执勤中，无意间救了一个重伤垂危的人，最后却发现这个人居然是让整个香港警界都恨之入骨的“鬼王党”悍匪韩江（张家辉 饰）。&nbsp;<br />\n　　痊愈之后的韩江更加的猖狂，杀人劫掠无所顾忌，而王伟业的同事们却因为种种掣肘以致束手无策，这一切既让王伟业陷入了深深的自责中，也让他终于明白了自己要走的路，既然命运帮他做出了抉择，他只能以身入魔对抗鬼王，了结这场恩怨。&nbsp;<br />\n　　到底是要做一个好人还是大家眼中的好警察，命运给他开了一个玩笑，冥冥中却隐藏着更深的阴谋……</span><span style="font-family:\'sans serif\', tahoma, verdana, helvetica;line-height:1.5;"></span>\n		</div>\n	</p>\n</p>', 3, '2014-04-21 13:10:30'),
	(28, 31232138, 10, '美国队长2 Captain America: The Winter Soldier (2014)', 'Marvel;美国电影; 超级英雄;动作;2014;ChrisEvans; 美国;漫画改编', '<div id="mainpic" class="" style="margin:3px 12px 0px 0px;padding:0px;text-align:center;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	<a class="nbgnbg" href="http://movie.douban.com/subject/6390823/photos?type=R"><img src="http://img3.douban.com/view/movie_poster_cover/spst/public/p2174824694.jpg" title="点击看更多海报" alt="Captain America: The Winter Soldier" /></a>\n</div>\n<div id="info" style="margin:0px;padding:0px;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">导演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1321812/">安东尼·卢素</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1320870/">乔·卢素</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">编剧</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1276125/">克里斯托弗·马库斯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1276126/">斯蒂芬·麦克菲利</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">主演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1017885/">克里斯·埃文斯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1054453/">斯嘉丽·约翰逊</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1021985/">塞巴斯蒂安·斯坦</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1027217/">安东尼·麦凯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1000051/">海莉·阿特维尔</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1044902/">艾米丽·万凯普</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1053617/">罗伯特·雷德福</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1054408/">塞缪尔·杰克逊</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1000018/">寇碧·史莫德斯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1126747/">卡兰·马尔韦</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1100321/">弗兰克·格里罗</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1013888/">斯坦·李</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1107884/">托比·琼斯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1036466/">珍妮·艾加特</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1240853/">乔治·圣皮埃尔</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1036574/">盖瑞·山德林</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1067776/">阿兰·戴尔</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1036774/">黄经汉</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1324856/">阿德托库姆布斯·麦克马克</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1220708/">Dominic Rains</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">类型:</span>&nbsp;<span>动作</span>&nbsp;/&nbsp;<span>科幻</span>&nbsp;/&nbsp;<span>冒险</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">官方网站:</span>&nbsp;<a href="http://marvel.com/captainamerica" target="_blank">marvel.com/captainamerica</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">制片国家/地区:</span>&nbsp;美国<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">语言:</span>&nbsp;英语 / 法语<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">上映日期:</span>&nbsp;<span>2014-04-04(美国/中国大陆)</span>&nbsp;/&nbsp;<span>2014-03-13(美国首映)</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">片长:</span>&nbsp;<span>136分钟</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">又名:</span>&nbsp;美国队长2：冬日战士 / 美国队长2：酷寒战士(台) / 美国队长2：寒冬战士 / 美国队长：冬兵 / Captain America 2<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">IMDb链接:</span>&nbsp;<a href="http://www.imdb.com/title/tt1843866" target="_blank">tt1843866</a>\n</div>', 1, '2014-04-21 13:13:29'),
	(29, 31232138, 10, '超验骇客 Transcendence (2014)', '动作;惊悚', '<div id="mainpic" class="" style="margin:3px 12px 0px 0px;padding:0px;text-align:center;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	<a class="nbgnbg" href="http://movie.douban.com/subject/10810745/photos?type=R"><img src="http://img3.douban.com/view/movie_poster_cover/spst/public/p2178116605.jpg" title="点击看更多海报" alt="Transcendence" /></a>\n</div>\n<p>\n	<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">导演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1009551/">沃利·菲斯特</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">编剧</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1339385/">杰克·帕格恩</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">主演</span>:&nbsp;<a href="http://movie.douban.com/celebrity/1054456/">约翰尼·德普</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1044871/">丽贝卡·豪尔</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1003482/">保罗·贝坦尼</a>&nbsp;/<a href="http://movie.douban.com/celebrity/1047992/">基利安·墨菲</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1031801/">凯特·玛拉</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1000106/">科尔·豪瑟</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1054534/">摩根·弗里曼</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1019033/">小克利夫顿·克林斯</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1040665/">科里·哈德里克</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1323450/">法尔克·亨特切尔</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1004844/">乔什·斯图沃特</a>&nbsp;/&nbsp;<a href="http://movie.douban.com/celebrity/1036475/">山德·贝克利</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">类型:</span>&nbsp;<span>动作</span>&nbsp;/&nbsp;<span>爱情</span>&nbsp;/&nbsp;<span>科幻</span>&nbsp;/&nbsp;<span>惊悚</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">官方网站:</span>&nbsp;<a href="http://www.transcendencemovie.com/" target="_blank">www.transcendencemovie.com</a><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">制片国家/地区:</span>&nbsp;美国 / 中国大陆 / 英国<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">语言:</span>&nbsp;英语<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">上映日期:</span>&nbsp;<span>2014-04-18(中国大陆/美国)</span><br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">片长:</span>&nbsp;<span>113分钟(中国大陆)</span>&nbsp;/ 119分钟(美国)<br />\n<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">又名:</span>&nbsp;超越潜能(港) / 超越<br />\n	<p>\n		<span class="pl" style="font-family:Arial, Helvetica, sans-serif;line-height:18px;color:#666666;">IMDb链接:</span>&nbsp;<a href="http://www.imdb.com/title/tt2209764" target="_blank">tt2209764</a>\n	</p>\n	<p>\n		<span style="color:#111111;font-family:Helvetica, Arial, sans-serif;line-height:19px;background-color:#FFFFFF;">威尔卡斯特博士（约翰尼·德普 Johnny Depp 饰）是人工智能领域首屈一指的研究者，他致力于开创有史以来最人性化的有感知的机器人，全方位结合了人类情感和智慧。虽然威尔极具争议的实验令他一举成名，但同时也让他成为反科技极端分子的眼中钉，这些极端分子开始极尽一切阻止他。然而没想到的是，他们对威尔的摧毁行动，却在不经意间成为了威尔人工智能人实验成功的催化剂——成为了他“超验”的参与者。威尔的妻子伊芙琳（丽贝卡·豪尔 Rebecca Hall 饰）和他最好的朋友马克斯（保罗·贝坦尼 Paul Bettany 饰）同是这个实验的研究员，但问题不在于他们能不能……而是他们应不应该继续着这项研究。伊芙琳和马克斯最担心的是，他们逐渐察觉到，威尔已经不再是单纯的进行探索研究，而是逐步演变成追求一种权力，他无所不在，让人无法预料在他的掌控下未来的结局是什么，唯一越来越清晰的可怕事情是没有人能够阻止他。&nbsp;</span>\n	</p>\n</p>', 11, '2014-04-21 13:15:09'),
	(30, 31232155, 16, '阿尼玛', '痞子蔡;小说;台湾; 痞蔡的风格还是那么有调调。。。', '<p>\n	<h3 class="headline-2" style="font-size:18px;font-family:微软雅黑, 黑体, Verdana;font-weight:500;background-color:#FFFFFF;">\n		<span class="headline-content" style="font-size:14px;">简介</span><span style="font-family:\'sans serif\', tahoma, verdana, helvetica;font-size:14px;line-height:1.5;"></span>\n	</h3>\n</p>\n<p>\n	什么是阿尼玛？阿尼玛是每个男人心中唯一认定的女孩！不管曾经邂逅多少女孩，他的心中永远只会有一个“阿尼玛”。\n</p>\n<div class="para">\n	一位腼腆害羞的高中男孩，与一位拥有如栀子花般美丽脸庞的高中女生，在公车上“不断地偶遇”。女孩的幽默与聪慧，打动了男孩的心，然而男孩没有进一步追求，二人只是在公车上简短客气的交流，他们不知道对方的名字，不知道对方的住处；但他们有着一种无声的默契，每天似乎都在期待着这个搭车的美丽时刻。\n</div>\n<div class="para">\n	上了大学，男孩难忘高中时期公车上相遇的女孩，纵使大学时期有缤纷的社团联谊生活，纵使也有对他心仪的女孩，但他总是不经意再次想起公车上拥有栀子花香的女孩……\n</div>\n<div class="para">\n	男孩在默默地等待与寻觅中，还有机会在茫茫人海中与心目中的阿尼玛女孩再次相遇吗？\n</div>\n<h3 class="headline-2" style="font-size:18px;font-family:微软雅黑, 黑体, Verdana;font-weight:500;background-color:#FFFFFF;">\n	<span class="headline-content" style="font-size:14px;">作者简介</span>\n</h3>\n<div class="para">\n	蔡智恒\n</div>\n<div class="para">\n	BBS的ID为jht，网络上的昵称是痞子蔡。\n</div>\n<div class="para">\n	1969年出生于台湾嘉义县，成功大学水利工程博士。\n</div>\n<div class="para">\n	1998年于BBS发表第一部小说《第一次的亲密接触》，掀起全球华文地区的痞子蔡热潮。\n</div>\n<div class="para">\n	自此以后，左脑创作小说、右脑书写学术论文，独树一格。\n</div>', 195, '2014-04-21 14:01:49'),
	(37, 31232138, 16, '最爱的流沙包', '', '<img src="/community/resources\\images\\20150525121300926_31232138.jpg" alt="" />', 24, '2015-05-25 12:13:10'),
	(39, 31232156, 11, '我遇到你', '传记', '<p style="text-indent:2em;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	"今年4月，60岁的敬一丹从央视退休，写下回忆性文字，回顾自己在央视“焦点访谈”“感动中国”“一丹话题”等的历程，这个历程也是见证中国百姓共同关心的重大事件的历程。本书还包括敬一丹在全国各地采访做节目刻骨铭心的经历，生动叙述了遇到各层面百姓、央视共事的工作伙伴等经历，故事真实生动，思考和感受刻骨铭心。\n</p>\n<p style="text-indent:2em;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	①坎坷的求学经历，中年再造的央视奋斗，全民关注的新闻热点，感人肺腑的记者良知，新闻理想，强烈的职业道德感，对央视节目的深刻反思反省，贯穿全书。\n</p>\n<p style="text-indent:2em;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	②敬一丹精彩的励志传奇：连考三年28岁上研究生，从研究生到教师，从教师到央视主持人，38岁创办一丹话题，40岁到焦点访谈。坎坷的求学经历、央视的奋斗历程精彩纷呈。\n</p>\n<p style="text-indent:2em;color:#111111;font-family:Helvetica, Arial, sans-serif;background-color:#FFFFFF;">\n	③在央视30年的经历，见证中国社会重大变迁：舆论监督、反腐、扶贫、国企工人下岗等社会转型热点，全民关注，弱势群体的采访，刻骨铭心\n</p>', 2, '2015-05-27 10:37:55');
/*!40000 ALTER TABLE `cm_post` ENABLE KEYS */;


-- 导出  表 community.cm_relationship 结构
CREATE TABLE IF NOT EXISTS `cm_relationship` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系id，主键',
  `follow` bigint(20) NOT NULL COMMENT '用户1',
  `followed` bigint(20) NOT NULL COMMENT '用户2',
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `follow_followed_unique` (`follow`,`followed`),
  KEY `followed` (`followed`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_relationship 的数据：~33 rows (大约)
DELETE FROM `cm_relationship`;
/*!40000 ALTER TABLE `cm_relationship` DISABLE KEYS */;
INSERT INTO `cm_relationship` (`id`, `follow`, `followed`, `createAt`) VALUES
	(3, 31232140, 31232138, '2013-01-20 01:05:08'),
	(4, 31232139, 31232140, '2013-01-20 01:05:08'),
	(105, 31232139, 31232138, '2013-01-22 21:09:36'),
	(110, 31232141, 31232138, '2013-01-26 22:15:34'),
	(111, 31232141, 31232139, '2013-01-26 22:15:36'),
	(112, 31232142, 31232138, '2013-01-26 23:28:13'),
	(115, 31232142, 31232139, '2013-01-26 23:34:21'),
	(116, 31232143, 31232138, '2013-01-29 23:59:04'),
	(122, 31232138, 31232141, '2013-02-01 18:10:26'),
	(125, 31232138, 31232142, '2013-02-08 16:26:46'),
	(126, 31232145, 31232138, '2013-02-24 22:19:41'),
	(127, 31232146, 31232145, '2013-02-28 00:15:51'),
	(221, 31232146, 31232139, '2013-02-28 01:40:19'),
	(228, 31232147, 31232138, '2013-03-04 00:34:25'),
	(232, 31232147, 31232140, '2013-03-04 00:48:30'),
	(239, 31232147, 31232139, '2013-03-04 00:50:09'),
	(246, 31232138, 31232147, '2013-05-07 17:19:37'),
	(247, 31232138, 31232144, '2013-05-07 17:19:39'),
	(249, 31232155, 31232138, '2014-04-21 14:05:12'),
	(250, 31232155, 31232139, '2014-04-21 14:05:13'),
	(251, 31232155, 31232140, '2014-04-21 14:05:23'),
	(263, 31232138, 31232139, '2015-05-18 11:48:47'),
	(265, 31232138, 31232149, '2015-05-18 17:09:16'),
	(266, 31232138, 31232148, '2015-05-18 17:09:17'),
	(267, 31232138, 31232152, '2015-05-18 17:09:18'),
	(268, 31232138, 31232153, '2015-05-18 17:09:19'),
	(269, 31232138, 31232151, '2015-05-18 17:09:20'),
	(270, 31232138, 31232154, '2015-05-18 17:09:22'),
	(271, 31232138, 31232155, '2015-05-18 17:09:22'),
	(272, 31232138, 31232156, '2015-05-18 17:09:23'),
	(273, 31232138, 31232143, '2015-05-18 17:17:21'),
	(278, 31232138, 31232145, '2015-05-26 13:26:07'),
	(280, 31232138, 31232146, '2015-05-26 13:26:17'),
	(281, 31232156, 31232139, '2015-05-26 16:31:15'),
	(283, 31232156, 31232143, '2015-05-26 16:31:16'),
	(284, 31232156, 31232142, '2015-05-26 16:31:17'),
	(285, 31232156, 31232141, '2015-05-26 16:31:17'),
	(286, 31232156, 31232144, '2015-05-26 16:31:18'),
	(287, 31232156, 31232145, '2015-05-26 16:31:18'),
	(288, 31232156, 31232146, '2015-05-26 16:31:20'),
	(289, 31232156, 31232149, '2015-05-26 16:31:20'),
	(290, 31232156, 31232148, '2015-05-26 16:31:21'),
	(291, 31232156, 31232147, '2015-05-26 16:31:22'),
	(292, 31232156, 31232151, '2015-05-26 16:31:24'),
	(293, 31232156, 31232152, '2015-05-26 16:31:24'),
	(294, 31232156, 31232153, '2015-05-26 16:31:25'),
	(295, 31232156, 31232154, '2015-05-26 16:31:27'),
	(303, 31232156, 31232155, '2015-05-26 18:59:16'),
	(306, 31232156, 31232140, '2015-05-26 18:59:25'),
	(307, 31232156, 31232138, '2015-05-27 12:32:10');
/*!40000 ALTER TABLE `cm_relationship` ENABLE KEYS */;


-- 导出  表 community.cm_resource 结构
CREATE TABLE IF NOT EXISTS `cm_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源id，主键',
  `uid` bigint(20) NOT NULL COMMENT '上传者',
  `gid` bigint(20) NOT NULL COMMENT '所属群组',
  `name` char(50) NOT NULL COMMENT '资源名称',
  `description` text NOT NULL COMMENT '描述',
  `size` bigint(20) NOT NULL COMMENT '大小',
  `uploadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `downloadURL` char(150) NOT NULL COMMENT '下载地址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_resource 的数据：~0 rows (大约)
DELETE FROM `cm_resource`;
/*!40000 ALTER TABLE `cm_resource` DISABLE KEYS */;
INSERT INTO `cm_resource` (`id`, `uid`, `gid`, `name`, `description`, `size`, `uploadTime`, `downloadURL`) VALUES
	(24, 31232138, 18, '流沙包', '流沙包', 72379, '2015-05-18 21:40:03', '20150518214003537_18_31232138.jpg');
/*!40000 ALTER TABLE `cm_resource` ENABLE KEYS */;


-- 导出  表 community.cm_resource_download 结构
CREATE TABLE IF NOT EXISTS `cm_resource_download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- 正在导出表  community.cm_resource_download 的数据：~6 rows (大约)
DELETE FROM `cm_resource_download`;
/*!40000 ALTER TABLE `cm_resource_download` DISABLE KEYS */;
INSERT INTO `cm_resource_download` (`id`, `uid`, `rid`, `createAt`) VALUES
	(8, 31232138, 24, '2015-05-18 22:00:14'),
	(9, 31232138, 24, '2015-05-18 22:01:42'),
	(10, 31232138, 24, '2015-05-18 22:03:10'),
	(11, 31232138, 24, '2015-05-18 22:04:23'),
	(12, 31232138, 24, '2015-05-18 22:05:31');
/*!40000 ALTER TABLE `cm_resource_download` ENABLE KEYS */;


-- 导出  表 community.cm_user 结构
CREATE TABLE IF NOT EXISTS `cm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id，主键',
  `email` char(40) NOT NULL COMMENT '账号（邮箱）',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` char(15) NOT NULL COMMENT '昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是女，1是男',
  `description` text COMMENT '个人简介',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册事件',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，0：离线，1：在线',
  `avaterURI` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '本次登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=31232157 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_user 的数据：~18 rows (大约)
DELETE FROM `cm_user`;
/*!40000 ALTER TABLE `cm_user` DISABLE KEYS */;
INSERT INTO `cm_user` (`id`, `email`, `password`, `nickname`, `sex`, `description`, `registered`, `status`, `avaterURI`, `enabled`, `last_login_time`, `login_time`) VALUES
	(31232138, '1@qq.com', '86d2a082d0ae0d724d8b417332b0b2e9', '小东', 1, '电影，看的电影比吃的饭还多，看的电影比走的路还长。每天奉上优秀电影推荐及经典电影台词，欢迎关注！！！', '2013-01-19 17:13:53', 1, 'resources\\avater\\180\\31232138.jpg', 1, '2015-05-26 18:49:18', '2015-05-27 16:15:48'),
	(31232139, '2@qq.com', 'c81e728d9d4c2f636f067f89cc14862c', '小智', 1, '任何时候都可以开始做自己想做的事， 希望你不要用年龄和其他东西去束缚自 己。年龄不是界限，除非你自己拿去为 难自己。人生需要规划，但是意外总是 会到，与其强求某事某地达到某个目 标，不如顺其自然。当然不是说听天由 命，而是听从心的方向，去做到最好。 —— 沈奇岚《无论何时，年华都盛 开》', '2013-01-19 21:40:25', 0, 'resources/avater/180/31232139.jpg', 1, NULL, '2015-05-27 14:05:31'),
	(31232140, '3@qq.com', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '小宇', 0, 'Your life is a result of the choices you make… if you don’t like your life it is time to start making better choices. —— 你的生活是由你的选择造成的。如果你不喜欢你现在的生活，那就是时候做些更好的选择了。', '2013-01-20 01:04:08', 0, '', 1, NULL, NULL),
	(31232141, '4@qq.com', 'a87ff679a2f3e71d9181a67b7542122c', '小艺', 0, '', '2013-01-26 22:14:10', 1, 'resources/avater/180/31232141.jpg', 1, NULL, NULL),
	(31232142, '5@qq.com', 'e4da3b7fbbce2345d7772b0674a318d5', '小五', 1, '', '2013-01-26 22:34:48', 1, '', 1, NULL, NULL),
	(31232143, '6@qq.com', '6512bd43d9caa6e02c990b0a82652dca', '小青', 0, '', '2013-01-29 23:58:55', 0, '', 1, NULL, NULL),
	(31232144, '7@qq.com', '3295c76acbf4caaed33c36b1b5fc2cb1', '小代', 0, '', '2013-02-24 22:17:56', 1, '', 1, NULL, NULL),
	(31232145, '8@qq.com', '28dd2c7955ce926456240b2ff0100bde', '小奇', 1, '', '2013-02-24 22:19:30', 0, '', 1, NULL, NULL),
	(31232146, '9@qq.com', 'f863ce02aaaef6d863a16b38a5dd5bb5', '小七', 1, '博客：http://binary.duapp.com/', '2013-02-28 00:12:47', 1, 'resources/avater/180/31232146.jpg', 1, NULL, NULL),
	(31232147, '10@qq.com', 'c9f0f895fb98ab9159f51fd0297e236d', '小发', 1, '周润发', '2013-03-04 00:31:50', 1, 'resources/avater/180/31232147.jpg', 1, NULL, NULL),
	(31232148, '11@qq.com', 'f7177163c833dff4b38fc8d2872f1ec6', '小刚', 0, '', '2013-04-04 14:12:09', 0, '', 1, NULL, NULL),
	(31232149, '12@qq.com', '45c48cce2e2d7fbdea1afc51c7c6ad26', '小阳', 0, '', '2014-04-21 11:28:40', 0, '', 1, NULL, NULL),
	(31232151, '13@qq.com', '3147da8ab4a0437c15ef51a5cc7f2dc4', '小念', 0, '', '2014-04-21 13:40:44', 0, '', 1, NULL, NULL),
	(31232152, '14@qq.com', '3147da8ab4a0437c15ef51a5cc7f2dc4', '小紫', 0, '', '2014-04-21 13:42:54', 1, '', 1, NULL, NULL),
	(31232153, '15@qq.com', '3147da8ab4a0437c15ef51a5cc7f2dc4', '小高', 0, '', '2014-04-21 13:46:49', 1, '', 1, NULL, NULL),
	(31232154, '16@qq.com', '3147da8ab4a0437c15ef51a5cc7f2dc4', '小静', 0, '', '2014-04-21 13:49:05', 1, '', 1, NULL, NULL),
	(31232155, 'test@qq.com', '098f6bcd4621d373cade4e832627b4f6', '小测', 0, '', '2014-04-21 13:50:56', 0, '', 1, NULL, NULL),
	(31232156, 'hxy@qq.com', '86d2a082d0ae0d724d8b417332b0b2e9', 'hxy', 1, '', '2015-05-11 18:09:43', 1, 'resources\\avater\\180\\31232156.jpg', 1, '2015-05-27 16:59:10', '2015-05-27 17:05:46');
/*!40000 ALTER TABLE `cm_user` ENABLE KEYS */;


-- 导出  表 community.cm_user_group 结构
CREATE TABLE IF NOT EXISTS `cm_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `gid` bigint(20) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_gid_unique` (`uid`,`gid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- 正在导出表  community.cm_user_group 的数据：~31 rows (大约)
DELETE FROM `cm_user_group`;
/*!40000 ALTER TABLE `cm_user_group` DISABLE KEYS */;
INSERT INTO `cm_user_group` (`id`, `uid`, `gid`, `createAt`) VALUES
	(21, 31232140, 11, '2013-01-22 23:46:35'),
	(22, 31232140, 10, '2013-01-22 23:58:33'),
	(25, 31232139, 11, '2013-01-23 02:17:28'),
	(26, 31232139, 10, '2013-01-23 02:19:07'),
	(29, 31232141, 10, '2013-01-26 22:15:51'),
	(32, 31232142, 10, '2013-01-26 23:42:43'),
	(42, 31232141, 13, '2013-02-08 19:01:27'),
	(43, 31232145, 10, '2013-02-24 22:19:35'),
	(44, 31232146, 10, '2013-02-28 00:15:40'),
	(45, 31232146, 14, '2013-02-28 00:16:42'),
	(52, 31232146, 11, '2013-02-28 01:42:18'),
	(68, 31232139, 14, '2013-03-02 21:57:51'),
	(70, 31232147, 10, '2013-03-04 00:33:43'),
	(72, 31232147, 11, '2013-03-04 00:33:58'),
	(73, 31232147, 12, '2013-03-04 00:34:04'),
	(80, 31232155, 16, '2014-04-21 13:57:00'),
	(90, 31232138, 11, '2015-05-18 11:48:37'),
	(91, 31232138, 10, '2015-05-18 11:48:37'),
	(92, 31232138, 12, '2015-05-18 11:48:38'),
	(93, 31232138, 14, '2015-05-18 11:49:21'),
	(94, 31232138, 15, '2015-05-18 11:49:22'),
	(95, 31232138, 13, '2015-05-18 11:49:22'),
	(98, 31232138, 17, '2015-05-18 14:28:18'),
	(100, 31232156, 12, '2015-05-18 16:44:53'),
	(101, 31232156, 15, '2015-05-18 16:44:54'),
	(102, 31232156, 14, '2015-05-18 16:44:54'),
	(103, 31232156, 13, '2015-05-18 16:44:55'),
	(104, 31232156, 16, '2015-05-18 16:44:56'),
	(105, 31232156, 17, '2015-05-18 16:44:56'),
	(106, 31232138, 18, '2015-05-18 19:53:36'),
	(107, 31232156, 10, '2015-05-25 16:42:19'),
	(109, 31232138, 16, '2015-05-26 14:11:48'),
	(110, 31232156, 11, '2015-05-26 17:08:08');
/*!40000 ALTER TABLE `cm_user_group` ENABLE KEYS */;


-- 导出  表 community.cm_user_post_view 结构
CREATE TABLE IF NOT EXISTS `cm_user_post_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=latin1 COMMENT='记录用户查看了哪个帖子';

-- 正在导出表  community.cm_user_post_view 的数据：~99 rows (大约)
DELETE FROM `cm_user_post_view`;
/*!40000 ALTER TABLE `cm_user_post_view` DISABLE KEYS */;
INSERT INTO `cm_user_post_view` (`id`, `uid`, `pid`, `createAt`) VALUES
	(1, 31232138, 25, '2013-05-07 16:38:17'),
	(2, 31232138, 25, '2013-05-07 16:45:09'),
	(3, 31232138, 25, '2013-05-07 16:45:28'),
	(4, 31232138, 25, '2013-05-07 16:45:53'),
	(5, 31232138, 24, '2013-05-07 16:46:10'),
	(6, 31232138, 25, '2013-05-07 16:49:32'),
	(7, 31232138, 24, '2013-05-07 16:49:35'),
	(8, 31232138, 24, '2013-05-07 16:49:46'),
	(9, 31232138, 25, '2013-05-07 17:19:52'),
	(10, 31232138, 25, '2013-05-07 17:19:56'),
	(11, 31232138, 20, '2013-05-08 01:08:54'),
	(12, 31232138, 22, '2013-07-11 16:49:24'),
	(13, 31232138, 22, '2013-07-11 16:49:24'),
	(14, 31232138, 22, '2013-07-11 16:49:30'),
	(15, 31232138, 22, '2013-07-11 16:49:31'),
	(16, 31232138, 22, '2013-07-11 16:49:46'),
	(17, 31232138, 24, '2013-07-11 16:49:50'),
	(18, 31232138, 24, '2013-07-11 16:49:51'),
	(19, 31232138, 24, '2013-07-11 16:49:52'),
	(20, 31232138, 24, '2013-07-11 16:50:20'),
	(21, 31232138, 24, '2013-07-11 16:50:24'),
	(22, 31232138, 24, '2013-07-11 16:50:28'),
	(23, 31232138, 25, '2013-07-11 16:50:31'),
	(24, 31232138, 26, '2013-07-11 16:50:42'),
	(25, 31232138, 23, '2013-07-11 16:50:45'),
	(26, 31232138, 23, '2013-07-11 16:50:47'),
	(27, 31232138, 23, '2013-07-11 16:50:47'),
	(28, 31232138, 23, '2013-07-11 16:50:48'),
	(29, 31232138, 23, '2013-07-11 16:50:49'),
	(30, 31232138, 23, '2013-07-11 16:50:56'),
	(31, 31232138, 26, '2013-07-11 16:50:58'),
	(32, 31232138, 26, '2013-07-11 16:50:59'),
	(33, 31232138, 26, '2013-07-11 16:51:00'),
	(34, 31232138, 26, '2013-07-11 16:51:01'),
	(35, 31232138, 22, '2013-07-11 16:51:04'),
	(36, 31232138, 22, '2013-07-11 16:51:06'),
	(37, 31232138, 22, '2013-07-11 16:51:07'),
	(38, 31232138, 22, '2013-07-11 16:51:07'),
	(39, 31232138, 22, '2013-07-11 16:51:08'),
	(40, 31232138, 8, '2013-07-11 16:51:10'),
	(41, 31232138, 8, '2013-07-11 16:51:12'),
	(42, 31232138, 8, '2013-07-11 16:51:13'),
	(43, 31232138, 8, '2013-07-11 16:51:14'),
	(44, 31232138, 25, '2013-07-11 18:13:13'),
	(45, 31232138, 25, '2013-07-11 18:13:19'),
	(46, 31232138, 25, '2013-07-11 18:13:22'),
	(47, 31232138, 27, '2014-04-21 13:10:32'),
	(48, 31232138, 29, '2014-04-21 13:15:12'),
	(49, 31232138, 29, '2014-04-21 13:19:43'),
	(50, 31232138, 29, '2014-04-21 13:24:02'),
	(51, 31232138, 25, '2014-04-21 13:24:31'),
	(52, 31232155, 30, '2014-04-21 14:02:19'),
	(53, 31232155, 30, '2014-04-21 14:03:21'),
	(54, 31232138, 29, '2014-05-13 13:35:04'),
	(55, 31232156, 29, '2015-05-11 18:10:41'),
	(56, 31232156, 23, '2015-05-11 18:58:52'),
	(57, 31232156, 8, '2015-05-11 18:58:57'),
	(58, 31232156, 29, '2015-05-12 10:51:31'),
	(59, 31232156, 29, '2015-05-12 10:51:44'),
	(60, 31232138, 25, '2015-05-18 10:25:25'),
	(61, 31232138, 25, '2015-05-18 10:30:48'),
	(62, 31232138, 25, '2015-05-18 10:31:18'),
	(63, 31232138, 25, '2015-05-18 10:32:26'),
	(64, 31232138, 25, '2015-05-18 10:35:17'),
	(65, 31232138, 25, '2015-05-18 10:42:49'),
	(66, 31232138, 25, '2015-05-18 10:44:44'),
	(67, 31232138, 25, '2015-05-18 10:45:00'),
	(68, 31232138, 25, '2015-05-18 10:45:14'),
	(69, 31232138, 25, '2015-05-18 10:49:13'),
	(70, 31232138, 25, '2015-05-18 10:51:33'),
	(71, 31232138, 25, '2015-05-18 10:52:23'),
	(72, 31232138, 25, '2015-05-18 10:58:04'),
	(73, 31232138, 25, '2015-05-18 11:02:26'),
	(74, 31232138, 25, '2015-05-18 11:02:28'),
	(75, 31232138, 25, '2015-05-18 11:02:34'),
	(76, 31232138, 25, '2015-05-18 11:17:40'),
	(77, 31232138, 25, '2015-05-18 11:18:28'),
	(78, 31232138, 25, '2015-05-18 11:20:22'),
	(79, 31232138, 25, '2015-05-18 11:20:57'),
	(80, 31232138, 25, '2015-05-18 11:21:33'),
	(81, 31232138, 25, '2015-05-18 11:21:35'),
	(82, 31232138, 25, '2015-05-18 11:47:42'),
	(83, 31232138, 25, '2015-05-18 11:47:51'),
	(84, 31232138, 25, '2015-05-18 11:47:54'),
	(85, 31232138, 31, '2015-05-18 12:20:47'),
	(86, 31232138, 31, '2015-05-18 12:20:49'),
	(87, 31232138, 31, '2015-05-18 12:20:52'),
	(88, 31232138, 33, '2015-05-18 14:32:23'),
	(89, 31232138, 33, '2015-05-18 14:32:37'),
	(90, 31232138, 32, '2015-05-18 14:34:44'),
	(91, 31232138, 32, '2015-05-18 15:00:41'),
	(92, 31232138, 32, '2015-05-18 15:01:09'),
	(93, 31232138, 32, '2015-05-18 15:02:13'),
	(94, 31232138, 32, '2015-05-18 15:02:40'),
	(95, 31232138, 32, '2015-05-18 15:02:43'),
	(96, 31232138, 32, '2015-05-18 15:02:49'),
	(97, 31232138, 32, '2015-05-18 15:02:53'),
	(98, 31232138, 32, '2015-05-18 15:56:46'),
	(99, 31232138, 32, '2015-05-18 15:56:46'),
	(100, 31232138, 32, '2015-05-18 15:56:53'),
	(101, 31232138, 35, '2015-05-18 15:59:16'),
	(102, 31232138, 35, '2015-05-18 15:59:29'),
	(103, 31232138, 35, '2015-05-18 16:00:37'),
	(104, 31232138, 4, '2015-05-18 16:04:47'),
	(105, 31232138, 27, '2015-05-22 19:55:51'),
	(106, 31232138, 27, '2015-05-22 19:55:54'),
	(107, 31232138, 28, '2015-05-22 19:56:00'),
	(108, 31232138, 36, '2015-05-25 12:12:38'),
	(109, 31232138, 37, '2015-05-25 12:13:12'),
	(110, 31232156, 37, '2015-05-25 12:14:31'),
	(111, 31232138, 19, '2015-05-25 15:39:01'),
	(112, 31232138, 30, '2015-05-25 17:37:58'),
	(113, 31232138, 30, '2015-05-25 17:38:05'),
	(114, 31232138, 30, '2015-05-25 17:38:55'),
	(115, 31232138, 30, '2015-05-25 17:45:28'),
	(116, 31232138, 30, '2015-05-25 17:45:41'),
	(117, 31232138, 30, '2015-05-25 17:46:32'),
	(118, 31232138, 30, '2015-05-25 17:47:00'),
	(119, 31232138, 30, '2015-05-25 17:47:02'),
	(120, 31232138, 30, '2015-05-25 17:47:06'),
	(121, 31232138, 30, '2015-05-25 17:50:53'),
	(122, 31232138, 30, '2015-05-25 17:50:55'),
	(123, 31232138, 30, '2015-05-25 17:50:58'),
	(124, 31232138, 30, '2015-05-25 17:51:00'),
	(125, 31232138, 30, '2015-05-25 17:51:03'),
	(126, 31232138, 21, '2015-05-26 13:22:22'),
	(127, 31232138, 29, '2015-05-26 13:22:30'),
	(128, 31232138, 29, '2015-05-26 13:22:32'),
	(129, 31232138, 20, '2015-05-26 13:22:36'),
	(130, 31232138, 37, '2015-05-26 13:24:15'),
	(131, 31232138, 37, '2015-05-26 13:24:18'),
	(132, 31232138, 24, '2015-05-26 13:26:19'),
	(133, 31232138, 24, '2015-05-26 13:26:22'),
	(134, 31232138, 30, '2015-05-26 14:33:15'),
	(135, 31232138, 30, '2015-05-26 14:38:30'),
	(136, 31232138, 30, '2015-05-26 14:38:33'),
	(137, 31232138, 30, '2015-05-26 14:38:35'),
	(138, 31232138, 30, '2015-05-26 14:38:38'),
	(139, 31232138, 30, '2015-05-26 14:38:42'),
	(140, 31232138, 30, '2015-05-26 14:38:47'),
	(141, 31232138, 30, '2015-05-26 14:38:50'),
	(142, 31232138, 30, '2015-05-26 14:38:54'),
	(143, 31232138, 30, '2015-05-26 14:38:57'),
	(144, 31232138, 30, '2015-05-26 14:39:01'),
	(145, 31232138, 30, '2015-05-26 14:39:03'),
	(146, 31232138, 30, '2015-05-26 14:39:06'),
	(147, 31232138, 30, '2015-05-26 14:39:09'),
	(148, 31232138, 30, '2015-05-26 14:39:12'),
	(149, 31232138, 30, '2015-05-26 14:39:15'),
	(150, 31232138, 30, '2015-05-26 14:39:21'),
	(151, 31232138, 30, '2015-05-26 14:39:24'),
	(152, 31232138, 30, '2015-05-26 14:39:39'),
	(153, 31232138, 30, '2015-05-26 14:39:40'),
	(154, 31232138, 30, '2015-05-26 14:41:02'),
	(155, 31232138, 30, '2015-05-26 14:41:05'),
	(156, 31232138, 30, '2015-05-26 14:41:07'),
	(157, 31232138, 30, '2015-05-26 14:41:09'),
	(158, 31232138, 30, '2015-05-26 14:41:11'),
	(159, 31232138, 30, '2015-05-26 14:41:42'),
	(160, 31232138, 30, '2015-05-26 14:41:45'),
	(161, 31232138, 30, '2015-05-26 14:41:46'),
	(162, 31232138, 30, '2015-05-26 14:41:49'),
	(163, 31232138, 30, '2015-05-26 14:42:13'),
	(164, 31232138, 30, '2015-05-26 14:42:17'),
	(165, 31232138, 30, '2015-05-26 14:42:19'),
	(166, 31232138, 30, '2015-05-26 14:42:23'),
	(167, 31232138, 30, '2015-05-26 14:42:25'),
	(168, 31232138, 30, '2015-05-26 14:42:28'),
	(169, 31232138, 30, '2015-05-26 14:42:30'),
	(170, 31232138, 30, '2015-05-26 15:05:15'),
	(171, 31232138, 30, '2015-05-26 15:06:01'),
	(172, 31232138, 30, '2015-05-26 15:07:37'),
	(173, 31232138, 30, '2015-05-26 15:09:05'),
	(174, 31232138, 30, '2015-05-26 15:09:06'),
	(175, 31232138, 30, '2015-05-26 15:09:26'),
	(176, 31232138, 30, '2015-05-26 15:09:28'),
	(177, 31232138, 30, '2015-05-26 15:09:28'),
	(178, 31232138, 30, '2015-05-26 15:09:29'),
	(179, 31232138, 30, '2015-05-26 15:09:29'),
	(180, 31232138, 30, '2015-05-26 15:09:29'),
	(181, 31232138, 30, '2015-05-26 15:09:30'),
	(182, 31232138, 30, '2015-05-26 15:09:30'),
	(183, 31232138, 30, '2015-05-26 15:10:29'),
	(184, 31232138, 30, '2015-05-26 15:10:34'),
	(185, 31232138, 30, '2015-05-26 15:10:35'),
	(186, 31232138, 30, '2015-05-26 15:10:41'),
	(187, 31232138, 30, '2015-05-26 15:10:43'),
	(188, 31232138, 30, '2015-05-26 15:10:44'),
	(189, 31232138, 30, '2015-05-26 15:11:01'),
	(190, 31232138, 30, '2015-05-26 15:12:27'),
	(191, 31232138, 30, '2015-05-26 15:12:29'),
	(192, 31232138, 30, '2015-05-26 15:12:30'),
	(193, 31232138, 30, '2015-05-26 15:12:30'),
	(194, 31232138, 30, '2015-05-26 15:14:09'),
	(195, 31232138, 30, '2015-05-26 15:14:10'),
	(196, 31232138, 30, '2015-05-26 15:14:22'),
	(197, 31232138, 30, '2015-05-26 15:14:40'),
	(198, 31232138, 30, '2015-05-26 15:14:42'),
	(199, 31232138, 30, '2015-05-26 15:15:15'),
	(200, 31232138, 30, '2015-05-26 15:39:34'),
	(201, 31232138, 30, '2015-05-26 15:39:59'),
	(202, 31232138, 30, '2015-05-26 15:39:59'),
	(203, 31232138, 30, '2015-05-26 15:40:00'),
	(204, 31232138, 30, '2015-05-26 15:40:00'),
	(205, 31232138, 30, '2015-05-26 15:40:00'),
	(206, 31232138, 30, '2015-05-26 15:40:03'),
	(207, 31232138, 30, '2015-05-26 15:40:04'),
	(208, 31232138, 30, '2015-05-26 15:40:05'),
	(209, 31232138, 30, '2015-05-26 15:40:06'),
	(210, 31232138, 30, '2015-05-26 15:40:07'),
	(211, 31232138, 30, '2015-05-26 15:41:05'),
	(212, 31232138, 30, '2015-05-26 15:41:10'),
	(213, 31232138, 30, '2015-05-26 15:41:11'),
	(214, 31232138, 30, '2015-05-26 15:41:37'),
	(215, 31232138, 30, '2015-05-26 15:41:38'),
	(216, 31232138, 30, '2015-05-26 15:41:39'),
	(217, 31232138, 30, '2015-05-26 15:41:41'),
	(218, 31232138, 30, '2015-05-26 15:41:47'),
	(219, 31232138, 30, '2015-05-26 15:42:30'),
	(220, 31232138, 30, '2015-05-26 15:42:33'),
	(221, 31232138, 30, '2015-05-26 15:42:34'),
	(222, 31232138, 30, '2015-05-26 15:42:35'),
	(223, 31232138, 30, '2015-05-26 15:42:36'),
	(224, 31232138, 30, '2015-05-26 15:42:36'),
	(225, 31232138, 30, '2015-05-26 15:42:36'),
	(226, 31232138, 30, '2015-05-26 15:42:37'),
	(227, 31232138, 30, '2015-05-26 15:42:37'),
	(228, 31232138, 30, '2015-05-26 15:42:38'),
	(229, 31232138, 30, '2015-05-26 15:42:39'),
	(230, 31232138, 30, '2015-05-26 15:42:41'),
	(231, 31232138, 30, '2015-05-26 15:42:45'),
	(232, 31232138, 30, '2015-05-26 15:42:46'),
	(233, 31232138, 30, '2015-05-26 15:48:44'),
	(234, 31232138, 30, '2015-05-26 15:49:25'),
	(235, 31232138, 30, '2015-05-26 15:49:27'),
	(236, 31232138, 30, '2015-05-26 15:49:29'),
	(237, 31232138, 30, '2015-05-26 15:49:30'),
	(238, 31232138, 30, '2015-05-26 15:49:55'),
	(239, 31232138, 30, '2015-05-26 15:50:00'),
	(240, 31232138, 30, '2015-05-26 15:50:06'),
	(241, 31232138, 30, '2015-05-26 15:50:08'),
	(242, 31232138, 30, '2015-05-26 15:54:11'),
	(243, 31232138, 30, '2015-05-26 15:55:15'),
	(244, 31232138, 30, '2015-05-26 15:55:17'),
	(245, 31232138, 30, '2015-05-26 15:55:39'),
	(246, 31232138, 30, '2015-05-26 15:57:09'),
	(247, 31232138, 30, '2015-05-26 15:57:13'),
	(248, 31232138, 30, '2015-05-26 15:57:15'),
	(249, 31232138, 37, '2015-05-26 15:57:19'),
	(250, 31232138, 30, '2015-05-26 16:01:44'),
	(251, 31232138, 30, '2015-05-26 16:01:48'),
	(252, 31232138, 30, '2015-05-26 16:01:50'),
	(253, 31232138, 30, '2015-05-26 16:05:30'),
	(254, 31232138, 30, '2015-05-26 16:05:34'),
	(255, 31232138, 30, '2015-05-26 16:08:32'),
	(256, 31232138, 30, '2015-05-26 16:08:36'),
	(257, 31232138, 30, '2015-05-26 16:08:37'),
	(258, 31232138, 37, '2015-05-26 16:25:52'),
	(259, 31232138, 37, '2015-05-26 16:26:20'),
	(260, 31232138, 37, '2015-05-26 16:26:23'),
	(261, 31232156, 37, '2015-05-26 16:50:43'),
	(262, 31232156, 37, '2015-05-26 16:50:57'),
	(263, 31232156, 37, '2015-05-26 16:50:59'),
	(264, 31232156, 19, '2015-05-26 16:51:39'),
	(265, 31232156, 37, '2015-05-26 17:24:58'),
	(266, 31232156, 37, '2015-05-26 17:25:02'),
	(267, 31232156, 37, '2015-05-26 17:25:04'),
	(268, 31232156, 29, '2015-05-26 17:25:28'),
	(269, 31232156, 29, '2015-05-26 19:29:16'),
	(270, 31232156, 37, '2015-05-26 19:29:21'),
	(271, 31232156, 4, '2015-05-27 10:37:04'),
	(272, 31232156, 39, '2015-05-27 10:37:57'),
	(273, 31232156, 39, '2015-05-27 10:38:11'),
	(274, 31232156, 37, '2015-05-27 15:56:14'),
	(275, 31232156, 37, '2015-05-27 15:56:17'),
	(276, 31232156, 37, '2015-05-27 15:56:20'),
	(277, 31232156, 37, '2015-05-27 15:56:23'),
	(278, 31232156, 37, '2015-05-27 15:56:51'),
	(279, 31232156, 37, '2015-05-27 15:56:55'),
	(280, 31232156, 37, '2015-05-27 15:56:55'),
	(281, 31232156, 37, '2015-05-27 15:57:01'),
	(282, 31232156, 30, '2015-05-27 15:57:12'),
	(283, 31232156, 30, '2015-05-27 15:57:16'),
	(284, 31232156, 30, '2015-05-27 15:57:17'),
	(285, 31232156, 30, '2015-05-27 15:57:24'),
	(286, 31232156, 30, '2015-05-27 15:57:28'),
	(287, 31232156, 30, '2015-05-27 15:57:32'),
	(288, 31232156, 30, '2015-05-27 15:57:36'),
	(289, 31232156, 30, '2015-05-27 15:57:45'),
	(290, 31232156, 30, '2015-05-27 15:57:46'),
	(291, 31232156, 30, '2015-05-27 15:57:49'),
	(292, 31232156, 30, '2015-05-27 15:57:52'),
	(293, 31232156, 30, '2015-05-27 15:57:56'),
	(294, 31232156, 30, '2015-05-27 15:57:59'),
	(295, 31232156, 30, '2015-05-27 15:58:01'),
	(296, 31232156, 30, '2015-05-27 15:58:04'),
	(297, 31232156, 30, '2015-05-27 15:58:20'),
	(298, 31232156, 30, '2015-05-27 15:58:24'),
	(299, 31232156, 30, '2015-05-27 15:58:25'),
	(300, 31232156, 30, '2015-05-27 15:58:46'),
	(301, 31232156, 30, '2015-05-27 15:58:47'),
	(302, 31232156, 30, '2015-05-27 15:58:50'),
	(303, 31232156, 30, '2015-05-27 15:58:52'),
	(304, 31232156, 30, '2015-05-27 15:58:56'),
	(305, 31232156, 30, '2015-05-27 15:58:58'),
	(306, 31232156, 30, '2015-05-27 15:59:00'),
	(307, 31232156, 30, '2015-05-27 15:59:01'),
	(308, 31232156, 30, '2015-05-27 15:59:03'),
	(309, 31232156, 30, '2015-05-27 15:59:05'),
	(310, 31232156, 30, '2015-05-27 15:59:07'),
	(311, 31232156, 30, '2015-05-27 15:59:11'),
	(312, 31232156, 30, '2015-05-27 15:59:25'),
	(313, 31232156, 30, '2015-05-27 15:59:26'),
	(314, 31232156, 30, '2015-05-27 15:59:28'),
	(315, 31232156, 30, '2015-05-27 15:59:31'),
	(316, 31232156, 30, '2015-05-27 15:59:49'),
	(317, 31232156, 30, '2015-05-27 15:59:51'),
	(318, 31232156, 30, '2015-05-27 15:59:53'),
	(319, 31232156, 30, '2015-05-27 15:59:54'),
	(320, 31232156, 30, '2015-05-27 15:59:56'),
	(321, 31232156, 30, '2015-05-27 16:00:04'),
	(322, 31232156, 30, '2015-05-27 16:00:06'),
	(323, 31232156, 30, '2015-05-27 16:00:08'),
	(324, 31232156, 30, '2015-05-27 16:00:09'),
	(325, 31232156, 30, '2015-05-27 16:01:32'),
	(326, 31232156, 30, '2015-05-27 16:01:34'),
	(327, 31232156, 30, '2015-05-27 16:01:38'),
	(328, 31232156, 30, '2015-05-27 16:01:40'),
	(329, 31232156, 30, '2015-05-27 16:09:48'),
	(330, 31232156, 30, '2015-05-27 16:09:56'),
	(331, 31232156, 30, '2015-05-27 16:11:40'),
	(332, 31232156, 30, '2015-05-27 16:11:58'),
	(333, 31232156, 30, '2015-05-27 16:12:17'),
	(334, 31232156, 30, '2015-05-27 16:12:19'),
	(335, 31232156, 30, '2015-05-27 16:12:26'),
	(336, 31232156, 37, '2015-05-27 16:12:34'),
	(337, 31232156, 30, '2015-05-27 16:12:36'),
	(338, 31232156, 30, '2015-05-27 16:12:38'),
	(339, 31232156, 21, '2015-05-27 16:59:55');
/*!40000 ALTER TABLE `cm_user_post_view` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
