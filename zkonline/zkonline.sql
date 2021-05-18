/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.27 : Database - zkonline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zkonline` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zkonline`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values (1,'教师');

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

insert  into `auth_group_permissions`(`id`,`group_id`,`permission_id`) values (6,1,25),(7,1,26),(8,1,27),(9,1,28),(50,1,29),(51,1,30),(52,1,31),(49,1,32),(40,1,48),(53,1,73),(54,1,74),(55,1,75),(56,1,76),(58,1,77),(59,1,78),(60,1,79),(57,1,80),(41,1,86),(42,1,88),(43,1,89),(44,1,90),(45,1,91),(46,1,92),(48,1,94),(47,1,96),(38,1,102),(39,1,104);

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户信息',6,'add_userprofile'),(22,'Can change 用户信息',6,'change_userprofile'),(23,'Can delete 用户信息',6,'delete_userprofile'),(24,'Can view 用户信息',6,'view_userprofile'),(25,'Can add 课程信息',7,'add_course'),(26,'Can change 课程信息',7,'change_course'),(27,'Can delete 课程信息',7,'delete_course'),(28,'Can view 课程信息',7,'view_course'),(29,'Can add 课程章节',8,'add_lesson'),(30,'Can change 课程章节',8,'change_lesson'),(31,'Can delete 课程章节',8,'delete_lesson'),(32,'Can view 课程章节',8,'view_lesson'),(33,'Can add 用户收藏',9,'add_userfavorite'),(34,'Can change 用户收藏',9,'change_userfavorite'),(35,'Can delete 用户收藏',9,'delete_userfavorite'),(36,'Can view 用户收藏',9,'view_userfavorite'),(37,'Can add 通知',10,'add_usermessage'),(38,'Can change 通知',10,'change_usermessage'),(39,'Can delete 通知',10,'delete_usermessage'),(40,'Can view 通知',10,'view_usermessage'),(41,'Can add 我的课程',11,'add_usercourses'),(42,'Can change 我的课程',11,'change_usercourses'),(43,'Can delete 我的课程',11,'delete_usercourses'),(44,'Can view 我的课程',11,'view_usercourses'),(45,'Can add 课程评论',12,'add_coursecomment'),(46,'Can change 课程评论',12,'change_coursecomment'),(47,'Can delete 课程评论',12,'delete_coursecomment'),(48,'Can view 课程评论',12,'view_coursecomment'),(49,'Can add 教师',13,'add_teacher'),(50,'Can change 教师',13,'change_teacher'),(51,'Can delete 教师',13,'delete_teacher'),(52,'Can view 教师',13,'view_teacher'),(53,'Can add Bookmark',14,'add_bookmark'),(54,'Can change Bookmark',14,'change_bookmark'),(55,'Can delete Bookmark',14,'delete_bookmark'),(56,'Can view Bookmark',14,'view_bookmark'),(57,'Can add User Setting',15,'add_usersettings'),(58,'Can change User Setting',15,'change_usersettings'),(59,'Can delete User Setting',15,'delete_usersettings'),(60,'Can view User Setting',15,'view_usersettings'),(61,'Can add User Widget',16,'add_userwidget'),(62,'Can change User Widget',16,'change_userwidget'),(63,'Can delete User Widget',16,'delete_userwidget'),(64,'Can view User Widget',16,'view_userwidget'),(65,'Can add log entry',17,'add_log'),(66,'Can change log entry',17,'change_log'),(67,'Can delete log entry',17,'delete_log'),(68,'Can view log entry',17,'view_log'),(69,'Can add captcha store',18,'add_captchastore'),(70,'Can change captcha store',18,'change_captchastore'),(71,'Can delete captcha store',18,'delete_captchastore'),(72,'Can view captcha store',18,'view_captchastore'),(73,'Can add 视频',19,'add_video'),(74,'Can change 视频',19,'change_video'),(75,'Can delete 视频',19,'delete_video'),(76,'Can view 视频',19,'view_video'),(77,'Can add 课程资源',20,'add_courseresource'),(78,'Can change 课程资源',20,'change_courseresource'),(79,'Can delete 课程资源',20,'delete_courseresource'),(80,'Can view 课程资源',20,'view_courseresource'),(81,'Can add 轮播图',21,'add_banner'),(82,'Can change 轮播图',21,'change_banner'),(83,'Can delete 轮播图',21,'delete_banner'),(84,'Can view 轮播图',21,'view_banner'),(85,'Can add 作业',22,'add_homework'),(86,'Can change 作业',22,'change_homework'),(87,'Can delete 作业',22,'delete_homework'),(88,'Can view 作业',22,'view_homework'),(89,'Can add 作业任务',23,'add_homeworktask'),(90,'Can change 作业任务',23,'change_homeworktask'),(91,'Can delete 作业任务',23,'delete_homeworktask'),(92,'Can view 作业任务',23,'view_homeworktask'),(93,'Can add 实验',24,'add_experiment'),(94,'Can change 实验',24,'change_experiment'),(95,'Can delete 实验',24,'delete_experiment'),(96,'Can view 实验',24,'view_experiment'),(97,'Can add 实验报告',25,'add_exp_report'),(98,'Can change 实验报告',25,'change_exp_report'),(99,'Can delete 实验报告',25,'delete_exp_report'),(100,'Can view 实验报告',25,'view_exp_report'),(101,'Can add 实验报告',26,'add_expreport'),(102,'Can change 实验报告',26,'change_expreport'),(103,'Can delete 实验报告',26,'delete_expreport'),(104,'Can view 实验报告',26,'view_expreport'),(105,'Can add 用户实验关联',27,'add_userexp'),(106,'Can change 用户实验关联',27,'change_userexp'),(107,'Can delete 用户实验关联',27,'delete_userexp'),(108,'Can view 用户实验关联',27,'view_userexp'),(109,'Can add 实验评论',28,'add_expcomment'),(110,'Can change 实验评论',28,'change_expcomment'),(111,'Can delete 实验评论',28,'delete_expcomment'),(112,'Can view 实验评论',28,'view_expcomment'),(113,'Can add 作业任务',29,'add_homeworktask1'),(114,'Can change 作业任务',29,'change_homeworktask1'),(115,'Can delete 作业任务',29,'delete_homeworktask1'),(116,'Can view 作业任务',29,'view_homeworktask1'),(117,'Can add 作业',30,'add_homework1'),(118,'Can change 作业',30,'change_homework1'),(119,'Can delete 作业',30,'delete_homework1'),(120,'Can view 作业',30,'view_homework1'),(121,'Can add 全局消息',31,'add_globalmessage'),(122,'Can change 全局消息',31,'change_globalmessage'),(123,'Can delete 全局消息',31,'delete_globalmessage'),(124,'Can view 全局消息',31,'view_globalmessage');

/*Table structure for table `captcha_captchastore` */

DROP TABLE IF EXISTS `captcha_captchastore`;

CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `captcha_captchastore` */

/*Table structure for table `courses_course` */

DROP TABLE IF EXISTS `courses_course`;

CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `student_nums` int(11) NOT NULL,
  `tag` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  `course_img` varchar(500) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `notice` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_teacher_id_846fa526_fk_teachers_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `courses_course` */

insert  into `courses_course`(`id`,`c_time`,`name`,`learn_times`,`click_nums`,`student_nums`,`tag`,`detail`,`course_img`,`teacher_id`,`category`,`notice`) values (2,'2021-03-15 12:17:00.000000','流体力学',20,2,1,'基础课','力学的一个分支，主要研究在各种力的作用下，流体本身的静止状态和运动状态以及流体和固体界壁间有相对运动时的相互作用和流动规律。','profile_img/course_img/2021/04/流体力学.jpg',2,'必修','abc'),(3,'2021-03-15 21:16:00.000000','环境检测',10,4,0,'专业课','环境检测是对某种环境进行的测试。环境检测和治理，是一项技术性很强的新兴行业。环境检测的介质对象大致可分为水质检测、空气检测、土壤检测、固体废物检测、生物检测、噪声和振动检测、电磁辐射检测、放射性检测、热检测、光检测、卫生，检测等。保证环境的安全。这就是环境检测的意义所在。','profile_img/course_img/2021/03/download.jpg',1,'必修','abc'),(4,'2021-03-15 21:17:00.000000','无机化学',0,114,2,'基础课','无机化学是研究无机化合物的化学，是化学领域的一个重要分支。通常无机化合物与有机化合物相对，指多数不含C-H键的化合物，但是，碳氧化物、碳硫化物、氰化物、硫氰酸盐、碳酸及碳酸盐、碳硼烷、羰基金属等都属于无机化学研究的范畴（实际上是将“由无机化学研究的物质”定义为“无机物”） [1-2]  。但这二者界限并不严格，之间有较大的重叠，有机金属化学即是一例。','profile_img/course_img/2021/04/无机化学.png',3,'必修','abc'),(5,'2021-03-15 21:17:00.000000','高等数学',0,8,2,'基础课','高等数学（英语：Further Mathematics）是比初等数学（英语：Elementary Mathematics）更高深的数学。中学里较深入的代数、几何以及集合论初步、逻辑初步统称为中等数学的，将其作为小学、初中的初等数学与本科阶段的高等数学之间的过渡。通常认为，高等数学的主要内容包括：极限理论、一元微积分学、多元微积分学、空间解析几何与向量代数、级数理论、常微分方程初步。在高等数学的教材中，以微积分学和级数理论为主体，其他方面的内容为辅，各类课本略有差异。\r\n\r\n高等数学是高等学校理工科本科有关专业学生的一门必修的重要基础课。通过这门课程的学习，使学生获得向量代数与空间解析几何、微积分的基本知识，必要的基础理论和常用的运算方法，并注意培养学生的运算能力和初步的抽象思维、逻辑推理及空间想象能力，从而使学生获得解决实际问题能力的初步训练，为学习后继课程奠定必要的数学基础。','profile_img/course_img/2021/03/download_1_aGJKX56.jpg',2,'必修','abc'),(6,'2021-03-15 21:17:00.000000','化工原理',0,2,0,'专业课','化工原理也叫单元操作，是从事化工专业必须掌握的基本知识，各种化学工业的工程技术各式各样，但一系列的操作使用相同的原理，上世纪20年代，英国和美国一些大学开始将这些原理单独抽出，开设一门单独的学科，专门研究化工单元操作。化学工程原理可以适用所有化工、轻工门类工业的需要。\r\n\r\n化工原理主要包括五部分：流体输送、传热、传质、热力过程和机械过程。许多化工机械都是根据化工原理的理论知识设计制造的。化工厂和轻工厂的工艺设计也离不开化工原理计算。','profile_img/course_img/2021/03/O1CN01ShwzU51Tn9S241t9c_2041592426.jpg',3,'必修','abc'),(7,'2021-03-28 00:39:00.000000','污水处理',100,54,3,'专业课','污水处理是处理水污染的重要过程。采用物理、生物及化学的方法主要对生活污水以及工业废水进行处理以分离水中的固体污染物并降低水中的有机污染物和富营养物（主要为氮、磷化合物），从而减轻污水对环境的污染。它的目标是生产环境安全的液体废物流（或经处理的污水）和固体废物（或污泥处理），适用于处理或再利用（通常为农场的肥料），污水经过多重净化后甚至可达到食用水的标准能再供饮用。\r\n\r\n在广义上，污水处理也被定义为废水处理——包括工业废水的净化处理。在大部分城市中，一部分含有有机污染物和富营养物的工业废水会通过污水处理厂进行二次处理来减少有机污染物排放量','profile_img/course_img/2021/03/wastewater-image-wide.jpg',1,'必修','abc');

/*Table structure for table `courses_courseresource` */

DROP TABLE IF EXISTS `courses_courseresource`;

CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file` varchar(200) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `courses_courseresource` */

insert  into `courses_courseresource`(`id`,`c_time`,`name`,`file`,`course_id`) values (1,'2021-03-26 18:41:00.000000','复习全书','course/resourse/2021/03/2021李永乐王式安武忠祥复习全书_基础版数学一二三.pdf',5),(2,'2021-03-28 01:04:00.000000','污水处理课件','course/resourse/2021/03/wastewater-image-wide.jpg',7);

/*Table structure for table `courses_lesson` */

DROP TABLE IF EXISTS `courses_lesson`;

CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  KEY `courses_lesson_teacher_id_6aa160b9_fk_teachers_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_lesson_teacher_id_6aa160b9_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `courses_lesson` */

insert  into `courses_lesson`(`id`,`c_time`,`course_id`,`learn_times`,`name`,`teacher_id`) values (1,'2021-03-26 19:59:00.000000',5,100,'第一章、函数、连续、极限',2),(2,'2021-03-26 20:00:00.000000',5,100,'第二章、一元函数微分',2),(3,'2021-03-28 01:00:00.000000',7,10,'城市污水概述',1),(4,'2021-03-28 01:00:00.000000',7,0,'污水处理设计步骤',1);

/*Table structure for table `courses_video` */

DROP TABLE IF EXISTS `courses_video`;

CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `courses_video` */

insert  into `courses_video`(`id`,`c_time`,`name`,`learn_times`,`url`,`lesson_id`) values (1,'2021-03-26 20:00:00.000000','函数',4,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E4%BD%A0%E8%A2%AB%E9%AA%97%E4%BA%86%EF%BC%88%E5%8E%9F%E8%A7%86%E9%A2%91%E7%B4%A0%E6%9D%90%29.mp4',1),(2,'2021-03-26 20:00:00.000000','极限',4,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E4%BD%A0%E8%A2%AB%E9%AA%97%E4%BA%86%EF%BC%88%E5%8E%9F%E8%A7%86%E9%A2%91%E7%B4%A0%E6%9D%90%29.mp4',1),(3,'2021-03-26 20:00:00.000000','函数的连续与间断',4,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E4%BD%A0%E8%A2%AB%E9%AA%97%E4%BA%86%EF%BC%88%E5%8E%9F%E8%A7%86%E9%A2%91%E7%B4%A0%E6%9D%90%29.mp4',1),(4,'2021-03-26 20:01:00.000000','导数与微分',4,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E4%BD%A0%E8%A2%AB%E9%AA%97%E4%BA%86%EF%BC%88%E5%8E%9F%E8%A7%86%E9%A2%91%E7%B4%A0%E6%9D%90%29.mp4',2),(5,'2021-03-26 20:01:00.000000','中值定理',4,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E4%BD%A0%E8%A2%AB%E9%AA%97%E4%BA%86%EF%BC%88%E5%8E%9F%E8%A7%86%E9%A2%91%E7%B4%A0%E6%9D%90%29.mp4',2),(6,'2021-03-28 01:01:00.000000','污水处理过程示例',10,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E5%9F%8E%E5%B8%82%E6%B1%A1%E6%B0%B4%E5%A4%84%E7%90%86%E8%BF%87%E7%A8%8B%20%E7%A7%91%E6%99%AE%20%20%E5%8A%A8%E7%94%BB%E7%89%88.mp4',3),(7,'2021-03-28 01:02:00.000000','污水主要污染物',10,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E5%9F%8E%E5%B8%82%E6%B1%A1%E6%B0%B4%E5%A4%84%E7%90%86%E8%BF%87%E7%A8%8B%20%E7%A7%91%E6%99%AE%20%20%E5%8A%A8%E7%94%BB%E7%89%88.mp4',3),(8,'2021-03-28 01:02:00.000000','设计前期工作',10,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E5%9F%8E%E5%B8%82%E6%B1%A1%E6%B0%B4%E5%A4%84%E7%90%86%E8%BF%87%E7%A8%8B%20%E7%A7%91%E6%99%AE%20%20%E5%8A%A8%E7%94%BB%E7%89%88.mp4',4),(9,'2021-03-28 01:03:00.000000','初步设计',10,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E5%9F%8E%E5%B8%82%E6%B1%A1%E6%B0%B4%E5%A4%84%E7%90%86%E8%BF%87%E7%A8%8B%20%E7%A7%91%E6%99%AE%20%20%E5%8A%A8%E7%94%BB%E7%89%88.mp4',4),(10,'2021-03-28 01:03:00.000000','施工图设计',10,'https://test-zkonline.oss-cn-beijing.aliyuncs.com/%E5%9F%8E%E5%B8%82%E6%B1%A1%E6%B0%B4%E5%A4%84%E7%90%86%E8%BF%87%E7%A8%8B%20%E7%A7%91%E6%99%AE%20%20%E5%8A%A8%E7%94%BB%E7%89%88.mp4',4);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2021-02-03 11:14:53.927981','1','课程部门',1,'[{\"added\": {}}]',3,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(18,'captcha','captchastore'),(4,'contenttypes','contenttype'),(7,'courses','course'),(20,'courses','courseresource'),(8,'courses','lesson'),(19,'courses','video'),(28,'experiments','expcomment'),(24,'experiments','experiment'),(26,'experiments','expreport'),(25,'experiments','exp_report'),(27,'experiments','userexp'),(22,'homework','homework'),(30,'homework','homework1'),(23,'homework','homeworktask'),(29,'homework','homeworktask1'),(21,'operations','banner'),(12,'operations','coursecomment'),(31,'operations','globalmessage'),(11,'operations','usercourses'),(9,'operations','userfavorite'),(10,'operations','usermessage'),(5,'sessions','session'),(13,'teachers','teacher'),(6,'users','userprofile'),(14,'xadmin','bookmark'),(17,'xadmin','log'),(15,'xadmin','usersettings'),(16,'xadmin','userwidget');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2021-02-02 16:21:52.937159'),(2,'contenttypes','0002_remove_content_type_name','2021-02-02 16:21:53.881317'),(3,'auth','0001_initial','2021-02-02 16:21:55.056823'),(4,'auth','0002_alter_permission_name_max_length','2021-02-02 16:21:58.344716'),(5,'auth','0003_alter_user_email_max_length','2021-02-02 16:21:58.378369'),(6,'auth','0004_alter_user_username_opts','2021-02-02 16:21:58.417573'),(7,'auth','0005_alter_user_last_login_null','2021-02-02 16:21:58.454169'),(8,'auth','0006_require_contenttypes_0002','2021-02-02 16:21:58.486247'),(9,'auth','0007_alter_validators_add_error_messages','2021-02-02 16:21:58.520821'),(10,'auth','0008_alter_user_username_max_length','2021-02-02 16:21:58.559947'),(11,'auth','0009_alter_user_last_name_max_length','2021-02-02 16:21:58.590505'),(12,'auth','0010_alter_group_name_max_length','2021-02-02 16:21:59.173556'),(13,'auth','0011_update_proxy_permissions','2021-02-02 16:21:59.210181'),(14,'users','0001_initial','2021-02-02 16:22:00.461169'),(15,'admin','0001_initial','2021-02-02 16:22:03.402136'),(16,'admin','0002_logentry_remove_auto_add','2021-02-02 16:22:04.778221'),(17,'admin','0003_logentry_add_action_flag_choices','2021-02-02 16:22:04.834370'),(18,'teachers','0001_initial','2021-02-02 16:22:05.141472'),(19,'courses','0001_initial','2021-02-02 16:22:05.791098'),(20,'operations','0001_initial','2021-02-02 16:22:08.385317'),(21,'sessions','0001_initial','2021-02-02 16:22:12.859992'),(22,'users','0002_auto_20210202_1621','2021-02-02 16:22:13.105963'),(23,'users','0003_auto_20210203_1143','2021-02-03 11:43:38.896109'),(24,'xadmin','0001_initial','2021-02-03 17:31:54.031449'),(25,'xadmin','0002_log','2021-02-03 17:31:57.022398'),(26,'xadmin','0003_auto_20160715_0100','2021-02-03 17:31:58.965794'),(27,'users','0004_auto_20210203_2022','2021-02-03 20:22:56.220844'),(28,'courses','0002_course_category','2021-02-04 01:03:12.143058'),(29,'courses','0003_auto_20210204_0106','2021-02-04 01:06:35.188218'),(30,'teachers','0002_auto_20210204_0106','2021-02-04 01:06:35.822503'),(31,'captcha','0001_initial','2021-02-08 17:05:09.791133'),(32,'courses','0004_auto_20210322_1046','2021-03-22 10:46:54.747454'),(33,'operations','0002_auto_20210322_1046','2021-03-22 10:46:56.291969'),(34,'users','0005_auto_20210322_1046','2021-03-22 10:46:56.364220'),(35,'courses','0005_auto_20210322_1047','2021-03-22 10:47:50.808438'),(36,'courses','0006_course_lesson_nums','2021-03-22 11:01:15.338551'),(37,'courses','0007_auto_20210322_1308','2021-03-22 13:08:31.228676'),(38,'courses','0008_auto_20210322_1308','2021-03-22 13:08:52.695159'),(39,'courses','0009_remove_course_lesson_nums','2021-03-27 00:50:41.051561'),(40,'teachers','0003_auto_20210327_0050','2021-03-27 00:50:41.104196'),(41,'teachers','0004_teacher_detail','2021-03-27 01:15:26.676751'),(42,'teachers','0005_auto_20210327_0145','2021-03-27 01:45:47.626249'),(43,'operations','0003_banner','2021-03-27 12:26:47.728795'),(44,'users','0006_auto_20210411_0023','2021-04-11 00:24:14.727562'),(45,'teachers','0006_auto_20210411_0026','2021-04-11 00:27:13.431912'),(49,'users','0007_auto_20210415_2040','2021-04-15 20:40:48.871634'),(51,'users','0008_auto_20210415_2110','2021-04-17 13:41:06.724097'),(52,'experiments','0001_initial','2021-04-17 14:08:10.302813'),(53,'experiments','0002_auto_20210417_1415','2021-04-17 14:15:18.984649'),(54,'experiments','0003_expcomment_userexp','2021-04-17 17:24:05.473970'),(55,'experiments','0004_remove_experiment_url','2021-04-17 18:03:09.252164'),(56,'experiments','0005_remove_expreport_exp_date','2021-04-17 19:26:59.853093'),(57,'experiments','0006_expreport_title','2021-04-17 23:20:23.824474'),(59,'experiments','0007_expreport_teacher','2021-04-18 13:12:16.443666'),(60,'homework','0001_initial','2021-04-18 13:48:18.582526'),(61,'homework','0002_auto_20210418_1357','2021-04-18 13:58:02.023549'),(62,'operations','0004_globalmessage','2021-04-20 17:23:28.603997'),(63,'courses','0010_auto_20210427_2351','2021-04-27 23:52:14.218324'),(64,'experiments','0008_auto_20210427_2351','2021-04-27 23:52:14.378752'),(65,'teachers','0007_auto_20210427_2351','2021-04-27 23:52:14.518653'),(66,'users','0009_auto_20210427_2351','2021-04-27 23:52:14.688102'),(67,'operations','0005_auto_20210428_1045','2021-04-28 10:45:29.075346'),(68,'courses','0011_lesson_teacher','2021-04-28 11:55:20.023531'),(69,'homework','0003_auto_20210428_1155','2021-04-28 11:55:21.744140'),(70,'operations','0006_auto_20210428_1155','2021-04-28 11:55:22.753092');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('9yte3n8w8328icbdk9py8v2zo4j4n7a8','OTNhNGY0ZjEyNTY0YzhhNWE1YTgxOGIyYTIyNzg2ZGY0MmQ2ODEzYTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21BdXRoIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWY1NGJlNzEzN2VjZjhhYzRhZjliY2M4ZWNkNWJmNGZhYWQ2NDkyNyIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJjb3Vyc2UiXSwiIl19','2021-05-20 21:12:49.888873'),('cq9g852joncsfvqtbr6e8jx1b11ynfco','NWRkNmUwMzY5ZGI2NDgyN2Q3MjcyYWQwNmQ3Y2JjMzJlNGRkMmQzYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOGU5Y2JjYzM4MjhiZjY4MjNhYzc0ZWQxZDVkZTA5NGIyNTFmNzAxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=','2021-02-20 02:35:33.817972'),('diqaew2323uhoh6tqidwehaw46my2ye5','NmQwY2E0ZGI5MzE4NTUwYzM0ODYzNzZlNThmZmUzODhhZDJkZDgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21BdXRoIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDhlOWNiY2MzODI4YmY2ODIzYWM3NGVkMWQ1ZGUwOTRiMjUxZjcwMSJ9','2021-05-02 00:12:30.958856'),('jmzkgc8m100i4b4wpekp3edwkr6awyi5','NmQ4ZGJlNjI5ZWMzMjc5ZWI5ZjYzNmI1MDE2NmY1ZDJlNzFkNjJjYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOGU5Y2JjYzM4MjhiZjY4MjNhYzc0ZWQxZDVkZTA5NGIyNTFmNzAxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCJfY29scz1pZC51c2VybmFtZS5yZWFsX25hbWUubW9iaWxlX251bWJlci5nZW5kZXIuZW1haWwuaXNfc3VwZXJ1c2VyLnBhc3N3b3JkIl19','2021-02-23 20:43:39.469783'),('nvlvv9c05533q34jql9vgahhp5xi1pv7','NThlM2ZiNThmOGNlMTNiNzU5ZTMxNWVmNmJjYjNiZTA0OWU2MWMzNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwOGU5Y2JjYzM4MjhiZjY4MjNhYzc0ZWQxZDVkZTA5NGIyNTFmNzAxIn0=','2021-02-17 19:56:55.584133'),('v9b2sieilcbtnf0y2jooqmxxklygy1zw','MDczODIzZTgzZWMzYzgzMzg0NjFkNmJmN2RkODE2NjA1YjBmNjM4NDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21BdXRoIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWY1NGJlNzEzN2VjZjhhYzRhZjliY2M4ZWNkNWJmNGZhYWQ2NDkyNyIsIkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl19','2021-05-01 23:08:17.228591');

/*Table structure for table `experiments_expcomment` */

DROP TABLE IF EXISTS `experiments_expcomment`;

CREATE TABLE `experiments_expcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `content` varchar(500) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiments_expcomme_exp_id_bea421b0_fk_experimen` (`exp_id`),
  KEY `experiments_expcomment_user_id_3608700d_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `experiments_expcomme_exp_id_bea421b0_fk_experimen` FOREIGN KEY (`exp_id`) REFERENCES `experiments_experiment` (`id`),
  CONSTRAINT `experiments_expcomment_user_id_3608700d_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `experiments_expcomment` */

insert  into `experiments_expcomment`(`id`,`c_time`,`content`,`exp_id`,`user_id`) values (1,'2021-04-17 17:48:23.641585','test comment1',2,1),(2,'2021-04-27 22:50:17.137329','test',4,1),(3,'2021-04-27 22:57:59.323492','test1',4,1),(4,'2021-04-27 23:03:00.049629','test2',4,1),(5,'2021-04-27 23:08:51.217789','test3',4,1),(6,'2021-04-27 23:10:24.450217','test4\n',4,1),(7,'2021-04-27 23:11:28.277247','test',1,1),(8,'2021-04-27 23:13:14.698605','test1',1,1);

/*Table structure for table `experiments_experiment` */

DROP TABLE IF EXISTS `experiments_experiment`;

CREATE TABLE `experiments_experiment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `notice` varchar(300) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `student_nums` int(11) NOT NULL,
  `detail` longtext NOT NULL,
  `img` varchar(500) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiments_experime_teacher_id_b404a541_fk_teachers_` (`teacher_id`),
  CONSTRAINT `experiments_experime_teacher_id_b404a541_fk_teachers_` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `experiments_experiment` */

insert  into `experiments_experiment`(`id`,`c_time`,`title`,`notice`,`click_nums`,`student_nums`,`detail`,`img`,`teacher_id`) values (1,'2021-04-17 17:15:00.000000','管道模拟仿真','This is the notice of exp2',15,1,'通过更改管直径、充满度、坡度及覆土厚度等参数数值，对管道的流量流速及管道情况进行模拟仿真。使学生直观的了解不同的参数对管道的影响。','experiment/img/2021/04/exp1.jpg',3),(2,'2021-04-17 17:18:00.000000','模块化拼接','This is the notice of exp1',59,2,'模块化管道的不同组件，使学生能够按需求自由拼接不同的组件生成所需管网模型。','experiment/img/2021/04/exp2.jpg',2),(3,'2021-04-26 12:19:09.860878','污水处理流程','this is notice of exp3',6,1,'污水处理过程的效果展示，以等高线的角度来展示水流流量在不同高度的效果，并展示污水流量流速与高度的关系。','experiment/img/2021/04/exp3.jpg',1),(4,'2021-04-26 12:20:03.114696','城市管道模拟','this is notice of exp4',14,1,'将论文中的城市模型化，展示了城市效果及位于城市之下的管道管网，方便学生从整体的角度去学习管道。','experiment/img/2021/04/exp4.jpg',3);

/*Table structure for table `experiments_expreport` */

DROP TABLE IF EXISTS `experiments_expreport`;

CREATE TABLE `experiments_expreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `exp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiments_exprepor_exp_id_ea5d3afd_fk_experimen` (`exp_id`),
  KEY `experiments_expreport_user_id_11006100_fk_users_userprofile_id` (`user_id`),
  KEY `experiments_expreport_teacher_id_e3ed4819_fk_teachers_teacher_id` (`teacher_id`),
  CONSTRAINT `experiments_exprepor_exp_id_ea5d3afd_fk_experimen` FOREIGN KEY (`exp_id`) REFERENCES `experiments_experiment` (`id`),
  CONSTRAINT `experiments_expreport_teacher_id_e3ed4819_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`),
  CONSTRAINT `experiments_expreport_user_id_11006100_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `experiments_expreport` */

insert  into `experiments_expreport`(`id`,`c_time`,`content`,`score`,`comment`,`exp_id`,`user_id`,`title`,`teacher_id`) values (6,'2021-04-27 23:10:33.570519','<h1 label=\"标题居中\" style=\"white-space: normal; font-size: 32px; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">实验报告</h1><table><tbody><tr class=\"firstRow\"><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">年级：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">班别：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">姓名：</td></tr><tr><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">学号：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"background-color: rgb(237, 245, 250);\">实验时间：</span></td><td width=\"273\" valign=\"top\"><br/></td></tr></tbody></table><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>一、实验目的<br/></strong></span></p><p style=\"white-space: normal;\">test2</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>二、实验要求</strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>三、实验过程</strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>四、实验结果</strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>五、思考题</strong></span></p><p><br/></p>',-1,'',4,1,'test',1),(8,'2021-04-27 23:13:23.795612','<h1 label=\"标题居中\" style=\"white-space: normal; font-size: 32px; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\">实验报告</h1><table><tbody><tr class=\"firstRow\"><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">年级：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">班别：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">姓名：</td></tr><tr><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\">学号：</td><td width=\"273\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"background-color: rgb(237, 245, 250);\">实验时间：</span></td><td width=\"273\" valign=\"top\"><br/></td></tr></tbody></table><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>一、实验目的<br/></strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">test</p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>二、实验要求</strong></span></p><p style=\"white-space: normal;\">test1</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>三、实验过程</strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>四、实验结果</strong></span></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><span style=\"font-size: 18px;\"><strong>五、思考题</strong></span></p><p><br/></p>',-1,'',1,1,'test',1);

/*Table structure for table `experiments_userexp` */

DROP TABLE IF EXISTS `experiments_userexp`;

CREATE TABLE `experiments_userexp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `exp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiments_userexp_exp_id_b0e1397b_fk_experiments_experiment_id` (`exp_id`),
  KEY `experiments_userexp_user_id_ad7a32ca_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `experiments_userexp_exp_id_b0e1397b_fk_experiments_experiment_id` FOREIGN KEY (`exp_id`) REFERENCES `experiments_experiment` (`id`),
  CONSTRAINT `experiments_userexp_user_id_ad7a32ca_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `experiments_userexp` */

insert  into `experiments_userexp`(`id`,`c_time`,`exp_id`,`user_id`) values (1,'2021-04-17 17:24:27.063268',2,1),(2,'2021-04-17 17:51:16.176636',1,1),(3,'2021-04-17 23:21:45.699387',2,7),(4,'2021-04-26 12:21:19.470814',3,1),(5,'2021-04-26 12:21:49.270687',4,1);

/*Table structure for table `homework_homework` */

DROP TABLE IF EXISTS `homework_homework`;

CREATE TABLE `homework_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `task_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homework_homework_task_id_40153121_fk_homework_homeworktask_id` (`task_id`),
  KEY `homework_homework_teacher_id_12f95ceb_fk_teachers_teacher_id` (`teacher_id`),
  KEY `homework_homework_user_id_d7fbdb93_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `homework_homework_task_id_40153121_fk_homework_homeworktask_id` FOREIGN KEY (`task_id`) REFERENCES `homework_homeworktask` (`id`),
  CONSTRAINT `homework_homework_teacher_id_12f95ceb_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`),
  CONSTRAINT `homework_homework_user_id_d7fbdb93_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `homework_homework` */

insert  into `homework_homework`(`id`,`c_time`,`title`,`content`,`score`,`comment`,`task_id`,`teacher_id`,`user_id`) values (5,'2021-04-27 22:43:31.314219','20210427','<p style=\"margin-top: 0px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">根据污水来源的观点，污水可以定义为从住宅、机关、商业或者工业区排放的与地下水、地表水、暴风雪等混合的携带有废物的液体或者水。污水由许多类别，相应地减少污水对环境的影响也有许多技术和工艺。按照污水来源，污水可以分为这四类。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>第一类：工业废水</strong>&nbsp;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">来自制造采矿和工业生产活动的污水，包括来自与工业或者商业储藏、加工的径流活渗沥液，以及其它不是生活污水的废水。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><img class=\"currentImg\" id=\"currentImg\" src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1792821318,3081001994&fm=26&gp=0.jpg\" width=\"640\" height=\"360\" style=\"font-family: sans-serif; top: 145px; left: 326px;\"/> <br/> </p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><br/> </p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>第二类：生活污水</strong></p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">来自住宅、写字楼、机关或相类似的污水；卫生污水；下水道污水，包括下水道系统中生活污水中混合的工业废水。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>第三类：商业污水</strong>&nbsp;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">来自商业设施而且某些成分超过生活污水的无毒、无害的污水[2]。如餐饮污水。洗衣房污水、动物饲养污水，发廊产生的污水等。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>第四类：表面径流</strong>&nbsp;</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">来自雨水、雪水、高速公路下水，来自城市和工业地区的水等等，表面径流没有渗进土壤，沿街道和陆地进入地下水。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">污水含量有：氨氮、磷、COD、BOD、重金属等。</p><p><br style=\"white-space: normal;\"/> </p><p><br/> </p>',80,'test',2,1,1);

/*Table structure for table `homework_homeworktask` */

DROP TABLE IF EXISTS `homework_homeworktask`;

CREATE TABLE `homework_homeworktask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `deadline` date NOT NULL,
  `content` longtext NOT NULL,
  `homework_num` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `homework_homeworktask_course_id_85c15340_fk_courses_course_id` (`course_id`),
  KEY `homework_homeworktask_teacher_id_4549c1f8_fk_teachers_teacher_id` (`teacher_id`),
  CONSTRAINT `homework_homeworktask_course_id_85c15340_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `homework_homeworktask_teacher_id_4549c1f8_fk_teachers_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `homework_homeworktask` */

insert  into `homework_homeworktask`(`id`,`c_time`,`title`,`deadline`,`content`,`homework_num`,`course_id`,`teacher_id`) values (1,'2021-04-18 14:01:08.871102','污水处理的原理','2021-06-09','<p>简述污水处理的基本方法及其原理</p>',2,7,1),(2,'2021-04-18 14:09:18.330254','污水的种类','2021-04-18','<p>列出污水的种类及其组成成分</p>',3,7,1);

/*Table structure for table `operations_banner` */

DROP TABLE IF EXISTS `operations_banner`;

CREATE TABLE `operations_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `index` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `is_course` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_banner_course_id_62d76410_fk_courses_course_id` (`course_id`),
  CONSTRAINT `operations_banner_course_id_62d76410_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `operations_banner` */

insert  into `operations_banner`(`id`,`c_time`,`title`,`image`,`url`,`index`,`course_id`,`is_course`) values (1,'2021-03-27 12:28:00.000000','高等数学','banner/2021/03/srchttp___i2.bangqu.com_k_news_20180612_tgoh7zfl462r0xqc.jpgreferhttp___i2.bangqu.jpg','http://127.0.0.1:8000/course4/detail/',4,5,1),(2,'2021-03-27 12:31:00.000000','流体力学','banner/2021/04/srchttp___5b0988e595225.cdn.sohucs.com_images_20180605_3d2fcdd85c414b9a9c4af54122bc064d.jpegreferhttp___5b0988e595225.cdn.sohucs.jpg','http://127.0.0.1:8000/course2/detail/',3,2,1),(3,'2021-03-27 12:31:00.000000','化工原理','banner/2021/03/gettyimages-995454422-612x612.jpg','http://127.0.0.1:8000/course6/detail/',2,6,1),(4,'2021-03-28 00:35:00.000000','污水处理','banner/2021/03/wastewater-image-wide.jpg','http://127.0.0.1:8000/course7/detail/',1,7,1);

/*Table structure for table `operations_coursecomment` */

DROP TABLE IF EXISTS `operations_coursecomment`;

CREATE TABLE `operations_coursecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `content` varchar(500) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_coursecomment_course_id_ee3f9947_fk_courses_course_id` (`course_id`),
  KEY `operations_coursecom_user_id_6e14aa25_fk_users_use` (`user_id`),
  CONSTRAINT `operations_coursecom_user_id_6e14aa25_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operations_coursecomment_course_id_ee3f9947_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `operations_coursecomment` */

insert  into `operations_coursecomment`(`id`,`c_time`,`content`,`course_id`,`user_id`) values (4,'2021-03-26 18:01:58.236425','test',4,1),(5,'2021-03-26 18:05:27.962864','第一条评论',4,1),(6,'2021-03-26 18:05:35.729241','第二条评论',4,1),(7,'2021-03-26 18:23:17.672637','第三条评论',4,1),(8,'2021-03-27 23:07:55.459709','第四条评论',4,1),(9,'2021-04-06 15:23:20.305779','test',7,1),(10,'2021-04-11 18:02:17.745016','第一个评论',5,1),(11,'2021-04-11 18:02:22.068405','第二个评论',5,1),(12,'2021-04-27 22:29:59.748317','test1',7,13),(13,'2021-04-27 22:39:05.656540','test2',7,1);

/*Table structure for table `operations_globalmessage` */

DROP TABLE IF EXISTS `operations_globalmessage`;

CREATE TABLE `operations_globalmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `operations_globalmessage` */

insert  into `operations_globalmessage`(`id`,`c_time`,`title`,`content`) values (1,'2021-04-20 17:38:00.000000','测试','这是一条全局消息');

/*Table structure for table `operations_usercourses` */

DROP TABLE IF EXISTS `operations_usercourses`;

CREATE TABLE `operations_usercourses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_usercourses_course_id_cbc79187_fk_courses_course_id` (`course_id`),
  KEY `operations_usercourses_user_id_365e1aef_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operations_usercourses_course_id_cbc79187_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operations_usercourses_user_id_365e1aef_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `operations_usercourses` */

insert  into `operations_usercourses`(`id`,`c_time`,`is_finished`,`course_id`,`user_id`) values (8,'2021-04-17 23:22:15.362358',0,7,7),(9,'2021-04-24 16:43:13.809449',0,7,1),(10,'2021-04-27 22:27:39.702508',0,7,13),(12,'2021-05-06 20:50:09.303040',0,5,1);

/*Table structure for table `operations_usermessage` */

DROP TABLE IF EXISTS `operations_usermessage`;

CREATE TABLE `operations_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `content` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_usermessage_user_id_511ab4d8_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operations_usermessage_user_id_511ab4d8_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `operations_usermessage` */

insert  into `operations_usermessage`(`id`,`c_time`,`content`,`has_read`,`user_id`) values (1,'2021-04-06 01:15:00.000000','欢迎注册',1,1),(6,'2021-04-27 21:59:15.029134','欢迎注册',0,13),(7,'2021-04-28 10:01:48.671518','您的提交的一份作业已评阅完毕，请及时查看',1,1);

/*Table structure for table `teachers_teacher` */

DROP TABLE IF EXISTS `teachers_teacher`;

CREATE TABLE `teachers_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_time` datetime(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  `profile_img` varchar(500) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_number` (`mobile_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `teachers_teacher` */

insert  into `teachers_teacher`(`id`,`c_time`,`name`,`desc`,`profile_img`,`gender`,`mobile_number`,`email`,`detail`) values (1,'2021-02-04 01:07:00.000000','拜登','奥巴马执政时期美国副总统  ，第46任美国总统。','profile_img/teacher/2021/03/u23808315024236986583fm26gp0.jpg','male','12313333333','Biden@gmail.com','曾任特拉华州资深联邦参议员，1972年当选美国参议员，是美国历史上排名第五的最年轻的参议员。也是特拉华州在任时间最长的参议员（1973-2009年）。1988年和2008年两度竞选美国总统，都没有成功，2008年和2012年两度作为美国前总统奥巴马的竞选搭档。曾任参议院司法委员会和对外关系委员会主席，在奥巴马执政时期任美国副总统。 [1]  2019年4月25日，拜登宣布参选2020美国总统。 [4]  2021年1月7日，美国国会联席会议确认，拜登赢得306张选举人票，特朗普获得232张选举人票，美国国会联席会议确认拜登当选总统， [5]  1月20日，拜登宣誓就任美国第46任总统。'),(2,'2021-03-15 12:16:00.000000','特朗普','德裔美国共和党籍政治家、企业家、房地产商人、电视人 ，第45任美国总统。','profile_img/teacher/2021/03/u1551512298681541fm26gp0.jpg','male','12312312312','Trump@gmail.com','唐纳德·特朗普（Donald Trump，1946年6月14日- ），出生于美国纽约，祖籍德国巴伐利亚 ，德裔美国共和党籍政治家、企业家、房地产商人、电视人 ，第45任美国总统（2017年1月20日-2021年1月20日）。\r\n特朗普于1968年获得宾夕法尼亚大学沃顿商学院经济学学士学位，随后任职于父亲弗雷德·特朗普的房地产公司。1971年接管公司，从事房地产开发，投资范围逐步延伸至其他多个行业。特朗普于2015年6月以美国共和党人身份宣布参选美国总统，2016年11月9日当选美国第45任总统，2017年1月20日宣誓就职 [3]  。2020年12月，特朗普败选，连任失败  。2021年1月19日，特朗普发表告别演说   。'),(3,'2021-03-27 00:53:00.000000','奥巴马','美国民主党籍政治家，第44任美国总统','profile_img/teacher/2021/03/u7820533382808322449fm26gp0.jpg','male','32132132121','Obama@gmail.com','1991年奥巴马以优等生身份从哈佛大学法学院毕业，而后在芝加哥大学法学院教授宪法长达12年（1992-2004年）。2007年2月10日宣布参加2008年美国总统选举。2008年11月4日当选为美国总统。2009年10月9日获诺贝尔和平奖。2012年击败美国共和党候选人威拉德·米特·罗姆尼，成功连任美国总统。2017年1月20日正式卸任美国总统');

/*Table structure for table `users_userprofile` */

DROP TABLE IF EXISTS `users_userprofile`;

CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `real_name` varchar(50) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `profile_img` varchar(500) NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  `whitch_teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `whitch_teacher_id` (`whitch_teacher_id`),
  CONSTRAINT `users_userprofile_whitch_teacher_id_d2b54579_fk_teachers_` FOREIGN KEY (`whitch_teacher_id`) REFERENCES `teachers_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile` */

insert  into `users_userprofile`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`real_name`,`mobile_number`,`gender`,`profile_img`,`is_teacher`,`whitch_teacher_id`) values (1,'pbkdf2_sha256$150000$Mr42hhBXnzQA$Irq27WPVGgwhyRQf6BI+zmiQ6Xk6qmNqDRGJ0JFHREc=','2021-04-28 12:27:16.394003',1,'root','','','Administrator1@sohu.com',1,1,'2021-02-03 10:48:00.000000','管理员1','13700000002','female','profile_img/user/2021/04/srchttp___i2.hdslb.com_bfs_archive_ccc8ac7238626e50a38b236d17ceee97f041efe2.pngreferhttp___i2.hdslb.jpg',0,NULL),(7,'pbkdf2_sha256$150000$LsEXIjPQcjfv$eDLF8XlbicZpCGNcz2L9nxX5TdSY+7uO1CynmiNfFRk=','2021-05-06 21:11:54.704006',0,'obama','','','aobama@outlook.com',1,1,'2021-04-15 20:12:00.000000','奥巴马','11111111111','male','profile_img/user/2021/04/u7820533382808322449fm26gp0_FR7cdgv.jpg',1,3),(8,'pbkdf2_sha256$150000$CA8ISBOfubx8$lF/0+EyLg/0+ixkMlOYwTw240/1ok1bHXK5iYOArMHA=','2021-04-28 12:18:01.775091',0,'biden','','','biden@outlook.com',1,1,'2021-04-18 14:19:35.153792','拜登','33333333333','male','profile_img/user/2021/04/u23808315024236986583fm26gp0.jpg',1,1),(9,'pbkdf2_sha256$150000$TtPDaENTflw5$VDUTk9OGy/JgnQ5HzTFZE0hCYdi108esMQKUg71mtFQ=',NULL,0,'trump','','','trump@outlook.com',1,1,'2021-04-18 14:20:31.442931','特朗普','44444444444','male','profile_img/user/2021/04/u1551512298681541fm26gp0.jpg',1,2),(13,'pbkdf2_sha256$150000$ND2LTu8WyyoV$KwmVZwrAjHC7RsduVPFEGsRuGmQjuGMWCsvBAJw0gYA=','2021-04-27 21:59:33.915422',0,'whoami','','','whoami@outlook.com',0,1,'2021-04-27 21:59:14.646116','班纳','13113730089','male','profile_img/teacher/default_profile.png',0,NULL);

/*Table structure for table `users_userprofile_groups` */

DROP TABLE IF EXISTS `users_userprofile_groups`;

CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile_groups` */

insert  into `users_userprofile_groups`(`id`,`userprofile_id`,`group_id`) values (2,7,1),(3,8,1),(4,9,1);

/*Table structure for table `users_userprofile_user_permissions` */

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;

CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_userprofile_user_permissions` */

/*Table structure for table `xadmin_bookmark` */

DROP TABLE IF EXISTS `xadmin_bookmark`;

CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_bookmark` */

/*Table structure for table `xadmin_log` */

DROP TABLE IF EXISTS `xadmin_log`;

CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_log` */

insert  into `xadmin_log`(`id`,`action_time`,`ip_addr`,`object_id`,`object_repr`,`action_flag`,`message`,`content_type_id`,`user_id`) values (1,'2021-02-04 01:07:15.187199','127.0.0.1','1','Teacher object (1)','create','已添加。',13,1),(2,'2021-02-04 01:08:36.300871','127.0.0.1','1','Course object (1)','create','已添加。',7,1),(3,'2021-02-06 02:16:10.414553','127.0.0.1','3','liu','create','已添加。',6,1),(4,'2021-02-09 19:54:44.144013','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(5,'2021-03-15 12:17:22.444845','127.0.0.1','2','teacher2','create','已添加。',13,1),(6,'2021-03-15 12:18:07.642649','127.0.0.1','2','英语','create','已添加。',7,1),(7,'2021-03-15 16:03:14.277578','127.0.0.1','2','teacher2','change','修改 profile',13,1),(8,'2021-03-15 18:35:14.796656','127.0.0.1','2','英语','change','修改 course_img',7,1),(9,'2021-03-15 18:35:25.732806','127.0.0.1','1','格斗','change','修改 course_img',7,1),(10,'2021-03-15 19:01:03.768781','127.0.0.1','2','英语','change','修改 course_img',7,1),(11,'2021-03-15 19:02:16.847990','127.0.0.1','2','英语','change','修改 course_img',7,1),(12,'2021-03-15 21:17:16.769630','127.0.0.1','3','语文','create','已添加。',7,1),(13,'2021-03-15 21:17:35.045485','127.0.0.1','4','数学','create','已添加。',7,1),(14,'2021-03-15 21:17:53.205134','127.0.0.1','5','物理','create','已添加。',7,1),(15,'2021-03-15 21:18:13.760833','127.0.0.1','6','历史','create','已添加。',7,1),(16,'2021-03-22 12:22:25.209216','127.0.0.1','6','历史','change','修改 course_img',7,1),(17,'2021-03-22 12:22:37.381407','127.0.0.1','4','数学','change','修改 course_img',7,1),(18,'2021-03-22 12:23:04.874764','127.0.0.1','5','物理','change','修改 course_img',7,1),(19,'2021-03-22 12:23:33.318239','127.0.0.1','3','语文','change','修改 course_img',7,1),(20,'2021-03-22 12:23:59.236979','127.0.0.1','2','英语','change','修改 course_img',7,1),(21,'2021-03-22 12:24:36.064839','127.0.0.1','1','拳击','change','修改 course_img',7,1),(22,'2021-03-26 18:27:57.476240','127.0.0.1','1','Administrator','change','修改 last_login，real_name，mobile_number 和 profile',6,1),(23,'2021-03-26 18:42:08.962585','127.0.0.1','1','复习全书','create','已添加。',20,1),(24,'2021-03-26 20:00:01.662385','127.0.0.1','1','第一章、函数、连续、极限','create','已添加。',8,1),(25,'2021-03-26 20:00:19.643648','127.0.0.1','2','第二章、一元函数微分','create','已添加。',8,1),(26,'2021-03-26 20:00:39.330754','127.0.0.1','1','函数','create','已添加。',19,1),(27,'2021-03-26 20:00:49.990428','127.0.0.1','2','极限','create','已添加。',19,1),(28,'2021-03-26 20:01:09.679246','127.0.0.1','3','函数的连续与间断','create','已添加。',19,1),(29,'2021-03-26 20:01:22.409853','127.0.0.1','4','导数与微分','create','已添加。',19,1),(30,'2021-03-26 20:01:32.519717','127.0.0.1','5','中值定理','create','已添加。',19,1),(31,'2021-03-26 20:15:47.909432','127.0.0.1','1','函数','change','修改 url',19,1),(32,'2021-03-26 20:16:54.368997','127.0.0.1','1','函数','change','修改 url',19,1),(33,'2021-03-27 00:37:51.023071','127.0.0.1','2','特朗普','change','修改 profile',13,1),(34,'2021-03-27 00:38:00.370179','127.0.0.1','1','拜登','change','修改 profile',13,1),(35,'2021-03-27 00:54:32.274579','127.0.0.1','3','奥巴马','create','已添加。',13,1),(36,'2021-03-27 01:50:34.893940','127.0.0.1','6','历史','change','修改 teacher',7,1),(37,'2021-03-27 01:50:48.393462','127.0.0.1','4','数学','change','修改 teacher',7,1),(38,'2021-03-27 12:31:24.785190','127.0.0.1','1','数学课程','create','已添加。',21,1),(39,'2021-03-27 12:31:53.125844','127.0.0.1','2','英语课程','create','已添加。',21,1),(40,'2021-03-27 12:33:39.839095','127.0.0.1','3','拳击课程','create','已添加。',21,1),(41,'2021-03-28 00:31:35.116078','127.0.0.1','6','化工原理','change','修改 course_img',7,1),(42,'2021-03-28 00:34:17.879666','127.0.0.1','5','高等数学','change','修改 course_img',7,1),(43,'2021-03-28 00:34:27.437288','127.0.0.1','4','大学物理','change','修改 course_img',7,1),(44,'2021-03-28 00:36:12.889085','127.0.0.1','4','环境检测','create','已添加。',21,1),(45,'2021-03-28 00:40:44.240335','127.0.0.1','7','污水处理','create','已添加。',7,1),(46,'2021-03-28 00:41:42.926266','127.0.0.1','4','污水处理','change','修改 image',21,1),(47,'2021-03-28 00:42:21.063493','127.0.0.1','3','环境检测','change','修改 course_img',7,1),(48,'2021-03-28 00:44:23.176969','127.0.0.1','3','化工原理','change','修改 image 和 url',21,1),(49,'2021-03-28 00:51:26.747255','127.0.0.1','2','第二章、一元函数微分','change','修改 course',8,1),(50,'2021-03-28 00:51:30.993039','127.0.0.1','1','第一章、函数、连续、极限','change','修改 course',8,1),(51,'2021-03-28 01:00:35.024489','127.0.0.1','3','城市污水概述','create','已添加。',8,1),(52,'2021-03-28 01:00:50.246398','127.0.0.1','4','污水处理设计步骤','create','已添加。',8,1),(53,'2021-03-28 01:02:25.208282','127.0.0.1','6','污水处理过程示例','create','已添加。',19,1),(54,'2021-03-28 01:02:49.408371','127.0.0.1','7','污水主要污染物','create','已添加。',19,1),(55,'2021-03-28 01:03:16.392688','127.0.0.1','8','设计前期工作','create','已添加。',19,1),(56,'2021-03-28 01:03:27.755845','127.0.0.1','9','初步设计','create','已添加。',19,1),(57,'2021-03-28 01:03:37.106852','127.0.0.1','10','施工图设计','create','已添加。',19,1),(58,'2021-03-28 01:05:14.655022','127.0.0.1','2','污水处理课件','create','已添加。',20,1),(59,'2021-04-06 01:15:44.753639','127.0.0.1','1','欢迎注册','create','已添加。',10,1),(60,'2021-04-06 11:36:16.804816','127.0.0.1','1','教师','change','修改 name 和 permissions',3,1),(61,'2021-04-06 15:32:31.546115','127.0.0.1','10','施工图设计','change','修改 url',19,1),(62,'2021-04-06 15:32:44.825167','127.0.0.1','9','初步设计','change','修改 url',19,1),(63,'2021-04-06 15:32:54.406292','127.0.0.1','8','设计前期工作','change','修改 url',19,1),(64,'2021-04-06 15:33:04.242233','127.0.0.1','7','污水主要污染物','change','修改 url',19,1),(65,'2021-04-06 15:33:14.314925','127.0.0.1','6','污水处理过程示例','change','修改 url',19,1),(66,'2021-04-11 17:54:39.819699','127.0.0.1','10','施工图设计','change','修改 url',19,1),(67,'2021-04-11 17:54:54.883290','127.0.0.1','9','初步设计','change','修改 url',19,1),(68,'2021-04-11 17:54:58.756814','127.0.0.1','8','设计前期工作','change','修改 url',19,1),(69,'2021-04-11 17:55:03.081031','127.0.0.1','7','污水主要污染物','change','修改 url',19,1),(70,'2021-04-11 17:55:07.363169','127.0.0.1','6','污水处理过程示例','change','修改 url',19,1),(71,'2021-04-11 17:56:12.442064','127.0.0.1','10','施工图设计','change','修改 url',19,1),(72,'2021-04-11 17:56:17.835123','127.0.0.1','9','初步设计','change','修改 url',19,1),(73,'2021-04-11 17:56:20.965805','127.0.0.1','8','设计前期工作','change','修改 url',19,1),(74,'2021-04-11 17:56:24.850354','127.0.0.1','7','污水主要污染物','change','修改 url',19,1),(75,'2021-04-11 17:56:29.177476','127.0.0.1','6','污水处理过程示例','change','修改 url',19,1),(76,'2021-04-12 23:31:10.624318','127.0.0.1','1','拳击','delete','',7,1),(77,'2021-04-12 23:32:39.978315','127.0.0.1','4','无机化学','change','修改 detail 和 course_img',7,1),(78,'2021-04-12 23:34:15.992502','127.0.0.1','2','流体力学','change','修改 detail 和 course_img',7,1),(79,'2021-04-14 01:31:03.095736','127.0.0.1','1','作业功能测试','create','已添加。',23,1),(80,'2021-04-14 02:59:49.677548','127.0.0.1','1','Homework object (1)','create','已添加。',22,1),(81,'2021-04-15 02:33:55.081859','127.0.0.1','1','作业功能测试','change','修改 deadline',23,1),(82,'2021-04-15 02:35:38.724264','127.0.0.1','1','污水处理的原理','change','修改 title 和 content',23,1),(83,'2021-04-15 02:36:13.751524','127.0.0.1','1','Homework object (1)','change','修改 content',22,1),(84,'2021-04-15 02:38:05.658317','127.0.0.1','1','污水处理的原理','change','修改 deadline',23,1),(85,'2021-04-15 02:38:29.850599','127.0.0.1','1','污水处理的原理','change','修改 deadline',23,1),(86,'2021-04-15 15:34:03.263235','127.0.0.1','2','污水的种类','create','已添加。',23,1),(87,'2021-04-15 19:19:25.820370','127.0.0.1','5','奥巴马','create','已添加。',6,1),(88,'2021-04-15 19:20:11.275488','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(89,'2021-04-15 19:54:55.938000','127.0.0.1','6','123','create','已添加。',6,1),(90,'2021-04-15 19:55:09.188351','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(91,'2021-04-15 20:12:30.672124','127.0.0.1','7','奥巴马','create','已添加。',6,1),(92,'2021-04-17 17:18:13.118763','127.0.0.1','1','Experiment object (1)','create','已添加。',24,1),(93,'2021-04-17 17:19:09.764596','127.0.0.1','2','Experiment object (2)','create','已添加。',24,1),(94,'2021-04-17 17:50:47.877930','127.0.0.1','2','Experiment object (2)','change','修改 url',24,1),(95,'2021-04-17 17:51:02.010176','127.0.0.1','1','Experiment object (1)','change','没有字段被修改。',24,1),(96,'2021-04-17 17:51:48.639010','127.0.0.1','1','Experiment object (1)','change','修改 url',24,1),(97,'2021-04-17 21:55:30.602429','127.0.0.1','1','Experiment object (1)','change','修改 click_nums 和 detail',24,1),(98,'2021-04-17 22:27:37.760060','127.0.0.1','1','教师','change','修改 permissions',3,1),(99,'2021-04-17 22:28:14.541329','127.0.0.1','7','奥巴马','change','修改 groups，profile_img，is_teacher 和 whitch_teacher',6,1),(100,'2021-04-17 22:31:43.013894','127.0.0.1','7','奥巴马','change','修改 is_staff',6,1),(101,'2021-04-18 00:38:00.592094','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(102,'2021-04-18 12:36:20.086760','127.0.0.1','1','教师','change','修改 permissions',3,1),(103,'2021-04-18 12:39:16.851049','127.0.0.1','1','教师','change','修改 permissions',3,1),(104,'2021-04-18 14:18:39.616419','127.0.0.1','7','奥巴马','change','修改 last_login 和 username',6,1),(105,'2021-04-18 14:19:35.334773','127.0.0.1','8','拜登','create','已添加。',6,1),(106,'2021-04-18 14:20:05.260623','127.0.0.1','8','拜登','change','修改 groups，is_staff，profile_img，is_teacher 和 whitch_teacher',6,1),(107,'2021-04-18 14:20:31.630931','127.0.0.1','9','特朗普','create','已添加。',6,1),(108,'2021-04-18 14:20:53.155165','127.0.0.1','9','特朗普','change','修改 groups，is_staff，profile_img，is_teacher 和 whitch_teacher',6,1),(109,'2021-04-18 14:25:35.790813','127.0.0.1','1','教师','change','修改 permissions',3,1),(110,'2021-04-19 00:37:48.468564','127.0.0.1','2','污水处理及管道模拟','change','修改 notice',24,1),(111,'2021-04-19 16:53:21.964738','127.0.0.1','2','流体力学','change','修改 image',21,1),(112,'2021-04-20 17:38:33.306939','127.0.0.1','1','测试','create','已添加。',31,1),(113,'2021-04-20 18:01:27.310329','127.0.0.1','2','您的提交的一份作业已评阅完毕，请及时查看','delete','',10,1),(114,'2021-04-26 12:19:10.987636','127.0.0.1','3','污水处理流程','create','已添加。',24,1),(115,'2021-04-26 12:20:03.124221','127.0.0.1','4','城市管道模拟','create','已添加。',24,1),(116,'2021-04-26 12:21:10.189358','127.0.0.1','1','管道模拟仿真','change','修改 img',24,1),(117,'2021-04-26 12:28:44.361574','127.0.0.1','2','模块化拼接','change','修改 img',24,1),(118,'2021-04-26 12:30:06.888724','127.0.0.1','3','污水处理流程','change','修改 img',24,1),(119,'2021-04-27 21:58:21.323124','127.0.0.1',NULL,'','delete','批量删除 3 个 用户信息',NULL,1),(120,'2021-04-27 22:41:34.200008','127.0.0.1',NULL,'','delete','批量删除 2 个 作业',NULL,1),(121,'2021-04-27 22:42:54.607411','127.0.0.1',NULL,'','delete','批量删除 1 个 作业',NULL,1),(122,'2021-04-27 22:43:02.665343','127.0.0.1',NULL,'','delete','批量删除 1 个 作业',NULL,1),(123,'2021-04-27 22:58:39.610536','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(124,'2021-04-27 23:02:45.665246','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(125,'2021-04-27 23:08:24.369943','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(126,'2021-04-27 23:10:05.429400','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(127,'2021-04-27 23:12:59.583880','127.0.0.1',NULL,'','delete','批量删除 1 个 实验报告',NULL,1),(128,'2021-04-28 00:42:52.013009','127.0.0.1',NULL,'','delete','批量删除 1 个 通知',NULL,1),(129,'2021-04-28 10:53:11.350284','127.0.0.1','4','污水处理','change','修改 is_course 和 course',21,1),(130,'2021-04-28 10:53:17.543278','127.0.0.1','3','化工原理','change','修改 course',21,1),(131,'2021-04-28 10:53:21.505694','127.0.0.1','2','流体力学','change','修改 course',21,1),(132,'2021-04-28 10:53:24.735348','127.0.0.1','2','流体力学','change','修改 is_course',21,1),(133,'2021-04-28 10:53:28.286121','127.0.0.1','3','化工原理','change','修改 is_course',21,1),(134,'2021-04-28 10:53:33.562098','127.0.0.1','1','高等数学','change','修改 is_course 和 course',21,1),(135,'2021-04-28 11:33:51.861949','127.0.0.1','1','教师','change','修改 permissions',3,1),(136,'2021-04-28 12:16:54.884668','127.0.0.1','1','教师','change','修改 permissions',3,1),(137,'2021-04-28 12:17:48.480820','127.0.0.1','1','教师','change','修改 permissions',3,1);

/*Table structure for table `xadmin_usersettings` */

DROP TABLE IF EXISTS `xadmin_usersettings`;

CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_usersettings` */

insert  into `xadmin_usersettings`(`id`,`key`,`value`,`user_id`) values (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-theme.css',1),(3,'dashboard:home:pos','',7),(4,'site-theme','https://bootswatch.com/3/cerulean/bootstrap.min.css',7),(5,'dashboard:home:pos','',8),(6,'site-theme','/static/xadmin/css/themes/bootstrap-theme.css',8),(7,'courses_course_editform_portal',',,lesson_set-group,,,,homeworktask_set-group,,',8);

/*Table structure for table `xadmin_userwidget` */

DROP TABLE IF EXISTS `xadmin_userwidget`;

CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xadmin_userwidget` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
