/*
Navicat MySQL Data Transfer

Source Server         : Mysql_localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jfinalshiromhcachemaven

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-09-18 14:58:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jf_tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_admin_user`;
CREATE TABLE `jf_tb_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL COMMENT '后台用户名',
  `password` varchar(45) NOT NULL COMMENT '后台密码（明文）',
  `salt` varchar(45) NOT NULL DEFAULT '',
  `in_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_admin_user
-- ----------------------------
INSERT INTO `jf_tb_admin_user` VALUES ('1', 'admin', 'b1510c53856fe90ddb1a9dd28484b601', '9ff46ebcdd82742f1f9f5515849ea7d5', '2016-03-24 18:05:01');
INSERT INTO `jf_tb_admin_user` VALUES ('2', 'tom', 'a64e184b43d6c6c4bf4181e950ba19ed', 'dfc4a9ba13100e05fb9f3748c565647b', '2016-05-16 18:38:24');
INSERT INTO `jf_tb_admin_user` VALUES ('3', 'test', 'bbc3807b61f330b346c9b8515c8954a1', 'ccbef28673b82b70e54c7ab0caf07472', '2016-05-25 15:44:07');

-- ----------------------------
-- Table structure for jf_tb_class
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_class`;
CREATE TABLE `jf_tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '班级名称',
  `gid` int(11) DEFAULT NULL COMMENT '年级编号',
  `lesson_id` int(11) DEFAULT NULL COMMENT 'lesson顺序，该班级上到当前年级所对应的课程的哪一课了',
  `ip` varchar(59) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_class
-- ----------------------------
INSERT INTO `jf_tb_class` VALUES ('194', '一班', '21', '133', '::100:0:ec6f:ed1c', '10722');
INSERT INTO `jf_tb_class` VALUES ('197', '1班', '23', null, '192.168.10.21', '94729');
INSERT INTO `jf_tb_class` VALUES ('199', '三班', '23', null, '192.168.10.21', '82010');
INSERT INTO `jf_tb_class` VALUES ('204', '十六班', '25', null, null, null);
INSERT INTO `jf_tb_class` VALUES ('218', '一班', '22', null, '192.168.10.21', '38116');
INSERT INTO `jf_tb_class` VALUES ('219', '二班', '21', '133', '192.168.1.111', '97061');
INSERT INTO `jf_tb_class` VALUES ('220', '三班', '21', '133', '192.168.10.21', '35862');
INSERT INTO `jf_tb_class` VALUES ('221', '四班', '21', '133', '192.168.10.21', '14082');
INSERT INTO `jf_tb_class` VALUES ('222', '五班', '21', '133', '192.168.10.21', '68013');
INSERT INTO `jf_tb_class` VALUES ('223', '二班', '26', null, null, null);

-- ----------------------------
-- Table structure for jf_tb_classroom
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_classroom`;
CREATE TABLE `jf_tb_classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室表格',
  `building` varchar(45) DEFAULT NULL COMMENT '教学楼',
  `name` varchar(45) DEFAULT NULL COMMENT '教室名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_classroom
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_classroom_piano
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_classroom_piano`;
CREATE TABLE `jf_tb_classroom_piano` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教室和钢琴的关联表 自增id',
  `classroom_id` int(11) DEFAULT NULL COMMENT '教室id',
  `piano_id` int(11) DEFAULT NULL COMMENT '钢琴id',
  PRIMARY KEY (`id`),
  KEY `fk_classroom_piano` (`classroom_id`) USING BTREE,
  KEY `fk_piano_classroom` (`piano_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_classroom_piano
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_class_schedule
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_class_schedule`;
CREATE TABLE `jf_tb_class_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级—课程表 关联表 自增id',
  `cid` int(11) DEFAULT NULL COMMENT '班级id',
  `sid` int(11) DEFAULT NULL COMMENT '课时id',
  PRIMARY KEY (`id`),
  KEY `fk_class_schedule` (`cid`) USING BTREE,
  KEY `fk_schedue_class` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_class_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_class_student
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_class_student`;
CREATE TABLE `jf_tb_class_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级学生关联表自增id',
  `cid` int(11) DEFAULT NULL COMMENT '班级id',
  `sid` int(11) DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_class_student
-- ----------------------------
INSERT INTO `jf_tb_class_student` VALUES ('68', '194', '89');
INSERT INTO `jf_tb_class_student` VALUES ('76', '194', '98');
INSERT INTO `jf_tb_class_student` VALUES ('78', '197', '99');
INSERT INTO `jf_tb_class_student` VALUES ('79', '197', '100');
INSERT INTO `jf_tb_class_student` VALUES ('104', '194', '96');
INSERT INTO `jf_tb_class_student` VALUES ('105', '194', '92');
INSERT INTO `jf_tb_class_student` VALUES ('106', '194', '106');
INSERT INTO `jf_tb_class_student` VALUES ('107', '194', '113');
INSERT INTO `jf_tb_class_student` VALUES ('108', '194', '115');
INSERT INTO `jf_tb_class_student` VALUES ('109', '194', '116');
INSERT INTO `jf_tb_class_student` VALUES ('110', '194', '114');
INSERT INTO `jf_tb_class_student` VALUES ('111', '219', '125');
INSERT INTO `jf_tb_class_student` VALUES ('112', '219', '127');
INSERT INTO `jf_tb_class_student` VALUES ('113', '219', '128');
INSERT INTO `jf_tb_class_student` VALUES ('114', '219', '129');
INSERT INTO `jf_tb_class_student` VALUES ('115', '220', '136');
INSERT INTO `jf_tb_class_student` VALUES ('116', '220', '137');
INSERT INTO `jf_tb_class_student` VALUES ('117', '220', '138');
INSERT INTO `jf_tb_class_student` VALUES ('118', '220', '135');
INSERT INTO `jf_tb_class_student` VALUES ('119', '221', '139');
INSERT INTO `jf_tb_class_student` VALUES ('120', '221', '140');
INSERT INTO `jf_tb_class_student` VALUES ('121', '221', '141');
INSERT INTO `jf_tb_class_student` VALUES ('122', '221', '142');
INSERT INTO `jf_tb_class_student` VALUES ('123', '222', '143');
INSERT INTO `jf_tb_class_student` VALUES ('124', '222', '144');
INSERT INTO `jf_tb_class_student` VALUES ('125', '222', '145');
INSERT INTO `jf_tb_class_student` VALUES ('126', '222', '146');
INSERT INTO `jf_tb_class_student` VALUES ('127', '222', '147');
INSERT INTO `jf_tb_class_student` VALUES ('128', '194', '130');
INSERT INTO `jf_tb_class_student` VALUES ('129', '194', '131');
INSERT INTO `jf_tb_class_student` VALUES ('130', '194', '132');
INSERT INTO `jf_tb_class_student` VALUES ('131', '194', '134');
INSERT INTO `jf_tb_class_student` VALUES ('132', '223', '147');

-- ----------------------------
-- Table structure for jf_tb_class_teacher
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_class_teacher`;
CREATE TABLE `jf_tb_class_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级教师关联表自增id',
  `cid` int(11) NOT NULL COMMENT '班级id',
  `tid` int(11) NOT NULL COMMENT '教师id',
  PRIMARY KEY (`id`),
  KEY `fk_class_tacher` (`cid`) USING BTREE,
  KEY `fk_teacher_class` (`tid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_class_teacher
-- ----------------------------
INSERT INTO `jf_tb_class_teacher` VALUES ('670', '197', '56');
INSERT INTO `jf_tb_class_teacher` VALUES ('671', '197', '58');
INSERT INTO `jf_tb_class_teacher` VALUES ('681', '204', '62');
INSERT INTO `jf_tb_class_teacher` VALUES ('692', '218', '61');
INSERT INTO `jf_tb_class_teacher` VALUES ('693', '219', '56');
INSERT INTO `jf_tb_class_teacher` VALUES ('698', '218', '64');
INSERT INTO `jf_tb_class_teacher` VALUES ('699', '218', '62');
INSERT INTO `jf_tb_class_teacher` VALUES ('701', '197', '62');
INSERT INTO `jf_tb_class_teacher` VALUES ('711', '219', '64');
INSERT INTO `jf_tb_class_teacher` VALUES ('714', '197', '64');
INSERT INTO `jf_tb_class_teacher` VALUES ('717', '223', '61');
INSERT INTO `jf_tb_class_teacher` VALUES ('727', '219', '61');
INSERT INTO `jf_tb_class_teacher` VALUES ('728', '220', '61');
INSERT INTO `jf_tb_class_teacher` VALUES ('737', '194', '62');
INSERT INTO `jf_tb_class_teacher` VALUES ('738', '194', '64');
INSERT INTO `jf_tb_class_teacher` VALUES ('740', '194', '61');

-- ----------------------------
-- Table structure for jf_tb_course
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course`;
CREATE TABLE `jf_tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '课程名称',
  `part_number` int(4) DEFAULT '0' COMMENT '小节数',
  `level` int(4) DEFAULT '0' COMMENT '课程阶段设置 小学1 幼儿园2 社会培训3',
  `comments` varchar(255) DEFAULT NULL COMMENT '课堂评语',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='教师端使用的课程';

-- ----------------------------
-- Records of jf_tb_course
-- ----------------------------
INSERT INTO `jf_tb_course` VALUES ('13', '小学', '18', '1', '                                                        \r\n                        \r\n                        ');
INSERT INTO `jf_tb_course` VALUES ('14', '幼儿园', '17', '2', null);
INSERT INTO `jf_tb_course` VALUES ('15', '社会培训', '16', '3', null);

-- ----------------------------
-- Table structure for jf_tb_courseware
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_courseware`;
CREATE TABLE `jf_tb_courseware` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `content` varchar(255) DEFAULT NULL COMMENT '教学内容',
  `goal` varchar(255) DEFAULT NULL COMMENT '教学目标',
  `point` varchar(255) DEFAULT NULL COMMENT '教学重点',
  `difficulty` varchar(255) DEFAULT NULL COMMENT '教学难点',
  `prepare` varchar(255) DEFAULT NULL COMMENT '教学准备',
  `name` varchar(45) DEFAULT NULL COMMENT '课程名称',
  `index` varchar(45) DEFAULT NULL COMMENT '课次',
  `detail_num` int(4) DEFAULT '0' COMMENT '课时数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课件表';

-- ----------------------------
-- Records of jf_tb_courseware
-- ----------------------------
INSERT INTO `jf_tb_courseware` VALUES ('1', '钢琴弹奏知识、姿势、手形及非连音弹奏方法', '1、了解钢琴弹奏的相关知识。\r\n2、初步掌握正确的弹奏姿势和弹奏手形。\r\n3、学习非连音的弹奏方法。\r\n4、体验手臂的重力运用和手指的“支撑”。', '1、弹奏手形。\r\n2、手臂自然下垂的重力体验。', '正确弹奏手形的掌握，手臂自然下垂的重量与手指支撑的协调\r\n\r\n教学准备：', '1、正确的弹奏姿势，手形的录像资料。常见的错误的弹奏姿势，手形的录像资料。\r\n2、乐曲演奏音像资料。', '大家一起来说', '第一课', '5');
INSERT INTO `jf_tb_courseware` VALUES ('2', 'ggggggggggggggggggggggggg', 'fffffffffffffffffffff', 'dddddddddddddddddddddddddd', 'ccccccccccccccccccccccccc', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '认识琴键', '第二课', '2');
INSERT INTO `jf_tb_courseware` VALUES ('3', 'dudududuudududuud', '读懂', '慢慢读', '读得快', '好好读的态度', '读谱原则', '第三课', '2');

-- ----------------------------
-- Table structure for jf_tb_courseware_detail
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_courseware_detail`;
CREATE TABLE `jf_tb_courseware_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` longtext,
  `course_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '课时名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='课时表';

-- ----------------------------
-- Records of jf_tb_courseware_detail
-- ----------------------------
INSERT INTO `jf_tb_courseware_detail` VALUES ('1', '1、钢琴乐器介绍\r\n讲述：钢琴是一种键盘类的西洋乐器，有乐器之王的称号。它音域宽广，既能演奏主旋律，又能表现和声，织体，还能演奏各种多声部音乐。有 清彻，透亮的高音，有浑厚低沉的低音。可以表达如泣如诉的细腻情感，也可以表达气势宏伟的壮阔辉煌，还可以表达活泼欢快的舞蹈形象。它是一种表现力非常丰富的乐器。\r\n欣赏：教师演奏三首乐曲，用直观演奏展示钢琴艺术“美”，激发学生兴趣。\r\n《可爱的家》《四小天鹅舞》《斗牛士之歌》\r\n2、学习钢琴的条件\r\n讲述：以前钢琴属于阳春白雪的乐器，西欧的富家小姐，公子作为一种艺术修养必学。，从80年代开始，我国钢琴不断普及，如今，钢琴已进入寻常百姓家，当前我国社会音乐普及中的钢琴热现象已使国内外业内人士欣喜和震惊。陈萨、朗朗、李云迪等寻常百姓家子弟已登上世界著 名钢琴演奏家行列。实践证明，智力正常，十指键全，有刻苦，顽强的毅力，有持之以恒的精神，就可以学好钢琴。\r\n欣赏：朗朗的演奏录像，幼儿的演奏录像，高年级学生的演奏录像，用贴近学生的生动演奏激发学生的学习欲望\r\n3、学习钢琴的特点\r\n感知：模仿老师摆好手形、动手指、引导学生思考。为什么我的手指不能灵活运动？\r\n讨论：学钢琴有什么特点？\r\n归纳：引导学生讨论后归纳：\r\n1、是一种肌肉群的协调运动，动作精细复杂。\r\n2、是视觉、思维、动作、听觉综合运用的高级思维系列活动。\r\n3、和所有技能性运动（体操、杂技、芭蕾等）一样，需要长期的、科学的练习。', '1', '课时1：介绍钢琴的相关知识');
INSERT INTO `jf_tb_courseware_detail` VALUES ('2', '欣赏：放录像对比欣赏，引导学生讲述正确的弹奏姿势\r\n归纳：\r\n1、坐位、脚支点、手支点和重力支点平衡、协调。\r\n2、腰、肩、臂的自然，放松。\r\n3、琴凳的高低，远近的衡量标准。\r\n练习：教师示范，学生练习，二人一组，互相观察，互相指导\r\n分析：\r\n常见错误姿势对弹奏的影响。\r\n含胸、蹋腰。双腿叉开、勾拢。身体僵硬。通过看录像，引导学生分析，不正确姿势对弹奏的影响。', '1', '课时2：钢琴弹奏姿势');
INSERT INTO `jf_tb_courseware_detail` VALUES ('3', '观察：看图片，对比观察正确与不正确的用形\r\n讲述：基本手形：五指自然弯曲，掌关凸起。手指自然分开，分别站在五个键上。呈“圆”形。有握球感。每一个手指按顺序弹一个键叫顺指法。\r\n练习：集体徒手练习，老师个别指导。学生相互观察，分析纠正。\r\n分析：不良手形状态以及纠正的办法。', '1', '课时3：钢钢琴弹奏的手形及顺指法');
INSERT INTO `jf_tb_courseware_detail` VALUES ('4', '讲述：非连音是断奏中的一种，在弹奏中有重要地位。初学时练非连音，主要体会手臂重力放下，通过手腕，送到手指的协调动作。\r\n练习:\r\n1、手臂自然“落”下的练习，指导学生体会手臂重力落下的感觉\r\n2、手腕的“支撑”“调节”作用体会\r\n3、手指“支撑”的要点：手形摆好，掌关节立起，指尖站稳，从肩部到指尖将力量向流水从水管里流出一样传送。\r\n4、以上三个部位的协调与配合。', '1', '课时4：非连音的弹奏练习');
INSERT INTO `jf_tb_courseware_detail` VALUES ('5', '1、手臂放松练习。\r\n2、“落“手臂练习。\r\n3、摆手形练习。\r\n4、架手形练习。\r\n通过、讲述、示范、模仿、练习四个步骤进行\r\n乐曲练习：《玛丽有一只小羊羔》、《伞兵》、《芦松舞》\r\n1、读谱、视唱。\r\n2、找键、确定指法。\r\n3、练习节奏、节拍。\r\n4、用非连音练习乐曲。\r\n乐曲练习：《扬基歌》、《黄河船夫曲》', '1', '课时5：天练练');
INSERT INTO `jf_tb_courseware_detail` VALUES ('6', 'zzzzzzzzzzzzz', '2', '课时1: 哈哈哈哈');
INSERT INTO `jf_tb_courseware_detail` VALUES ('7', 'ssssssssssssssssssssss', '2', '课时2：呵呵呵');
INSERT INTO `jf_tb_courseware_detail` VALUES ('8', '我是读谱1', '3', '课时1：读谱1');
INSERT INTO `jf_tb_courseware_detail` VALUES ('9', '我是读谱2', '3', '课时3：读谱2');

-- ----------------------------
-- Table structure for jf_tb_course_part
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_part`;
CREATE TABLE `jf_tb_course_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(45) DEFAULT NULL COMMENT '小节名称',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `part_index` int(4) DEFAULT NULL COMMENT '该小节在其所在课程中的顺序',
  `unit_number` int(4) DEFAULT '0' COMMENT '单元数',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级栏目ID',
  `type` varchar(5) NOT NULL DEFAULT '1' COMMENT '类型 1 lesson  2 channel 3 resource\r\n\r\n 1 是课程类型不可以携带资源\r\n2普通子栏目\r\n6作业子栏目\r\n\r\n\r\n3 是资源类型 可以携带视频资源（与，视频，音乐文件关联）\r\n4 是资源类型 可以携带音乐资源（与音乐文件关联）\r\n5 是资源类型 可以携带作业资源（与作业文件关联）\r\n\r\n\r\n\r\n\r\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='课程  栏目表';

-- ----------------------------
-- Records of jf_tb_course_part
-- ----------------------------
INSERT INTO `jf_tb_course_part` VALUES ('133', 'lesson_1', '13', '1', '0', '0', '1');
INSERT INTO `jf_tb_course_part` VALUES ('135', '开心歌唱', '13', '10', '0', '133', '100');
INSERT INTO `jf_tb_course_part` VALUES ('136', 'video_1.1', '13', '10', '0', '135', '3');
INSERT INTO `jf_tb_course_part` VALUES ('137', 'video_1.2', '14', '10', '0', '135', '3');
INSERT INTO `jf_tb_course_part` VALUES ('141', '一起弹奏吧', '13', '20', '0', '133', '101');
INSERT INTO `jf_tb_course_part` VALUES ('142', '示范奏', '13', '10', '0', '141', '2');
INSERT INTO `jf_tb_course_part` VALUES ('143', 'video_2.1', '13', '1', '0', '142', '3');
INSERT INTO `jf_tb_course_part` VALUES ('144', 'video_2.2', '13', '1', '0', '142', '3');
INSERT INTO `jf_tb_course_part` VALUES ('145', 'video_2.3', '13', '1', '0', '142', '3');
INSERT INTO `jf_tb_course_part` VALUES ('146', 'video_2.4', '13', '1', '0', '142', '3');
INSERT INTO `jf_tb_course_part` VALUES ('147', '跟奏', '13', '20', '0', '141', '2');
INSERT INTO `jf_tb_course_part` VALUES ('148', '跟奏2', '13', '30', '0', '141', '2');
INSERT INTO `jf_tb_course_part` VALUES ('149', '完整奏', '13', '40', '0', '141', '2');
INSERT INTO `jf_tb_course_part` VALUES ('150', '完整奏2', '13', '50', '0', '141', '2');
INSERT INTO `jf_tb_course_part` VALUES ('151', 'video_1', '13', '1', '0', '147', '3');
INSERT INTO `jf_tb_course_part` VALUES ('152', 'music_1', '13', '2', '0', '147', '4');
INSERT INTO `jf_tb_course_part` VALUES ('153', 'video_1', '13', '1', '0', '148', '3');
INSERT INTO `jf_tb_course_part` VALUES ('154', 'video_1', '13', '1', '0', '149', '3');
INSERT INTO `jf_tb_course_part` VALUES ('155', 'music_1', '13', '2', '0', '149', '4');
INSERT INTO `jf_tb_course_part` VALUES ('156', 'video_1', '13', '1', '0', '150', '3');
INSERT INTO `jf_tb_course_part` VALUES ('157', 'music_1', '13', '2', '0', '150', '4');
INSERT INTO `jf_tb_course_part` VALUES ('158', '会听的耳朵', '13', '30', '0', '133', '102');
INSERT INTO `jf_tb_course_part` VALUES ('162', '作业', '13', '80', '0', '133', '107');
INSERT INTO `jf_tb_course_part` VALUES ('163', '一起弹奏吧2', '13', '70', '0', '133', '103');
INSERT INTO `jf_tb_course_part` VALUES ('164', 'video_3.1', '13', '1', '0', '158', '3');
INSERT INTO `jf_tb_course_part` VALUES ('165', 'video_3.2', '13', '2', '0', '158', '3');
INSERT INTO `jf_tb_course_part` VALUES ('166', 'video_4.1', '13', '1', '0', '159', '3');
INSERT INTO `jf_tb_course_part` VALUES ('174', '乐理', '13', '1', '0', '162', '2');
INSERT INTO `jf_tb_course_part` VALUES ('175', '节奏', '13', '2', '0', '162', '2');
INSERT INTO `jf_tb_course_part` VALUES ('176', '乐曲', '13', '3', '0', '162', '2');
INSERT INTO `jf_tb_course_part` VALUES ('177', '作业1', '13', '1', '0', '174', '2');
INSERT INTO `jf_tb_course_part` VALUES ('178', '作业2', '13', '2', '0', '174', '2');
INSERT INTO `jf_tb_course_part` VALUES ('179', '题目', '13', '1', '0', '177', '5');
INSERT INTO `jf_tb_course_part` VALUES ('181', '题目', '13', '1', '0', '178', '5');
INSERT INTO `jf_tb_course_part` VALUES ('188', '示范奏', '13', '1', '0', '175', '2');
INSERT INTO `jf_tb_course_part` VALUES ('189', '完整奏', '13', '2', '0', '175', '2');
INSERT INTO `jf_tb_course_part` VALUES ('190', 'video_7', '13', '1', '0', '188', '3');
INSERT INTO `jf_tb_course_part` VALUES ('191', 'music_7.2', '13', '1', '0', '189', '4');
INSERT INTO `jf_tb_course_part` VALUES ('192', 'video_7.2', '13', '2', '0', '189', '3');
INSERT INTO `jf_tb_course_part` VALUES ('193', '跟奏', '13', '1', '0', '176', '2');
INSERT INTO `jf_tb_course_part` VALUES ('194', '跟奏2', '13', '2', '0', '176', '2');
INSERT INTO `jf_tb_course_part` VALUES ('195', '完整奏', '13', '3', '0', '176', '2');
INSERT INTO `jf_tb_course_part` VALUES ('196', '完整奏2', '13', '4', '0', '176', '2');
INSERT INTO `jf_tb_course_part` VALUES ('197', 'video_7.3', '13', '1', '0', '193', '3');
INSERT INTO `jf_tb_course_part` VALUES ('198', 'music_7.3', '13', '2', '0', '193', '4');
INSERT INTO `jf_tb_course_part` VALUES ('199', 'video_7.3.2', '13', '1', '0', '194', '3');
INSERT INTO `jf_tb_course_part` VALUES ('200', 'video_7.3.3', '13', '1', '0', '195', '3');
INSERT INTO `jf_tb_course_part` VALUES ('201', 'music_7.3.3', '13', '2', '0', '195', '4');
INSERT INTO `jf_tb_course_part` VALUES ('202', 'video_7.3.4', '13', '1', '0', '196', '3');
INSERT INTO `jf_tb_course_part` VALUES ('203', 'music_7.3.4', '13', '2', '0', '196', '4');
INSERT INTO `jf_tb_course_part` VALUES ('204', '示范奏', '13', '1', '0', '163', '2');
INSERT INTO `jf_tb_course_part` VALUES ('205', '跟奏', '13', '2', '0', '163', '2');
INSERT INTO `jf_tb_course_part` VALUES ('206', '跟奏2', '13', '3', '0', '163', '2');
INSERT INTO `jf_tb_course_part` VALUES ('207', '完整奏', '13', '4', '0', '163', '2');
INSERT INTO `jf_tb_course_part` VALUES ('208', '完整奏2', '13', '5', '0', '163', '2');
INSERT INTO `jf_tb_course_part` VALUES ('209', 'video_8.1.1', '13', '1', '0', '204', '3');
INSERT INTO `jf_tb_course_part` VALUES ('210', 'video_8.1.2', '13', '2', '0', '204', '3');
INSERT INTO `jf_tb_course_part` VALUES ('211', 'video_8.1.3', '13', '3', '0', '204', '3');
INSERT INTO `jf_tb_course_part` VALUES ('212', 'video_8.1.4', '13', '4', '0', '204', '3');
INSERT INTO `jf_tb_course_part` VALUES ('213', 'video_8.2.1', '13', '1', '0', '205', '3');
INSERT INTO `jf_tb_course_part` VALUES ('214', 'music_8.2.2', '13', '2', '0', '205', '4');
INSERT INTO `jf_tb_course_part` VALUES ('215', 'video_8.3.1', '13', '1', '0', '206', '3');
INSERT INTO `jf_tb_course_part` VALUES ('216', 'video_8.4.1', '13', '1', '0', '207', '3');
INSERT INTO `jf_tb_course_part` VALUES ('217', 'music_8.4.2', '13', '2', '0', '207', '4');
INSERT INTO `jf_tb_course_part` VALUES ('218', 'video_8.5.1', '13', '1', '0', '208', '3');
INSERT INTO `jf_tb_course_part` VALUES ('219', 'music_8.5.1', '13', '2', '0', '208', '4');
INSERT INTO `jf_tb_course_part` VALUES ('220', 'lesson_2', '13', '2', '0', '0', '1');
INSERT INTO `jf_tb_course_part` VALUES ('221', '幼儿园3', '14', '3', '0', '0', '1');
INSERT INTO `jf_tb_course_part` VALUES ('222', '幼儿园3儿子', '14', '22', '0', '221', '102');
INSERT INTO `jf_tb_course_part` VALUES ('223', '顶级', '0', '0', '0', '-1', '1');

-- ----------------------------
-- Table structure for jf_tb_course_part_detail
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_part_detail`;
CREATE TABLE `jf_tb_course_part_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL,
  `parent_part_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `pic_path` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_course_part_detail
-- ----------------------------
INSERT INTO `jf_tb_course_part_detail` VALUES ('1', '135', '133', '开心的歌唱', '<div class=\"course_intro_cont\">\r\n												<p class=\"course_cont_tit0\">讲述:</p>     \r\n												<div class=\"course_cont_tit1\">\r\n													<p>钢琴是一种键盘类的西洋乐器，有乐器之王的称号。它音域宽广，既能演奏主旋律，又能表现和声，织体，还能演奏各种多声部音乐。有\r\n		清彻，透亮的高音，有浑厚低沉的低音。可以表达如泣如诉的细腻情感，也可以表达气势宏伟的壮阔辉煌，还可以表达活泼欢快的舞蹈形象。它是一种表现力非常丰富的乐器。\r\n													</p>													\r\n												</div>\r\n											</div>\r\n											<div class=\"course_intro_cont\">\r\n												<p class=\"course_cont_tit0\">欣赏:</p>\r\n												<div class=\"course_cont_tit1\">\r\n													<p>教师演奏三首乐曲，用直观演奏展示钢琴艺术“美”，激发学生兴趣。</p> \r\n													<p>《可爱的家》《四小天鹅舞》《斗牛士之歌》</p>													\r\n												</div>\r\n											</div>\r\n										', '/static/school/img/courseware/course.png', '2016-08-27 10:07:31');
INSERT INTO `jf_tb_course_part_detail` VALUES ('2', '141', '133', '一起弹奏吧1', '<div class=\"course_intro_cont\">\r\n												<p>1、了解钢琴弹奏的相关知识。 </p>\r\n												<p>2、初步掌握正确的弹奏姿势和弹奏手形。</p>\r\n												<p>3、学习非连音的弹奏方法。</p>\r\n												<p>4、体验手臂的重力运用和手指</p>												\r\n											</div>\r\n										', '/static/school/img/courseware/course.png', '2016-08-27 10:09:15');
INSERT INTO `jf_tb_course_part_detail` VALUES ('3', '158', '133', '会听的耳朵', '<div class=\"course_intro_cont\">\r\n												<p class=\"course_cont_tit0\">讲述:</p>     \r\n												<div class=\"course_cont_tit1\">\r\n													<p>钢琴是一种键盘类的西洋乐器，有乐器之王的称号。它音域宽广，既能演奏主旋律，又能表现和声，织体，还能演奏各种多声部音乐。有\r\n		清彻，透亮的高音，有浑厚低沉的低音。可以表达如泣如诉的细腻情感，也可以表达气势宏伟的壮阔辉煌，还可以表达活泼欢快的舞蹈形象。它是一种表现力非常丰富的乐器。\r\n													</p>													\r\n												</div>\r\n											</div>\r\n											<div class=\"course_intro_cont\">\r\n												<p class=\"course_cont_tit0\">欣赏:</p>\r\n												<div class=\"course_cont_tit1\">\r\n													<p>教师演奏三首乐曲，用直观演奏展示钢琴艺术“美”，激发学生兴趣。</p> \r\n													<p>《可爱的家》《四小天鹅舞》《斗牛士之歌》</p>													\r\n												</div>\r\n											</div>\r\n										', '/static/school/img/courseware/course.png', '2016-08-27 10:11:29');
INSERT INTO `jf_tb_course_part_detail` VALUES ('4', '163', '133', '一起弹奏吧2', '<div class=\"course_intro_cont\">\n												<p class=\"course_cont_tit0\">讲述:</p>     \n												<div class=\"course_cont_tit1\">\n													<p>钢琴是一种键盘类的西洋乐器，有乐器之王的称号。它音域宽广，既能演奏主旋律，又能表现和声，织体，还能演奏各种多声部音乐。有\n		清彻，透亮的高音，有浑厚低沉的低音。可以表达如泣如诉的细腻情感，也可以表达气势宏伟的壮阔辉煌，还可以表达活泼欢快的舞蹈形象。它是一种表现力非常丰富的乐器。\n													</p>													\n												</div>\n											</div>\n											<div class=\"course_intro_cont\">\n												<p class=\"course_cont_tit0\">欣赏:</p>\n												<div class=\"course_cont_tit1\">\n													<p>教师演奏三首乐曲，用直观演奏展示钢琴艺术“美”，激发学生兴趣。</p> \n													<p>《可爱的家》《四小天鹅舞》《斗牛士之歌》</p>													\n												</div>\n											</div>\n										', '/static/school/img/courseware/course.png', '2016-08-27 10:13:47');

-- ----------------------------
-- Table structure for jf_tb_course_part_history
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_part_history`;
CREATE TABLE `jf_tb_course_part_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='存储未上课程(历史未上课程)';

-- ----------------------------
-- Records of jf_tb_course_part_history
-- ----------------------------
INSERT INTO `jf_tb_course_part_history` VALUES ('3', '135', '194', '2016-08-11 16:39:14');

-- ----------------------------
-- Table structure for jf_tb_course_part_setting
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_part_setting`;
CREATE TABLE `jf_tb_course_part_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL COMMENT '对应课程单元ID',
  `class_id` int(11) DEFAULT NULL COMMENT '班级ID',
  `parent_part_id` int(11) NOT NULL COMMENT '表示自定义课程位置在某正式课程后面。',
  `lesson_status` char(1) DEFAULT NULL COMMENT '1：以上课程；null：未上课程（只存在顶级栏目，例如：lesson_1）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='机动课，是教师在历史未上课程中选出某几个单元课程添加至中，形成一节机动课，如普通课程（如：lesson_1、lesson_2）平级';

-- ----------------------------
-- Records of jf_tb_course_part_setting
-- ----------------------------
INSERT INTO `jf_tb_course_part_setting` VALUES ('1', '133', '194', '0', '1', '2016-08-12 13:29:57');
INSERT INTO `jf_tb_course_part_setting` VALUES ('2', '135', '194', '133', null, '2016-08-12 13:30:39');
INSERT INTO `jf_tb_course_part_setting` VALUES ('10', '158', '194', '133', null, '2016-08-12 17:04:32');
INSERT INTO `jf_tb_course_part_setting` VALUES ('11', '159', '194', '133', null, '2016-08-12 17:04:32');

-- ----------------------------
-- Table structure for jf_tb_course_part_unit
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_part_unit`;
CREATE TABLE `jf_tb_course_part_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '单元名称 如：快乐弹奏',
  `unit_index` int(4) DEFAULT '0' COMMENT '所在课程小节中的位置',
  `part_id` int(11) NOT NULL COMMENT '所在小节的id 对应 jf_tb_course_part 的id字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每一个课程小节中包含的单元\r\n\r\n视频，或者 midi的组合';

-- ----------------------------
-- Records of jf_tb_course_part_unit
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_course_type
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_course_type`;
CREATE TABLE `jf_tb_course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_course_type
-- ----------------------------
INSERT INTO `jf_tb_course_type` VALUES ('100', '开心的歌唱');
INSERT INTO `jf_tb_course_type` VALUES ('101', '一起弹奏吧1');
INSERT INTO `jf_tb_course_type` VALUES ('102', '会听的耳朵');
INSERT INTO `jf_tb_course_type` VALUES ('103', '一起弹奏吧2');
INSERT INTO `jf_tb_course_type` VALUES ('104', '音乐欣赏');
INSERT INTO `jf_tb_course_type` VALUES ('105', '节奏连连看');
INSERT INTO `jf_tb_course_type` VALUES ('106', '电子教案');
INSERT INTO `jf_tb_course_type` VALUES ('107', '作业');

-- ----------------------------
-- Table structure for jf_tb_demolesson
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_demolesson`;
CREATE TABLE `jf_tb_demolesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '视频路径',
  `size` double(11,0) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '类型 1：示范课  2：曲目 3：类型3',
  `author` varchar(255) DEFAULT '' COMMENT '作者，教师id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `know_point` varchar(512) DEFAULT NULL COMMENT '知识要点',
  `like_number` int(11) DEFAULT NULL COMMENT '点赞量',
  `level` int(4) DEFAULT '0' COMMENT '难度',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_demolesson
-- ----------------------------
INSERT INTO `jf_tb_demolesson` VALUES ('3068', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3069', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3070', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3071', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3072', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3073', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3074', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3075', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3076', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3077', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3080', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3081', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3082', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3083', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3084', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3085', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3086', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3087', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3088', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3089', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3095', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3096', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3097', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3098', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3099', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3100', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3101', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3102', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3103', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3104', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3105', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3106', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3107', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3108', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3109', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3110', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson` VALUES ('3111', '虫儿飞(初学儿童)', '/static/upload/video/gg.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson` VALUES ('3112', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson` VALUES ('3113', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson` VALUES ('3114', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson` VALUES ('3126', '测试曲目1', '/static/upload/video/small39.mp4', null, '2', '学生1', '/static/upload/pic/large_width_image1.jpg', '知识要点1\r\n知识要点2\r\n知识要点3', '555', '3', '2016-06-21 15:05:33');

-- ----------------------------
-- Table structure for jf_tb_demolesson_copy
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_demolesson_copy`;
CREATE TABLE `jf_tb_demolesson_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '视频路径',
  `size` double(11,0) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '类型 1：示范课  2：曲目 3：类型3',
  `author` varchar(255) DEFAULT '' COMMENT '作者，教师id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `know_point` varchar(512) DEFAULT NULL COMMENT '知识要点',
  `like_number` int(11) DEFAULT NULL COMMENT '点赞量',
  `level` int(4) DEFAULT '0' COMMENT '难度',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_demolesson_copy
-- ----------------------------
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3068', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3069', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3070', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3071', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3072', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3073', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3074', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3075', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3076', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3077', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3080', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3081', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3082', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3083', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3084', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3085', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3086', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3087', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3088', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3089', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3095', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3096', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3097', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3098', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3099', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3100', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3101', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3102', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3103', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3104', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3105', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3106', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3107', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3108', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3109', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3110', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3111', '虫儿飞(初学儿童)', '/static/upload/video/gg.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3112', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3113', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3114', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy` VALUES ('3126', '测试曲目1', '/static/upload/video/small39.mp4', null, '2', '学生1', '/static/upload/pic/large_width_image1.jpg', '知识要点1\r\n知识要点2\r\n知识要点3', '555', '3', '2016-06-21 15:05:33');

-- ----------------------------
-- Table structure for jf_tb_demolesson_copy1
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_demolesson_copy1`;
CREATE TABLE `jf_tb_demolesson_copy1` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '视频路径',
  `size` double(11,0) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '类型 1：示范课  2：曲目 3：类型3',
  `author` varchar(255) DEFAULT '' COMMENT '作者，教师id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `know_point` varchar(512) DEFAULT NULL COMMENT '知识要点',
  `like_number` int(11) DEFAULT NULL COMMENT '点赞量',
  `level` int(4) DEFAULT '0' COMMENT '难度',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_demolesson_copy1
-- ----------------------------
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3068', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3069', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3070', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3071', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3072', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3073', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3074', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3075', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3076', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3077', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3080', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3081', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3082', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3083', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3084', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3085', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3086', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3087', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3088', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3089', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3095', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3096', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3097', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3098', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3099', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3100', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3101', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3102', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3103', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3104', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3105', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3106', '虫儿飞(初学儿童)', '/static/upload/video/small35.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3107', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3108', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3109', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3110', '小鸣奏曲', '/static/upload/video/small34.mp4', null, '2', '谢依晨', '/static/upload/pic/Koala2.jpg', '第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '33', '0', '2016-06-20 20:16:59');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3111', '虫儿飞(初学儿童)', '/static/upload/video/gg.mp4', null, '1', '常江舟', '/static/upload/pic/Lighthouse.jpg', '虫儿飞\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '666', '0', '2016-06-20 20:22:27');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3112', '示范课3', '/static/upload/video/small36.mp4', null, '1', '林清源', '/static/upload/pic/Jellyfish.jpg', '示范课3\r\n\r\n第一课 认识中央C、二分音符、四分音符、全音符\r\n（一）教学目的：通过本课学习初步了解钢琴的中央C及音符\r\n（二）教学内容：\r\n1.理论授课内容:认识钢琴键盘上的中央C,初步了解钢琴键盘的音名:CDEFGAB。认识五线谱、二分音符、四分音符、全音符。\r\n2.实践授课内容:在钢琴上反复的弹中央C,练习曲《请弹吧》。\r\n（三）教学重点难点：手指触键的感觉，强调左手。', '888', '0', '2016-06-20 20:24:12');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3113', '示范课4', '/static/upload/video/small37.mp4', null, '3', '周宁娅', '/static/upload/pic/Desert.jpg', '示范课4\r\n(一)知识要点1\r\n(二)知识要点2\r\n(三)知识要点3', '999', '0', '2016-06-20 20:31:38');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3114', '示范课5', '/static/upload/video/small38.mp4', null, '1', '吴旭光', '/static/upload/pic/large_width_image.jpg', ' 示范课5：\r\n(一)知识点1\r\n(二)知识点2\r\n(三)知识点3\r\n(四)知识点4\r\n(五)知识点5', '555', '0', '2016-06-20 20:58:48');
INSERT INTO `jf_tb_demolesson_copy1` VALUES ('3126', '测试曲目1', '/static/upload/video/small39.mp4', null, '2', '学生1', '/static/upload/pic/large_width_image1.jpg', '知识要点1\r\n知识要点2\r\n知识要点3', '555', '3', '2016-06-21 15:05:33');

-- ----------------------------
-- Table structure for jf_tb_grade
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_grade`;
CREATE TABLE `jf_tb_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '年级表',
  `name` varchar(45) NOT NULL COMMENT '年级名称',
  `course_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_grade
-- ----------------------------
INSERT INTO `jf_tb_grade` VALUES ('21', '一年级', '13', '1');
INSERT INTO `jf_tb_grade` VALUES ('22', '二年级', null, '1');
INSERT INTO `jf_tb_grade` VALUES ('23', '三年级', null, '1');
INSERT INTO `jf_tb_grade` VALUES ('24', '四年级', null, '1');
INSERT INTO `jf_tb_grade` VALUES ('25', '五年级', null, '5');
INSERT INTO `jf_tb_grade` VALUES ('26', '六年级', null, '1');

-- ----------------------------
-- Table structure for jf_tb_greetings
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_greetings`;
CREATE TABLE `jf_tb_greetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `client_type` char(1) NOT NULL COMMENT '终端类型 1：学生端；2：教师端',
  `type` char(1) NOT NULL COMMENT '1：通用；2：早晨：3：下午;4：晚上;5：凌晨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='问候语';

-- ----------------------------
-- Records of jf_tb_greetings
-- ----------------------------
INSERT INTO `jf_tb_greetings` VALUES ('1', 'Hi，等了这么久，你终于来啦！', '1', '1');
INSERT INTO `jf_tb_greetings` VALUES ('2', '我猜你现在一定很开心吧。', '1', '1');
INSERT INTO `jf_tb_greetings` VALUES ('3', 'Hi，我们又见面了，开始精彩的表演吧！', '1', '1');
INSERT INTO `jf_tb_greetings` VALUES ('4', '用你的琴声和大家说早安吧。', '1', '2');
INSERT INTO `jf_tb_greetings` VALUES ('5', '新的一天从优美的琴声开始，早上好。', '1', '2');
INSERT INTO `jf_tb_greetings` VALUES ('6', '听说，下午的阳光和音乐很配哦！', '1', '3');
INSERT INTO `jf_tb_greetings` VALUES ('7', '让音符变成闪烁的星星来陪着你吧。', '1', '4');
INSERT INTO `jf_tb_greetings` VALUES ('8', '来段音乐，让我有个好梦吧。', '1', '4');
INSERT INTO `jf_tb_greetings` VALUES ('9', '弹一首优美的旋律，祝亲爱的爸爸妈妈晚安。', '1', '4');
INSERT INTO `jf_tb_greetings` VALUES ('10', '亲爱的小小音乐家，时间太晚了赶快去睡觉吧，明天见~', '1', '5');

-- ----------------------------
-- Table structure for jf_tb_greetings_version
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_greetings_version`;
CREATE TABLE `jf_tb_greetings_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL COMMENT '类型 1：学生客户端；2：教师客户端',
  `create_time` bigint(20) NOT NULL COMMENT '最后一次上传更新时间戳，客户端判断是否更新问候语',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_greetings_version
-- ----------------------------
INSERT INTO `jf_tb_greetings_version` VALUES ('1', '1', '1470635185');
INSERT INTO `jf_tb_greetings_version` VALUES ('2', '2', '1470635185');

-- ----------------------------
-- Table structure for jf_tb_homework
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_homework`;
CREATE TABLE `jf_tb_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '答案详情',
  `answer_a` varchar(255) DEFAULT NULL,
  `answer_b` varchar(255) DEFAULT NULL,
  `answer_c` varchar(255) DEFAULT NULL,
  `answer_d` varchar(255) DEFAULT NULL,
  `answer` varchar(4) NOT NULL COMMENT '答案',
  `course_part_id` int(11) NOT NULL COMMENT '所属栏目id',
  `source_index` int(4) NOT NULL DEFAULT '0' COMMENT '在栏目中的顺序',
  `pics_path` varchar(255) DEFAULT NULL,
  `answer_type` char(1) NOT NULL COMMENT '答案类型   1文字  2 图片    类型为图片的时候相应答案column存的是图片地址。数据库中使用相对路径。返回给客户端的时候给客户端绝对路径',
  `ogg_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_homework
-- ----------------------------
INSERT INTO `jf_tb_homework` VALUES ('13', '以下哪一个是四分音符？', '以下哪一个是四分音符?', '/static/upload/homework/Do.png', '/static/upload/homework/Re.png', null, null, 'B', '179', '1', null, '2', '/static/upload/ogg/YinPin.ogg');
INSERT INTO `jf_tb_homework` VALUES ('14', '四分音符弹几拍？99', '四分音符弹几拍？', '一拍', '两拍', '', '', 'A', '181', '2', null, '1', '/static/upload/ogg/YinPin1.ogg');

-- ----------------------------
-- Table structure for jf_tb_lesson
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_lesson`;
CREATE TABLE `jf_tb_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课表id.自动增长',
  `class_id` int(11) DEFAULT NULL COMMENT '班级ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `time_start` varchar(50) DEFAULT NULL,
  `time_end` varchar(50) DEFAULT NULL,
  `day` int(2) DEFAULT NULL COMMENT '周一~周日 \r\n1:周日\r\n2：周一\r\n……\r\n7：周六',
  `am_pm` char(1) DEFAULT NULL COMMENT '1：上午；2：下午',
  `title` varchar(50) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL COMMENT '课堂评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='课时表\r\n可以给班级排课\r\n可以关联学生，学生查询某节课自己的成绩。\r\nlesson1\r\nlesson2';

-- ----------------------------
-- Records of jf_tb_lesson
-- ----------------------------
INSERT INTO `jf_tb_lesson` VALUES ('1', '194', null, '10:00', '12:00', '1', '1', '音乐课', '打发的说法1');
INSERT INTO `jf_tb_lesson` VALUES ('2', '194', null, '08::00', '11:00', '4', '1', '音乐课', '撒旦法对方的');
INSERT INTO `jf_tb_lesson` VALUES ('3', '194', null, '14:30', '16::00', '3', '2', '音乐课', 'adfadsfadsf');
INSERT INTO `jf_tb_lesson` VALUES ('4', '194', null, '15::00', '16:00', '7', '2', '音乐课', 'adfad');
INSERT INTO `jf_tb_lesson` VALUES ('10', '194', null, '12', '123', '2', '1', '2', '1adfa');
INSERT INTO `jf_tb_lesson` VALUES ('11', '194', null, 's', 's', '7', '1', 's', 'd');

-- ----------------------------
-- Table structure for jf_tb_like
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_like`;
CREATE TABLE `jf_tb_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `phone_self` varchar(11) NOT NULL COMMENT '关注者手机号',
  `phone_other` varchar(11) NOT NULL COMMENT '被关注者手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Records of jf_tb_like
-- ----------------------------
INSERT INTO `jf_tb_like` VALUES ('2', '18210546592', '18310359398');
INSERT INTO `jf_tb_like` VALUES ('3', '18210546592', '13522847490');
INSERT INTO `jf_tb_like` VALUES ('4', '18310359398', '18210546592');
INSERT INTO `jf_tb_like` VALUES ('5', '13522847490', '18210546592');
INSERT INTO `jf_tb_like` VALUES ('6', '18611157744', '18210546592');

-- ----------------------------
-- Table structure for jf_tb_music
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_music`;
CREATE TABLE `jf_tb_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `stave_path` varchar(255) DEFAULT NULL COMMENT '五线谱路径',
  `midi_path` varchar(255) DEFAULT NULL COMMENT 'midi文件路径',
  `ogg_path` varchar(255) DEFAULT NULL COMMENT '有时候会用到 音频文件',
  `course_part_id` int(11) NOT NULL COMMENT '所属栏目Id',
  `source_index` int(4) DEFAULT '0' COMMENT '在栏目中的顺序',
  `name` varchar(45) DEFAULT '' COMMENT '音乐名称',
  `tone_id` int(11) DEFAULT NULL,
  `txt_a` varchar(255) DEFAULT '' COMMENT '带midi的txt文件',
  `txt_b` varchar(255) DEFAULT '' COMMENT '非txt文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_music
-- ----------------------------
INSERT INTO `jf_tb_music` VALUES ('17', null, null, null, '152', '1', 'B3GenZou1MIDI', '1', '/static/upload/txt/B3GenZou1MIDI.txt', null);
INSERT INTO `jf_tb_music` VALUES ('18', null, null, null, '155', '1', 'B3WanZhengZouMIDI', '1', '/static/upload/txt/B3WanZhengZouMIDI.txt', null);
INSERT INTO `jf_tb_music` VALUES ('19', '/static/upload/stave/PuZi.png', null, null, '157', '1', 'B3MIDI', '1', '/static/upload/txt/B3MIDI.txt', '/static/upload/txt/B3.txt');
INSERT INTO `jf_tb_music` VALUES ('22', '/static/upload/stave/B2LLK.jpg', null, null, '191', '1', 'B2LLK', '1', '/static/upload/txt/B2LLKMIDI.txt', '/static/upload/txt/B2LLK.txt');
INSERT INTO `jf_tb_music` VALUES ('23', null, null, null, '198', '1', 'B3YiQiTanZouBaGenZou1MIDI', '1', '/static/upload/txt/B3YiQiTanZouBaGenZou1MIDI.txt', null);
INSERT INTO `jf_tb_music` VALUES ('24', null, null, null, '201', '1', 'B3WanZhengZouMIDI', '1', '/static/upload/txt/B3WanZhengZouMIDI1.txt', null);
INSERT INTO `jf_tb_music` VALUES ('25', '/static/upload/stave/B3YiQiTanZouBa.jpg', null, null, '203', '1', 'B3YiQiTanZouBa', '1', '/static/upload/txt/B3YiQiTanZouBaMIDI.txt', '/static/upload/txt/B3YiQiTanZouBa.txt');
INSERT INTO `jf_tb_music` VALUES ('26', null, null, null, '214', '1', '8.2.2', '1', '/static/upload/txt/B3GenZou1MIDI1.txt', null);
INSERT INTO `jf_tb_music` VALUES ('27', null, null, null, '217', '1', '8.4.2', '1', '/static/upload/txt/B3WanZhengZouMIDI2.txt', null);
INSERT INTO `jf_tb_music` VALUES ('28', '/static/upload/stave/PuZi1.png', null, null, '219', '1', '8.5.1', '1', '/static/upload/txt/B3MIDI1.txt', '/static/upload/txt/B31.txt');

-- ----------------------------
-- Table structure for jf_tb_notification
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_notification`;
CREATE TABLE `jf_tb_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL COMMENT '消息内容',
  `read` int(11) NOT NULL DEFAULT '0' COMMENT '是否已读：0默认 1已读',
  `from_author_id` varchar(32) NOT NULL DEFAULT '' COMMENT '来源用户id',
  `author_id` varchar(32) NOT NULL DEFAULT '' COMMENT '目标用户id',
  `target_id` varchar(255) DEFAULT NULL COMMENT '目标id',
  `in_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `action` varchar(255) DEFAULT NULL COMMENT '通知动作',
  `source` varchar(32) DEFAULT NULL COMMENT '通知来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_notification
-- ----------------------------
INSERT INTO `jf_tb_notification` VALUES ('1', '通知信息1', '0', '', '', null, '2016-06-21 15:31:46', null, null);
INSERT INTO `jf_tb_notification` VALUES ('2', '通知信息2', '0', '', '', null, '2016-06-21 15:31:56', null, null);
INSERT INTO `jf_tb_notification` VALUES ('3', '通知信息3', '0', '', '', null, '2016-06-21 15:32:04', null, null);
INSERT INTO `jf_tb_notification` VALUES ('4', '通知信息4', '0', '', '', null, '2016-06-21 15:32:11', null, null);
INSERT INTO `jf_tb_notification` VALUES ('5', '通知信息5', '0', '', '', null, '2016-06-21 15:32:14', null, null);
INSERT INTO `jf_tb_notification` VALUES ('6', '通知信息6', '0', '', '', null, '2016-06-21 15:32:21', null, null);

-- ----------------------------
-- Table structure for jf_tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_permission`;
CREATE TABLE `jf_tb_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '父节点0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_permission
-- ----------------------------
INSERT INTO `jf_tb_permission` VALUES ('1', 'menu:index', '菜单，首页', '10');
INSERT INTO `jf_tb_permission` VALUES ('6', 'menu:user', '菜单，用户', '10');
INSERT INTO `jf_tb_permission` VALUES ('9', 'menu:setting', '菜单，设置', '10');
INSERT INTO `jf_tb_permission` VALUES ('10', 'menu', '菜单节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('14', 'link', '友链节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('16', 'user', '用户节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('18', 'setting', '设置节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('19', 'index', '首页节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('32', 'user:delete', '删除用户', '16');
INSERT INTO `jf_tb_permission` VALUES ('34', 'setting:permission', '权限设置', '18');
INSERT INTO `jf_tb_permission` VALUES ('35', 'setting:sysconfig', '系统设置', '18');
INSERT INTO `jf_tb_permission` VALUES ('36', 'index:topic', '今日话题', '19');
INSERT INTO `jf_tb_permission` VALUES ('37', 'index:reply', '今日回复', '19');
INSERT INTO `jf_tb_permission` VALUES ('38', 'index:user', '今日注册用户', '19');
INSERT INTO `jf_tb_permission` VALUES ('39', 'index:mission', '今日签到', '19');
INSERT INTO `jf_tb_permission` VALUES ('43', 'setting:role', '角色设置', '18');
INSERT INTO `jf_tb_permission` VALUES ('44', 'setting:adminuser', '后台用户设置', '18');
INSERT INTO `jf_tb_permission` VALUES ('49', 'user:disabled', '禁用用户', '16');
INSERT INTO `jf_tb_permission` VALUES ('50', 'setting:modifypwd', '修改密码', '18');
INSERT INTO `jf_tb_permission` VALUES ('55', 'demo', '示范课节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('56', 'demolesson:index', '示范课首页', '55');
INSERT INTO `jf_tb_permission` VALUES ('57', 'demolesson:delete', '删除示范课', '55');
INSERT INTO `jf_tb_permission` VALUES ('58', 'demolesson:add', '添加示范课', '55');
INSERT INTO `jf_tb_permission` VALUES ('59', 'demolesson:edit', '编辑示范课', '55');
INSERT INTO `jf_tb_permission` VALUES ('60', 'menu:demolesson', '示范课管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('61', 'demolesson:get', '查看示范课信息', '55');
INSERT INTO `jf_tb_permission` VALUES ('62', 'video', '通用视频', '0');
INSERT INTO `jf_tb_permission` VALUES ('63', 'video:list', '通用视频首页', '62');
INSERT INTO `jf_tb_permission` VALUES ('64', 'video:add', '通用视频增加', '62');
INSERT INTO `jf_tb_permission` VALUES ('65', 'video:edit', '通用视频修改', '62');
INSERT INTO `jf_tb_permission` VALUES ('66', 'video:delete', '通用视频删除', '62');
INSERT INTO `jf_tb_permission` VALUES ('67', 'video:info', '通用视频查看', '62');
INSERT INTO `jf_tb_permission` VALUES ('68', 'menu:video', '通用视频管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('69', 'course', '课程管理', '0');
INSERT INTO `jf_tb_permission` VALUES ('71', 'course:index', '课程列表', '69');
INSERT INTO `jf_tb_permission` VALUES ('72', 'course:add', '课程增加', '69');
INSERT INTO `jf_tb_permission` VALUES ('73', 'course:edit', '课程编辑', '69');
INSERT INTO `jf_tb_permission` VALUES ('74', 'course:delete', '课程删除', '69');
INSERT INTO `jf_tb_permission` VALUES ('75', 'course:info', '课程详情', '69');
INSERT INTO `jf_tb_permission` VALUES ('76', 'menu:course', '课程管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('77', 'menu:coursepart', '课程小节(项目)', '10');
INSERT INTO `jf_tb_permission` VALUES ('78', 'coursepart', '课程小节(项目)', '0');
INSERT INTO `jf_tb_permission` VALUES ('79', 'coursepart:index', '课程小节列表页', '78');
INSERT INTO `jf_tb_permission` VALUES ('80', 'coursepart:add', '课程小节添加', '78');
INSERT INTO `jf_tb_permission` VALUES ('81', 'coursepart:delete', '课程小节删除', '78');
INSERT INTO `jf_tb_permission` VALUES ('82', 'coursepart:edit', '课程小节修改', '78');
INSERT INTO `jf_tb_permission` VALUES ('83', 'coursepart:info', '课程小节详情', '78');
INSERT INTO `jf_tb_permission` VALUES ('84', 'coursepartunit', '小节单元管理', '0');
INSERT INTO `jf_tb_permission` VALUES ('85', 'coursepartunit:index', '单元列表页', '84');
INSERT INTO `jf_tb_permission` VALUES ('86', 'coursepartunit:add', '单元增加', '84');
INSERT INTO `jf_tb_permission` VALUES ('87', 'coursepartunit:edit', '单元修改', '84');
INSERT INTO `jf_tb_permission` VALUES ('88', 'coursepartunit:delete', '单元删除', '84');
INSERT INTO `jf_tb_permission` VALUES ('89', 'menu:coursepartunit', '小节单元管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('90', 'coursepart:addchild', '增加子栏目', '78');
INSERT INTO `jf_tb_permission` VALUES ('91', 'music', '音乐节点', '0');
INSERT INTO `jf_tb_permission` VALUES ('93', 'menu:music', '音乐管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('94', 'music:index', '音乐列表页', '91');
INSERT INTO `jf_tb_permission` VALUES ('95', 'music:add', '增加音乐', '91');
INSERT INTO `jf_tb_permission` VALUES ('96', 'music:edit', '编辑音乐', '91');
INSERT INTO `jf_tb_permission` VALUES ('97', 'music:delete', '删除音乐', '91');
INSERT INTO `jf_tb_permission` VALUES ('98', 'music:info', '查看音乐详情', '91');
INSERT INTO `jf_tb_permission` VALUES ('99', 'menu:homework', '作业管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('100', 'homework', '作业管理', '0');
INSERT INTO `jf_tb_permission` VALUES ('102', 'homework:index', '家庭作业列表页', '100');
INSERT INTO `jf_tb_permission` VALUES ('103', 'homework:add', '家庭作业增加', '100');
INSERT INTO `jf_tb_permission` VALUES ('104', 'homework:edit', '家庭作业修改', '100');
INSERT INTO `jf_tb_permission` VALUES ('105', 'homework:delete', '家庭作业删除', '100');
INSERT INTO `jf_tb_permission` VALUES ('106', 'homework:info', '家庭作业详情', '100');
INSERT INTO `jf_tb_permission` VALUES ('107', 'grade', '年级管理', '0');
INSERT INTO `jf_tb_permission` VALUES ('108', 'menu:grade', '年级管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('109', 'grade:select_course', '年级选课', '107');
INSERT INTO `jf_tb_permission` VALUES ('110', 'grade:edit', '编辑年级', '107');
INSERT INTO `jf_tb_permission` VALUES ('111', 'user:add', '增加用户', '16');
INSERT INTO `jf_tb_permission` VALUES ('112', 'menu:score', '成绩管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('113', 'menu:source', '资源管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('114', 'menu:song', '曲库管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('116', '', '成绩管理', '0');
INSERT INTO `jf_tb_permission` VALUES ('117', 'score:index', '成绩列表页', '116');
INSERT INTO `jf_tb_permission` VALUES ('118', 'score:delete', '成绩删除', '116');
INSERT INTO `jf_tb_permission` VALUES ('119', 'menu:school', '学校管理', '10');
INSERT INTO `jf_tb_permission` VALUES ('120', 'abc', 'menu:abc', '10');

-- ----------------------------
-- Table structure for jf_tb_piano
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_piano`;
CREATE TABLE `jf_tb_piano` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钢琴表自增id',
  `use_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用时间',
  `user_degree` varchar(45) DEFAULT NULL COMMENT '使用程度',
  `description` varchar(512) DEFAULT NULL COMMENT '产品参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_piano
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_piano_malfunction
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_piano_malfunction`;
CREATE TABLE `jf_tb_piano_malfunction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钢琴故障表自增id',
  `piano_id` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL COMMENT '故障类型',
  `description` varchar(255) DEFAULT NULL COMMENT '故障说明',
  `repairs_time` datetime DEFAULT NULL COMMENT '报修日期',
  `status` varchar(1) DEFAULT NULL COMMENT '故障钢琴状态 1未维修2在维修3已维修',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_piano_malfunction
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_piano_malfunction_detail
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_piano_malfunction_detail`;
CREATE TABLE `jf_tb_piano_malfunction_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mal_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_piano_malfunction_detail
-- ----------------------------
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('1', '2', '您已成功提供钢琴故障报修维修申请。', '2016-08-28 02:16:40');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('2', '2', '您已成功提供钢琴故障报修维修申请。', '2016-08-28 11:17:27');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('3', '2', '天使音乐已接收到故障钢琴，正在检测维修。', '2016-08-29 02:17:43');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('4', '3', '您已成功提供钢琴故障报修维修申请。', '2016-08-29 02:17:45');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('5', '3', '您已成功提供钢琴故障报修维修申请。', '2016-08-29 02:17:46');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('6', '3', '天使音乐已接收到故障钢琴，正在检测维修。', '2016-08-29 02:17:47');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('8', '7', '11123沙发上到', '2016-09-01 05:51:12');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('9', '3', '谁发的发', '2016-09-01 05:55:32');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('10', '4', '第一步', '2016-09-01 05:57:45');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('11', '4', '完成', '2016-09-01 06:00:42');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('12', '15', '第一步', '2016-09-01 06:22:57');
INSERT INTO `jf_tb_piano_malfunction_detail` VALUES ('13', '15', '完成', '2016-09-01 06:23:30');

-- ----------------------------
-- Table structure for jf_tb_province
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_province`;
CREATE TABLE `jf_tb_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_province
-- ----------------------------
INSERT INTO `jf_tb_province` VALUES ('1', '北京市 ');
INSERT INTO `jf_tb_province` VALUES ('2', '广东省 ');
INSERT INTO `jf_tb_province` VALUES ('3', '山东省 ');
INSERT INTO `jf_tb_province` VALUES ('4', '江苏省 ');
INSERT INTO `jf_tb_province` VALUES ('5', '河南省 ');
INSERT INTO `jf_tb_province` VALUES ('6', '上海市');
INSERT INTO `jf_tb_province` VALUES ('7', '河北省 ');
INSERT INTO `jf_tb_province` VALUES ('8', '浙江省');
INSERT INTO `jf_tb_province` VALUES ('9', '香港特别行政区');
INSERT INTO `jf_tb_province` VALUES ('10', '陕西省');
INSERT INTO `jf_tb_province` VALUES ('11', '湖南省');
INSERT INTO `jf_tb_province` VALUES ('12', '重庆市');
INSERT INTO `jf_tb_province` VALUES ('13', '福建省');
INSERT INTO `jf_tb_province` VALUES ('14', '天津市');
INSERT INTO `jf_tb_province` VALUES ('15', '云南省');
INSERT INTO `jf_tb_province` VALUES ('16', '四川省');
INSERT INTO `jf_tb_province` VALUES ('17', '广西壮族自治区');
INSERT INTO `jf_tb_province` VALUES ('18', '安徽省');
INSERT INTO `jf_tb_province` VALUES ('19', '海南省');
INSERT INTO `jf_tb_province` VALUES ('20', '江西省');
INSERT INTO `jf_tb_province` VALUES ('21', '湖北省');
INSERT INTO `jf_tb_province` VALUES ('22', '山西省');
INSERT INTO `jf_tb_province` VALUES ('23', '辽宁省');
INSERT INTO `jf_tb_province` VALUES ('24', '台湾省');
INSERT INTO `jf_tb_province` VALUES ('25', '黑龙江');
INSERT INTO `jf_tb_province` VALUES ('26', '内蒙古自治区');
INSERT INTO `jf_tb_province` VALUES ('27', '澳门特别行政区');
INSERT INTO `jf_tb_province` VALUES ('28', '贵州省');
INSERT INTO `jf_tb_province` VALUES ('29', '甘肃省');
INSERT INTO `jf_tb_province` VALUES ('30', '青海省');
INSERT INTO `jf_tb_province` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `jf_tb_province` VALUES ('32', '西藏区');
INSERT INTO `jf_tb_province` VALUES ('33', '吉林省');
INSERT INTO `jf_tb_province` VALUES ('34', '宁夏回族自治区');

-- ----------------------------
-- Table structure for jf_tb_role
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_role`;
CREATE TABLE `jf_tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jf_tb_role
-- ----------------------------
INSERT INTO `jf_tb_role` VALUES ('1', 'admin', '超级管理员');
INSERT INTO `jf_tb_role` VALUES ('2', 'banzhu', '版主');
INSERT INTO `jf_tb_role` VALUES ('3', '测试号', '测试账号');

-- ----------------------------
-- Table structure for jf_tb_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_role_permission`;
CREATE TABLE `jf_tb_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  KEY `fk_role_permission` (`rid`) USING BTREE,
  KEY `fk_permission_role` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_role_permission
-- ----------------------------
INSERT INTO `jf_tb_role_permission` VALUES ('2', '1');
INSERT INTO `jf_tb_role_permission` VALUES ('2', '9');
INSERT INTO `jf_tb_role_permission` VALUES ('2', '34');
INSERT INTO `jf_tb_role_permission` VALUES ('2', '50');
INSERT INTO `jf_tb_role_permission` VALUES ('2', '36');
INSERT INTO `jf_tb_role_permission` VALUES ('2', '37');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '1');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '60');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '56');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '57');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '58');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '59');
INSERT INTO `jf_tb_role_permission` VALUES ('3', '61');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '1');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '6');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '9');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '60');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '68');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '76');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '77');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '89');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '93');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '99');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '108');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '112');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '113');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '114');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '119');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '32');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '49');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '111');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '34');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '35');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '43');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '44');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '50');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '36');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '37');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '38');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '39');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '56');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '57');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '58');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '59');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '61');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '63');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '64');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '65');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '66');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '67');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '71');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '72');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '73');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '74');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '75');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '79');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '80');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '81');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '82');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '83');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '90');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '85');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '86');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '87');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '88');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '94');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '95');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '96');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '97');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '98');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '102');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '103');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '104');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '105');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '106');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '109');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '110');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '117');
INSERT INTO `jf_tb_role_permission` VALUES ('1', '118');

-- ----------------------------
-- Table structure for jf_tb_schedule
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_schedule`;
CREATE TABLE `jf_tb_schedule` (
  `id` int(11) NOT NULL COMMENT '课程表自增id',
  `week` varchar(1) DEFAULT NULL COMMENT '周几',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `name` varchar(255) DEFAULT NULL COMMENT '课程名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_school
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_school`;
CREATE TABLE `jf_tb_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_school
-- ----------------------------
INSERT INTO `jf_tb_school` VALUES ('1', '测试学校1', '打发的说法', '2016-08-04 14:39:10');
INSERT INTO `jf_tb_school` VALUES ('3', '测试学校3', '发', '2016-08-06 16:37:35');
INSERT INTO `jf_tb_school` VALUES ('4', 'School', '啊打发的\r\n爱的色放', '2016-08-06 16:37:45');
INSERT INTO `jf_tb_school` VALUES ('5', '测试学校4', '啊打发', '2016-08-06 16:37:51');
INSERT INTO `jf_tb_school` VALUES ('6', '测111', null, '2016-08-06 17:26:32');
INSERT INTO `jf_tb_school` VALUES ('7', '测1111', null, '2016-08-08 18:14:35');

-- ----------------------------
-- Table structure for jf_tb_school_detail
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_school_detail`;
CREATE TABLE `jf_tb_school_detail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `intro` text COMMENT '学校简介',
  `history` text COMMENT '历史沿革',
  `trait` text COMMENT '办学特点',
  `description` text COMMENT '学科介绍',
  `recruit` text COMMENT '招生报名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_school_detail
-- ----------------------------
INSERT INTO `jf_tb_school_detail` VALUES ('1', '星海音乐学院附属中等音乐学校', '', '\r\n											<p class=\"school_sum_p0\">\r\n												星海音乐学院附属中等学校(简称\"星海附中\")地处广州，是华南地区唯一的中等音乐专业学校,由广东省教育厅和星海音乐学院主管。学校创建于1957年，原名广州音乐学院。1985年为纪念人民音乐家冼星海，学校更名为星海音乐学院附属中等音乐学校。\r\n											</p>\r\n											<p class=\"school_sum_p1\">\r\n												2009年被国家教育部认定为继中央音乐学院附中和上海音乐学院附中后第三家国家级重点中等音乐专业学校。\r\n											</p>\r\n											<p class=\"school_sum_p2\">\r\n												学校以培养高等音乐院校优秀后备生和复合型的中等音乐人才为目标。面向全国(\"含港、澳、台地区\")招生。现设有钢琴(含双排键)、管弦、民乐、声乐、作曲、音乐舞蹈等六个专业。其中。钢琴为广东省首批重点建设专业。\r\n											</p>\r\n										', '\n											星海音乐学院附属中等学校(简称\"星海附中\")地处广州，是华南地区唯一的中等音乐专业学校,由广东省教育厅和星海音乐学院主管。学校创建于1957年，原名广州音乐学院。1985年为纪念人民音乐家冼星海，学校更名为星海音乐学院附属中等音乐学校。\n										<br>\n										2009年被国家教育部认定为继中央音乐学院附中和上海音乐学院附中后第三家国家级重点中等音乐专业学校。\n										<br>\n											学校以培养高等音乐院校优秀后备生和复合型的中等音乐人才为目标。面向全国(\"含港、澳、台地区\")招生。现设有钢琴(含双排键)、管弦、民乐、声乐、作曲、音乐舞蹈等六个专业。其中。钢琴为广东省首批重点建设专业。\n										', '\n											学校践行星海精神，坚持\"求真、尚美、崇德、敬业\"的办学理念。形成了\"实践性强、开放度高、办学资源丰富、专业与文化均衡发展\"的办学特点。\n										', '<p class=\"school_subject\">钢琴学科</p>\n										<p>\n											钢琴学科是广东省教育厅首批重点建设学科,设有钢琴及双排键电子管风琴专业方向。该学科师资力量强大，近3年来所培养的学生在国际、国内重大比赛中屡获大奖，累计20余项。\n											学科负责人朱晓蓓副教授教学经验丰富，成果显著、曾获得\"优秀园丁奖\",现为广东省音乐家协会高等音乐教育学会理事、澳门青年交响乐团海外顾问，在专业领域有较大的影响力。\n										</p>\n										<p class=\"school_subject school_sub\">民乐学科</p>\n										<p>\n											民乐学科是附中规模较大的表演专业学科，设有二胡、高胡、扬琴、琵琶、古筝、三弦、中阮、笛子、笙、唢呐、民族打击乐等专业。该学科坚持以岭南音乐为特色，传承和发展民族音乐。\n											近年来师生在全国各类专业比赛中频创佳绩。学科负责人张帆老师教学经验丰富，现任中国竹笛学会理事、广东省竹笛协会副会长、广东音乐家教育协会副会长、多次获得全国优秀指导教师等称号。\n										</p>		\n									', '\n										<p>1、广州(校本部)考点:</p>\n										<p>1)网上报名时间:由2013年3月8日上午9:00至3月16日下午17:00止</p>\n										<p>2)现场确认时间:暂定2013年3月20日、21日上午9:00-11:30,下午14:30-16:30</p>\n										<p>逾期未确认者,一律做报名无效处理</p>\n										<p>3)因故未在网上报名的考生，可在现场确认时进行补报</p>\n										<p>4)考试时间:3月23日起初试</p>\n									');

-- ----------------------------
-- Table structure for jf_tb_score
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_score`;
CREATE TABLE `jf_tb_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成绩表自增id',
  `student_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `score` int(4) DEFAULT NULL,
  `class_index` int(4) DEFAULT NULL COMMENT '班级排名',
  `grade_index` int(4) DEFAULT NULL COMMENT '成绩排名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_score
-- ----------------------------

-- ----------------------------
-- Table structure for jf_tb_song
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_song`;
CREATE TABLE `jf_tb_song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '音乐名称',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `level` char(1) NOT NULL DEFAULT '1' COMMENT '等级划分，1-8',
  `cover_path` varchar(255) DEFAULT NULL COMMENT '封面图片路径',
  `stave_path` varchar(255) DEFAULT NULL COMMENT '五线谱',
  `midi_path` varchar(255) DEFAULT NULL,
  `ogg_path` varchar(255) DEFAULT NULL,
  `txt_a` varchar(255) DEFAULT NULL,
  `txt_b` varchar(255) DEFAULT NULL,
  `click_num` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='曲库，我爱弹奏';

-- ----------------------------
-- Records of jf_tb_song
-- ----------------------------
INSERT INTO `jf_tb_song` VALUES ('1', '歌曲1', '贝多芬', '1', 'fadf', 'afadf', 'af', 'adfa222', null, null, '0', '2016-07-13 11:46:09');
INSERT INTO `jf_tb_song` VALUES ('2', '歌曲2', '贝多芬2', '1', null, null, null, null, null, null, '243', '2016-07-13 13:29:39');
INSERT INTO `jf_tb_song` VALUES ('3', '歌曲3', '贝多芬3', '2', null, null, null, null, null, null, '13', '2016-07-13 13:29:53');
INSERT INTO `jf_tb_song` VALUES ('4', '歌曲4', '贝多芬4', '2', null, null, null, null, null, null, '13', '2016-07-13 13:30:04');
INSERT INTO `jf_tb_song` VALUES ('5', '歌曲5', '贝多芬5', '3', null, null, null, null, null, null, '2313', '2016-07-13 17:02:11');
INSERT INTO `jf_tb_song` VALUES ('6', '歌曲6', '贝多芬6', '4', null, null, null, null, null, null, '2', '2016-07-13 17:02:22');
INSERT INTO `jf_tb_song` VALUES ('7', '歌曲7', '贝多芬7', '5', null, null, null, null, null, null, '23', '2016-07-13 17:02:24');
INSERT INTO `jf_tb_song` VALUES ('8', '歌曲8', '贝多芬8', '5', null, null, null, null, null, null, '1', '2016-07-13 17:02:25');
INSERT INTO `jf_tb_song` VALUES ('9', '歌曲9', '贝多芬9', '5', null, null, null, null, null, null, '1', '2016-07-13 17:02:27');
INSERT INTO `jf_tb_song` VALUES ('11', '歌曲11', '贝多芬11', '6', null, null, null, null, null, null, '100', '2016-07-13 17:02:29');
INSERT INTO `jf_tb_song` VALUES ('12', '歌曲12', '贝多芬12', '7', null, null, null, null, null, null, '244', '2016-07-13 17:02:32');
INSERT INTO `jf_tb_song` VALUES ('13', 'adf', 'beiduof啊', '8', '/static/upload/pic/职位7.png', '/static/upload/stave/职位2.png', '/static/upload/midi/midi1.midi', '/static/upload/ogg/ogg1.ogg', null, null, '222', '2016-07-14 16:38:25');
INSERT INTO `jf_tb_song` VALUES ('16', '新歌23', '阿凡达', '1', '/static/upload/pic/职位10.png', null, null, null, '/static/upload/midi/midi1.txt', '/static/upload/midi/midi2.txt', '333', '2016-07-18 11:49:29');
INSERT INTO `jf_tb_song` VALUES ('17', 'abcd', '又是贝多芬', '7', '/static/upload/pic/职位12.png', '/static/upload/stave/职位5.png', '/static/upload/midi/midi4.midi', '/static/upload/ogg/ogg4.ogg', '/static/upload/txt/video_list1.txt', '/static/upload/txt/taobaokey2.txt', '12', '2016-07-25 13:37:39');

-- ----------------------------
-- Table structure for jf_tb_song_record
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_song_record`;
CREATE TABLE `jf_tb_song_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL COMMENT '歌曲ID',
  `phone_num` varchar(11) NOT NULL COMMENT '用户手机号码，关联用户表',
  `cover_num` int(11) DEFAULT '1' COMMENT '封面编号',
  `txt_path` varchar(255) DEFAULT NULL COMMENT '用户弹奏后生成的txt文件，由客户生成发送给服务器',
  `yin_gao` int(11) DEFAULT '0' COMMENT '音高，单位%',
  `jie_zou` int(11) DEFAULT '0' COMMENT '节奏:单位%',
  `shi_zhi` int(11) DEFAULT '0' COMMENT '时值：单位%',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_song_record
-- ----------------------------
INSERT INTO `jf_tb_song_record` VALUES ('1', '2', '13888888888', '1', '/static/upload/txt/1469093890747800.txt', '90', '80', null, '2016-07-21 17:37:31');
INSERT INTO `jf_tb_song_record` VALUES ('2', '2', '13888888888', '1', '/static/upload/txt/1469093933396628.txt', '90', '80', '60', '2016-07-21 17:38:14');

-- ----------------------------
-- Table structure for jf_tb_song_tag
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_song_tag`;
CREATE TABLE `jf_tb_song_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL COMMENT '歌曲标签ID',
  `song_id` int(11) NOT NULL COMMENT '曲库ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_song_tag
-- ----------------------------
INSERT INTO `jf_tb_song_tag` VALUES ('1', '1', '1');
INSERT INTO `jf_tb_song_tag` VALUES ('2', '1', '2');
INSERT INTO `jf_tb_song_tag` VALUES ('3', '1', '3');
INSERT INTO `jf_tb_song_tag` VALUES ('4', '2', '4');
INSERT INTO `jf_tb_song_tag` VALUES ('5', '1', '5');
INSERT INTO `jf_tb_song_tag` VALUES ('6', '1', '6');
INSERT INTO `jf_tb_song_tag` VALUES ('7', '1', '7');
INSERT INTO `jf_tb_song_tag` VALUES ('8', '1', '8');
INSERT INTO `jf_tb_song_tag` VALUES ('9', '1', '9');
INSERT INTO `jf_tb_song_tag` VALUES ('11', '1', '11');
INSERT INTO `jf_tb_song_tag` VALUES ('12', '1', '12');
INSERT INTO `jf_tb_song_tag` VALUES ('13', '2', '1');
INSERT INTO `jf_tb_song_tag` VALUES ('16', '1', '16');
INSERT INTO `jf_tb_song_tag` VALUES ('20', '2', '16');
INSERT INTO `jf_tb_song_tag` VALUES ('33', '11', '16');
INSERT INTO `jf_tb_song_tag` VALUES ('38', '2', '13');
INSERT INTO `jf_tb_song_tag` VALUES ('39', '1', '17');
INSERT INTO `jf_tb_song_tag` VALUES ('40', '2', '17');
INSERT INTO `jf_tb_song_tag` VALUES ('41', '3', '17');
INSERT INTO `jf_tb_song_tag` VALUES ('42', '15', '17');

-- ----------------------------
-- Table structure for jf_tb_student
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_student`;
CREATE TABLE `jf_tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `class_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `parent_type` varchar(20) DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL COMMENT '性别 男1  女2',
  `entrancetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入学时间',
  `parent_id` int(11) DEFAULT NULL COMMENT '家长ID',
  `student_number` varchar(20) DEFAULT NULL COMMENT '学籍号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `age` varchar(3) DEFAULT '' COMMENT '年龄',
  `state` varchar(1) DEFAULT '1' COMMENT '状态 1在读 2休学 3转学 4毕业',
  `study_time` varchar(10) DEFAULT NULL COMMENT '学习时长',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `level` int(4) DEFAULT '0' COMMENT '等级',
  `description` varchar(255) DEFAULT '' COMMENT '简介',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PHONE_UNIQUE` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_student
-- ----------------------------
INSERT INTO `jf_tb_student` VALUES ('89', '194', '周宁娅', '18210546592', '爸爸', '阿什顿飞', '2', '2013-09-10 00:00:00', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('92', '194', '董云辰1', '18611082881', '爸爸', '大', '2', '2016-08-25 00:00:00', null, '201606218899', '北京市朝阳区望京SOHO', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('96', '194', 'can老师', '15210411296', '爸爸', '么么哒', '2', '2016-08-08 00:00:00', null, '123456789101', '北京市朝阳区鹿港小镇A2单元605室123', '15', '2', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('102', '194', '超姐', '13651004228', '爸爸', 'Mom', '1', '2016-08-08 00:00:00', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('103', '194', '王帅', '13693329426', '爸爸', 'Mom', '1', '2016-08-10 14:33:42', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('104', '219', '夏毅', '18510236545', '爸爸', 'Mom', '2', '2016-08-09 00:00:00', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '0', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('105', '219', '杜金科', '13611087000', '爸爸', 'Mom', '1', '2016-08-09 00:00:00', null, '201509100113', '北京市朝阳区鹿港小镇A2单元605室2', '14', '3', '0', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('106', '194', '包野', '18618422414', '爸爸', 'Mom', '1', '2016-08-12 16:30:33', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '4', '21', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('107', '219', '123', '18156911306', '爸爸', 'Momw', '2', '2016-08-13 00:00:00', null, '201509100112131231', '北京市朝阳区鹿港小镇A2单元605室', '12', '2', '44', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('111', '219', 'aaaa', '18156911305', '爸爸', null, '1', '2016-08-13 17:36:40', null, '312123', 'asda', '12', '2', null, null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('113', '194', '德哥', '13691194025', '爸爸', 'Mom', '1', '2016-08-14 14:26:33', null, '201509100119', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('114', '194', '桐桐', '18148141319', '爸爸', 'Mom', '1', '2016-08-14 14:28:51', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('115', '220', '同同', '13911341388', '爸爸', 'Mom', '1', '2016-08-14 14:31:30', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('116', '220', '大桐', '13161541319', '爸爸', 'Mom', '1', '2016-08-14 14:32:13', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('117', '194', 'ning亚', '18156911307', '妈妈', '战三', '2', '2016-08-20 00:00:00', null, '20150910031112', '北京市朝阳区鹿港小镇A2单元605室2321', '131', '3', '111', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('118', '221', '贝贝', '18611590801', '爸爸', 'Mom', '1', '2016-08-14 16:37:18', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('119', '221', '潘潘', '18844138401', '爸爸', 'Mom', '1', '2016-08-14 16:38:33', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('120', '221', '帅帅', '13261082613', '爸爸', 'Mom', '1', '2016-08-14 16:38:53', null, '201509100112', '133', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('121', '222', '张三1', '15001284030', '爸爸', 'Mom', '1', '2016-08-14 16:39:47', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('122', '222', '艳艳', '13466519426', '爸爸', 'Mom', '1', '2016-08-14 16:40:31', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('123', '222', '于于', '18600943577', '爸爸', 'Mom', '1', '2016-08-14 16:40:55', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('124', '222', '王晶', '15601212266', '爸爸', 'Mom', '1', '2016-08-14 16:41:09', null, '201509100112', '北京市朝阳区鹿港小镇A2单元605室', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('125', '219', '张三1', '13344445555', '爸爸', 'mon', '1', '2016-08-15 20:53:47', null, '201509100112', '133', '12', '1', '20', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('127', '219', '郭珊', '13344445510', null, null, '1', '2016-08-15 21:01:00', null, '1', '133', '12', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('128', '219', '张琦', '13344445512', null, null, '1', '2016-08-15 21:01:07', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('129', '219', '王禹嘉', '13344445513', null, null, '1', '2016-08-15 21:01:11', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('130', '194', '王步国', '13344445514', null, null, '1', '2016-08-15 21:01:13', null, '1', '133', '1', '3', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('131', '194', '侯苍慧', '13344445515', null, null, '1', '2016-08-15 21:01:16', null, '1', '133', '1', '3', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('132', '194', '袁啸', '13344445516', null, null, '1', '2016-08-15 21:01:19', null, '1', '133', '1', '3', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('134', '194', '董云辰', '13344445517', null, null, '1', '2016-08-15 21:01:24', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('135', '220', '倪文帅', '13344445518', null, null, '1', '2016-08-15 21:01:26', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('136', '220', '范启明 ', '13344445519', null, null, '1', '2016-08-15 21:01:28', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('137', '220', '王亮', '13344445520', null, null, '1', '2016-08-15 21:01:34', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('138', '220', '温秋荣', '13344445521', null, null, '1', '2016-08-15 21:01:37', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('139', '221', '常姜洲', '13344445522', null, null, '1', '2016-08-15 21:01:39', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('140', '221', '胡志昆  ', '13344445523', null, null, '1', '2016-08-15 21:01:41', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('141', '221', '吴旭光', '13344445524', null, null, '1', '2016-08-15 21:01:43', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('142', '221', '周宁娅', '13344445525', null, null, '1', '2016-08-15 21:01:46', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('143', '222', '文东', '13344445526', null, null, '1', '2016-08-15 21:01:48', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('144', '222', '孙超', '13344445527', null, null, '1', '2016-08-15 21:01:52', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('145', null, '秦庆渊', '13344445528', null, '王帅帅', '1', '2016-08-15 21:01:54', null, '1', '133', '1', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('146', null, '田继东', '13344445529', null, null, '1', '2016-08-15 21:01:56', null, '1444444444444', '133', '12', '1', '1', null, '0', '', '0', '1');
INSERT INTO `jf_tb_student` VALUES ('147', null, '马宁1', '13344445530', '爸爸', '王哭', '1', '2016-08-02 00:00:00', null, '20150910011213123199', '1332abc北京', '14', '1', '120', null, '0', '', '0', '1');

-- ----------------------------
-- Table structure for jf_tb_student_score
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_student_score`;
CREATE TABLE `jf_tb_student_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL COMMENT '学生ID',
  `score` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `homework_id` int(11) DEFAULT NULL,
  `play_record` text,
  `error_flag` text,
  `comments` varchar(255) DEFAULT NULL COMMENT '评语',
  `s_jiezou` int(11) DEFAULT NULL COMMENT '单位是百分比',
  `s_shizhi` int(11) DEFAULT NULL,
  `s_yingao` int(11) DEFAULT NULL,
  `student_answer` varchar(4) DEFAULT NULL COMMENT '学生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_student_score
-- ----------------------------
INSERT INTO `jf_tb_student_score` VALUES ('1', '117', '3', '133', null, null, null, 'afada大', null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('62', '117', '4', '162', null, null, null, '阿打发打发到是', null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('63', '117', '2', '135', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('64', '117', '1', '141', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('65', '117', '2', '158', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('66', '117', '3', '159', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('67', '117', '2', '160', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('68', '117', '4', '163', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('69', '117', '1', '174', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('70', '117', '1', '175', null, null, null, null, '20', '50', null, null);
INSERT INTO `jf_tb_student_score` VALUES ('71', '117', '3', '176', null, null, null, null, '70', '80', '90', null);
INSERT INTO `jf_tb_student_score` VALUES ('75', '117', '3', '11', null, 'asdfasdfasdfasdfasdfasdfashdfasdfasdfausdfasdhfaushdfahsdufgauisdhfauhsdfiuadshfiuohaosduf', null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('76', '89', '1', '133', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('77', '92', '2', '133', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('78', '89', '1', '141', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('79', '92', '2', '141', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('80', '106', '3', '163', null, null, null, null, null, null, null, null);
INSERT INTO `jf_tb_student_score` VALUES ('81', '1', '4', '2', null, 's111111', null, '俺的沙发', null, null, null, null);

-- ----------------------------
-- Table structure for jf_tb_stu_homework_answer
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_stu_homework_answer`;
CREATE TABLE `jf_tb_stu_homework_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `hid` int(11) NOT NULL COMMENT '选择题作业ID',
  `student_answer` varchar(4) DEFAULT NULL COMMENT '学生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_stu_homework_answer
-- ----------------------------
INSERT INTO `jf_tb_stu_homework_answer` VALUES ('1', '117', '13', 'A');
INSERT INTO `jf_tb_stu_homework_answer` VALUES ('2', '117', '14', 'A');
INSERT INTO `jf_tb_stu_homework_answer` VALUES ('3', '3', '12', 'A');

-- ----------------------------
-- Table structure for jf_tb_suggest
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_suggest`;
CREATE TABLE `jf_tb_suggest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) DEFAULT NULL COMMENT '学校ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名字',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `message` varchar(255) DEFAULT NULL COMMENT '留言',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学校端意见建议';

-- ----------------------------
-- Records of jf_tb_suggest
-- ----------------------------
INSERT INTO `jf_tb_suggest` VALUES ('1', '1', '张三', '13111112222', 'asdf@163.com', '注册中操作失误，选择了另外一个号码发送了短信，结果无法撤销。希望解决。另，是不是注册后号码就不能修改了', '2016-08-30 10:05:05');

-- ----------------------------
-- Table structure for jf_tb_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_sys_config`;
CREATE TABLE `jf_tb_sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(45) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_sys_config
-- ----------------------------
INSERT INTO `jf_tb_sys_config` VALUES ('2', 'emailPassword', 'mnbvcxz2014');
INSERT INTO `jf_tb_sys_config` VALUES ('3', 'emailSender', 'LKK  Piano');
INSERT INTO `jf_tb_sys_config` VALUES ('4', 'emailSmtp', 'smtp.163.com');
INSERT INTO `jf_tb_sys_config` VALUES ('5', 'emailUsername', 'cjz930305@163.com');
INSERT INTO `jf_tb_sys_config` VALUES ('6', 'pageSize', '8');
INSERT INTO `jf_tb_sys_config` VALUES ('7', 'qq_appId', '');
INSERT INTO `jf_tb_sys_config` VALUES ('8', 'qq_appKey', '');
INSERT INTO `jf_tb_sys_config` VALUES ('9', 'qq_redirect_URI', '');
INSERT INTO `jf_tb_sys_config` VALUES ('10', 'sina_clientId', '');
INSERT INTO `jf_tb_sys_config` VALUES ('11', 'sina_clientSercret', '');
INSERT INTO `jf_tb_sys_config` VALUES ('12', 'siteTitle', '天使音乐');
INSERT INTO `jf_tb_sys_config` VALUES ('14', 'qq_meta', '');
INSERT INTO `jf_tb_sys_config` VALUES ('15', 'sina_meta', '');
INSERT INTO `jf_tb_sys_config` VALUES ('16', 'baidu_site_meta', '');
INSERT INTO `jf_tb_sys_config` VALUES ('17', 'google_site_meta', '');
INSERT INTO `jf_tb_sys_config` VALUES ('18', 'bing_site_meta', 'haha ');
INSERT INTO `jf_tb_sys_config` VALUES ('19', 'beian_name', '');
INSERT INTO `jf_tb_sys_config` VALUES ('20', 'sina_redirect_URI', '');
INSERT INTO `jf_tb_sys_config` VALUES ('21', 'tongji_js', '');
INSERT INTO `jf_tb_sys_config` VALUES ('22', 'sysconfigcache', null);

-- ----------------------------
-- Table structure for jf_tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_tag`;
CREATE TABLE `jf_tb_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `order_by` int(11) NOT NULL DEFAULT '1' COMMENT '排序字段，数字月大，排序靠前',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `唯一` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='曲库对应标签';

-- ----------------------------
-- Records of jf_tb_tag
-- ----------------------------
INSERT INTO `jf_tb_tag` VALUES ('1', '精品', '4', '2016-07-13 11:45:42');
INSERT INTO `jf_tb_tag` VALUES ('2', '儿童', '3', '2016-07-13 11:56:33');
INSERT INTO `jf_tb_tag` VALUES ('3', '22', '2', '2016-07-13 13:27:54');
INSERT INTO `jf_tb_tag` VALUES ('4', '暗暗地', '1', '2016-07-13 13:27:57');
INSERT INTO `jf_tb_tag` VALUES ('7', '精品2', '1', '2016-07-15 11:17:57');
INSERT INTO `jf_tb_tag` VALUES ('8', '精品23', '1', '2016-07-15 11:18:44');
INSERT INTO `jf_tb_tag` VALUES ('9', '儿童2', '1', '2016-07-15 11:19:30');
INSERT INTO `jf_tb_tag` VALUES ('10', '撒范德萨', '1', '2016-07-15 11:21:36');
INSERT INTO `jf_tb_tag` VALUES ('11', '新歌分类', '1', '2016-07-15 14:02:12');
INSERT INTO `jf_tb_tag` VALUES ('12', 'adsf', '1', '2016-07-18 14:43:58');
INSERT INTO `jf_tb_tag` VALUES ('13', '33', '1', '2016-07-18 14:45:00');
INSERT INTO `jf_tb_tag` VALUES ('14', 'asdsss', '1', '2016-07-18 14:48:23');
INSERT INTO `jf_tb_tag` VALUES ('15', '55', '1', '2016-07-18 14:48:31');
INSERT INTO `jf_tb_tag` VALUES ('16', 'bbb', '1', '2016-07-18 14:58:45');
INSERT INTO `jf_tb_tag` VALUES ('17', 'adf', '1', '2016-08-19 13:29:17');
INSERT INTO `jf_tb_tag` VALUES ('18', 'fdasdc', '1', '2016-08-19 15:23:31');

-- ----------------------------
-- Table structure for jf_tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_teacher`;
CREATE TABLE `jf_tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` varchar(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(1) DEFAULT NULL COMMENT '性别  1 男 2女',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `job` varchar(1) DEFAULT NULL COMMENT '1高级教师2中级教师3初级教师',
  `lesson_grade` varchar(2) DEFAULT NULL COMMENT '排课年级  1 代表1年级',
  `lesson_class` varchar(2) DEFAULT NULL COMMENT '排课班级  6代表6班',
  `teach_time` varchar(2) DEFAULT NULL COMMENT '教龄，单位年',
  `graduated` varchar(20) DEFAULT '' COMMENT '毕业院校',
  `entry_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `state` varchar(1) DEFAULT '1' COMMENT '1在职2休假3离职',
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PHONE_UNIQUE` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_teacher
-- ----------------------------
INSERT INTO `jf_tb_teacher` VALUES ('56', '', '李晴天', '2', '18', '13522120357', '北京市海淀区长椿街', '2', null, null, '10', '中国音乐学院', '2013-09-10 00:00:00', '1', '1');
INSERT INTO `jf_tb_teacher` VALUES ('58', '', 'LLK袁啸', '1', '20', '18131644285', '燕郊丢手机', '1', null, null, '10', '中国音乐学院', '2016-06-22 00:00:00', '1', '1');
INSERT INTO `jf_tb_teacher` VALUES ('60', '', '谢依晨', null, '32', '18979893369', '北京市朝阳区鹿港小镇A2单元605室', '1', null, null, '10', '中国音乐学院', '2016-08-10 14:33:43', '1', '1');
INSERT INTO `jf_tb_teacher` VALUES ('61', '', 'Sam', '2', '29', '13810869207', '北京市朝阳区鹿港小镇A2单元605室', '1', '1', '1', '15', '中国音乐学院', '2016-08-03 00:00:00', '3', '1');
INSERT INTO `jf_tb_teacher` VALUES ('62', '', '蒋飞', '1', '32', '13810691802', '北京市朝阳区鹿港小镇A2单元605室', '1', null, null, '10', '中国音乐学院', '2016-08-10 14:33:43', '3', '1');
INSERT INTO `jf_tb_teacher` VALUES ('64', '', '小帅12', '1', '32', '18210838351', '北京市朝阳区鹿港小镇A2单元605室1', '3', '1', '1', '11', '中国音乐学院1', '2016-08-22 00:00:00', '3', '1');

-- ----------------------------
-- Table structure for jf_tb_teacher_result
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_teacher_result`;
CREATE TABLE `jf_tb_teacher_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tid` int(11) NOT NULL COMMENT '教师id',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `time_start` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ' 时间',
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_teacher_result
-- ----------------------------
INSERT INTO `jf_tb_teacher_result` VALUES ('1', '1', '哈哈', '                                                                                                                                            自06年任教以来，每年全国音协考级通过率达百分百，优秀率于百分之80以上，连续7年被音乐家协会评为\'优秀辅导教师\'\r\n												\r\n												\r\n												', '2016-05-26 00:00:00', '2016-05-28 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('3', '1', '考级通过率百分之百', '                                                                                                                                                                                                自06年任教以来，每年全国音协考级通过率达百分百，优秀率于百分之80以上，连续7年被音乐家协会评为\'优秀辅导教师\'\r\n												\r\n												\r\n												\r\n												', '2016-05-01 00:00:00', '2016-05-28 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('4', '1', '我是测试卡卡卡啊', '自06年任教以来，每年全国音协考级通过率达百分百，优秀率于百分之80以上，连续7年被音乐师', '2016-05-22 00:00:00', '2016-05-17 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('5', '67', '标题信息标题信息', null, '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('6', '68', '标题信息标题信息', null, '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('7', '69', '标题信息标题信息', null, '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('8', '70', '标题信息标题信息', null, '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('9', '71', '标题信息标题信息', null, '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('10', '56', '标题信息标题信息1', '内容详细内容详细内容详细内容详细内容详细内容详细11\r\n啊打发', '2016-08-23 00:00:00', '2016-08-24 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('11', '56', '标题信息标题信息', '内容详细内容详细内容详细内容详细内容详细内容详细', '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('12', '56', '标题信息标题信息', '内容详细内容详细内容详细内容详细内容详细内容详细', '2016-08-18 00:00:00', '2016-08-18 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('13', '76', '标题信息标题信息', '内容详细内容详细内容详细内容详细内容详细内容详细', '2016-08-19 00:00:00', '2016-08-19 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('14', '77', '标题信息标题信息', '内容详细内容详细内容详细内容详细内容详细内容详细', '2016-08-19 00:00:00', '2016-08-19 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('15', '78', '标题信息标题信息', '内容详细内容详细内容详细内容详细内容详细内容详细', '2016-08-19 00:00:00', '2016-08-19 00:00:00');
INSERT INTO `jf_tb_teacher_result` VALUES ('21', '58', '考级通过率百分百', '自06年任教以来，每年全国音协考级通过率达百分百，优秀率于百分之80以上，连续7年被音乐家协会评为“优秀辅导教师”', '2016-08-22 00:00:00', '2016-08-22 00:00:00');

-- ----------------------------
-- Table structure for jf_tb_tone
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_tone`;
CREATE TABLE `jf_tb_tone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `english_name` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tone_id` int(11) DEFAULT NULL,
  `client_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tone_id` (`tone_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='音色：用于音乐';

-- ----------------------------
-- Records of jf_tb_tone
-- ----------------------------
INSERT INTO `jf_tb_tone` VALUES ('1', '钢琴', 'PIANO GRD', '0', null, null);
INSERT INTO `jf_tb_tone` VALUES ('2', '钟琴', 'GLOCK', '0', null, null);
INSERT INTO `jf_tb_tone` VALUES ('3', '风琴', 'ORGAN', '0', null, null);
INSERT INTO `jf_tb_tone` VALUES ('4', '钢琴', 'PIANO GRD', '0', '0', '1');
INSERT INTO `jf_tb_tone` VALUES ('5', '明亮钢琴', 'PIANO BRITE', '0', '1', '1');
INSERT INTO `jf_tb_tone` VALUES ('6', '钢片琴', 'CELESTA', '2', '15', null);
INSERT INTO `jf_tb_tone` VALUES ('7', '钟琴', 'GLOCKNSPL', '2', '9', '1');
INSERT INTO `jf_tb_tone` VALUES ('8', '木琴', 'XYLOPHONE', '1', '13', '1');
INSERT INTO `jf_tb_tone` VALUES ('9', '教堂风琴', 'CHURCH ORG', '3', '19', '1');
INSERT INTO `jf_tb_tone` VALUES ('10', '手风琴', 'ACCORDN1\r\n', '3', '21', '1');

-- ----------------------------
-- Table structure for jf_tb_tone_version
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_tone_version`;
CREATE TABLE `jf_tb_tone_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_tone_version
-- ----------------------------
INSERT INTO `jf_tb_tone_version` VALUES ('1', '1471603344');

-- ----------------------------
-- Table structure for jf_tb_user
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_user`;
CREATE TABLE `jf_tb_user` (
  `id` varchar(32) NOT NULL,
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称，如果是家长的话就将昵称作为家长姓名',
  `token` varchar(255) DEFAULT NULL COMMENT '用户唯一标识，用于客户端和网页存入cookie',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `in_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `url` varchar(255) DEFAULT NULL COMMENT '个人主页',
  `signature` varchar(1000) DEFAULT NULL COMMENT '个性签名',
  `type` varchar(1) DEFAULT '' COMMENT '用户类型：1学生，2教师，3家长，4 学校',
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PHONE_UNIQUE` (`phone`) USING BTREE,
  UNIQUE KEY `EMAIL_UNIQUE` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_user
-- ----------------------------
INSERT INTO `jf_tb_user` VALUES ('01', '13344445519', '范启明 ', 'sdfasfwe', '/static/img/default_avatar.png', '2016-08-15 21:06:49', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('0943f918662e4525848663206fd863df', '13466519426', '艳艳', '3b97f7c78f75434c9a47534d02801ab1', '/static/school/img/student/tx_05_11.png', '2016-08-14 16:40:31', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('0faa1ffed6bc4c3b8b8999a5ef81737f', '18148141319', '桐桐', '0de4cc23eea848df9c2977925ebd5414', '/static/school/img/student/tx_04_06.png', '2016-08-14 14:28:51', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('1', '13344445510', '郭珊', '13123', '/static/school/img/1.jpg', '2016-08-15 21:06:40', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('11', '13344445520', '王亮', 'sdfasd', '/static/school/img/2.jpg', '2016-08-15 21:06:50', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('1111', '13344445522', '常姜洲', 'sdfsdfasdfsadfa', '/static/school/img/4.jpg', '2016-08-15 21:06:54', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('11111', '13344445523', '胡志昆  ', 'adsfsdfsd', '/static/school/img/5.jpg', '2016-08-15 21:06:55', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('1212', '13344445528', '秦庆渊', 'fhfhrtgdb', '/static/school/img/6.jpg', '2016-08-15 21:08:46', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('121312', '13344445529', '田继东', 'hbsgery', '/static/school/img/7.jpg', '2016-08-15 21:08:47', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('122', '13344445521', '温秋荣', 'sdfa', '/static/school/img/8.jpeg', '2016-08-15 21:06:53', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('153f75e578044649bff699e323ba964f', '18156911307', 'ning亚', '8620a1ff478e49b898b98646f5b5f805', '/static/school/img/9.jpeg', '2016-08-14 15:55:07', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('1919454fada7455db326932889f44e88', '18210546592', '周宁娅', '5e94982b5441408abe0b808f3575dbc8', '/static/school/img/10.jpeg', '2016-06-17 13:33:16', '周宁娅@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('1bcd5c3bce614702a830c58352b03e0e', '18844138401', '潘潘', '322512a98ef0472da1c8ac8e8ad6599d', '/static/school/img/11.jpg', '2016-08-14 16:38:33', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('2', '13344445511', '郭帅', '123123134123', '/static/school/img/12.jpg', '2016-08-15 21:06:41', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('3', '13344445512', '张琦', 'wreqwer', '/static/school/img/13.jpg', '2016-08-15 21:06:41', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('31312312', '13344445530', '马宁1', 'bxbcvsr', '/static/school/img/14.jpg', '2016-08-15 21:08:48', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('333', '13344445524', '吴旭光', 'fsdfsdf', '/static/school/img/15.jpg', '2016-08-15 21:06:56', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('3a7ea4fad1f248549b86e28f813873d8', '13810869208', '王啸', 'c5ab93868b7b439da8ca53ed44cf0218', '/static/school/img/teacher/pic2.png', '2016-08-05 10:18:19', '王啸@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('4', '13344445513', '王禹嘉', 'wrqwerqwer', '/static/school/img/17.jpg', '2016-08-15 21:06:42', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('4444', '13344445525', '周宁娅', 'vbxcbxc', '/static/school/img/18.jpg', '2016-08-15 21:06:57', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('45b0407136d9457c8962353b4be2f121', '18979893369', '谢依晨', '8c968c5e63ab4f24a53d09691413937f', '/static/school/img/teacher/pic2.png', '2016-08-05 09:40:40', '谢依晨@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('4fa05680b0f64c72b2481d034e2ea2d6', '18611082881', '董云辰1', '16a44b17659e43deb87305b43d5cf3fa', '/static/school/img/19.jpg', '2016-06-21 18:50:58', '董云辰@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('5', '13344445514', '王步国', 'sdfvcxc', '/static/school/img/20.jpg', '2016-08-15 21:06:43', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('53908ac7214f4103a83d7340449e88df', '18600168224', '朱小涛', '7ee889f58ac14fb983d1150eb6b08245', '/static/school/img/teacher/pic2.png', '2016-08-03 18:09:39', '朱小涛@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('5555', '13344445526', '文东', 'hffhfhtr', '/static/school/img/21.jpg', '2016-08-15 21:06:58', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('5bb6fff08f014f39b021e2980795f64b', '13161541319', '大桐', 'af6c90f83d374c4dac0eefe55894c741', '/static/school/img/22.jpg', '2016-08-14 14:32:13', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('5e67c3e444f44b81a421921a8c7277f9', '18611157744', '张丁元', '25927e88126d4347953db9478d5b5f7b', '/static/img/default_avatar.png', '2016-08-03 15:36:47', '张丁元@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '4', '1');
INSERT INTO `jf_tb_user` VALUES ('5ec9f54e58b24f4c8e5f45b54dd5912a', '13611087000', '杜金科', 'fe1808dd2fc34953b5d21cd25c31a4ef', '/static/school/img/23.jpg', '2016-08-09 16:01:41', '杜金科@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('6', '13344445515', '侯苍慧', 'safasdfa', '/static/school/img/24.jpg', '2016-08-15 21:06:43', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('666', '13344445527', '孙超', 'fghfhgcfd', '/static/school/img/25.jpg', '2016-08-15 21:07:00', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('6bfea0ac6d5e4a39a2086b751e491048', '18510236545', '夏毅', '8ea1882b153446718e8b7a328fde8690', '/static/school/img/26.jpg', '2016-08-09 16:01:03', '夏毅@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('6c109e3a7a27494cb3377c9452e66dca', '18600943577', '于于', '7e11952eb5094b4eb66b27d80960c5ab', '/static/school/img/27.jpg', '2016-08-14 16:40:55', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('6da21a6bddb64ebf92ff525d5af3c8be', '13261082613', '帅帅', '2c52a215221a478ebffa311bfb92024e', '/static/school/img/28.jpg', '2016-08-14 16:38:53', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('7', '13344445516', '袁啸', 'zvcxv', '/static/school/img/29.jpg', '2016-08-15 21:06:45', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('75029ef11ded43f68524b1aa25165319', '13691194025', '德哥', 'cbd066f13c77428b80f04d99dbc463cb', '/static/school/img/30.jpg', '2016-08-14 14:26:33', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('7e4e5f670d604c129ba717fda9944f01', '15001284030', '迁迁', 'd2cdd7f4197f48c78c822fc7b2565278', '/static/school/img/31.jpg', '2016-08-14 16:39:47', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('7f595b5b47f04479983062e8f6c2f31a', '18310359390', 'admin', 'd367fc4b3eac417ba292e7a7e91c8643', '/static/img/default_avatar.png', '2016-06-07 14:39:55', 'admin@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '4', '1');
INSERT INTO `jf_tb_user` VALUES ('8', '13344445517', '董云辰', 'sdfasdf', '/static/school/img/32.jpg', '2016-08-15 21:06:46', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('8d0d0ec423714469844743a426a0821b', '15601212266', '王晶', 'cb1c93e934b447879342d79964780494', '/static/school/img/33.jpg', '2016-08-14 16:41:09', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('91', '13344445518', '倪文帅', 'sdfads', '/static/school/img/34.jpg', '2016-08-15 21:06:47', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('92a3e890fa0e434780256249aab91580', '18156911306', '123', '8e80517d36ac48edb5274a8c58e5220a', '/static/school/img/35.jpg', '2016-08-12 22:45:19', '123@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('98535db3069f4646b5254f25364cb296', '13651004228', '超姐', '16de586a3ede4a52ab822aa6a5e6dd3d', '/static/school/img/36.jpg', '2016-08-09 15:52:13', '超姐@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('9cc44a70e88e4cb5a0f55ae7c5af7548', '13693329426', '王帅', 'a75bb6fa28d844b9922747049a7d0d26', '/static/school/img/37.jpg', '2016-08-09 15:57:52', '王帅@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('a54092133d214a7189985fc900429c59', '18131644285', 'LLK袁啸', '8a983af816b34ef2bee5e6e98fe06a42', '/static/school/img/teacher/pic2.png', '2016-06-22 16:08:33', 'LLK袁啸@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('adf', '18156911305', 'aaaa', null, '/static/school/img/38.jpg', '2016-08-13 17:38:26', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('b67cecc60abe4041bde244f598c50e01', '18210838351', '小帅', '999435cf6c2f43659b48cc171e67c754', '/static/school/img/teacher/pic2.png', '2016-08-06 11:36:25', '小帅@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('ca8e0d21986946b594e560b2302954bf', '18611590801', '贝贝', '10a1c4daa66e4e5a8e698d72b2d59750', '/static/school/img/39.jpg', '2016-08-14 16:37:18', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('d385a5c5d3db4c2ea1bf6636bacb8217', '18618422414', '包野', '399ef576a07d41698f69f07c0b201ad9', '/static/school/img/40.jpeg', '2016-08-12 16:30:33', '包野@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('d53d1c8095c748f2bab1628b0a16ccc1', '15210411296', 'can老师', '7cceae3f4d7d482baebbc90a5c0e2ad8', '/static/school/img/41.jpg', '2016-08-08 11:11:45', 'can老师@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('d73c04d99de4441480626d7e7dc9acc4', '13911341388', '同同', 'df32b2d2f1c245cf9cfae6e0a4520303', '/static/school/img/42.jpg', '2016-08-14 14:31:30', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');
INSERT INTO `jf_tb_user` VALUES ('d94ee47acb614183b290c5cdb1e65c95', '13522847490', '胡志昆', 'e19bcc9442874d55b15be37bf8f2b3b7', '/static/img/default_avatar.png', '2016-07-21 18:22:31', '胡志昆@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '4', '1');
INSERT INTO `jf_tb_user` VALUES ('ddc02be9f6104b329bdb529857ecb3c2', '13522120357', '李晴天', '443e5759afa645829505014a73bfe136', '/static/school/img/teacher/pic2.png', '2016-06-17 15:44:20', '李晴天@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('e580ef98cb74455f8e39757bd69f74e2', '13810869207', 'Sam', 'a358bf85d35e439d80b320ac69b0ba92', '/static/school/img/teacher/pic2.png', '2016-08-05 10:05:36', 'Sam@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('eaa2978e629445a3bec662191e2bac01', '13810691802', '蒋飞', 'b3df8a13aa074cc2bcc2ec6409605340', '/static/school/img/teacher/pic2.png', '2016-08-05 10:09:09', '蒋飞@null.null', 'e10adc3949ba59abbe56e057f20f883e', null, null, '2', '1');
INSERT INTO `jf_tb_user` VALUES ('sasd', '13344445555', '张三1', 'adfaf', '/static/school/img/43.jpg', '2016-08-15 21:06:25', null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '1');

-- ----------------------------
-- Table structure for jf_tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_user_role`;
CREATE TABLE `jf_tb_user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  KEY `fk_user_role` (`uid`) USING BTREE,
  KEY `fk_role_user` (`rid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_user_role
-- ----------------------------
INSERT INTO `jf_tb_user_role` VALUES ('1', '1');
INSERT INTO `jf_tb_user_role` VALUES ('2', '2');
INSERT INTO `jf_tb_user_role` VALUES ('3', '3');

-- ----------------------------
-- Table structure for jf_tb_valicode
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_valicode`;
CREATE TABLE `jf_tb_valicode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '验证码',
  `in_time` datetime NOT NULL COMMENT '录入时间',
  `status` int(11) NOT NULL COMMENT '0未使用  1已使用',
  `type` varchar(45) NOT NULL COMMENT '验证码类型，比如：找回密码',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `target` varchar(255) NOT NULL COMMENT '发送目标，如邮箱等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_valicode
-- ----------------------------
INSERT INTO `jf_tb_valicode` VALUES ('1', 'ffc40d', '2016-05-18 15:13:16', '1', 'reg', '2016-05-18 15:43:16', '316402360@qq.com');
INSERT INTO `jf_tb_valicode` VALUES ('2', '25c8fd', '2016-05-18 19:34:13', '0', 'reg', '2016-05-18 19:35:13', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('3', 'c82b5f', '2016-05-18 19:37:24', '0', 'reg', '2016-05-18 19:38:24', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('4', '51e760', '2016-05-18 19:44:19', '0', 'reg', '2016-05-18 19:45:19', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('5', '740d7e', '2016-05-18 19:47:46', '1', 'reg', '2016-05-18 19:48:46', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('6', 'e9b244', '2016-05-18 20:43:52', '1', 'reg', '2016-05-18 20:44:52', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('7', 'ab4620', '2016-05-18 20:57:25', '0', 'reg', '2016-05-18 20:58:25', '15801620845');
INSERT INTO `jf_tb_valicode` VALUES ('8', 'a0230d', '2016-05-18 21:02:49', '0', 'reg', '2016-05-18 21:03:49', '15801620845');
INSERT INTO `jf_tb_valicode` VALUES ('9', '46393e', '2016-05-18 21:04:19', '1', 'reg', '2016-05-18 21:05:19', '15801620845');
INSERT INTO `jf_tb_valicode` VALUES ('10', '7eccdb', '2016-05-19 15:57:49', '1', 'reg', '2016-05-19 15:58:49', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('11', 'a82648', '2016-05-19 16:51:59', '1', 'forgetpwd', '2016-05-19 16:52:59', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('12', 'cb7779', '2016-05-19 16:59:27', '0', 'reg', '2016-05-19 17:00:27', '13167336654');
INSERT INTO `jf_tb_valicode` VALUES ('13', 'e77240', '2016-05-19 17:01:55', '0', 'reg', '2016-05-19 17:02:55', '13167336654');
INSERT INTO `jf_tb_valicode` VALUES ('14', '71a6b3', '2016-05-19 17:05:42', '1', 'reg', '2016-05-19 17:06:42', '13167336654');
INSERT INTO `jf_tb_valicode` VALUES ('15', '3f71a4', '2016-05-19 17:14:47', '0', 'reg', '2016-05-19 17:15:47', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('16', 'eb102f', '2016-05-19 17:27:05', '1', 'reg', '2016-05-19 17:28:05', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('17', 'c6be54', '2016-05-19 17:28:21', '1', 'reg', '2016-05-19 17:29:21', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('18', '0f0667', '2016-05-19 17:56:20', '1', 'reg', '2016-05-19 17:57:20', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('19', 'c18921', '2016-05-19 18:00:52', '0', 'reg', '2016-05-19 18:01:52', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('20', '015991', '2016-05-19 18:03:24', '0', 'reg', '2016-05-19 18:04:24', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('21', '81fac5', '2016-05-19 18:04:12', '0', 'reg', '2016-05-19 18:05:12', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('22', 'fd3c41', '2016-05-19 18:05:07', '1', 'reg', '2016-05-19 18:06:07', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('23', 'de2ad6', '2016-05-19 18:06:53', '1', 'reg', '2016-05-19 18:07:53', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('24', '198188', '2016-05-19 18:30:04', '0', 'forgetpwd', '2016-05-19 18:31:04', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('25', '6671c1', '2016-05-19 18:31:15', '1', 'forgetpwd', '2016-05-19 18:32:15', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('26', 'd6f1bf', '2016-05-20 20:29:57', '0', 'reg', '2016-05-20 20:30:57', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('27', 'f6f029', '2016-05-20 20:32:45', '1', 'reg', '2016-05-20 20:33:45', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('28', 'f14bf3', '2016-05-23 12:27:33', '1', 'reg', '2016-05-23 12:28:33', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('29', '55b7d5', '2016-05-23 12:29:58', '1', 'reg', '2016-05-23 12:30:58', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('30', '435dde', '2016-05-23 12:31:31', '1', 'reg', '2016-05-23 12:32:31', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('31', '22c183', '2016-05-24 14:59:00', '1', 'reg', '2016-05-24 15:00:00', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('32', '0903c3', '2016-05-25 16:25:58', '1', 'forgetpwd', '2016-05-25 16:26:58', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('33', '0770b3', '2016-05-25 16:27:09', '1', 'forgetpwd', '2016-05-25 16:28:09', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('34', 'ef3828', '2016-05-27 12:31:14', '0', 'reg', '2016-05-27 12:32:14', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('35', 'f5ab98', '2016-05-27 12:36:53', '0', 'reg', '2016-05-27 12:37:53', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('36', '4cf7a6', '2016-05-27 12:37:50', '1', 'reg', '2016-05-27 12:38:50', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('37', '735925', '2016-05-27 12:38:06', '0', 'reg', '2016-05-27 12:39:06', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('38', '7cf0ce', '2016-05-27 12:39:13', '1', 'reg', '2016-05-27 12:40:13', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('39', '57dced', '2016-05-27 12:40:00', '1', 'reg', '2016-05-27 12:41:00', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('40', '845f31', '2016-05-27 16:50:58', '1', 'forgetpwd', '2016-05-27 16:51:58', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('41', '8268d0', '2016-05-27 23:37:28', '0', 'reg', '2016-05-27 23:38:28', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('42', '42c266', '2016-05-27 23:41:17', '0', 'reg', '2016-05-27 23:42:17', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('43', '180968', '2016-05-27 23:42:03', '0', 'reg', '2016-05-27 23:43:03', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('44', 'e1e4d4', '2016-05-27 23:45:21', '0', 'reg', '2016-05-27 23:46:21', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('45', '602522', '2016-05-27 23:45:32', '0', 'reg', '2016-05-27 23:46:32', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('46', '3b6c1c', '2016-05-27 23:46:08', '0', 'reg', '2016-05-27 23:47:08', '18712807295');
INSERT INTO `jf_tb_valicode` VALUES ('47', '570056', '2016-05-27 23:50:35', '0', 'reg', '2016-05-27 23:51:35', '18712807295');
INSERT INTO `jf_tb_valicode` VALUES ('48', '2a6bbd', '2016-05-27 23:53:44', '1', 'reg', '2016-05-27 23:54:44', '18712807295');
INSERT INTO `jf_tb_valicode` VALUES ('49', 'a16ad6', '2016-05-27 23:57:40', '0', 'reg', '2016-05-27 23:58:40', '13140073367');
INSERT INTO `jf_tb_valicode` VALUES ('50', '656e21', '2016-05-27 23:58:13', '1', 'reg', '2016-05-27 23:59:13', '13140073367');
INSERT INTO `jf_tb_valicode` VALUES ('51', '061a96', '2016-05-28 00:01:28', '1', 'reg', '2016-05-28 00:02:28', '15652646165');
INSERT INTO `jf_tb_valicode` VALUES ('52', 'b1342f', '2016-05-28 00:04:17', '1', 'reg', '2016-05-28 00:05:17', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('53', '8d070c', '2016-05-28 00:13:52', '1', 'forgetpwd', '2016-05-28 00:14:52', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('54', '161de6', '2016-05-28 00:14:28', '0', 'forgetpwd', '2016-05-28 00:15:28', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('55', '45623a', '2016-05-28 00:14:48', '0', 'forgetpwd', '2016-05-28 00:15:48', '15010586492');
INSERT INTO `jf_tb_valicode` VALUES ('56', 'a00594', '2016-05-30 10:44:59', '1', 'reg', '2016-05-30 10:45:59', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('57', 'baf8f8', '2016-05-30 10:47:27', '1', 'reg', '2016-05-30 10:48:27', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('58', 'd6abe7', '2016-05-30 10:59:37', '1', 'reg', '2016-05-30 11:00:37', '13691194025');
INSERT INTO `jf_tb_valicode` VALUES ('59', '60821f', '2016-05-30 10:59:39', '0', 'reg', '2016-05-30 11:00:39', '13691194025');
INSERT INTO `jf_tb_valicode` VALUES ('60', 'd51188', '2016-05-30 11:05:31', '1', 'reg', '2016-05-30 11:06:31', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('61', '5f1f23', '2016-06-01 16:59:56', '1', 'reg', '2016-06-01 17:00:56', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('62', 'b9f509', '2016-06-02 11:39:41', '1', 'reg', '2016-06-02 11:40:41', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('63', '6d73a5', '2016-06-03 14:12:56', '0', 'reg', '2016-06-03 14:13:56', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('64', 'a45edc', '2016-06-03 14:13:03', '0', 'reg', '2016-06-03 14:14:03', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('65', '56b181', '2016-06-03 14:14:42', '1', 'reg', '2016-06-03 14:15:42', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('66', '561b0f', '2016-06-06 11:59:39', '0', 'forgetpwd', '2016-06-06 12:00:39', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('67', '575c02', '2016-06-06 12:05:24', '0', 'forgetpwd', '2016-06-06 12:06:24', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('68', 'bc338c', '2016-06-07 14:39:25', '1', 'reg', '2016-06-07 14:40:25', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('69', 'f44ca0', '2016-06-07 18:12:50', '1', 'forgetpwd', '2016-06-07 18:13:50', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('70', '701568', '2016-06-12 11:31:37', '0', 'initpwd', '2016-06-12 11:32:37', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('71', '921804', '2016-06-12 11:38:55', '0', 'initpwd', '2016-06-12 11:39:55', '13522837490');
INSERT INTO `jf_tb_valicode` VALUES ('72', '477214', '2016-06-12 11:44:44', '0', 'initpwd', '2016-06-12 11:45:44', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('73', '883105', '2016-06-12 11:54:28', '0', 'initpwd', '2016-06-12 11:55:28', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('74', '158767', '2016-06-13 10:34:13', '0', 'initpwd', '2016-06-13 10:35:13', '18310359398');
INSERT INTO `jf_tb_valicode` VALUES ('75', 'aa3d2e', '2016-06-13 11:05:13', '0', 'forgetpwd', '2016-06-13 11:06:13', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('76', 'c7d937', '2016-06-13 11:05:18', '0', 'forgetpwd', '2016-06-13 11:06:18', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('77', '97fd1a', '2016-06-13 11:05:18', '0', 'forgetpwd', '2016-06-13 11:06:18', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('78', 'a546c1', '2016-06-13 11:05:20', '0', 'forgetpwd', '2016-06-13 11:06:20', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('79', '262176', '2016-06-13 11:05:40', '0', 'forgetpwd', '2016-06-13 11:06:40', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('80', '6fe3bf', '2016-06-13 11:05:44', '0', 'forgetpwd', '2016-06-13 11:06:44', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('81', '063016', '2016-06-17 13:33:15', '0', 'initpwd', '2016-06-17 13:34:15', '18210546592');
INSERT INTO `jf_tb_valicode` VALUES ('82', '264149', '2016-06-17 15:44:20', '0', 'initpwd', '2016-06-17 15:45:20', '13522120357');
INSERT INTO `jf_tb_valicode` VALUES ('83', '062abe', '2016-06-19 17:25:56', '0', 'reg', '2016-06-19 17:26:56', '15910861286');
INSERT INTO `jf_tb_valicode` VALUES ('84', '23c179', '2016-06-19 17:41:26', '1', 'forgetpwd', '2016-06-19 17:42:26', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('85', '45fb64', '2016-06-20 16:01:56', '1', 'forgetpwd', '2016-06-20 16:02:56', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('86', '7230d8', '2016-06-21 14:17:34', '0', 'forgetpwd', '2016-06-21 14:18:34', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('87', '3770de', '2016-06-21 14:29:37', '0', 'forgetpwd', '2016-06-21 14:30:37', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('88', '399003', '2016-06-21 14:34:10', '0', 'forgetpwd', '2016-06-21 14:35:10', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('89', '1e1a14', '2016-06-21 15:42:15', '0', 'forgetpwd', '2016-06-21 15:43:15', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('90', 'ed8192', '2016-06-21 15:47:38', '0', 'forgetpwd', '2016-06-21 15:48:38', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('91', '804636', '2016-06-21 17:02:26', '0', 'initpwd', '2016-06-21 17:03:26', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('92', '808100', '2016-06-21 18:49:53', '0', 'initpwd', '2016-06-21 18:50:53', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('93', '913912', '2016-06-21 18:50:11', '0', 'initpwd', '2016-06-21 18:51:11', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('94', '251088', '2016-06-21 18:50:58', '0', 'initpwd', '2016-06-21 18:51:58', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('95', '08c29f', '2016-06-22 14:49:12', '0', 'forgetpwd', '2016-06-22 14:50:12', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('96', 'f48326', '2016-06-22 15:34:14', '0', 'reg', '2016-06-22 15:35:14', '15822847490');
INSERT INTO `jf_tb_valicode` VALUES ('97', 'd04d97', '2016-06-22 15:35:43', '0', 'reg', '2016-06-22 15:36:43', '15822847490');
INSERT INTO `jf_tb_valicode` VALUES ('98', 'f3e18a', '2016-06-22 15:51:34', '0', 'reg', '2016-06-22 15:52:34', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('99', '916914', '2016-06-22 16:02:20', '0', 'initpwd', '2016-06-22 16:03:20', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('100', '453148', '2016-06-22 16:08:32', '0', 'initpwd', '2016-06-22 16:09:32', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('101', '568359', '2016-07-21 18:22:30', '0', 'initpwd', '2016-07-21 18:23:30', '13522847490');
INSERT INTO `jf_tb_valicode` VALUES ('102', '4eb061', '2016-07-29 16:57:32', '0', 'reg', '2016-07-29 16:58:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('103', 'ecef0c', '2016-07-29 16:57:34', '0', 'reg', '2016-07-29 16:58:34', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('104', '943843', '2016-07-29 16:57:35', '0', 'reg', '2016-07-29 16:58:35', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('105', '2b9fc7', '2016-07-29 16:57:35', '0', 'reg', '2016-07-29 16:58:35', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('106', '8b1ef2', '2016-07-29 16:57:35', '0', 'reg', '2016-07-29 16:58:35', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('107', '80fc98', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('108', '228f80', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('109', '7bbde1', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('110', 'c28478', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('111', 'ebf264', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('112', 'ec367f', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('113', 'd8302f', '2016-07-29 16:57:36', '0', 'reg', '2016-07-29 16:58:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('114', '5da21f', '2016-07-29 16:57:37', '0', 'reg', '2016-07-29 16:58:37', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('115', '9a7581', '2016-07-29 16:57:37', '0', 'reg', '2016-07-29 16:58:37', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('116', '069a5c', '2016-07-29 16:57:37', '0', 'reg', '2016-07-29 16:58:37', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('117', '7fbf3e', '2016-07-29 16:57:37', '0', 'reg', '2016-07-29 16:58:37', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('118', '320429', '2016-07-29 16:57:37', '0', 'reg', '2016-07-29 16:58:37', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('119', '939035', '2016-07-29 16:57:38', '0', 'reg', '2016-07-29 16:58:38', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('120', '8ba0b2', '2016-07-29 16:57:38', '0', 'reg', '2016-07-29 16:58:38', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('121', '6cb982', '2016-07-29 16:57:38', '0', 'reg', '2016-07-29 16:58:38', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('122', '7aee8a', '2016-07-29 16:57:42', '0', 'reg', '2016-07-29 16:58:42', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('123', '89daca', '2016-07-29 16:59:22', '0', 'reg', '2016-07-29 17:00:22', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('124', '599f1d', '2016-07-29 16:59:22', '0', 'reg', '2016-07-29 17:00:22', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('125', 'c31151', '2016-07-29 16:59:22', '0', 'reg', '2016-07-29 17:00:22', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('126', 'd6b763', '2016-07-29 16:59:22', '0', 'reg', '2016-07-29 17:00:22', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('127', 'ac95b0', '2016-07-29 16:59:22', '0', 'reg', '2016-07-29 17:00:22', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('128', '2d7af0', '2016-07-29 16:59:23', '0', 'reg', '2016-07-29 17:00:23', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('129', 'a422cb', '2016-07-29 16:59:23', '0', 'reg', '2016-07-29 17:00:23', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('130', '564906', '2016-07-29 16:59:23', '0', 'reg', '2016-07-29 17:00:23', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('131', '11f9d8', '2016-07-29 16:59:23', '0', 'reg', '2016-07-29 17:00:23', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('132', '60a911', '2016-07-29 16:59:23', '0', 'reg', '2016-07-29 17:00:23', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('133', '0db1e9', '2016-07-29 16:59:30', '0', 'reg', '2016-07-29 17:00:30', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('134', 'a02ce9', '2016-07-29 16:59:31', '0', 'reg', '2016-07-29 17:00:31', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('135', '830e49', '2016-07-29 16:59:31', '0', 'reg', '2016-07-29 17:00:31', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('136', '6b83f6', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('137', '14aa86', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('138', '4bef71', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('139', 'c8add3', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('140', 'ad50b0', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('141', '986cdc', '2016-07-29 16:59:32', '0', 'reg', '2016-07-29 17:00:32', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('142', '67c60b', '2016-07-29 16:59:33', '0', 'reg', '2016-07-29 17:00:33', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('143', 'd9e234', '2016-07-29 16:59:33', '0', 'reg', '2016-07-29 17:00:33', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('144', 'cb933b', '2016-07-29 16:59:33', '0', 'reg', '2016-07-29 17:00:33', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('145', 'b7208d', '2016-07-29 16:59:33', '0', 'reg', '2016-07-29 17:00:33', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('146', 'c3f22e', '2016-07-29 16:59:33', '0', 'reg', '2016-07-29 17:00:33', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('147', '6d8410', '2016-07-29 16:59:36', '0', 'reg', '2016-07-29 17:00:36', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('148', '62789a', '2016-07-29 16:59:39', '0', 'reg', '2016-07-29 17:00:39', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('149', '6fbc1a', '2016-07-29 16:59:39', '0', 'reg', '2016-07-29 17:00:39', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('150', 'fe4d5f', '2016-07-29 16:59:42', '0', 'reg', '2016-07-29 17:00:42', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('151', 'fb2256', '2016-07-29 16:59:42', '0', 'reg', '2016-07-29 17:00:42', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('152', '690c5e', '2016-07-29 16:59:43', '0', 'reg', '2016-07-29 17:00:43', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('153', '7e4b46', '2016-07-29 16:59:56', '0', 'reg', '2016-07-29 17:00:56', '13333333333');
INSERT INTO `jf_tb_valicode` VALUES ('154', '7afd21', '2016-07-30 17:29:44', '1', 'reg', '2016-07-30 17:30:44', '13043746263');
INSERT INTO `jf_tb_valicode` VALUES ('155', 'aaa1d5', '2016-08-01 11:00:49', '0', 'forgetpwd', '2016-08-01 11:01:49', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('156', 'ca5112', '2016-08-01 11:01:27', '1', 'forgetpwd', '2016-08-01 11:02:27', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('157', '075354', '2016-08-03 11:40:34', '0', 'reg', '2016-08-03 11:41:34', '18611082883');
INSERT INTO `jf_tb_valicode` VALUES ('158', 'c7b988', '2016-08-03 11:42:45', '1', 'forgetpwd', '2016-08-03 11:43:45', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('159', '394042', '2016-08-03 15:36:47', '0', 'initpwd', '2016-08-03 15:37:47', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('160', '006550', '2016-08-03 18:09:38', '0', 'initpwd', '2016-08-03 18:10:38', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('161', '8c9222', '2016-08-04 21:46:01', '0', 'reg', '2016-08-04 21:47:01', '18611082811');
INSERT INTO `jf_tb_valicode` VALUES ('162', '014bed', '2016-08-04 21:47:34', '1', 'reg', '2016-08-04 21:48:34', '18500567972');
INSERT INTO `jf_tb_valicode` VALUES ('163', '615085', '2016-08-05 09:40:39', '0', 'initpwd', '2016-08-05 09:41:39', '18979893369');
INSERT INTO `jf_tb_valicode` VALUES ('164', '538970', '2016-08-05 09:40:54', '0', 'initpwd', '2016-08-05 09:41:54', '13810869207');
INSERT INTO `jf_tb_valicode` VALUES ('165', '215494', '2016-08-05 10:05:36', '0', 'initpwd', '2016-08-05 10:06:36', '13810869207');
INSERT INTO `jf_tb_valicode` VALUES ('166', '284197', '2016-08-05 10:09:09', '0', 'initpwd', '2016-08-05 10:10:09', '13810691802');
INSERT INTO `jf_tb_valicode` VALUES ('167', '101345', '2016-08-05 10:18:19', '0', 'initpwd', '2016-08-05 10:19:19', '13810869208');
INSERT INTO `jf_tb_valicode` VALUES ('168', '848255', '2016-08-05 14:26:12', '0', 'initpwd', '2016-08-05 14:27:12', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('169', '792148', '2016-08-05 14:26:16', '0', 'initpwd', '2016-08-05 14:27:16', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('170', '214597', '2016-08-05 14:26:20', '0', 'initpwd', '2016-08-05 14:27:20', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('171', '070470', '2016-08-05 14:26:22', '0', 'initpwd', '2016-08-05 14:27:22', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('172', '824672', '2016-08-05 14:26:22', '0', 'initpwd', '2016-08-05 14:27:22', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('173', '604946', '2016-08-05 14:26:23', '0', 'initpwd', '2016-08-05 14:27:23', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('174', '011414', '2016-08-05 14:26:23', '0', 'initpwd', '2016-08-05 14:27:23', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('175', '650155', '2016-08-05 14:26:23', '0', 'initpwd', '2016-08-05 14:27:23', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('176', '486928', '2016-08-05 14:26:24', '0', 'initpwd', '2016-08-05 14:27:24', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('177', '170330', '2016-08-05 14:26:24', '0', 'initpwd', '2016-08-05 14:27:24', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('178', '239647', '2016-08-05 14:26:24', '0', 'initpwd', '2016-08-05 14:27:24', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('179', '069556', '2016-08-05 14:26:24', '0', 'initpwd', '2016-08-05 14:27:24', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('180', '129192', '2016-08-05 14:26:25', '0', 'initpwd', '2016-08-05 14:27:25', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('181', '525745', '2016-08-05 14:26:25', '0', 'initpwd', '2016-08-05 14:27:25', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('182', '018327', '2016-08-05 14:26:25', '0', 'initpwd', '2016-08-05 14:27:25', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('183', '936492', '2016-08-05 14:26:25', '0', 'initpwd', '2016-08-05 14:27:25', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('184', '953395', '2016-08-05 14:26:25', '0', 'initpwd', '2016-08-05 14:27:25', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('185', '596695', '2016-08-05 14:26:26', '0', 'initpwd', '2016-08-05 14:27:26', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('186', '394856', '2016-08-05 14:26:26', '0', 'initpwd', '2016-08-05 14:27:26', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('187', '402842', '2016-08-05 14:26:26', '0', 'initpwd', '2016-08-05 14:27:26', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('188', '986313', '2016-08-05 14:26:26', '0', 'initpwd', '2016-08-05 14:27:26', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('189', '275809', '2016-08-05 14:26:26', '0', 'initpwd', '2016-08-05 14:27:26', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('190', '425954', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('191', '141740', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('192', '963515', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('193', '249478', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('194', '159358', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('195', '333062', '2016-08-05 14:26:27', '0', 'initpwd', '2016-08-05 14:27:27', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('196', '399936', '2016-08-05 14:26:33', '0', 'initpwd', '2016-08-05 14:27:33', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('197', '668101', '2016-08-05 14:26:35', '0', 'initpwd', '2016-08-05 14:27:35', '13810869200');
INSERT INTO `jf_tb_valicode` VALUES ('198', '9cca73', '2016-08-05 15:45:08', '0', 'forgetpwd', '2016-08-05 15:46:08', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('199', 'e076b2', '2016-08-05 15:47:28', '0', 'forgetpwd', '2016-08-05 15:48:28', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('200', '640920', '2016-08-05 17:44:39', '0', 'forgetpwd', '2016-08-05 17:45:39', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('201', 'f77474', '2016-08-05 22:55:44', '1', 'forgetpwd', '2016-08-05 22:56:44', '18611082881');
INSERT INTO `jf_tb_valicode` VALUES ('202', '3d023d', '2016-08-06 11:05:42', '0', 'forgetpwd', '2016-08-06 11:06:42', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('203', '89f401', '2016-08-06 11:09:25', '1', 'forgetpwd', '2016-08-06 11:10:25', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('204', 'd04b82', '2016-08-06 11:13:06', '1', 'forgetpwd', '2016-08-06 11:14:06', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('205', '6d0e4d', '2016-08-06 11:15:38', '1', 'forgetpwd', '2016-08-06 11:16:38', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('206', '3c6490', '2016-08-06 11:19:21', '1', 'forgetpwd', '2016-08-06 11:20:21', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('207', 'a5129b', '2016-08-06 11:29:37', '0', 'forgetpwd', '2016-08-06 11:30:37', '18131644285');
INSERT INTO `jf_tb_valicode` VALUES ('208', 'cda4b9', '2016-08-06 11:33:08', '1', 'forgetpwd', '2016-08-06 11:34:08', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('209', '814438', '2016-08-06 11:36:25', '0', 'initpwd', '2016-08-06 11:37:25', '18210838351');
INSERT INTO `jf_tb_valicode` VALUES ('210', 'cd3c51', '2016-08-06 11:37:45', '1', 'forgetpwd', '2016-08-06 11:38:45', '18210838351');
INSERT INTO `jf_tb_valicode` VALUES ('211', '60f3a0', '2016-08-06 11:39:26', '1', 'forgetpwd', '2016-08-06 11:40:26', '18210838351');
INSERT INTO `jf_tb_valicode` VALUES ('212', '961150', '2016-08-08 11:06:41', '0', 'initpwd', '2016-08-08 11:07:41', '15210411296');
INSERT INTO `jf_tb_valicode` VALUES ('213', '280146', '2016-08-08 11:10:48', '0', 'initpwd', '2016-08-08 11:11:48', '15210411296');
INSERT INTO `jf_tb_valicode` VALUES ('214', '067608', '2016-08-08 11:11:44', '0', 'initpwd', '2016-08-08 11:12:44', '15210411296');
INSERT INTO `jf_tb_valicode` VALUES ('215', '0ebe4b', '2016-08-08 14:50:22', '1', 'forgetpwd', '2016-08-08 14:51:22', '18210546592');
INSERT INTO `jf_tb_valicode` VALUES ('216', '8d7c90', '2016-08-08 17:21:04', '1', 'forgetpwd', '2016-08-08 17:22:04', '15210411296');
INSERT INTO `jf_tb_valicode` VALUES ('217', '494861', '2016-08-09 10:35:36', '0', 'initpwd', '2016-08-09 10:36:36', '13621167443');
INSERT INTO `jf_tb_valicode` VALUES ('218', '905019', '2016-08-09 10:37:24', '0', 'initpwd', '2016-08-09 10:38:24', '13621167443');
INSERT INTO `jf_tb_valicode` VALUES ('219', '005801', '2016-08-09 13:47:58', '0', 'initpwd', '2016-08-09 13:48:58', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('220', '281797', '2016-08-09 13:48:37', '0', 'initpwd', '2016-08-09 13:49:37', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('221', '347960', '2016-08-09 13:48:40', '0', 'initpwd', '2016-08-09 13:49:40', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('222', '265870', '2016-08-09 13:48:40', '0', 'initpwd', '2016-08-09 13:49:40', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('223', '975716', '2016-08-09 13:48:41', '0', 'initpwd', '2016-08-09 13:49:41', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('224', '739839', '2016-08-09 13:48:41', '0', 'initpwd', '2016-08-09 13:49:41', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('225', '378376', '2016-08-09 13:48:46', '0', 'initpwd', '2016-08-09 13:49:46', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('226', '725531', '2016-08-09 13:48:46', '0', 'initpwd', '2016-08-09 13:49:46', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('227', '309587', '2016-08-09 13:48:46', '0', 'initpwd', '2016-08-09 13:49:46', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('228', '024978', '2016-08-09 13:48:46', '0', 'initpwd', '2016-08-09 13:49:46', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('229', '661492', '2016-08-09 13:48:50', '0', 'initpwd', '2016-08-09 13:49:50', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('230', '904027', '2016-08-09 13:48:50', '0', 'initpwd', '2016-08-09 13:49:50', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('231', '261161', '2016-08-09 13:48:50', '0', 'initpwd', '2016-08-09 13:49:50', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('232', '638901', '2016-08-09 13:48:50', '0', 'initpwd', '2016-08-09 13:49:50', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('233', '114354', '2016-08-09 13:48:50', '0', 'initpwd', '2016-08-09 13:49:50', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('234', '716633', '2016-08-09 13:48:51', '0', 'initpwd', '2016-08-09 13:49:51', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('235', '541112', '2016-08-09 13:52:54', '0', 'initpwd', '2016-08-09 13:53:54', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('236', '461989', '2016-08-09 13:53:32', '0', 'initpwd', '2016-08-09 13:54:32', '13611087000');
INSERT INTO `jf_tb_valicode` VALUES ('237', '078573', '2016-08-09 13:54:15', '0', 'initpwd', '2016-08-09 13:55:15', '18510236545');
INSERT INTO `jf_tb_valicode` VALUES ('238', '370253', '2016-08-09 13:54:42', '0', 'initpwd', '2016-08-09 13:55:42', '13810869207');
INSERT INTO `jf_tb_valicode` VALUES ('239', '377525', '2016-08-09 14:07:09', '0', 'initpwd', '2016-08-09 14:08:09', '13651004228');
INSERT INTO `jf_tb_valicode` VALUES ('240', '480676', '2016-08-09 14:10:13', '0', 'initpwd', '2016-08-09 14:11:13', '13651004228');
INSERT INTO `jf_tb_valicode` VALUES ('241', '29989d', '2016-08-09 14:35:55', '1', 'forgetpwd', '2016-08-09 14:36:55', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('242', '668527', '2016-08-09 15:52:12', '0', 'initpwd', '2016-08-09 15:53:12', '13651004228');
INSERT INTO `jf_tb_valicode` VALUES ('243', '536882', '2016-08-09 15:57:51', '0', 'initpwd', '2016-08-09 15:58:51', '13693329426');
INSERT INTO `jf_tb_valicode` VALUES ('244', '197825', '2016-08-09 15:59:10', '0', 'initpwd', '2016-08-09 16:00:10', '13810869207');
INSERT INTO `jf_tb_valicode` VALUES ('245', '586136', '2016-08-09 15:59:52', '0', 'initpwd', '2016-08-09 16:00:52', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('246', '248998', '2016-08-09 16:00:07', '0', 'initpwd', '2016-08-09 16:01:07', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('247', '771599', '2016-08-09 16:01:03', '0', 'initpwd', '2016-08-09 16:02:03', '18510236545');
INSERT INTO `jf_tb_valicode` VALUES ('248', '663653', '2016-08-09 16:01:41', '0', 'initpwd', '2016-08-09 16:02:41', '13611087000');
INSERT INTO `jf_tb_valicode` VALUES ('249', '047696', '2016-08-11 13:54:09', '0', 'initpwd', '2016-08-11 13:55:09', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('250', '210493', '2016-08-11 13:56:02', '0', 'initpwd', '2016-08-11 13:57:02', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('251', '318267', '2016-08-11 13:56:19', '0', 'initpwd', '2016-08-11 13:57:19', '18600168224');
INSERT INTO `jf_tb_valicode` VALUES ('252', '687433', '2016-08-12 16:30:33', '0', 'initpwd', '2016-08-12 16:31:33', '18618422414');
INSERT INTO `jf_tb_valicode` VALUES ('253', '498567', '2016-08-12 18:29:48', '0', 'initpwd', '2016-08-12 18:30:48', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('254', '078417', '2016-08-12 18:29:52', '0', 'initpwd', '2016-08-12 18:30:52', '18611157744');
INSERT INTO `jf_tb_valicode` VALUES ('255', '430558', '2016-08-12 22:45:19', '0', 'initpwd', '2016-08-12 22:46:19', '18156911306');
INSERT INTO `jf_tb_valicode` VALUES ('256', '101706', '2016-08-12 23:06:12', '0', 'initpwd', '2016-08-12 23:07:12', '18310359390');
INSERT INTO `jf_tb_valicode` VALUES ('257', '856296', '2016-08-12 23:33:06', '0', 'initpwd', '2016-08-12 23:34:06', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('258', '506771', '2016-08-12 23:33:06', '0', 'initpwd', '2016-08-12 23:34:06', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('259', '318517', '2016-08-12 23:36:34', '0', 'initpwd', '2016-08-12 23:37:34', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('260', '462139', '2016-08-12 23:36:34', '0', 'initpwd', '2016-08-12 23:37:34', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('261', '364530', '2016-08-12 23:43:39', '0', 'initpwd', '2016-08-12 23:44:39', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('262', '763354', '2016-08-12 23:46:36', '0', 'initpwd', '2016-08-12 23:47:36', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('263', '335394', '2016-08-13 22:40:25', '0', 'initpwd', '2016-08-13 22:41:25', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('264', '551915', '2016-08-14 14:26:33', '0', 'initpwd', '2016-08-14 14:27:33', '13691194025');
INSERT INTO `jf_tb_valicode` VALUES ('265', '275186', '2016-08-14 14:28:51', '0', 'initpwd', '2016-08-14 14:29:51', '18148141319');
INSERT INTO `jf_tb_valicode` VALUES ('266', '653125', '2016-08-14 14:31:30', '0', 'initpwd', '2016-08-14 14:32:30', '13911341388');
INSERT INTO `jf_tb_valicode` VALUES ('267', '136762', '2016-08-14 14:32:13', '0', 'initpwd', '2016-08-14 14:33:13', '13161541319');
INSERT INTO `jf_tb_valicode` VALUES ('268', '745178', '2016-08-14 15:55:07', '0', 'initpwd', '2016-08-14 15:56:07', '18156911307');
INSERT INTO `jf_tb_valicode` VALUES ('269', '949788', '2016-08-14 16:37:18', '0', 'initpwd', '2016-08-14 16:38:18', '18611590801');
INSERT INTO `jf_tb_valicode` VALUES ('270', '324195', '2016-08-14 16:38:33', '0', 'initpwd', '2016-08-14 16:39:33', '18844138401');
INSERT INTO `jf_tb_valicode` VALUES ('271', '788206', '2016-08-14 16:38:53', '0', 'initpwd', '2016-08-14 16:39:53', '13261082613');
INSERT INTO `jf_tb_valicode` VALUES ('272', '669811', '2016-08-14 16:39:47', '0', 'initpwd', '2016-08-14 16:40:47', '15001284030');
INSERT INTO `jf_tb_valicode` VALUES ('273', '536456', '2016-08-14 16:40:31', '0', 'initpwd', '2016-08-14 16:41:31', '13466519426');
INSERT INTO `jf_tb_valicode` VALUES ('274', '509327', '2016-08-14 16:40:55', '0', 'initpwd', '2016-08-14 16:41:55', '18600943577');
INSERT INTO `jf_tb_valicode` VALUES ('275', '165322', '2016-08-14 16:41:09', '0', 'initpwd', '2016-08-14 16:42:09', '15601212266');
INSERT INTO `jf_tb_valicode` VALUES ('276', 'd2fc5d', '2016-08-14 21:02:58', '0', 'forgetpwd', '2016-08-14 21:03:58', '13691194025');
INSERT INTO `jf_tb_valicode` VALUES ('277', '4ff039', '2016-08-15 13:55:47', '0', 'reg', '2016-08-15 13:56:47', '13621167443');
INSERT INTO `jf_tb_valicode` VALUES ('278', '1134f4', '2016-08-15 13:55:51', '0', 'reg', '2016-08-15 13:56:51', '13621167443');
INSERT INTO `jf_tb_valicode` VALUES ('279', '2933e6', '2016-08-15 13:55:57', '0', 'reg', '2016-08-15 13:56:57', '13621167443');
INSERT INTO `jf_tb_valicode` VALUES ('280', '708674', '2016-08-18 22:42:30', '0', 'initpwd', '2016-08-18 22:43:30', '13888888888');
INSERT INTO `jf_tb_valicode` VALUES ('281', '714021', '2016-08-18 22:57:40', '0', 'initpwd', '2016-08-18 22:58:40', '13888888881');
INSERT INTO `jf_tb_valicode` VALUES ('282', '129505', '2016-08-18 22:58:25', '0', 'initpwd', '2016-08-18 22:59:25', '13888888882');
INSERT INTO `jf_tb_valicode` VALUES ('283', '624595', '2016-08-18 23:04:16', '0', 'initpwd', '2016-08-18 23:05:16', '13888887777');
INSERT INTO `jf_tb_valicode` VALUES ('284', '251444', '2016-08-18 23:06:32', '0', 'initpwd', '2016-08-18 23:07:32', '18922222222');
INSERT INTO `jf_tb_valicode` VALUES ('285', '898467', '2016-08-18 23:07:41', '0', 'initpwd', '2016-08-18 23:08:41', '18911111111');
INSERT INTO `jf_tb_valicode` VALUES ('286', '953030', '2016-08-18 23:08:21', '0', 'initpwd', '2016-08-18 23:09:21', '18971111111');
INSERT INTO `jf_tb_valicode` VALUES ('287', '266383', '2016-08-18 23:09:42', '0', 'initpwd', '2016-08-18 23:10:42', '18979893111');
INSERT INTO `jf_tb_valicode` VALUES ('288', '561112', '2016-08-18 23:39:49', '0', 'initpwd', '2016-08-18 23:40:49', '18979893123');
INSERT INTO `jf_tb_valicode` VALUES ('289', '706682', '2016-08-18 23:40:28', '0', 'initpwd', '2016-08-18 23:41:28', '18979111111');
INSERT INTO `jf_tb_valicode` VALUES ('290', '111000', '2016-08-19 14:23:25', '0', 'initpwd', '2016-08-19 14:24:25', '18911111112');
INSERT INTO `jf_tb_valicode` VALUES ('291', '721682', '2016-08-19 14:28:48', '0', 'initpwd', '2016-08-19 14:29:48', '18911111111');
INSERT INTO `jf_tb_valicode` VALUES ('292', '941092', '2016-08-19 16:30:50', '0', 'initpwd', '2016-08-19 16:31:50', '18979893111');

-- ----------------------------
-- Table structure for jf_tb_video
-- ----------------------------
DROP TABLE IF EXISTS `jf_tb_video`;
CREATE TABLE `jf_tb_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频名字',
  `path` varchar(255) DEFAULT NULL COMMENT '视频路径',
  `author_name` varchar(255) DEFAULT NULL COMMENT '作者姓名',
  `author_avatar` varchar(255) DEFAULT NULL COMMENT '作者头像地址',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `course_part_id` int(11) DEFAULT NULL COMMENT '所在单元id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '封面路径',
  `source_index` int(4) DEFAULT '0' COMMENT '本资源在所在栏目中的位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jf_tb_video
-- ----------------------------
INSERT INTO `jf_tb_video` VALUES ('57', '1.1', '/static/upload/video/1.1.mp4', null, null, '2016-08-01 14:44:25', '136', null, '10');
INSERT INTO `jf_tb_video` VALUES ('58', '1.2', '/static/upload/video/1.2.mp4', null, null, '2016-08-01 14:46:32', '137', null, '10');
INSERT INTO `jf_tb_video` VALUES ('59', 'video_2.1', '/static/upload/video/2.1.mp4', null, null, '2016-08-01 15:04:48', '143', null, '1');
INSERT INTO `jf_tb_video` VALUES ('60', 'video_2.2', '/static/upload/video/2.2.mp4', null, null, '2016-08-01 15:05:13', '144', null, '1');
INSERT INTO `jf_tb_video` VALUES ('61', 'video_2.3', '/static/upload/video/2.3.mp4', null, null, '2016-08-01 15:05:46', '145', null, '1');
INSERT INTO `jf_tb_video` VALUES ('62', 'video_2.4', '/static/upload/video/2.4.mp4', null, null, '2016-08-01 15:06:27', '146', null, '1');
INSERT INTO `jf_tb_video` VALUES ('63', '2.5', '/static/upload/video/2.5.mp4', null, null, '2016-08-01 15:40:04', '151', null, '1');
INSERT INTO `jf_tb_video` VALUES ('64', '2.6', '/static/upload/video/2.6.mp4', null, null, '2016-08-01 15:40:40', '153', null, '1');
INSERT INTO `jf_tb_video` VALUES ('65', '2.4', '/static/upload/video/2.41.mp4', null, null, '2016-08-01 15:41:33', '154', null, '1');
INSERT INTO `jf_tb_video` VALUES ('66', '2.5', '/static/upload/video/2.51.mp4', null, null, '2016-08-01 15:42:42', '156', null, '1');
INSERT INTO `jf_tb_video` VALUES ('67', 'ShiFanZou', '/static/upload/video/ShiFanZou.mp4', null, null, '2016-08-02 15:25:21', '190', null, '1');
INSERT INTO `jf_tb_video` VALUES ('68', 'WanZhengZou', '/static/upload/video/WanZhengZou.mp4', null, null, '2016-08-02 15:30:19', '192', null, '1');
INSERT INTO `jf_tb_video` VALUES ('69', '7.3.1GenZou1', '/static/upload/video/7.3.1GenZou1.mp4', null, null, '2016-08-02 16:51:13', '197', null, '1');
INSERT INTO `jf_tb_video` VALUES ('70', '7.3.2GenZou2', '/static/upload/video/7.3.2GenZou2.mp4', null, null, '2016-08-02 16:51:57', '199', null, '1');
INSERT INTO `jf_tb_video` VALUES ('71', '7.3.3WanZhengZou1', '/static/upload/video/7.3.3WanZhengZou1.mp4', null, null, '2016-08-02 16:52:40', '200', null, '1');
INSERT INTO `jf_tb_video` VALUES ('72', '7.3.4WanZhengZou2', '/static/upload/video/7.3.4WanZhengZou2.mp4', null, null, '2016-08-02 16:53:18', '202', null, '1');
INSERT INTO `jf_tb_video` VALUES ('73', '8.1', '/static/upload/video/8.1.mp4', null, null, '2016-08-02 17:17:35', '209', null, '1');
INSERT INTO `jf_tb_video` VALUES ('74', '8.2', '/static/upload/video/8.2.mp4', null, null, '2016-08-02 17:18:38', '210', null, '1');
INSERT INTO `jf_tb_video` VALUES ('75', '8.3', '/static/upload/video/8.3.mp4', null, null, '2016-08-02 17:19:32', '211', null, '1');
INSERT INTO `jf_tb_video` VALUES ('76', '8.1.4', '/static/upload/video/8.4.mp4', null, null, '2016-08-02 17:20:09', '212', null, '1');
INSERT INTO `jf_tb_video` VALUES ('77', '8.2.1', '/static/upload/video/8.5.mp4', null, null, '2016-08-02 17:21:46', '213', null, '1');
INSERT INTO `jf_tb_video` VALUES ('78', '8.3.1', '/static/upload/video/8.6.mp4', null, null, '2016-08-02 17:22:33', '215', null, '1');
INSERT INTO `jf_tb_video` VALUES ('79', '8.4.1', '/static/upload/video/8.41.mp4', null, null, '2016-08-02 17:23:03', '216', null, '1');
INSERT INTO `jf_tb_video` VALUES ('80', '8.5.1', '/static/upload/video/8.51.mp4', null, null, '2016-08-02 17:23:37', '218', null, '1');

-- ----------------------------
-- Table structure for lkk_demolesson
-- ----------------------------
DROP TABLE IF EXISTS `lkk_demolesson`;
CREATE TABLE `lkk_demolesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '视频路径',
  `size` double(11,0) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '类型 1：示范课  2：曲目 3：类型3',
  `author` varchar(255) DEFAULT '' COMMENT '作者，教师id',
  `pic_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `know_point` varchar(255) DEFAULT NULL COMMENT '知识要点',
  `purpose` varchar(255) DEFAULT NULL COMMENT '教学目的',
  `content` text COMMENT '教学内容',
  `process` varchar(255) DEFAULT NULL COMMENT '教学过程',
  `like_number` int(11) DEFAULT NULL COMMENT '点赞量',
  `level` int(4) DEFAULT '0' COMMENT '难度',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3099 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lkk_demolesson
-- ----------------------------
INSERT INTO `lkk_demolesson` VALUES ('3068', '13', 'model lesson01', '/demolesson/model lesson01.mp4', null, '1', '谢依晨', '', '', null, null, null, '33', '0', '2016-06-20 20:16:59');
INSERT INTO `lkk_demolesson` VALUES ('3069', '13', 'model lesson02', '/demolesson/model lesson02.mp4', null, '1', '常江舟', '', '', null, null, null, '666', '0', '2016-06-20 20:22:27');
INSERT INTO `lkk_demolesson` VALUES ('3070', '13', 'model lesson03', '/demolesson/model lesson03.mp4', null, '1', '林清源', '', '', null, null, null, '888', '0', '2016-06-20 20:24:12');
INSERT INTO `lkk_demolesson` VALUES ('3071', '13', 'model lesson04', '/demolesson/model lesson04.mp4', null, '1', '周宁娅', '', '', null, null, null, '999', '0', '2016-06-20 20:31:38');
INSERT INTO `lkk_demolesson` VALUES ('3072', '13', 'model lesson05', '/demolesson/model lesson05.mp4', null, '1', '吴旭光', '', '', null, null, null, '555', '0', '2016-06-20 20:58:48');
INSERT INTO `lkk_demolesson` VALUES ('3073', '13', 'model lesson06', '/demolesson/model lesson06.mp4', null, '1', '谢依晨', '', '', null, null, null, '33', '0', '2016-06-20 20:16:59');
INSERT INTO `lkk_demolesson` VALUES ('3074', '13', 'model lesson07', '/demolesson/model lesson07.mp4', null, '1', '常江舟', '', '', null, null, null, '666', '0', '2016-06-20 20:22:27');
INSERT INTO `lkk_demolesson` VALUES ('3075', '13', 'model lesson08', '/demolesson/model lesson08.mp4', null, '1', '林清源', '', '', null, null, null, '888', '0', '2016-06-20 20:24:12');
INSERT INTO `lkk_demolesson` VALUES ('3076', '13', 'model lesson09', '/demolesson/model lesson09.mp4', null, '1', '周宁娅', '', '', null, null, null, '999', '0', '2016-06-20 20:31:38');
INSERT INTO `lkk_demolesson` VALUES ('3077', '13', 'model lesson10', '/demolesson/model lesson10.mp4', null, '1', '吴旭光', '', '', null, null, null, '555', '0', '2016-06-20 20:58:48');
INSERT INTO `lkk_demolesson` VALUES ('3080', '13', 'model lesson11', '/demolesson/model lesson11.mp4', null, '1', '谢依晨', '', '', null, null, null, '33', '0', '2016-06-20 20:16:59');
INSERT INTO `lkk_demolesson` VALUES ('3081', '13', 'model lesson12', '/demolesson/model lesson12.mp4', null, '1', '常江舟', '', '', null, null, null, '666', '0', '2016-06-20 20:22:27');
INSERT INTO `lkk_demolesson` VALUES ('3082', '13', 'model lesson13', '/demolesson/model lesson13.mp4', null, '1', '林清源', '', '', null, null, null, '888', '0', '2016-06-20 20:24:12');
INSERT INTO `lkk_demolesson` VALUES ('3083', '13', 'model lesson14', '/demolesson/model lesson14.mp4', null, '1', '周宁娅', '', '', null, null, null, '999', '0', '2016-06-20 20:31:38');
INSERT INTO `lkk_demolesson` VALUES ('3084', '13', 'model lesson15', '/demolesson/model lesson15.mp4', null, '1', '吴旭光', '', '', null, null, null, '555', '0', '2016-06-20 20:58:48');
INSERT INTO `lkk_demolesson` VALUES ('3085', '13', 'model lesson16', '/demolesson/model lesson16.mp4', null, '1', '谢依晨', '', '', null, null, null, '33', '0', '2016-06-20 20:16:59');
INSERT INTO `lkk_demolesson` VALUES ('3086', '13', 'model lesson17', '/demolesson/model lesson17.mp4', null, '1', '常江舟', '', '', null, null, null, '666', '0', '2016-06-20 20:22:27');
INSERT INTO `lkk_demolesson` VALUES ('3087', '13', 'model lesson18', '/demolesson/model lesson18.mp4', null, '1', '林清源', '', '', null, null, null, '888', '0', '2016-06-20 20:24:12');
INSERT INTO `lkk_demolesson` VALUES ('3088', '13', 'model lesson19', '/demolesson/model lesson19mp4', null, '1', '周宁娅', '', '', null, null, null, '999', '0', '2016-06-20 20:31:38');
INSERT INTO `lkk_demolesson` VALUES ('3089', '13', 'model lesson20', '/demolesson/model lesson20.mp4', null, '1', '吴旭光', '', '', null, null, null, '555', '0', '2016-06-20 20:58:48');
INSERT INTO `lkk_demolesson` VALUES ('3095', '13', 'model lesson21', '/demolesson/model lesson21.mp4', null, '1', '谢依晨', '', '', null, null, null, '33', '0', '2016-06-20 20:16:59');
INSERT INTO `lkk_demolesson` VALUES ('3096', '13', 'model lesson22', '/demolesson/model lesson22mp4', null, '1', '常江舟', '', '', null, null, null, '666', '0', '2016-06-20 20:22:27');
INSERT INTO `lkk_demolesson` VALUES ('3097', '13', 'model lesson23', '/demolesson/model lesson23.mp4', null, '1', '林清源', '', '', null, null, null, '888', '0', '2016-06-20 20:24:12');
INSERT INTO `lkk_demolesson` VALUES ('3098', '13', 'model lesson24', '/demolesson/model lesson24.mp4', null, '1', '周宁娅', '', '', null, null, null, '999', '0', '2016-06-20 20:31:38');
