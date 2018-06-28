-- Started: 2018-06-27 19:37:23
SET NAMES 'utf8';
-- -----------------------------------
-- Dumping table b_admin_notify
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_admin_notify_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_agent
-- -----------------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_agent` VALUES
(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2018-06-27 10:18:47', '2018-06-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2018-06-27 10:18:47', '2018-06-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2018-06-27 19:02:31', '2018-06-27 20:02:31', NULL, 3600, 'N', NULL, 'N'),
(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2018-06-27 10:18:47', '2018-06-28 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
(5, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', NULL, '2018-06-28 03:00:00', NULL, 86400, 'N', NULL, 'N'),
(6, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2018-06-27 19:32:28', '2018-06-27 19:33:28', NULL, 60, 'N', NULL, 'N'),
(7, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2018-06-27 10:18:47', '2018-06-28 10:18:47', NULL, 86400, 'N', NULL, 'N'),
(8, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2018-06-27 10:18:47', '2018-06-28 10:18:47', NULL, 86400, 'N', NULL, 'N'),
(9, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2018-06-27 10:18:47', '2018-06-28 10:18:47', NULL, 86400, 'N', NULL, 'N'),
(10, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2018-06-27 10:18:47', '2018-06-28 10:18:47', NULL, 86400, 'N', NULL, 'N'),
(11, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2018-06-27 19:10:35', '2018-06-27 19:40:35', NULL, 1800, 'N', NULL, 'N'),
(12, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2018-06-27 19:02:31', '2018-06-27 20:02:31', NULL, 3600, 'N', NULL, 'N'),
(13, 'sender', 100, '\\Bitrix\\Sender\\MailingManager::checkPeriod();', 'Y', '2018-06-27 19:32:28', '2018-06-27 19:33:28', NULL, 60, 'N', NULL, 'N'),
(14, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2018-06-27 19:02:31', '2018-06-27 20:02:31', NULL, 3600, 'N', NULL, 'N'),
(15, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2018-06-27 10:18:47', '2018-06-28 10:18:47', NULL, 86400, 'N', NULL, 'N'),
(16, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', NULL, '2018-06-28 03:00:00', NULL, 86400, 'Y', NULL, 'N');
-- -----------------------------------
-- Dumping table b_app_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_bitrixcloud_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_bitrixcloud_option` VALUES
(1, 'backup_quota', 0, '0', '0'),
(2, 'backup_total_size', 0, '0', '0'),
(3, 'backup_last_backup_time', 0, '0', '1530083948'),
(4, 'monitoring_expire_time', 0, '0', '1530099320');
-- -----------------------------------
-- Dumping table b_blog
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_category
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_comment`;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_group`;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_image
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_image`;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post`;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_post_category
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post_category`;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_post_param
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_post_param`;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_site_path
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_site_path`;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_smile`;
CREATE TABLE `b_blog_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `SMILE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_blog_smile` VALUES
(1, 'S', ':D :-D', 'icon_biggrin.png', NULL, 'Y', 120, 16, 16),
(2, 'S', ':) :-)', 'icon_smile.png', NULL, 'Y', 100, 16, 16),
(3, 'S', ':( :-(', 'icon_sad.png', NULL, 'Y', 140, 16, 16),
(4, 'S', ':o :-o :shock:', 'icon_eek.png', NULL, 'Y', 180, 16, 16),
(5, 'S', '8) 8-)', 'icon_cool.png', NULL, 'Y', 130, 16, 16),
(6, 'S', ':{} :-{}', 'icon_kiss.png', NULL, 'Y', 200, 16, 16),
(7, 'S', ':oops:', 'icon_redface.png', NULL, 'Y', 190, 16, 16),
(8, 'S', ':cry: :~(', 'icon_cry.png', NULL, 'Y', 160, 16, 16),
(9, 'S', ':evil: >:-<', 'icon_evil.png', NULL, 'Y', 170, 16, 16),
(10, 'S', ';) ;-)', 'icon_wink.png', NULL, 'Y', 110, 16, 16),
(11, 'S', ':!:', 'icon_exclaim.png', NULL, 'Y', 220, 16, 16),
(12, 'S', ':?:', 'icon_question.png', NULL, 'Y', 210, 16, 16),
(13, 'S', ':idea:', 'icon_idea.png', NULL, 'Y', 230, 16, 16),
(14, 'S', ':| :-|', 'icon_neutral.png', NULL, 'Y', 150, 16, 16);
-- -----------------------------------
-- Dumping table b_blog_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_smile_lang`;
CREATE TABLE `b_blog_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_blog_smile_lang` VALUES
(1, 1, 'ru', 'Широкая улыбка'),
(2, 1, 'en', 'Big grin'),
(3, 2, 'ru', 'С улыбкой'),
(4, 2, 'en', 'Smile'),
(5, 3, 'ru', 'Печально'),
(6, 3, 'en', 'Sad'),
(7, 4, 'ru', 'Удивленно'),
(8, 4, 'en', 'Surprised'),
(9, 5, 'ru', 'Здорово'),
(10, 5, 'en', 'Cool'),
(11, 6, 'ru', 'Поцелуй'),
(12, 6, 'en', 'Kiss'),
(13, 7, 'ru', 'Смущенный'),
(14, 7, 'en', 'Embarrassed'),
(15, 8, 'ru', 'Очень грустно'),
(16, 8, 'en', 'Crying'),
(17, 9, 'ru', 'Со злостью'),
(18, 9, 'en', 'Angry'),
(19, 10, 'ru', 'Шутливо'),
(20, 10, 'en', 'Wink'),
(21, 11, 'ru', 'Восклицание'),
(22, 11, 'en', 'Exclamation'),
(23, 12, 'ru', 'Вопрос'),
(24, 12, 'en', 'Question'),
(25, 13, 'ru', 'Идея'),
(26, 13, 'en', 'Idea'),
(27, 14, 'ru', 'Скептически'),
(28, 14, 'en', 'Skeptic');
-- -----------------------------------
-- Dumping table b_blog_socnet
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_socnet`;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_socnet_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_socnet_rights`;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_trackback
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_trackback`;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user`;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_user2blog
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user2blog`;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_user2user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user2user_group`;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_blog_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user_group`;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_blog_user_group` VALUES
(1, NULL, 'all'),
(2, NULL, 'registered');
-- -----------------------------------
-- Dumping table b_blog_user_group_perms
-- -----------------------------------
DROP TABLE IF EXISTS `b_blog_user_group_perms`;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_cache_tag
-- -----------------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_cache_tag` VALUES
(NULL, NULL, '0:1530115390', '**'),
('s1', '/dcf', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/dcf', '/s1/bitrix/menu.sections/06f', 'iblock_id_2'),
('s1', '/dcf', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/dcf', '/s1/my/simplecomp.exam/dcf', 'iblock_id_2'),
('s1', '/dcf', '/s1/my/simplecomp.exam/dcf', 'iblock_id_1'),
('s1', '/f6e', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/d1d', '/s1/bitrix/menu.sections/06f', 'iblock_id_2'),
('s1', '/d1d', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/d1d', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/d1d', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/23c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/23c', '/s1/bitrix/menu.sections/06f', 'iblock_id_2'),
('s1', '/23c', '/s1/bitrix/news.list/06f', 'iblock_id_1'),
('s1', '/23c', '/s1/bitrix/furniture.catalog.random/06f', 'iblock_id_2'),
('s1', '/23c', '/s1/bitrix/menu.sections/23c', 'iblock_id_2');
-- -----------------------------------
-- Dumping table b_captcha
-- -----------------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_checklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_bucket
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_resize
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_clouds_file_upload
-- -----------------------------------
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_component_params
-- -----------------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_component_params` VALUES
(3, 's1', 'bitrix:news', '.default', '/news/index.php', 'Y', '/news/', 99, 2450, 'a:69:{s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:10:\"NEWS_COUNT\";s:1:\"5\";s:10:\"USE_SEARCH\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"Y\";s:8:\"NUM_NEWS\";s:2:\"20\";s:8:\"NUM_DAYS\";s:2:\"30\";s:6:\"YANDEX\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:8:\"SEF_MODE\";s:1:\"Y\";s:10:\"SEF_FOLDER\";s:6:\"/news/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"Y\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"Y\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:6:\"arrows\";s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:8:\"36000000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:10:\"USE_REVIEW\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:15:\"USE_SPECIALDATE\";s:1:\"Y\";s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:17:\"SEF_URL_TEMPLATES\";a:5:{s:4:\"news\";s:0:\"\";s:7:\"section\";s:0:\"\";s:6:\"detail\";s:13:\"#ELEMENT_ID#/\";s:3:\"rss\";s:4:\"rss/\";s:11:\"rss_section\";s:17:\"#SECTION_ID#/rss/\";}}'),
(4, 's1', 'bitrix:main.feedback', '', '/ex2/feedback/index.php', 'N', NULL, 112, 401, 'a:6:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:11:\"USE_CAPTCHA\";s:1:\"Y\";s:7:\"OK_TEXT\";s:59:\"Спасибо, ваше сообщение принято.\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:15:\"REQUIRED_FIELDS\";N;s:16:\"EVENT_MESSAGE_ID\";a:1:{i:0;s:1:\"7\";}}'),
(9, 's1', 'my:simplecomp.exam', '.default', '/ex2/simplecomp/index.php', 'N', NULL, 109, 351, 'a:6:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:10:\"CATALOG_ID\";s:1:\"2\";s:7:\"NEWS_ID\";s:1:\"1\";s:4:\"CODE\";s:12:\"UF_NEWS_LINK\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";}'),
(15, 's1', 'my:complexcomp.exam', '.default', '/ex2/complexcomponent/index.php', 'N', NULL, 113, 2133, 'a:54:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:9:\"IBLOCK_ID\";s:0:\"\";s:8:\"SEF_MODE\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"Y\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:10:\"USE_REVIEW\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:13:\"SECTION_COUNT\";s:2:\"20\";s:17:\"TOP_ELEMENT_COUNT\";s:1:\"9\";s:22:\"TOP_LINE_ELEMENT_COUNT\";s:1:\"3\";s:18:\"SECTION_SORT_FIELD\";s:4:\"sort\";s:18:\"SECTION_SORT_ORDER\";s:3:\"asc\";s:22:\"TOP_ELEMENT_SORT_FIELD\";s:4:\"sort\";s:22:\"TOP_ELEMENT_SORT_ORDER\";s:3:\"asc\";s:14:\"TOP_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"TOP_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:26:\"SECTION_PAGE_ELEMENT_COUNT\";s:2:\"20\";s:26:\"SECTION_LINE_ELEMENT_COUNT\";s:1:\"3\";s:18:\"ELEMENT_SORT_FIELD\";s:4:\"sort\";s:18:\"ELEMENT_SORT_ORDER\";s:3:\"asc\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_BROWSER_TITLE\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:11:\"PAGER_TITLE\";s:20:\"Фотографии\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:10:\"SEF_FOLDER\";s:22:\"/ex2/complexcomponent/\";s:16:\"VARIABLE_ALIASES\";a:4:{s:10:\"SECTION_ID\";s:10:\"SECTION_ID\";s:10:\"ELEMENT_ID\";s:10:\"ELEMENT_ID\";s:6:\"PARAM1\";s:4:\"PAR1\";s:6:\"PARAM2\";s:4:\"PAR2\";}}');
-- -----------------------------------
-- Dumping table b_counter_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_culture
-- -----------------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_culture` VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y'),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y');
-- -----------------------------------
-- Dumping table b_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event` VALUES
(1, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:5:\"arwra\";}', '2018-06-27 13:33:30', '2018-06-27 13:33:31', 'F', 'N'),
(2, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:10:\"MESSAGE!!!\";}', '2018-06-27 13:45:02', '2018-06-27 13:45:02', 'F', 'N'),
(3, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:10:\"MESSAGE!!!\";}', '2018-06-27 13:47:05', '2018-06-27 13:47:05', 'F', 'N'),
(4, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:8:\"MESSAGE!\";}', '2018-06-27 14:05:15', '2018-06-27 14:31:58', 'F', 'N'),
(5, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:9:\"Message!!\";}', '2018-06-27 14:10:36', '2018-06-27 14:31:58', 'F', 'N'),
(6, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:11:\"MESSAGE!!!!\";}', '2018-06-27 14:13:58', '2018-06-27 14:31:58', 'F', 'N'),
(7, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:12:\"MESSAGE!!!\r\n\";}', '2018-06-27 14:17:28', '2018-06-27 14:31:58', 'F', 'N'),
(8, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:10:\"MESSAGE!!!\";}', '2018-06-27 14:18:21', '2018-06-27 14:31:58', 'F', 'N'),
(9, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:8:\"Message!\";}', '2018-06-27 14:23:05', '2018-06-27 14:32:40', 'F', 'N'),
(10, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:8:\"asfaafaa\";}', '2018-06-27 14:24:27', '2018-06-27 14:32:40', 'F', 'N'),
(11, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:11:\"12344556677\";}', '2018-06-27 14:25:21', '2018-06-27 14:32:40', 'F', 'N'),
(12, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:5:\"12345\";}', '2018-06-27 14:26:51', '2018-06-27 14:32:40', 'F', 'N'),
(13, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:10:\"1234567890\";}', '2018-06-27 14:27:35', '2018-06-27 14:32:40', 'F', 'N'),
(14, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:10:\"1234567890\";}', '2018-06-27 14:28:13', '2018-06-27 14:35:35', 'F', 'N'),
(15, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:7:\"1234567\";}', '2018-06-27 14:31:09', '2018-06-27 14:35:35', 'F', 'N'),
(16, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:6:\"123456\";}', '2018-06-27 14:31:58', '2018-06-27 14:35:35', 'F', 'N'),
(17, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:6:\"123456\";}', '2018-06-27 14:32:39', '2018-06-27 14:35:35', 'F', 'N'),
(18, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:6:\"123456\";}', '2018-06-27 14:35:47', '2018-06-27 14:35:48', 'F', 'N'),
(19, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:8:\"MESSAGE!\";}', '2018-06-27 14:38:01', '2018-06-27 14:38:01', 'F', 'N'),
(20, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:25:\"Сергей Есенин\";s:12:\"AUTHOR_EMAIL\";s:14:\"esenin@mail.ru\";s:8:\"EMAIL_TO\";s:14:\"Esenin@mail.ru\";s:4:\"TEXT\";s:27:\"Сообщение!!!331242\";}', '2018-06-27 14:38:56', '2018-06-27 14:38:56', 'F', 'N');
-- -----------------------------------
-- Dumping table b_event_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_log` VALUES
(1, '2018-06-27 10:23:55', 'UNKNOWN', 'SECTION_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_folder_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&path=%2F&back_url=%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";b:0;}'),
(2, '2018-06-27 13:19:07', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:13:\"ex2/index.php\";}'),
(3, '2018-06-27 13:19:07', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:3:\"ex2\";}'),
(4, '2018-06-27 13:19:07', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:2:{s:4:\"path\";b:0;s:9:\"menu_name\";s:23:\"Верхнее меню\";}'),
(5, '2018-06-27 13:19:14', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:13:\"ex2/index.php\";}'),
(6, '2018-06-27 13:19:51', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2Fex2%2F%3Fclear_cache%3DY&path=%2Fex2&name=left&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:19:\"Левое меню\";s:4:\"path\";s:3:\"ex2\";}'),
(7, '2018-06-27 13:20:28', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F%3Fclear_cache%3DY&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"ex2feedback/index.php\";}'),
(8, '2018-06-27 13:20:28', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F%3Fclear_cache%3DY&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:12:\"ex2/feedback\";}'),
(9, '2018-06-27 13:20:30', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:22:\"ex2/feedback/index.php\";}'),
(10, '2018-06-27 13:32:07', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:22:\"ex2/feedback/index.php\";}'),
(11, '2018-06-27 14:31:58', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(12, '2018-06-27 14:31:58', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(13, '2018-06-27 14:31:58', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(14, '2018-06-27 14:31:58', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(15, '2018-06-27 14:31:58', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(16, '2018-06-27 14:32:40', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(17, '2018-06-27 14:32:40', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(18, '2018-06-27 14:32:40', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(19, '2018-06-27 14:32:40', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(20, '2018-06-27 14:32:40', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin)  данные из формы: Сергей Есенин'),
(21, '2018-06-27 14:35:35', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(22, '2018-06-27 14:35:35', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(23, '2018-06-27 14:35:35', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(24, '2018-06-27 14:35:35', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&clear_cache=Y&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(25, '2018-06-27 14:35:47', 'SECURITY', 'MY_OWN_TYPE', 'main', '123', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(26, '2018-06-27 14:38:01', 'SECURITY', 'MY_OWN_TYPE', 'main', '999', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8&back_url_admin=%2Fbitrix%2Fadmin%2Fevent_log.php%3Flang%3Dru', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(27, '2018-06-27 14:38:56', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/ex2/feedback/?success=95674aef56bfdfa318b55701418de4e8', 's1', 1, NULL, 'Замена данных в отсылаемом письме – Пользователь авторизован: 1 (admin) Сергей Есенин данные из формы: Сергей Есенин'),
(28, '2018-06-27 14:50:47', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:23:\"ex2simplecomp/index.php\";}'),
(29, '2018-06-27 14:50:47', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"ex2/simplecomp\";}'),
(30, '2018-06-27 14:50:47', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:2:{s:4:\"path\";s:3:\"ex2\";s:9:\"menu_name\";s:19:\"Левое меню\";}'),
(31, '2018-06-27 14:50:55', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(32, '2018-06-27 15:22:49', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(33, '2018-06-27 15:24:07', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(34, '2018-06-27 15:24:22', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(35, '2018-06-27 15:51:07', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(36, '2018-06-27 16:23:28', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:24:\"ex2/simplecomp/index.php\";}'),
(37, '2018-06-27 18:37:45', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:29:\"ex2complexcomponent/index.php\";}'),
(38, '2018-06-27 18:37:45', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:20:\"ex2/complexcomponent\";}'),
(39, '2018-06-27 18:37:46', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=furniture_red&newFolder=Y&path=%2Fex2%2F&back_url=%2Fex2%2F&siteTemplateId=furniture_red', NULL, 1, NULL, 'a:2:{s:4:\"path\";s:3:\"ex2\";s:9:\"menu_name\";s:19:\"Левое меню\";}'),
(40, '2018-06-27 18:37:49', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:30:\"ex2/complexcomponent/index.php\";}'),
(41, '2018-06-27 18:39:49', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/44.0.2403.89 Chrome/44.0.2403.89 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:30:\"ex2/complexcomponent/index.php\";}');
-- -----------------------------------
-- Dumping table b_event_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message` VALUES
(1, '2018-06-27 10:18:00', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2018-06-27 10:18:00', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2018-06-27 10:18:00', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2018-06-27 10:18:00', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2018-06-27 10:18:00', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2018-06-27 10:18:00', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2018-06-27 10:18:00', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2018-06-27 10:18:07', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2018-06-27 10:18:07', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2018-06-27 10:18:07', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2018-06-27 10:18:07', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2018-06-27 10:18:07', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2018-06-27 10:18:07', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2018-06-27 10:18:07', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2018-06-27 10:18:07', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2018-06-27 10:18:07', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2018-06-27 10:18:13', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2018-06-27 10:18:13', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2018-06-27 10:18:13', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2018-06-27 10:18:13', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2018-06-27 10:18:13', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2018-06-27 10:18:22', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2018-06-27 10:18:24', 'SENDER_SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE#\nСписок рассылок:\n#MAILING_LIST#\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##CONFIRM_URL#\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\nЕсли вы не подписывались на рассылку и получили это письмо по ошибке,\nпроигнорируйте его.\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE\"];?>\n\nСписок рассылок:\n<?=$arParams[\"MAILING_LIST\"];?>\n\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"CONFIRM_URL\"];?>\n\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\nЕсли вы не подписывались на рассылку и получили это письмо по ошибке,\nпроигнорируйте его.\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2018-06-27 10:18:29', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2018-06-27 10:18:31', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_event_message_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_message_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1'),
(12, 's1'),
(13, 's1'),
(14, 's1'),
(15, 's1'),
(16, 's1'),
(17, 's1'),
(18, 's1'),
(19, 's1'),
(20, 's1'),
(21, 's1'),
(22, 's1'),
(23, 's1'),
(24, 's1'),
(25, 's1');
-- -----------------------------------
-- Dumping table b_event_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_type` VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
(8, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
(9, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
(10, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
(11, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
(12, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
(13, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
(14, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7),
(15, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
(16, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
(17, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
(18, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
(19, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
(20, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
(21, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
(22, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
(23, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '\n#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
(24, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
(25, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
(26, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
(27, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
(28, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
(29, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 100),
(30, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 100),
(31, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 100),
(32, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\\r\\n#BLOG_NAME# - Blog name\\r\\n#BLOG_URL# - Blog name, Latin letters only\\r\\n#BLOG_ADR# - Blog address\\r\\n#USER_ID# - User ID\\r\\n#USER# - User\\r\\n#USER_URL# - User URL\\r\\n#EMAIL_FROM# - Sender E-mail\\r\\n#EMAIL_TO# - Recipient E-mail', 100),
(33, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100),
(34, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100),
(35, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100),
(36, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100),
(37, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100),
(38, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100),
(39, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100),
(40, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100),
(41, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100),
(42, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100),
(43, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100),
(44, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100),
(45, 'ru', 'SENDER_SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#EMAIL# - адрес подписки\n#DATE# - дата добавления/изменения адреса\n#CONFIRM_URL# - адрес подтверждения\n#MAILING_LIST# - список подписок\n', 100),
(46, 'en', 'SENDER_SUBSCRIBE_CONFIRM', 'Confirm subscription', '#EMAIL# - subscription URL\n#DATE# - the date the address was added or updated\n#CONFIRM_URL# - confirmation URL\n#MAILING_LIST# - subscriptions\n', 100),
(47, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100),
(48, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100),
(49, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100),
(50, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100);
-- -----------------------------------
-- Dumping table b_favorite
-- -----------------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file` VALUES
(1, '2018-06-27 10:19:01', 'iblock', 97, 117, 7208, 'image/gif', 'iblock/92b', '92bdf8a93d4711d77e5f0f48144a8dca.gif', '9f643eecc497982747178145cc4736a4.gif', '', NULL, '7d53fd6e5f9bdc2254bfd1b1fceb5cc4'),
(2, '2018-06-27 10:19:01', 'iblock', 97, 118, 6154, 'image/gif', 'iblock/fee', 'fee40f85e637c687f5e5f2fbf5cdc9d4.gif', '9baa9f7a5c946e28647383d6d4a7fed2.gif', '', NULL, 'b6bc62034164da446f42407ddaf4b5fd'),
(3, '2018-06-27 10:19:01', 'iblock', 97, 115, 7024, 'image/gif', 'iblock/6e3', '6e3ecbec20cc8137108de5887be92d31.gif', '3583b1ad0ff085c4fc5cc3ef35c117f5.gif', '', NULL, '5e4d3c6be2f76c8e57707cc3b98287bd'),
(4, '2018-06-27 10:19:01', 'iblock', 97, 117, 8177, 'image/gif', 'iblock/006', '0062c77ac1fbdea3b12197b8ba7db1ed.gif', 'e41c3f9d5834738bb4b1a8bda651989d.gif', '', NULL, 'd2052402cea29429468c1da2434056a8'),
(5, '2018-06-27 10:19:01', 'iblock', 75, 82, 6081, 'image/jpeg', 'iblock/6cf', '6cfb347ad17bac5cc1b703f54094a4fb.jpg', '2e602c1c22ccb832df21ad28ad5edaad.jpg', '', NULL, '3d6953d644741f5422d2587a593c2263'),
(6, '2018-06-27 10:19:01', 'iblock', 365, 400, 93204, 'image/jpeg', 'iblock/671', '6717d486ef2af51d350e9745b7ff190d.jpg', '09812c445d3ee5f5311bbe7e44ee7d6f.jpg', '', NULL, '5283ee24cd05daf110e03ab43f4bac3f'),
(7, '2018-06-27 10:19:01', 'iblock', 62, 75, 4431, 'image/jpeg', 'iblock/ee2', 'ee2ec63ff2f09048205fe6410f18c0f8.jpg', 'bb30381459dbbbe12e882e632f6b1c53.jpg', '', NULL, '18bda3d93fb4e324c88431f8fe55d0d1'),
(8, '2018-06-27 10:19:01', 'iblock', 331, 400, 82283, 'image/jpeg', 'iblock/efa', 'efaa8dcd171a6db9708f3b900174c492.jpg', '626ca8c573225d46d0b4d809cebb3dae.jpg', '', NULL, 'af7e00e83208f0d27fcfd0a586889b56'),
(9, '2018-06-27 10:19:02', 'iblock', 75, 47, 3075, 'image/jpeg', 'iblock/629', '62945f417108ceb6a36a8ea479115b32.jpg', '1f5d4439c837ba415e78b9645ae0d73b.jpg', '', NULL, '0c1b03f1f8124195da9ef3ac403ece35'),
(10, '2018-06-27 10:19:02', 'iblock', 400, 250, 29739, 'image/jpeg', 'iblock/4e9', '4e939c38b8431b57af9fcd9b8dd2bfa2.jpg', '885f25305f6c920393bf447112730a32.jpg', '', NULL, 'e79d2e9452ccbd82571df4bf01852040'),
(11, '2018-06-27 10:19:02', 'iblock', 75, 49, 3038, 'image/jpeg', 'iblock/9b7', '9b720388247108e0ac90d3dbd230f841.jpg', 'ab929afb73ab299a22e03cc039569505.jpg', '', NULL, '96374bba59bf9d261b8a02f6b2d6e71d'),
(12, '2018-06-27 10:19:02', 'iblock', 400, 260, 36309, 'image/jpeg', 'iblock/b8c', 'b8c3a154d4ed563e20217099a51945b3.jpg', 'f2bca316eede55098cab3bfda5b46697.jpg', '', NULL, '0e1348b0e7b7e09d7f895c00090eeb96'),
(13, '2018-06-27 10:19:02', 'iblock', 75, 46, 2766, 'image/jpeg', 'iblock/788', '788c7cdf01b739252f175549d5f97ef0.jpg', '74a072234e4b35fc24ee618bfc7dc98b.jpg', '', NULL, '7c2658a279bd637b08512f9defd16f98'),
(14, '2018-06-27 10:19:02', 'iblock', 400, 247, 26265, 'image/jpeg', 'iblock/d0d', 'd0d2a56d14a5d0d671213ba0ea7ab4ba.jpg', '6237fa3331d46f6efe0409d7d24cdb25.jpg', '', NULL, '273a4a3252059c2b9c58950688feb714'),
(15, '2018-06-27 10:19:02', 'iblock', 59, 75, 4604, 'image/jpeg', 'iblock/f1e', 'f1eecc7bacd4aff19d0e7a33ab2d3628.jpg', '3392f27c38911965c60026ff9c0d3ef6.jpg', '', NULL, '759ddcb28cfa28f4f738a771c5dea860'),
(16, '2018-06-27 10:19:02', 'iblock', 313, 400, 57378, 'image/jpeg', 'iblock/332', '332e226aa6f963c16044b93c69426b01.jpg', 'baee3922cc3b782c479845cd9a51aa2b.jpg', '', NULL, '69062352802a2fb70aaf922a1d0bb827'),
(17, '2018-06-27 10:19:02', 'iblock', 49, 75, 3877, 'image/jpeg', 'iblock/ca4', 'ca425a171be78da7a47247abb85210e5.jpg', '2bdc35b67545840a286ee2ade1e53cf1.jpg', '', NULL, '83e82da486d3aee8154ebe32013ee596'),
(18, '2018-06-27 10:19:02', 'iblock', 264, 400, 96792, 'image/jpeg', 'iblock/675', '675fc0051daffbc5a4068c3ba37a593f.jpg', '9444ca19815887874cfa5ccd2cf9b08e.jpg', '', NULL, '7171e0094700d62bc27291c7b410b0d8'),
(19, '2018-06-27 10:19:02', 'iblock', 41, 75, 4223, 'image/jpeg', 'iblock/c40', 'c409cbbab45160aca22487e4027c6c54.jpg', '9b1cf849b8732e25002db920755486e9.jpg', '', NULL, '776636a0fe1dbc845ea9e0d40603e045'),
(20, '2018-06-27 10:19:02', 'iblock', 220, 400, 65934, 'image/jpeg', 'iblock/708', '708e6494d8932795b09f19b2dace919e.jpg', '38f3bb38d0be153aa8233f8959141b8d.jpg', '', NULL, 'd5df0dc45acdde4cf226a92fac94045b'),
(21, '2018-06-27 10:19:02', 'iblock', 62, 75, 4454, 'image/jpeg', 'iblock/bd5', 'bd55a049b51fa078beb3743a8a4691cf.jpg', 'd64f02c32d7aec7d187dfb4d6e89c56b.jpg', '', NULL, '64d814c44c6d9745a83bfe53ca06bc87'),
(22, '2018-06-27 10:19:02', 'iblock', 329, 400, 78028, 'image/jpeg', 'iblock/b63', 'b6324d7294fb67cdc78e15620a212e40.jpg', '445fcbf65c020dbaebf811a58b7ef941.jpg', '', NULL, '8fd2f4574d12f852da313d5c3a909546'),
(23, '2018-06-27 10:19:02', 'iblock', 50, 75, 4281, 'image/jpeg', 'iblock/127', '127598d019d83c7e1265c3582a046d81.jpg', '4d4fcbcf706e07d5920751b96b2390a2.jpg', '', NULL, 'ca9a25c506a5bb072bfa2fb8f8f4f7b8'),
(24, '2018-06-27 10:19:02', 'iblock', 269, 400, 62994, 'image/jpeg', 'iblock/945', '9455bba91b685e7154cbef9a80c58ab0.jpg', '7412d2f4d2b8e91187d39405c1c331c0.jpg', '', NULL, '1c2f06b8a9d08dc2e2bb913296db7781'),
(25, '2018-06-27 10:19:02', 'iblock', 32, 75, 2529, 'image/jpeg', 'iblock/007', '007e2059464f3ee2cde331e73a7bcfce.jpg', 'a20a430640daab0d2e80587a991043dc.jpg', '', NULL, '2827ed6555e2ad7d1ab9fa05178fd86a'),
(26, '2018-06-27 10:19:02', 'iblock', 171, 400, 43694, 'image/jpeg', 'iblock/bc1', 'bc1f3b6269e289667643fdb6d0e499ab.jpg', '2b671b45113c251546674131e9681c89.jpg', '', NULL, '297208428a1f9ac7e704dc2d038fffc5'),
(27, '2018-06-27 10:19:02', 'iblock', 52, 75, 3543, 'image/jpeg', 'iblock/508', '50852d97fe05ad290000ea885049dde2.jpg', '35962bde726c3ffaf7ccdfd9bb607379.jpg', '', NULL, 'd26bf387d81e2aee9bd568a2fbf9e9cf'),
(28, '2018-06-27 10:19:02', 'iblock', 276, 400, 45830, 'image/jpeg', 'iblock/e97', 'e97429a2c1ac32aced5d8e7ebb5f37bf.jpg', '1421f08c8613b257c93f95ca3fd2826d.jpg', '', NULL, 'da0fbd7b44de760571741022ef770e56'),
(29, '2018-06-27 10:19:02', 'iblock', 69, 75, 4545, 'image/jpeg', 'iblock/993', '9939c6374e0740ea3d959da18b8d1611.jpg', '331184f76e4aafea8728856ad06f4487.jpg', '', NULL, '7b930d7182ff8df315ab518e35639b70'),
(30, '2018-06-27 10:19:02', 'iblock', 366, 400, 50389, 'image/jpeg', 'iblock/202', '202fd54ce1c36ce3a049d62594a9e292.jpg', 'e26a955a944250ca5980f143faaadfbb.jpg', '', NULL, 'eeb73a53c1dcf5b3e792efa2d615301b'),
(31, '2018-06-27 10:19:02', 'iblock', 52, 75, 4430, 'image/jpeg', 'iblock/28c', '28c05b9baae5d7cd3ef3821340af15d1.jpg', '3e84c9ae297f66002462ef2782524e1c.jpg', '', NULL, '501bbf46014cb1d281b53ea7b83cd0c5'),
(32, '2018-06-27 10:19:02', 'iblock', 279, 400, 60160, 'image/jpeg', 'iblock/036', '03678d6d84f38dffb1cf3338f5dde89d.jpg', '16798358158a0c4e8e280370dad92e34.jpg', '', NULL, '95830a915d346e71c4c149849c10afe1'),
(33, '2018-06-27 10:19:02', 'iblock', 75, 74, 5105, 'image/jpeg', 'iblock/f87', 'f87e645f7c23fe14e45671007b84bd49.jpg', '809194f5dcf2a15a37cdcaa8e3abbe3d.jpg', '', NULL, 'c650d99532bef755d0ffa9335f470802'),
(34, '2018-06-27 10:19:02', 'iblock', 400, 394, 67705, 'image/jpeg', 'iblock/167', '1673e5ad2f669a3f4f80ca5f12493bcc.jpg', '2883876e37fde7403e471cc9a24ea3e7.jpg', '', NULL, 'a98e999a2533a72f0e0cb3849a67138e'),
(35, '2018-06-27 10:19:02', 'iblock', 75, 54, 3651, 'image/jpeg', 'iblock/fd1', 'fd1a8919b788057390bacff530d5da2c.jpg', '434f471a7920ed00e08fb3916569e1f7.jpg', '', NULL, '35315885e9c2132a90402689d9d98228'),
(36, '2018-06-27 10:19:02', 'iblock', 400, 286, 40331, 'image/jpeg', 'iblock/e55', 'e5574b8819b9e70808c5a081bd82164d.jpg', '7fe0d47b409d9aa6097128b113e753b9.jpg', '', NULL, 'db91cd9c30e5b3cc674f7eddee9c5a1b'),
(37, '2018-06-27 10:19:03', 'iblock', 75, 45, 3564, 'image/jpeg', 'iblock/529', '529e649b903ead5861121ea51b0db46d.jpg', 'a7b9328dab5d8599953605e2d14da0b3.jpg', '', NULL, '1f5ad9c2de69e183b83bad77cc962acf'),
(38, '2018-06-27 10:19:03', 'iblock', 400, 238, 42306, 'image/jpeg', 'iblock/93b', '93b79911edb70eaaadbe9adc3e7043e8.jpg', 'e4427787c59b56b70a9c0381453f88dc.jpg', '', NULL, '6066afff6bef5b67dc850b1e250443c5'),
(39, '2018-06-27 10:19:03', 'iblock', 75, 47, 2666, 'image/jpeg', 'iblock/ca0', 'ca0702a3dae64b764bfade0a8f46322c.jpg', '3413e989dd3239527ed2144bdb285a2b.jpg', '', NULL, '4b03f33675077b161fcd9838a1e46871'),
(40, '2018-06-27 10:19:03', 'iblock', 400, 249, 26842, 'image/jpeg', 'iblock/5e6', '5e6b66465a2846146c93ee0ac5fd6a9f.jpg', '4f2b682c4cc7361e22e669e8faa4f344.jpg', '', NULL, '22bc15f7d776a5791911747dc5f30f8d'),
(41, '2018-06-27 10:19:03', 'iblock', 75, 45, 3069, 'image/jpeg', 'iblock/bdb', 'bdb28a6d9de7f6d57a4ce2aed5fd8c0a.jpg', '26051473b5a68363a0882915e3e020e5.jpg', '', NULL, '77546ef250c95307818c6ad777af92a9'),
(42, '2018-06-27 10:19:03', 'iblock', 400, 239, 36150, 'image/jpeg', 'iblock/c40', 'c40f964ec28e8e40dbaaa99f61ad876b.jpg', '8c00778d633d1db6aaf29242c1602897.jpg', '', NULL, '9a0e6191b30dfb9512873f84150f1b5b'),
(43, '2018-06-27 10:19:03', 'iblock', 75, 47, 3403, 'image/jpeg', 'iblock/907', '907625cccb0c7eaaa84233e6b6caf710.jpg', 'd1a244031379e20a9d7f9cf85227bb2e.jpg', '', NULL, 'd536cb262a775e7a33c59e741a65fb68'),
(44, '2018-06-27 10:19:03', 'iblock', 400, 250, 34322, 'image/jpeg', 'iblock/636', '6365e0a2d627255887412f23ac5d6851.jpg', '8b88ada642f37df4236b4cd129b85292.jpg', '', NULL, '07d3de993206ddb91a7c294628ee6f31'),
(45, '2018-06-27 10:19:03', 'iblock', 75, 49, 3941, 'image/jpeg', 'iblock/4ad', '4ad982b4975e73a616d586d1b1100d78.jpg', 'af64b255f19f75b080d5b934f156c590.jpg', '', NULL, '61e525d263d7f8cb5ce1a186de828dd6'),
(46, '2018-06-27 10:19:03', 'iblock', 400, 261, 37746, 'image/jpeg', 'iblock/ca3', 'ca3ce233c5192cf6e9bd269858073696.jpg', 'b6dabd5a96bb11b68a8d7d2dd9c9a4e0.jpg', '', NULL, 'f35118d226de5343ce4c15837d724593'),
(47, '2018-06-27 10:19:03', 'iblock', 75, 59, 3571, 'image/jpeg', 'iblock/515', '51522f46f43a0d96af6a4dff284e5a67.jpg', '058550b5373b90e56aacb376028089f4.jpg', '', NULL, '32c8acb82b20ed1f321579592ae36679'),
(48, '2018-06-27 10:19:03', 'iblock', 400, 312, 34110, 'image/jpeg', 'iblock/b70', 'b70476e0b76b1173899d3bae6ccc5a1a.jpg', 'e2612b793f41a81309fcc54bcbf65783.jpg', '', NULL, '63651af8b8f14ef256781e1c2eee6cd0'),
(49, '2018-06-27 10:19:03', 'iblock', 75, 48, 3030, 'image/jpeg', 'iblock/920', '92073893dc7d39b23d3768335a7e2c73.jpg', '8065fe760829c4055200ea4831d72c17.jpg', '', NULL, '26181ea78fc81ca40dbea1fe6f5d2119'),
(50, '2018-06-27 10:19:03', 'iblock', 400, 258, 29503, 'image/jpeg', 'iblock/d4c', 'd4cb1411272f6ce63d0744d0c84e2c2c.jpg', '8b6d3cc80b138843463e65ae7a97ffe1.jpg', '', NULL, 'dbc94ffb6443ec079d467d2fe450af3d'),
(51, '2018-06-27 10:19:03', 'iblock', 75, 52, 2250, 'image/jpeg', 'iblock/c80', 'c80820b80affc9074d3f19a32ce50989.jpg', 'a89665621b4b083248a5a8016be4e380.jpg', '', NULL, 'f1f02ba5369942a2b5c58cf449602cbc'),
(52, '2018-06-27 10:19:03', 'iblock', 400, 279, 22919, 'image/jpeg', 'iblock/16f', '16f5fc3e9e5dc438103cac29ccc1e283.jpg', '93de20bec81a906df174ababa31d856e.jpg', '', NULL, 'd38a65fd7e48941ed427c044e1028ced'),
(53, '2018-06-27 10:19:03', 'iblock', 97, 115, 5781, 'image/gif', 'iblock/1bd', '1bd6bc305b0199e45a216470edcf4668.gif', '8b0b3bc52fec8070e3561af5d05cd3a8.gif', '', NULL, '4a3d72dcce6a28ea9aa42a81e7c61665'),
(54, '2018-06-27 10:19:03', 'iblock', 97, 116, 7345, 'image/gif', 'iblock/998', '9982dfcfb0e78a255d6740241a63e611.gif', '38bf3b317397e56d07fe06731ca3a441.gif', '', NULL, '383d86d3cfb7a3513c84f410f09b59a6');
-- -----------------------------------
-- Dumping table b_file_search
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_filters
-- -----------------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form
-- -----------------------------------
DROP TABLE IF EXISTS `b_form`;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_group`;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_2_mail_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_mail_template`;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_2_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_2_site`;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_answer`;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_crm
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm`;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_crm_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm_field`;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_crm_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_crm_link`;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field`;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_field_filter
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field_filter`;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_field_validator
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_field_validator`;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_menu
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_menu`;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_result
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_result`;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_result_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_result_answer`;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_status
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status`;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_status_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status_2_group`;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_form_status_2_mail_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum`;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum2site
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum2site`;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_dictionary
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_dictionary`;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_dictionary` VALUES
(1, '[ru] Словарь слов', 'W'),
(2, '[ru] Словарь транслита', 'T'),
(3, '[en] Bad words', 'W'),
(4, '[en] Transliteration', 'T');
-- -----------------------------------
-- Dumping table b_forum_email
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_email`;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_file`;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_filter
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_filter`;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_filter` VALUES
(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');
-- -----------------------------------
-- Dumping table b_forum_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_group`;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_group_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_group_lang`;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_letter
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_letter`;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_letter` VALUES
(1, 2, 'а', 'АаAa'),
(2, 2, 'б', 'БбBb'),
(3, 2, 'в', 'ВвVv'),
(4, 2, 'г', 'Гг'),
(5, 2, 'д', 'ДдDd'),
(6, 2, 'е', 'ЁёЕеEe'),
(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
(8, 2, 'ж', 'ЖжGg'),
(9, 2, 'з', 'ЗзZz3'),
(10, 2, 'и', 'ИиIi'),
(11, 2, 'й', 'ЙйИиYy'),
(12, 2, 'к', 'КкKk'),
(13, 2, 'л', 'ЛлLl'),
(14, 2, 'м', 'МмMm'),
(15, 2, 'н', 'НнNn'),
(16, 2, 'о', 'ОоOo'),
(17, 2, 'п', 'ПпPp'),
(18, 2, 'р', 'РрPpRr'),
(19, 2, 'с', 'СсCc'),
(20, 2, 'т', 'ТтTt'),
(21, 2, 'у', 'УуUu'),
(22, 2, 'ф', 'ФфFf'),
(23, 2, 'х', 'ХхXx'),
(24, 2, 'ц', 'ЦцCc'),
(25, 2, 'ч', 'Чч'),
(26, 2, 'ш', 'Шш'),
(27, 2, 'щ', 'Щщ'),
(28, 2, 'ь', 'ЪъЬь\"\','),
(29, 2, 'ы', 'Ыы'),
(30, 2, 'ъ', 'ЪъЬь\"\','),
(31, 2, 'э', 'Ээ'),
(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
(33, 2, 'я', 'Яя'),
(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
(36, 2, 'тся', '%'),
(37, 2, 'ться', '%');
-- -----------------------------------
-- Dumping table b_forum_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_message`;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_perms
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_perms`;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_pm_folder
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_pm_folder`;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_pm_folder` VALUES
(1, 'SYSTEM_FOLDER_1', 0, 0),
(2, 'SYSTEM_FOLDER_2', 0, 0),
(3, 'SYSTEM_FOLDER_3', 0, 0),
(4, 'SYSTEM_FOLDER_4', 0, 0);
-- -----------------------------------
-- Dumping table b_forum_points
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points`;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_points2post
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points2post`;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_points_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_points_lang`;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_private_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_private_message`;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime NOT NULL,
  `POST_SUBJ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `USE_SMILES` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_rank
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_rank`;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_rank_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_rank_lang`;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_smile`;
CREATE TABLE `b_forum_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_smile` VALUES
(68, 'S', ':D :-D', 'icon_biggrin.png', 'FICON_BIGGRIN', 'N', 30, 16, 16),
(69, 'S', ':) :-)', 'icon_smile.png', 'FICON_SMILE', 'N', 10, 16, 16),
(70, 'S', ':( :-(', 'icon_sad.png', 'FICON_SAD', 'N', 50, 16, 16),
(71, 'S', ':o :-o :shock:', 'icon_eek.png', 'FICON_EEK', 'N', 90, 16, 16),
(72, 'S', '8) 8-)', 'icon_cool.png', 'FICON_COOL', 'N', 40, 16, 16),
(73, 'S', ':{} :-{}', 'icon_kiss.png', 'FICON_KISS', 'N', 110, 16, 16),
(74, 'S', ':oops:', 'icon_redface.png', 'FICON_REDFACE', 'Y', 100, 16, 16),
(75, 'S', ':cry: :~(', 'icon_cry.png', 'FICON_CRY', 'Y', 70, 16, 16),
(76, 'S', ':evil: >:-<', 'icon_evil.png', 'FICON_EVIL', 'N', 80, 16, 16),
(77, 'S', ';) ;-)', 'icon_wink.png', 'FICON_WINK', 'N', 20, 16, 16),
(78, 'S', ':!:', 'icon_exclaim.png', 'FICON_EXCLAIM', 'Y', 130, 16, 16),
(79, 'S', ':?:', 'icon_question.png', 'FICON_QUESTION', 'Y', 120, 16, 16),
(80, 'S', ':idea:', 'icon_idea.png', 'FICON_IDEA', 'Y', 140, 16, 16),
(81, 'S', ':| :-|', 'icon_neutral.png', 'FICON_NEUTRAL', 'N', 60, 16, 16),
(82, 'S', ':\\  :-\\  :/ :-/', 'icon_confuse.png', 'FICON_CONFUSE', 'N', 60, 16, 16),
(83, 'I', '', 'icon1.gif', 'FICON_NOTE', 'Y', 150, 15, 15),
(84, 'I', '', 'icon2.gif', 'FICON_DIRRECTION', 'Y', 150, 15, 15),
(85, 'I', '', 'icon3.gif', 'FICON_IDEA2', 'Y', 150, 15, 15),
(86, 'I', '', 'icon4.gif', 'FICON_ATTANSION', 'Y', 150, 15, 15),
(87, 'I', '', 'icon5.gif', 'FICON_QUESTION2', 'Y', 150, 15, 15),
(88, 'I', '', 'icon6.gif', 'FICON_BAD', 'Y', 150, 15, 15),
(89, 'I', '', 'icon7.gif', 'FICON_GOOD', 'Y', 150, 15, 15);
-- -----------------------------------
-- Dumping table b_forum_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_smile_lang`;
CREATE TABLE `b_forum_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_forum_smile_lang` VALUES
(1, 68, 'ru', 'Широкая улыбка'),
(2, 69, 'ru', 'С улыбкой'),
(3, 70, 'ru', 'Печально'),
(4, 71, 'ru', 'Удивленно'),
(5, 72, 'ru', 'Здорово'),
(6, 73, 'ru', 'Поцелуй'),
(7, 74, 'ru', 'Смущенно'),
(8, 75, 'ru', 'Очень грустно'),
(9, 76, 'ru', 'Со злостью'),
(10, 77, 'ru', 'Шутливо'),
(11, 78, 'ru', 'Восклицание'),
(12, 79, 'ru', 'Вопрос'),
(13, 80, 'ru', 'Идея'),
(14, 81, 'ru', 'Нет слов'),
(15, 82, 'ru', 'Озадаченно'),
(16, 83, 'ru', 'Заметка'),
(17, 84, 'ru', 'Направление'),
(18, 85, 'ru', 'Идея'),
(19, 86, 'ru', 'Внимание'),
(20, 87, 'ru', 'Вопрос'),
(21, 88, 'ru', 'Плохо'),
(22, 89, 'ru', 'Хорошо'),
(23, 68, 'en', 'Big grin'),
(24, 69, 'en', 'Smile'),
(25, 70, 'en', 'Sad'),
(26, 71, 'en', 'Surprised'),
(27, 72, 'en', 'Cool'),
(28, 73, 'en', 'Kiss'),
(29, 74, 'en', 'Embaressed'),
(30, 75, 'en', 'Crying'),
(31, 79, 'en', 'Question'),
(32, 78, 'en', 'Exclamation'),
(33, 77, 'en', 'Wink'),
(34, 76, 'en', 'Angry'),
(35, 80, 'en', 'Idea'),
(36, 81, 'en', 'Speechless'),
(37, 82, 'en', 'Skeptical'),
(38, 83, 'en', 'Note'),
(39, 84, 'en', 'Direction'),
(40, 85, 'en', 'Idea'),
(41, 86, 'en', 'Attention'),
(42, 87, 'en', 'Question'),
(43, 88, 'en', 'Thumbs Down'),
(44, 89, 'en', 'Thumbs Up');
-- -----------------------------------
-- Dumping table b_forum_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_stat`;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_subscribe
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_subscribe`;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_topic
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_topic`;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_ID` tinyint(2) DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user`;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_user_forum
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_forum`;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_user_points
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_points`;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_forum_user_topic
-- -----------------------------------
DROP TABLE IF EXISTS `b_forum_user_topic`;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group` VALUES
(1, '2018-06-27 10:17:59', 'Y', 1, 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2018-06-27 10:17:59', 'Y', 2, 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2018-06-27 10:17:59', 'Y', 3, 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2018-06-27 10:17:59', 'Y', 4, 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY'),
(5, '2018-06-27 10:18:58', 'Y', 300, 'N', 'Контент-редакторы', NULL, NULL, 'content_editor');
-- -----------------------------------
-- Dumping table b_group_collection_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_subordinate
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group_task` VALUES
(5, 44, '');
-- -----------------------------------
-- Dumping table b_hlblock_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hot_keys
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys` VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0);
-- -----------------------------------
-- Dumping table b_hot_keys_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys_code` VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
-- -----------------------------------
-- Dumping table b_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock` VALUES
(1, '2018-06-27 10:18:59', 'news', 's1', 'furniture_news_s1', 'Новости', 'Y', 500, '#SITE_DIR#/news/', '#SITE_DIR#/news/#ID#/', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_news_s1', '4a6c8dfd5f7da79df357cef9671caf43', 'Y', 'N', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Новости', 'Новость'),
(2, '2018-06-27 18:05:01', 'products', 's1', 'furniture_products_s1', '[s1] Продукция', 'Y', 500, '#SITE_DIR#/products/', '#SITE_DIR#/products/#SECTION_ID#/#ID#/', '#SITE_DIR#/products/#ID#/', NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_products_s1', 'f774babc3e71902d307cf8f49218b538', 'Y', 'Y', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Товары', 'Элемент'),
(3, '2018-06-27 10:19:03', 'products', 's1', 'furniture_services_s1', '[s1] Услуги', 'Y', 500, '#SITE_DIR#/services/', '#SITE_DIR#/services/#ID#/', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_services_s1', '72bfb07e774f5b5d4ae6213623aae225', 'Y', 'Y', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Услуги', 'Услуга'),
(4, '2018-06-27 10:19:04', 'vacancies', 's1', 'furniture_vacancies_s1', 'Вакансии', 'Y', 500, '#SITE_DIR#/company/vacancies.php', '#SITE_DIR#/company/vacancies.php##ID#', NULL, NULL, NULL, NULL, 'text', 24, 'Y', 'N', NULL, NULL, 'N', 'furniture_vacancies_s1', 'af6ac05870ccffa01fc7d5808310794a', 'Y', 'N', 'N', 'N', 'L', NULL, 'S', NULL, NULL, 1, 0, NULL, NULL, NULL, 'Разделы', 'Раздел', 'Вакансии', 'Вакансия');
-- -----------------------------------
-- Dumping table b_iblock_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element` VALUES
(1, '2018-06-27 10:18:59', 1, '2018-06-27 10:18:59', 1, 1, NULL, 'Y', '2010-05-25 00:00:00', NULL, 500, 'Мебельный форум Беларуси', NULL, 'С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году.', 'html', NULL, '\r\n<p>С 20 по 23 апреля 2010 года состоится <strong>Мебельный Форум Беларуси</strong> &ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из <em>Беларуси, Австрии, Латвии, Литвы, России, Польши </em>и<em> Украины</em>. В составе форума состоится пять выставок:&quot;Минский мебельный салон&quot;, &quot;Мебельные технологии&quot;, &quot;ОфисКомфорт&quot;, &quot;Кухня&quot; и &quot;Домотех&quot;. Экспозиция будет строиться по принципу двух тематических секторов:<em> готовой мебели</em> и <em>материалов для ее производства</em>.\r\n \r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе готовой мебели будут представлены:</p>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<ul>\r\n \r\n \r\n \r\n  <li>корпусная и мягкая мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для детей и молодежи;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>предметы интерьера;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>кухонная мебель;</li>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n  <li>мебель для офиса и административных зданий.</li>\r\n\r\n \r\n \r\n </ul>\r\n\r\n \r\n \r\n \r\n \r\n \r\n \r\n<p>В секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n \r\n </p>\r\n\r\n \r\n \r\n \r\n \r\n<p>Помимо расширенной экспозиции пяти тематических выставок &quot;Экспофорум&quot; подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума &quot;<strong>Народное признание</strong>&quot;. В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\r\n \r\n \r\n  <br />\r\n\r\n \r\n <strong>Мебельный Форум</strong> предоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок <strong>Мебельного Форума</strong>.\r\n \r\n \r\n  <br />\r\n\r\n \r\n </p>\r\n\r\n<p><em>Прием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.</em></p>\r\n\r\n \r\n \r\n \r\n \r\n<ul>\r\n </ul>\r\n\r\n \r\n \r\n \r\n ', 'html', 'МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ МЕБЕЛЬНЫЙ \r\nФОРУМ БЕЛАРУСИ &NDASH; ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ \r\nОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ \r\nУЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ БЕЛАРУСИ, АВСТРИИ, \r\nЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ И УКРАИНЫ. \r\nВ СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ \r\nМЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \r\n\"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ \r\nБУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ \r\nСЕКТОРОВ: ГОТОВОЙ МЕБЕЛИ И МАТЕРИАЛОВ ДЛЯ \r\nЕЕ ПРОИЗВОДСТВА. \r\n \r\n\r\nВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ: \r\n\r\n- КОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ; \r\n- ПРЕДМЕТЫ ИНТЕРЬЕРА; \r\n- КУХОННАЯ МЕБЕЛЬ; \r\n- МЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ. \r\n\r\nВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА \r\nМЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ \r\nРЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, \r\nОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ \r\nДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ. \r\n \r\n\r\nПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ \r\nВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ \r\nДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В \r\nРАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. \r\nИ ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ \r\nСТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"НАРОДНОЕ \r\nПРИЗНАНИЕ\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ \r\nВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ \r\nСМОТРОМ ОБРАЗЦОВ МЕБЕЛИ. \r\nМЕБЕЛЬНЫЙ ФОРУМ ПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ \r\nВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ \r\nМЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ \r\nПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ \r\nПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ \r\nПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА \r\nБУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ \r\nПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \r\nМЕБЕЛЬНОГО ФОРУМА. \r\n \r\n\r\nПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ \r\nДО 12 АПРЕЛЯ 2010 ГОДА.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', '', '', '-384246935', NULL, NULL, NULL),
(2, '2018-06-27 10:18:59', 1, '2018-06-27 10:18:59', 1, 1, NULL, 'Y', '2010-05-26 00:00:00', NULL, 500, 'Международная мебельная выставка SALON DEL MOBILE', NULL, 'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. ', 'html', NULL, 'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.', 'text', 'МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ \r\nЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ.\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '373546319', NULL, NULL, NULL),
(3, '2018-06-27 10:18:59', 1, '2018-06-27 10:18:59', 1, 1, NULL, 'Y', '2010-05-27 00:00:00', NULL, 500, 'Получено прочное водостойкое соединение', NULL, 'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. ', 'html', NULL, '<b>Авторы изобретения</b>: Разиньков Егор Михайлович  и Мещерякова Анна Анатольевна </br>\r\n              Патент Российской Федерации RU2277566</br>\r\n              <h3>Описание изобретения</h3>\r\n              <p>Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\r\n              Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. </p>\r\n\r\n              <p>Изобретение решает задачу по получению прочного и водостойкого клеевого соединения.\r\n              Это достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\r\n              </p>\r\n              <table cellspacing=\"10\">\r\n              <tr>\r\n              <td>Карбамидомеламиноформальдегидная смола</td><td>64,5-79,2</td>\r\n              </tr>	\r\n              <tr>\r\n              <td>10%-ный Раствор щавелевой кислоты</td><td>4,4-20,5</td>\r\n\r\n              </tr>\r\n              <tr>\r\n              <td> Отвердитель для карбамидомеламиноформальдегидной </td><td>0,6-2,0</td>\r\n              </tr>\r\n              <tr>\r\n              <td> смолы 2542</td><td>13,0-15,8</td>\r\n\r\n              </tr>	\r\n              </table>\r\n', 'html', 'ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ \r\nСОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ \r\nПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, \r\nИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ \r\nИ СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ \r\nКОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО \r\nПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ.\r\nАВТОРЫ ИЗОБРЕТЕНИЯ: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ \r\nИ МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА ПАТЕНТ РОССИЙСКОЙ \r\nФЕДЕРАЦИИ RU2277566 ОПИСАНИЕ ИЗОБРЕТЕНИЯ \r\n\r\nИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ \r\nИ ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ \r\nВ ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ \r\nПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ \r\nПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ \r\nИ ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ \r\nОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ \r\nЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ \r\nСМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ \r\nИ ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ \r\nХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \r\n\r\nИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ \r\nПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ. \r\nЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, \r\nВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, \r\nСОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ \r\nМОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ \r\nСМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ \r\nСМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА \r\n- КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ \r\nОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ \r\nПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, \r\nМАС.Ч.: \r\n КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА \r\n   64,5-79,2     \r\n 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ    4,4-20,5 \r\n    \r\n ОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r\n    0,6-2,0     \r\n СМОЛЫ 2542    13,0-15,8', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '868533081', NULL, NULL, NULL),
(4, '2018-06-27 10:19:01', 1, '2018-06-27 10:19:01', 1, 2, 1, 'Y', NULL, NULL, 500, 'Герцог', 5, '<p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>', 'html', 6, '        <p>Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.</p>', 'html', 'ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ \r\nТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ \r\nДЕКОР.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '10', '', '', '-782370160', NULL, NULL, NULL),
(5, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:01', 1, 2, 1, 'Y', NULL, NULL, 500, 'Монализа', 7, '        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ', 'html', 8, '        <p>Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\r\n        По желанию клиента возможна простежка на спинке и подлокотниках.</p>\r\n      ', 'html', 'МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. \r\nКАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ. \r\nПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА \r\nСПИНКЕ И ПОДЛОКОТНИКАХ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '11', '', '', '-48879568', NULL, NULL, NULL),
(6, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Министр', 9, '        <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n      ', 'html', 10, '          <p>Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \r\n          С его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.</p>\r\n        ', 'html', 'МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ \r\nНА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \r\nС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР \r\nВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ \r\nС КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '12', '', '', '-2121649046', NULL, NULL, NULL),
(7, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Хром', 11, '        \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n      ', 'html', 12, '          \r\n          <p>Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \r\n          счет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \r\n          Твердая спинка жестко поддерживает позвоночник.</p>\r\n        ', 'html', 'ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА \r\nОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ \r\nЗА СЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ \r\nПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \r\nТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '13', '', '', '-256131656', NULL, NULL, NULL),
(8, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 3, 'Y', NULL, NULL, 500, 'Ливерпуль', 13, '        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n      ', 'html', 14, '        \r\n        <p>Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \r\n        создают особую атмосферу в кухне.</p>\r\n        \r\n      ', 'html', 'ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ \r\nВ КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, СОЗДАЮТ \r\nОСОБУЮ АТМОСФЕРУ В КУХНЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '14', '', '', '1081715374', NULL, NULL, NULL),
(9, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Изабелла', 15, '        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ', 'html', 16, '        <p>Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.</p>\r\n      ', 'html', 'ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. \r\nОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ \r\nИЛИ КОЖЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '15', '', '', '-1320392841', NULL, NULL, NULL),
(10, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Аладдин', 17, '        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ', 'html', 18, '        <p>Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \r\n        придают изделию необыкновенный шарм и элегантную роскошь. \r\n        По желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»</p>\r\n      ', 'html', 'АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ \r\nТКАНИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ПО ЖЕЛАНИЮ КЛИЕНТА \r\nМОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ \r\nДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ \r\nРАСКЛАДУШКУ»', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '16', '', '', '1053250178', NULL, NULL, NULL),
(11, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Джоконда', 19, '          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ', 'html', 20, '          <p>Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \r\n          Обивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.</p>\r\n        ', 'html', 'ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, \r\nРУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ \r\nШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. ОБИВКА ТАКЖЕ \r\nМОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА \r\nПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '17', '', '', '-106709740', NULL, NULL, NULL),
(12, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Флора', 21, '        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ', 'html', 22, '        <p>Классическая модель создана для украшения роскошных интерьеров. \r\n        Элегантность и колоритность модели придают накладки из натурального дерева.</p>\r\n      ', 'html', 'ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ \r\nРОСКОШНЫХ ИНТЕРЬЕРОВ. ЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ \r\nМОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО \r\nДЕРЕВА.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '18', '', '', '-1053944437', NULL, NULL, NULL),
(13, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Престиж', 23, '          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ', 'html', 24, '          <p>Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.</p>\r\n        ', 'html', 'ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК \r\nНАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА \r\nМОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '19', '', '', '273423738', NULL, NULL, NULL),
(14, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 1, 'Y', NULL, NULL, 500, 'Лаура', 25, '        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ', 'html', 26, '        <p>Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \r\n        Элитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.</p>\r\n      ', 'html', 'ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН \r\nИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, \r\nПО ВАШЕМУ ЖЕЛАНИЮ. ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ \r\nПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ \r\nРОСКОШЬ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '20', '', '', '-281088768', NULL, NULL, NULL),
(15, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Модерн', 27, '         <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ', 'html', 28, '          <p>Основными характеристиками данной серии является новизна дизайнерской мысли, \r\n          которая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \r\n          которая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \r\n          Что в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \r\n          Данная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \r\n          но и самого времени.</p>\r\n        ', 'html', 'МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ \r\nЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, КОТОРАЯ \r\nВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, \r\nИ ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ \r\nКОМПОНОВКИ, КОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ \r\nНАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ \r\nРЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. ЧТО В СОЧЕТАНИИ \r\nС УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ \r\nВ ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \r\nДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, \r\nКОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ \r\nТОЛЬКО СВОИХ КОНКУРЕНТОВ, НО И САМОГО ВРЕМЕНИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '21', '', '', '-1185689438', NULL, NULL, NULL),
(16, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Оптима', 29, '         <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \r\n          Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</p><p>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \r\n          обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать \r\n          пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</p><p>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.</p>\r\n        </p>\r\n      ', 'html', 30, '            \r\n        <p>\r\n          Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство  - значит помочь коллегам выполнять свои функции быстрее и эффективнее.</br>\r\n          Серия <b>«Оптима»</b> позволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы  помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.</br>\r\n          Мебель <b>«Оптима»</b> - это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\n        </p>\r\n      ', 'html', 'ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\r\n\r\nСЕРИЯ «ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ \r\nДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ.\r\n\r\nМЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ \r\nРЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА \r\nВ ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ \r\nОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ \r\nКОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ \r\nПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ \r\nСВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ. СЕРИЯ \r\n«ОПТИМА» ПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ \r\nОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ \r\nИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ \r\nКАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ \r\nСТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ \r\nРАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО \r\nПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ \r\nК ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ \r\nФИРМЫ В ЦЕЛОМ. МЕБЕЛЬ «ОПТИМА» - ЭТО ПОЛНЫЙ \r\nНАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА \r\nПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '22', '', '', '1945328005', NULL, NULL, NULL),
(17, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Собрание', 31, '        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ', 'html', 32, '        \r\n        <p>\r\n          Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\r\n          Удивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\n        </p>\r\n      ', 'html', 'СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ \r\nДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ \r\nОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ \r\nНЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА \r\nКАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ \r\nЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ \r\nВОПРОСОВ. УДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ \r\nРОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ \r\nСТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ \r\nОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О \r\nКАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ \r\nПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ \r\nДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ \r\nОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ \r\nЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '23', '', '', '1523163777', NULL, NULL, NULL),
(18, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Лидер', 33, '        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n      ', 'html', 34, '        \r\n        <p>Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \r\n        Слева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \r\n        Справа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \r\n        основными достоинствами данной серии.</p>\r\n        \r\n      ', 'html', 'ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, \r\nИ ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \r\nСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ \r\nПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА \r\nИ НОГ. СПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ \r\nИ ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ \r\nДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \r\nОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '24', '', '', '-1927682590', NULL, NULL, NULL),
(19, '2018-06-27 10:19:02', 1, '2018-06-27 10:19:02', 1, 2, 2, 'Y', NULL, NULL, 500, 'Президент', 35, '        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.</p> \r\n      ', 'html', 36, '        \r\n        <p><b>Кресло руководителя Президент</b> во главе большого круглого стола поможет создать в вашем кабинете\r\n        обстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \r\n        поможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \r\n        Дизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \r\n        Производится ограниченными партиями - не более 10 кресел в год.</p>\r\n        \r\n      ', 'html', 'ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ ВО ГЛАВЕ \r\nБОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ \r\nВ ВАШЕМ КАБИНЕТЕ ОБСТАНОВКУ ЛЕГЕНДАРНОЙ \r\nСОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО \r\nМЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \r\nПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, \r\nСОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \r\nДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ \r\nСТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА \r\nВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. ПРОИЗВОДИТСЯ \r\nОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ \r\nВ ГОД.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '25', '', '', '-1836002422', NULL, NULL, NULL),
(20, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 2, 'Y', NULL, NULL, 500, 'Плутон', 37, '        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n      ', 'html', 38, '        \r\n        <p>Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \r\n        Данная модель будет незаменима для тех, кто много работает за компьютером.</p>\r\n        \r\n      ', 'html', 'ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ \r\nФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ \r\nРАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. ДАННАЯ МОДЕЛЬ \r\nБУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ \r\nЗА КОМПЬЮТЕРОМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '26', '', '', '1990779533', NULL, NULL, NULL),
(21, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 3, 'Y', NULL, NULL, 500, 'Парма', 39, '        <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r\n        Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r\n        Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>\r\n      ', 'html', 40, '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. <br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.&lt;/p&gt;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', 'html', 'ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ \r\nЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\nСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА \r\nБУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\nТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ \r\nВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&LT;P&GT;СТУЛЬЯ ПАРМА \r\nВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ \r\nЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;СТУЛ ПРАКТИЧЕСКИ \r\nЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ \r\nСТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;ТОНИРОВКА ДЕРЕВЯННЫХ \r\nДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ \r\nПАЛИТРЕ.&LT;/P&GT;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;\r\n&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;&NBSP;', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '27', '', '', '964589627', NULL, NULL, NULL),
(22, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 3, 'Y', NULL, NULL, 500, 'Палермо', 41, '        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n      ', 'html', 42, '        \r\n        <p>Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \r\n        и в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \r\n        органично сольются с его стилем.</p>\r\n        \r\n      ', 'html', 'ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ \r\nС УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \r\nИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. \r\nСТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ \r\nИ ОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '28', '', '', '-1151185156', NULL, NULL, NULL),
(23, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 3, 'Y', NULL, NULL, 500, 'Валенсия', 43, '        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n      ', 'html', 44, '        \r\n        <p>Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \r\n        мягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \r\n        персонала.</p>\r\n        \r\n      ', 'html', 'ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ \r\nПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА \r\nСПИНКИ И МЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО \r\nУДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ \r\nОФИСНОЙ МЕБЕЛИ ДЛЯ ПЕРСОНАЛА.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '29', '', '', '589017098', NULL, NULL, NULL),
(24, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 4, 'Y', NULL, NULL, 500, 'Фазенда', 45, '        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n      ', 'html', 46, '        \r\n        <p>Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \r\n        Ткань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.</p>\r\n        \r\n      ', 'html', 'ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ \r\nИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ \r\nПРИРОДНЫХ МАТЕРИАЛОВ. ТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ \r\nТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ \r\nНА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. \r\nЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '30', '', '', '-1288812514', NULL, NULL, NULL),
(25, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 4, 'Y', NULL, NULL, 500, 'Эра', 47, '        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n      ', 'html', 48, '        \r\n        <p>Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \r\n        что можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \r\n        к компьютерной стойке, также ее можно использовать как мебель для кафе и баров.</p>\r\n        \r\n      ', 'html', 'ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ \r\nСИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН \r\nТЕМ, ЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ \r\nДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ \r\nОТЛИЧНО ПОДОЙДЕТ К КОМПЬЮТЕРНОЙ СТОЙКЕ, \r\nТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ \r\nДЛЯ КАФЕ И БАРОВ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '31', '', '', '858154825', NULL, NULL, NULL),
(26, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 4, 'Y', NULL, NULL, 500, 'Сити', 49, '        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n      ', 'html', 50, '        \r\n        <p>Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \r\n        своей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \r\n        любой компьютерной мебелью.</p>\r\n        \r\n      ', 'html', 'СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ \r\nОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ СВОЕЙ \r\nНЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ \r\nОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ \r\nС ЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '32', '', '', '-252178488', NULL, NULL, NULL),
(27, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 2, 4, 'Y', NULL, NULL, 500, 'Изопласт Хром', 51, '        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n      ', 'html', 52, '        \r\n        <p>Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \r\n        сиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \r\n        в качестве аудиторных конференц-кресел, кроме того, их легко хранить.</p>\r\n        \r\n      ', 'html', 'ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ \r\nМЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ \r\nИ СИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. \r\nПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ \r\nДЛЯ ИСПОЛЬЗОВАНИЯ В КАЧЕСТВЕ АУДИТОРНЫХ \r\nКОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '33', '', '', '2001037389', NULL, NULL, NULL),
(28, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Мебель на заказ', 53, 'Наша компания занимается разработкой мебели на заказ.', 'html', NULL, '        <p>Наша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\r\n        гардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.</p>\r\n        <p>Мы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\r\n        По Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\r\n        произведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.</p>\r\n        <p>После заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\r\n        где опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\r\n        непосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\r\n        сотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\r\n        вносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.</p>\r\n        \r\n      ', 'html', 'МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ.\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ \r\nНА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ \r\nИ КОРПУСНЫЕ ШКАФЫ КУПЕ, ГАРДЕРОБНЫЕ КОМНАТЫ, \r\nПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ \r\nИ ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ. \r\n\r\nМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ \r\nИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, \r\nМАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ. \r\nПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ \r\nСО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ \r\nМЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ \r\nИ ПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ \r\nВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, \r\nСОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ. \r\n\r\nПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ \r\nСРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ \r\nПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО, ГДЕ \r\nОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ \r\nВ ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. \r\nПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ \r\nНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ \r\nРАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ \r\nНЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ \r\nСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ \r\nС ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ \r\nДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ \r\nВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ \r\nЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА \r\nОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '5', '', '', '841280321', NULL, NULL, NULL),
(29, '2018-06-27 10:19:03', 1, '2018-06-27 10:19:03', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Услуги дизайнера', 54, 'Мы предлагаем широкий спектр услуг по дизайну мебели.', 'html', NULL, '        \r\n        <ul>\r\n          <li>Диагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.</li>\r\n          <li>Разработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.</li>\r\n          <li>Разработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие,  рассмотреть его в деталях.</li>\r\n          <li>Подбор и расстановка мебели.</li>\r\n          <li>Декорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.</li>\r\n        </ul>\r\n        \r\n      ', 'html', 'УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ \r\nМЕБЕЛИ.\r\n- ДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ \r\nПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, \r\nОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, \r\nОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, \r\nРАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ \r\nЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ \r\nЖИЗНИ. \r\n- РАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ \r\nРАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ \r\nПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ \r\nЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ \r\nВАРИАНТ. \r\n- РАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ \r\nМОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, \r\nИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ \r\nПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ \r\nИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ. \r\n- ПОДБОР И РАССТАНОВКА МЕБЕЛИ. \r\n- ДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ \r\nИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ \r\nПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ \r\nЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', '', '', '-1080381355', NULL, NULL, NULL),
(30, '2018-06-27 10:19:04', 1, '2018-06-27 10:19:04', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 200, 'Продавец-дизайнер (кухни)', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ', 'html', 'ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\n\r\nТРЕБОВАНИЯ \r\n\r\nУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ \r\nОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ \r\nВ МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ \r\nОБЯЗАННОСТИ \r\n\r\nКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ \r\nМЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ \r\nПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ. УСЛОВИЯ \r\n\r\nЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + \r\nПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ \r\nСОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '2', '', '', '1704140047', NULL, NULL, NULL),
(31, '2018-06-27 10:19:04', 1, '2018-06-27 10:19:04', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 300, 'Директор магазина', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ', 'html', 'ДИРЕКТОР МАГАЗИНА\r\n\r\nТРЕБОВАНИЯ \r\n\r\nВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ \r\nРАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ \r\nПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ \r\nУПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ \r\nЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ \r\nОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ \r\nЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ \r\nФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И \r\nОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ \r\nОТЧЕТНОСТЬ. УСЛОВИЯ \r\n\r\nТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ \r\nГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: \r\nОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ \r\nДОХОД ОТ 35000 РУБ', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', '', '', '192768702', NULL, NULL, NULL),
(32, '2018-06-27 10:19:04', 1, '2018-06-27 10:19:04', 1, 4, NULL, 'Y', '2010-05-01 00:00:00', NULL, 400, 'Бухгалтер отдела учета готовой продукции', NULL, '', 'html', NULL, '<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ', 'html', 'БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\n\r\nТРЕБОВАНИЯ \r\n\r\nЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ \r\nРАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ \r\nБУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), \r\nСАМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, \r\nБЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ. \r\nОБЯЗАННОСТИ \r\n\r\nРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ \r\nМПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ \r\nСЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ \r\nПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ \r\nФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ УСЛОВИЯ \r\n\r\nГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ \r\nГ. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД \r\n10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', '', '', '790068583', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_element_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_lock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element_property` VALUES
(1, 2, 4, '10000', 'text', NULL, 10000.0000, ''),
(2, 3, 4, '2', 'text', 2, NULL, NULL),
(3, 4, 4, '195x95x125', 'text', NULL, 195.0000, ''),
(4, 6, 4, '40324А', 'text', NULL, 40324.0000, ''),
(5, 7, 4, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(6, 8, 4, 'Россия', 'text', NULL, 0.0000, ''),
(7, 2, 5, '12000', 'text', NULL, 12000.0000, ''),
(8, 3, 5, '2', 'text', 2, NULL, NULL),
(9, 4, 5, '175x95x115', 'text', NULL, 175.0000, ''),
(10, 6, 5, '56830Е', 'text', NULL, 56830.0000, ''),
(11, 7, 5, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(12, 8, 5, 'Россия', 'text', NULL, 0.0000, ''),
(13, 1, 6, '1', 'text', 1, NULL, NULL),
(14, 2, 6, '7899', 'text', NULL, 7899.0000, ''),
(15, 3, 6, '2', 'text', 2, NULL, NULL),
(16, 4, 6, '54x49x120', 'text', NULL, 54.0000, ''),
(17, 6, 6, '435245', 'text', NULL, 435245.0000, ''),
(18, 7, 6, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(19, 8, 6, 'Россия', 'text', NULL, 0.0000, ''),
(20, 2, 7, '8999', 'text', NULL, 8999.0000, ''),
(21, 3, 7, '2', 'text', 2, NULL, NULL),
(22, 4, 7, '66x60x36', 'text', NULL, 66.0000, ''),
(23, 6, 7, '234523', 'text', NULL, 234523.0000, ''),
(24, 7, 7, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(25, 8, 7, 'Россия', 'text', NULL, 0.0000, ''),
(26, 2, 8, '1500', 'text', NULL, 1500.0000, ''),
(27, 3, 8, '2', 'text', 2, NULL, NULL),
(28, 4, 8, '51x43x85', 'text', NULL, 51.0000, ''),
(29, 6, 8, '234011', 'text', NULL, 234011.0000, ''),
(30, 7, 8, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(31, 8, 8, 'Россия', 'text', NULL, 0.0000, ''),
(32, 1, 9, '1', 'text', 1, NULL, NULL),
(33, 2, 9, '11899', 'text', NULL, 11899.0000, ''),
(34, 3, 9, '2', 'text', 2, NULL, NULL),
(35, 4, 9, '155x90x95', 'text', NULL, 155.0000, ''),
(36, 6, 9, '47539Р', 'text', NULL, 47539.0000, ''),
(37, 7, 9, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(38, 8, 9, 'Россия', 'text', NULL, 0.0000, ''),
(39, 2, 10, '12500', 'text', NULL, 12500.0000, ''),
(40, 3, 10, '2', 'text', 2, NULL, NULL),
(41, 4, 10, '165x90x115', 'text', NULL, 165.0000, ''),
(42, 6, 10, '00549Е', 'text', NULL, 549.0000, ''),
(43, 7, 10, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(44, 8, 10, 'Россия', 'text', NULL, 0.0000, ''),
(45, 2, 11, '8000', 'text', NULL, 8000.0000, ''),
(46, 3, 11, '2', 'text', 2, NULL, NULL),
(47, 4, 11, '155x95x105', 'text', NULL, 155.0000, ''),
(48, 6, 11, '98922К', 'text', NULL, 98922.0000, ''),
(49, 7, 11, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(50, 8, 11, 'Россия', 'text', NULL, 0.0000, ''),
(51, 1, 12, '1', 'text', 1, NULL, NULL),
(52, 2, 12, '10999', 'text', NULL, 10999.0000, ''),
(53, 3, 12, '2', 'text', 2, NULL, NULL),
(54, 4, 12, '165x90x115', 'text', NULL, 165.0000, ''),
(55, 6, 12, '64512Т', 'text', NULL, 64512.0000, ''),
(56, 7, 12, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(57, 8, 12, 'Россия', 'text', NULL, 0.0000, ''),
(58, 2, 13, '9999', 'text', NULL, 9999.0000, ''),
(59, 3, 13, '2', 'text', 2, NULL, NULL),
(60, 4, 13, '210x105x135', 'text', NULL, 210.0000, ''),
(61, 6, 13, '96395Т', 'text', NULL, 96395.0000, ''),
(62, 7, 13, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(63, 8, 13, 'Россия', 'text', NULL, 0.0000, ''),
(64, 2, 14, '1499', 'text', NULL, 1499.0000, ''),
(65, 3, 14, '2', 'text', 2, NULL, NULL),
(66, 4, 14, '175x110x115', 'text', NULL, 175.0000, ''),
(67, 5, 14, '200x100', 'text', NULL, 200.0000, ''),
(68, 6, 14, '38263Е', 'text', NULL, 38263.0000, ''),
(69, 7, 14, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(70, 8, 14, 'Россия', 'text', NULL, 0.0000, ''),
(71, 2, 15, '9999', 'text', NULL, 9999.0000, ''),
(72, 3, 15, '2', 'text', 2, NULL, NULL),
(73, 6, 15, '634645', 'text', NULL, 634645.0000, ''),
(74, 7, 15, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(75, 8, 15, 'Россия', 'text', NULL, 0.0000, ''),
(76, 2, 16, '7799', 'text', NULL, 7799.0000, ''),
(77, 3, 16, '2', 'text', 2, NULL, NULL),
(78, 6, 16, '634045', 'text', NULL, 634045.0000, ''),
(79, 7, 16, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(80, 8, 16, 'Россия', 'text', NULL, 0.0000, ''),
(81, 2, 17, '6779', 'text', NULL, 6779.0000, ''),
(82, 3, 17, '2', 'text', 2, NULL, NULL),
(83, 4, 17, '220x140x120', 'text', NULL, 220.0000, ''),
(84, 6, 17, '634043', 'text', NULL, 634043.0000, ''),
(85, 7, 17, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(86, 8, 17, 'Россия', 'text', NULL, 0.0000, ''),
(87, 2, 18, '4579', 'text', NULL, 4579.0000, ''),
(88, 3, 18, '2', 'text', 2, NULL, NULL),
(89, 4, 18, '200x150x120', 'text', NULL, 200.0000, ''),
(90, 6, 18, '634023', 'text', NULL, 634023.0000, ''),
(91, 7, 18, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(92, 8, 18, 'Россия', 'text', NULL, 0.0000, ''),
(93, 1, 19, '1', 'text', 1, NULL, NULL),
(94, 2, 19, '14999', 'text', NULL, 14999.0000, ''),
(95, 3, 19, '2', 'text', 2, NULL, NULL),
(96, 4, 19, '50x69x130', 'text', NULL, 50.0000, ''),
(97, 6, 19, '634023', 'text', NULL, 634023.0000, ''),
(98, 7, 19, 'Кожа, ткань', 'text', NULL, 0.0000, ''),
(99, 8, 19, 'Россия', 'text', NULL, 0.0000, ''),
(100, 2, 20, '12999', 'text', NULL, 12999.0000, ''),
(101, 3, 20, '2', 'text', 2, NULL, NULL),
(102, 4, 20, '58x48x86', 'text', NULL, 58.0000, ''),
(103, 6, 20, '634011', 'text', NULL, 634011.0000, ''),
(104, 7, 20, 'Кожа, металл, ткань', 'text', NULL, 0.0000, ''),
(105, 8, 20, 'Россия', 'text', NULL, 0.0000, ''),
(106, 2, 21, '1700', 'text', NULL, 1700.0000, ''),
(107, 3, 21, '2', 'text', 2, NULL, NULL),
(108, 4, 21, '52x42x88', 'text', NULL, 52.0000, ''),
(109, 6, 21, '234012', 'text', NULL, 234012.0000, ''),
(110, 7, 21, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(111, 8, 21, 'Россия', 'text', NULL, 0.0000, ''),
(112, 2, 22, '1000', 'text', NULL, 1000.0000, ''),
(113, 3, 22, '2', 'text', 2, NULL, NULL),
(114, 4, 22, '52x42x88', 'text', NULL, 52.0000, ''),
(115, 6, 22, '234014', 'text', NULL, 234014.0000, ''),
(116, 7, 22, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(117, 8, 22, 'Россия', 'text', NULL, 0.0000, ''),
(118, 2, 23, '1399', 'text', NULL, 1399.0000, ''),
(119, 3, 23, '2', 'text', 2, NULL, NULL),
(120, 4, 23, '55x39x90', 'text', NULL, 55.0000, ''),
(121, 6, 23, '234017', 'text', NULL, 234017.0000, ''),
(122, 7, 23, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(123, 8, 23, 'Россия', 'text', NULL, 0.0000, ''),
(124, 2, 24, '1000', 'text', NULL, 1000.0000, ''),
(125, 3, 24, '2', 'text', 2, NULL, NULL),
(126, 4, 24, '56x48x80', 'text', NULL, 56.0000, ''),
(127, 6, 24, '234013', 'text', NULL, 234013.0000, ''),
(128, 7, 24, 'Дерево, ткань', 'text', NULL, 0.0000, ''),
(129, 8, 24, 'Россия', 'text', NULL, 0.0000, ''),
(130, 2, 25, '1300', 'text', NULL, 1300.0000, ''),
(131, 3, 25, '2', 'text', 2, NULL, NULL),
(132, 4, 25, '52x42x88', 'text', NULL, 52.0000, ''),
(133, 6, 25, '234015', 'text', NULL, 234015.0000, ''),
(134, 7, 25, 'Металл, пластик', 'text', NULL, 0.0000, ''),
(135, 8, 25, 'Россия', 'text', NULL, 0.0000, ''),
(136, 2, 26, '1699', 'text', NULL, 1699.0000, ''),
(137, 3, 26, '2', 'text', 2, NULL, NULL),
(138, 4, 26, '52x45x65', 'text', NULL, 52.0000, ''),
(139, 6, 26, '234016', 'text', NULL, 234016.0000, ''),
(140, 7, 26, 'Металл, пластик, кожа', 'text', NULL, 0.0000, ''),
(141, 8, 26, 'Россия', 'text', NULL, 0.0000, ''),
(142, 2, 27, '1679', 'text', NULL, 1679.0000, ''),
(143, 3, 27, '2', 'text', 2, NULL, NULL),
(144, 4, 27, '54x43x82', 'text', NULL, 54.0000, ''),
(145, 6, 27, '234017', 'text', NULL, 234017.0000, ''),
(146, 7, 27, 'Металл, пластик', 'text', NULL, 0.0000, ''),
(147, 8, 27, 'Россия', 'text', NULL, 0.0000, '');
-- -----------------------------------
-- Dumping table b_iblock_element_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_fields
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_fields` VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'N', ''),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', ''),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', NULL),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_NAME', 'Y', NULL),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', NULL),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'N', ''),
(1, 'XML_IMPORT_START_TIME', 'N', '2018-06-27 10:18:58'),
(2, 'ACTIVE', 'Y', 'Y'),
(2, 'ACTIVE_FROM', 'N', ''),
(2, 'ACTIVE_TO', 'N', ''),
(2, 'CODE', 'N', ''),
(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'DETAIL_TEXT', 'N', ''),
(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'IBLOCK_SECTION', 'N', ''),
(2, 'LOG_ELEMENT_ADD', 'N', NULL),
(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
(2, 'LOG_SECTION_ADD', 'N', NULL),
(2, 'LOG_SECTION_DELETE', 'N', NULL),
(2, 'LOG_SECTION_EDIT', 'N', NULL),
(2, 'NAME', 'Y', ''),
(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'PREVIEW_TEXT', 'N', ''),
(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(2, 'SECTION_DESCRIPTION', 'N', NULL),
(2, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_NAME', 'Y', NULL),
(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(2, 'SECTION_XML_ID', 'N', NULL),
(2, 'SORT', 'N', '0'),
(2, 'TAGS', 'N', ''),
(2, 'XML_ID', 'N', ''),
(2, 'XML_IMPORT_START_TIME', 'N', '2018-06-27 10:19:01'),
(3, 'ACTIVE', 'Y', 'Y'),
(3, 'ACTIVE_FROM', 'N', ''),
(3, 'ACTIVE_TO', 'N', ''),
(3, 'CODE', 'N', ''),
(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'DETAIL_TEXT', 'N', ''),
(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(3, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'IBLOCK_SECTION', 'N', ''),
(3, 'LOG_ELEMENT_ADD', 'N', NULL),
(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
(3, 'LOG_SECTION_ADD', 'N', NULL),
(3, 'LOG_SECTION_DELETE', 'N', NULL),
(3, 'LOG_SECTION_EDIT', 'N', NULL),
(3, 'NAME', 'Y', ''),
(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'PREVIEW_TEXT', 'N', ''),
(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(3, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(3, 'SECTION_DESCRIPTION', 'N', NULL),
(3, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(3, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_NAME', 'Y', NULL),
(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(3, 'SECTION_XML_ID', 'N', NULL),
(3, 'SORT', 'N', '0'),
(3, 'TAGS', 'N', ''),
(3, 'XML_ID', 'N', ''),
(3, 'XML_IMPORT_START_TIME', 'N', '2018-06-27 10:19:03'),
(4, 'ACTIVE', 'Y', 'Y'),
(4, 'ACTIVE_FROM', 'N', ''),
(4, 'ACTIVE_TO', 'N', ''),
(4, 'CODE', 'N', ''),
(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'DETAIL_TEXT', 'N', ''),
(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(4, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'IBLOCK_SECTION', 'N', ''),
(4, 'LOG_ELEMENT_ADD', 'N', NULL),
(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
(4, 'LOG_SECTION_ADD', 'N', NULL),
(4, 'LOG_SECTION_DELETE', 'N', NULL),
(4, 'LOG_SECTION_EDIT', 'N', NULL),
(4, 'NAME', 'Y', ''),
(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'PREVIEW_TEXT', 'N', ''),
(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(4, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(4, 'SECTION_DESCRIPTION', 'N', NULL),
(4, 'SECTION_DESCRIPTION_TYPE', 'Y', NULL),
(4, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_NAME', 'Y', NULL),
(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";N;s:19:\"WATERMARK_TEXT_FONT\";N;s:20:\"WATERMARK_TEXT_COLOR\";N;s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";N;s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";N;s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";N;s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(4, 'SECTION_XML_ID', 'N', NULL),
(4, 'SORT', 'N', '0'),
(4, 'TAGS', 'N', ''),
(4, 'XML_ID', 'N', ''),
(4, 'XML_IMPORT_START_TIME', 'N', '2018-06-27 10:19:04');
-- -----------------------------------
-- Dumping table b_iblock_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_group` VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(1, 5, 'W'),
(2, 1, 'X'),
(2, 2, 'R'),
(2, 5, 'W'),
(3, 1, 'X'),
(3, 2, 'R'),
(3, 5, 'W'),
(4, 1, 'X'),
(4, 2, 'R'),
(4, 5, 'W');
-- -----------------------------------
-- Dumping table b_iblock_iblock_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_iproperty
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_messages
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_messages` VALUES
(1, 'ELEMENT_ADD', 'Добавить новость'),
(1, 'ELEMENT_DELETE', 'Удалить новость'),
(1, 'ELEMENT_EDIT', 'Изменить новость'),
(1, 'ELEMENT_NAME', 'Новость'),
(1, 'ELEMENTS_NAME', 'Новости'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(2, 'ELEMENT_ADD', 'Добавить товар'),
(2, 'ELEMENT_DELETE', 'Удалить товар'),
(2, 'ELEMENT_EDIT', 'Изменить товар'),
(2, 'ELEMENT_NAME', 'Элемент'),
(2, 'ELEMENTS_NAME', 'Товары'),
(2, 'SECTION_ADD', 'Добавить раздел'),
(2, 'SECTION_DELETE', 'Удалить раздел'),
(2, 'SECTION_EDIT', 'Изменить раздел'),
(2, 'SECTION_NAME', 'Раздел'),
(2, 'SECTIONS_NAME', 'Разделы'),
(3, 'ELEMENT_ADD', 'Добавить услугу'),
(3, 'ELEMENT_DELETE', 'Удалить услугу'),
(3, 'ELEMENT_EDIT', 'Изменить услугу'),
(3, 'ELEMENT_NAME', 'Услуга'),
(3, 'ELEMENTS_NAME', 'Услуги'),
(3, 'SECTION_ADD', 'Добавить раздел'),
(3, 'SECTION_DELETE', 'Удалить раздел'),
(3, 'SECTION_EDIT', 'Изменить раздел'),
(3, 'SECTION_NAME', 'Раздел'),
(3, 'SECTIONS_NAME', 'Разделы'),
(4, 'ELEMENT_ADD', 'Добавить вакансию'),
(4, 'ELEMENT_DELETE', 'Удалить вакансию'),
(4, 'ELEMENT_EDIT', 'Изменить вакансию'),
(4, 'ELEMENT_NAME', 'Вакансия'),
(4, 'ELEMENTS_NAME', 'Вакансии'),
(4, 'SECTION_ADD', 'Добавить раздел'),
(4, 'SECTION_DELETE', 'Удалить раздел'),
(4, 'SECTION_EDIT', 'Изменить раздел'),
(4, 'SECTION_NAME', 'Раздел'),
(4, 'SECTIONS_NAME', 'Разделы');
-- -----------------------------------
-- Dumping table b_iblock_offers_tmp
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property` VALUES
(1, '2018-06-27 10:19:01', 2, 'Специальное предложение', 'Y', 100, 'SPECIALOFFER', NULL, 'L', 1, 30, 'C', 'N', '5', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(2, '2018-06-27 10:19:01', 2, 'Цена', 'Y', 200, 'PRICE', NULL, 'N', 1, 30, 'L', 'N', '6', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(3, '2018-06-27 10:19:01', 2, 'Валюта цены (подпись)', 'Y', 300, 'PRICECURRENCY', NULL, 'L', 1, 30, 'C', 'N', '7', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(4, '2018-06-27 10:19:01', 2, 'Габариты (Д х Ш х В)', 'Y', 400, 'SIZE', NULL, 'S', 1, 30, 'L', 'N', '8', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(5, '2018-06-27 10:19:01', 2, 'Размеры спального места', 'Y', 500, 'S_SIZE', NULL, 'S', 1, 30, 'L', 'N', '9', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(6, '2018-06-27 10:19:01', 2, 'Артикул', 'Y', 600, 'ARTNUMBER', NULL, 'S', 1, 30, 'L', 'N', '10', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(7, '2018-06-27 10:19:01', 2, 'Материал', 'Y', 700, 'MATERIAL', NULL, 'S', 1, 30, 'L', 'N', '11', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL),
(8, '2018-06-27 10:19:01', 2, 'Производитель', 'Y', 800, 'MANUFACTURER', NULL, 'S', 1, 30, 'L', 'N', '12', NULL, 5, NULL, NULL, 'N', 'N', 'N', 'N', 1, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_property_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property_enum` VALUES
(1, 1, 'да', 'N', 500, 'Y', NULL),
(2, 3, 'руб.', 'Y', 10, 'corp_cf_cur_1', NULL),
(3, 3, '$', 'N', 20, 'corp_cf_cur_3', NULL),
(4, 3, '€', 'N', 30, 'corp_cf_cur_2', NULL);
-- -----------------------------------
-- Dumping table b_iblock_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_rss
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section` VALUES
(1, '2018-06-27 16:04:24', 1, '2018-06-27 10:19:01', 1, 2, NULL, 'Y', 'Y', 100, 'Мягкая мебель', 1, 1, 2, 1, 'Диваны, кресла и прочая мягкая мебель', 'html', 'МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ', '', '2', NULL, NULL, NULL),
(2, '2018-06-27 16:04:47', 1, '2018-06-27 10:19:01', 1, 2, NULL, 'Y', 'Y', 200, 'Офисная мебель', 2, 3, 4, 1, 'Диваны, столы, стулья', 'html', 'ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ', '', '3', NULL, NULL, NULL),
(3, '2018-06-27 18:05:01', 1, '2018-06-27 10:19:01', 1, 2, NULL, 'Y', 'Y', 300, 'Мебель для кухни', 3, 5, 6, 1, 'Полки, ящики, столы и стулья', 'html', 'МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ', '', '4', NULL, NULL, NULL),
(4, '2018-06-27 18:04:48', 1, '2018-06-27 10:19:01', 1, 2, NULL, 'Y', 'Y', 400, 'Детская мебель', 4, 7, 8, 1, 'Кровати, стулья, мягкая детская мебель', 'html', 'ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ', '', '5', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section_element` VALUES
(1, 4, NULL),
(1, 5, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 11, NULL),
(1, 12, NULL),
(1, 13, NULL),
(1, 14, NULL),
(2, 6, NULL),
(2, 7, NULL),
(2, 15, NULL),
(2, 16, NULL),
(2, 17, NULL),
(2, 18, NULL),
(2, 19, NULL),
(2, 20, NULL),
(3, 8, NULL),
(3, 21, NULL),
(3, 22, NULL),
(3, 23, NULL),
(4, 24, NULL),
(4, 25, NULL),
(4, 26, NULL),
(4, 27, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1');
-- -----------------------------------
-- Dumping table b_iblock_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type` VALUES
('news', 'N', NULL, NULL, 'Y', 50),
('products', 'Y', NULL, NULL, 'N', 100),
('vacancies', 'Y', NULL, NULL, 'N', 150);
-- -----------------------------------
-- Dumping table b_iblock_type_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type_lang` VALUES
('news', 'en', 'News', '', 'News'),
('news', 'ru', 'Новости', '', 'Новости'),
('products', 'en', 'Products and services', 'Sections', 'Products and services'),
('products', 'ru', 'Товары и услуги', 'Разделы', 'Товары и услуги'),
('vacancies', 'en', 'Job', 'Categories', 'Vacancies'),
('vacancies', 'ru', 'Вакансии', 'Разделы', 'Вакансии');
-- -----------------------------------
-- Dumping table b_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_lang` VALUES
('s1', 1, 'Y', 'Y', 'Cайт производства (Сайт по умолчанию)', '/', NULL, NULL, NULL, NULL, NULL, 'ru', NULL, 'N', NULL, 'Cайт производства', NULL, 1);
-- -----------------------------------
-- Dumping table b_lang_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_language
-- -----------------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_language` VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);
-- -----------------------------------
-- Dumping table b_list_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_list_rubric`;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_collection
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_collection_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_type` VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
-- -----------------------------------
-- Dumping table b_mobileapp_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_mobileapp_app`;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_mobileapp_config
-- -----------------------------------
DROP TABLE IF EXISTS `b_mobileapp_config`;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module` VALUES
('bitrix.sitecorporate', '2018-06-27 10:18:03'),
('bitrix.siteinfoportal', '2018-06-27 10:18:05'),
('bitrix.sitepersonal', '2018-06-27 10:18:05'),
('bitrixcloud', '2018-06-27 10:18:06'),
('blog', '2018-06-27 10:18:07'),
('clouds', '2018-06-27 10:18:09'),
('compression', '2018-06-27 10:18:09'),
('fileman', '2018-06-27 10:18:10'),
('form', '2018-06-27 10:18:11'),
('forum', '2018-06-27 10:18:12'),
('highloadblock', '2018-06-27 10:18:14'),
('iblock', '2018-06-27 10:18:15'),
('main', '2018-06-27 10:17:59'),
('mobileapp', '2018-06-27 10:18:18'),
('perfmon', '2018-06-27 10:18:18'),
('photogallery', '2018-06-27 10:18:19'),
('scale', '2018-06-27 10:18:20'),
('search', '2018-06-27 10:18:21'),
('security', '2018-06-27 10:18:22'),
('sender', '2018-06-27 10:18:23'),
('seo', '2018-06-27 10:18:25'),
('socialservices', '2018-06-27 10:18:27'),
('subscribe', '2018-06-27 10:18:29'),
('vote', '2018-06-27 10:18:31');
-- -----------------------------------
-- Dumping table b_module_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_group` VALUES
(1, 'main', 5, 'Q', NULL);
-- -----------------------------------
-- Dumping table b_module_to_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`,`MESSAGE_ID`,`TO_MODULE_ID`,`TO_CLASS`,`TO_METHOD`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_to_module` VALUES
(1, '2018-06-27 10:17:59', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
(2, '2018-06-27 10:17:59', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
(3, '2018-06-27 10:17:59', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
(4, '2018-06-27 10:17:59', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
(5, '2018-06-27 10:17:59', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
(6, '2018-06-27 10:17:59', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
(7, '2018-06-27 10:17:59', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
(8, '2018-06-27 10:17:59', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
(9, '2018-06-27 10:17:59', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
(10, '2018-06-27 10:17:59', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
(11, '2018-06-27 10:17:59', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
(12, '2018-06-27 10:17:59', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
(13, '2018-06-27 10:17:59', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
(14, '2018-06-27 10:17:59', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
(15, '2018-06-27 10:17:59', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
(16, '2018-06-27 10:17:59', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
(17, '2018-06-27 10:17:59', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
(18, '2018-06-27 10:17:59', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
(19, '2018-06-27 10:17:59', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
(20, '2018-06-27 10:17:59', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
(21, '2018-06-27 10:17:59', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
(22, '2018-06-27 10:17:59', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
(23, '2018-06-27 10:17:59', 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
(24, '2018-06-27 10:17:59', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
(25, '2018-06-27 10:17:59', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
(26, '2018-06-27 10:17:59', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
(27, '2018-06-27 10:17:59', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
(28, '2018-06-27 10:17:59', 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
(29, '2018-06-27 10:17:59', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
(30, '2018-06-27 10:17:59', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
(31, '2018-06-27 10:17:59', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
(32, '2018-06-27 10:17:59', 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1),
(33, '2018-06-27 10:17:59', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
(34, '2018-06-27 10:17:59', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
(35, '2018-06-27 10:17:59', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
(36, '2018-06-27 10:17:59', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
(37, '2018-06-27 10:17:59', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
(38, '2018-06-27 10:17:59', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
(39, '2018-06-27 10:17:59', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
(40, '2018-06-27 10:17:59', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
(41, '2018-06-27 10:17:59', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
(42, '2018-06-27 10:17:59', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
(43, '2018-06-27 10:17:59', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
(44, '2018-06-27 10:17:59', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
(45, '2018-06-27 10:17:59', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
(46, '2018-06-27 10:17:59', 100, 'sale', 'OnBasketAdd', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 1),
(47, '2018-06-27 10:17:59', 100, 'sale', 'OnOrderSave', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 1),
(48, '2018-06-27 10:17:59', 100, 'sale', 'OnSalePayOrder', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 1),
(49, '2018-06-27 10:18:03', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
(50, '2018-06-27 10:18:05', 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1),
(51, '2018-06-27 10:18:05', 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1),
(52, '2018-06-27 10:18:06', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', 1),
(53, '2018-06-27 10:18:06', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
(54, '2018-06-27 10:18:06', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
(55, '2018-06-27 10:18:07', 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1),
(56, '2018-06-27 10:18:07', 100, 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', 1),
(57, '2018-06-27 10:18:07', 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1),
(58, '2018-06-27 10:18:07', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1),
(59, '2018-06-27 10:18:07', 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(60, '2018-06-27 10:18:07', 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
(61, '2018-06-27 10:18:07', 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(62, '2018-06-27 10:18:07', 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
(63, '2018-06-27 10:18:07', 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1),
(64, '2018-06-27 10:18:07', 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1),
(65, '2018-06-27 10:18:07', 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1),
(66, '2018-06-27 10:18:07', 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1),
(67, '2018-06-27 10:18:07', 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1),
(68, '2018-06-27 10:18:07', 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1),
(69, '2018-06-27 10:18:07', 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1),
(70, '2018-06-27 10:18:07', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1),
(71, '2018-06-27 10:18:07', 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
(72, '2018-06-27 10:18:07', 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
(73, '2018-06-27 10:18:07', 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1),
(74, '2018-06-27 10:18:09', 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
(75, '2018-06-27 10:18:09', 100, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
(76, '2018-06-27 10:18:09', 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
(77, '2018-06-27 10:18:09', 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
(78, '2018-06-27 10:18:09', 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
(79, '2018-06-27 10:18:09', 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
(80, '2018-06-27 10:18:09', 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
(81, '2018-06-27 10:18:09', 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
(82, '2018-06-27 10:18:09', 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
(83, '2018-06-27 10:18:09', 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
(84, '2018-06-27 10:18:09', 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
(85, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObject', '', 1),
(86, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObject', '', 1),
(87, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObject', '', 1),
(88, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObject', '', 1),
(89, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObject', '', 1),
(90, '2018-06-27 10:18:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObject', '', 1),
(91, '2018-06-27 10:18:09', 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
(92, '2018-06-27 10:18:09', 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
(93, '2018-06-27 10:18:10', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
(94, '2018-06-27 10:18:10', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
(95, '2018-06-27 10:18:10', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
(96, '2018-06-27 10:18:10', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
(97, '2018-06-27 10:18:10', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
(98, '2018-06-27 10:18:10', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
(99, '2018-06-27 10:18:10', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
(100, '2018-06-27 10:18:10', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
(101, '2018-06-27 10:18:10', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
(102, '2018-06-27 10:18:10', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
(103, '2018-06-27 10:18:11', 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1),
(104, '2018-06-27 10:18:12', 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1),
(105, '2018-06-27 10:18:12', 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1),
(106, '2018-06-27 10:18:12', 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1),
(107, '2018-06-27 10:18:12', 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1),
(108, '2018-06-27 10:18:12', 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1),
(109, '2018-06-27 10:18:12', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1),
(110, '2018-06-27 10:18:12', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1),
(111, '2018-06-27 10:18:12', 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1),
(112, '2018-06-27 10:18:12', 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1),
(113, '2018-06-27 10:18:12', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1),
(114, '2018-06-27 10:18:12', 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1),
(115, '2018-06-27 10:18:12', 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1),
(116, '2018-06-27 10:18:12', 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1),
(117, '2018-06-27 10:18:12', 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1),
(118, '2018-06-27 10:18:12', 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1),
(119, '2018-06-27 10:18:12', 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1),
(120, '2018-06-27 10:18:12', 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1),
(121, '2018-06-27 10:18:12', 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1),
(122, '2018-06-27 10:18:12', 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1),
(123, '2018-06-27 10:18:12', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1),
(124, '2018-06-27 10:18:12', 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
(125, '2018-06-27 10:18:12', 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
(126, '2018-06-27 10:18:12', 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1),
(127, '2018-06-27 10:18:12', 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1),
(128, '2018-06-27 10:18:14', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
(129, '2018-06-27 10:18:14', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
(130, '2018-06-27 10:18:14', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
(131, '2018-06-27 10:18:14', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
(132, '2018-06-27 10:18:14', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
(133, '2018-06-27 10:18:15', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
(134, '2018-06-27 10:18:15', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
(135, '2018-06-27 10:18:15', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
(136, '2018-06-27 10:18:15', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
(137, '2018-06-27 10:18:15', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
(138, '2018-06-27 10:18:15', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
(139, '2018-06-27 10:18:15', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
(140, '2018-06-27 10:18:15', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
(141, '2018-06-27 10:18:15', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
(142, '2018-06-27 10:18:15', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
(143, '2018-06-27 10:18:15', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
(144, '2018-06-27 10:18:15', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
(145, '2018-06-27 10:18:15', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
(146, '2018-06-27 10:18:15', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
(147, '2018-06-27 10:18:15', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Date_GetUserTypeDescription', '', 1),
(148, '2018-06-27 10:18:15', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_DateTime_GetUserTypeDescription', '', 1),
(149, '2018-06-27 10:18:15', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_XmlID_GetUserTypeDescription', '', 1),
(150, '2018-06-27 10:18:15', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_FileMan_GetUserTypeDescription', '', 1),
(151, '2018-06-27 10:18:15', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_HTML_GetUserTypeDescription', '', 1),
(152, '2018-06-27 10:18:15', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementList_GetUserTypeDescription', '', 1),
(153, '2018-06-27 10:18:15', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Sequence_GetUserTypeDescription', '', 1),
(154, '2018-06-27 10:18:15', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementAutoComplete_GetUserTypeDescription', '', 1),
(155, '2018-06-27 10:18:15', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SKU_GetUserTypeDescription', '', 1),
(156, '2018-06-27 10:18:15', 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SectionAutoComplete_GetUserTypeDescription', '', 1),
(157, '2018-06-27 10:18:18', 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1),
(158, '2018-06-27 10:18:18', 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1),
(159, '2018-06-27 10:18:19', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1),
(160, '2018-06-27 10:18:19', 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1),
(161, '2018-06-27 10:18:19', 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1),
(162, '2018-06-27 10:18:19', 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1),
(163, '2018-06-27 10:18:20', 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1),
(164, '2018-06-27 10:18:21', 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
(165, '2018-06-27 10:18:21', 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
(166, '2018-06-27 10:18:21', 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
(167, '2018-06-27 10:18:21', 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
(168, '2018-06-27 10:18:21', 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
(169, '2018-06-27 10:18:21', 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
(170, '2018-06-27 10:18:21', 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
(171, '2018-06-27 10:18:21', 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
(172, '2018-06-27 10:18:21', 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
(173, '2018-06-27 10:18:22', 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1),
(174, '2018-06-27 10:18:22', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1),
(175, '2018-06-27 10:18:22', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1),
(176, '2018-06-27 10:18:22', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1),
(177, '2018-06-27 10:18:22', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1),
(178, '2018-06-27 10:18:22', 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1),
(179, '2018-06-27 10:18:22', 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1),
(180, '2018-06-27 10:18:23', 100, 'main', 'OnMailEventMailRead', 'sender', '', 'bitrix\\sender\\postingmanager', 'onMailEventMailRead', '', 1),
(181, '2018-06-27 10:18:23', 100, 'main', 'OnMailEventMailClick', 'sender', '', 'bitrix\\sender\\postingmanager', 'onMailEventMailClick', '', 1),
(182, '2018-06-27 10:18:23', 100, 'main', 'OnMailEventSubscriptionDisable', 'sender', '', 'Bitrix\\Sender\\Subscription', 'onMailEventSubscriptionDisable', '', 1),
(183, '2018-06-27 10:18:23', 100, 'main', 'OnMailEventSubscriptionEnable', 'sender', '', 'Bitrix\\Sender\\Subscription', 'onMailEventSubscriptionEnable', '', 1),
(184, '2018-06-27 10:18:23', 100, 'main', 'OnMailEventSubscriptionList', 'sender', '', 'Bitrix\\Sender\\Subscription', 'onMailEventSubscriptionList', '', 1),
(185, '2018-06-27 10:18:23', 100, 'sender', 'OnConnectorList', 'sender', '', 'bitrix\\sender\\connectormanager', 'onConnectorListContact', '', 1),
(186, '2018-06-27 10:18:23', 100, 'sender', 'OnConnectorList', 'sender', '', 'bitrix\\sender\\connectormanager', 'onConnectorListRecipient', '', 1),
(187, '2018-06-27 10:18:23', 100, 'sender', 'OnPresetTemplateList', 'sender', '', 'Bitrix\\Sender\\Preset\\TemplateBase', 'onPresetTemplateList', '', 1),
(188, '2018-06-27 10:18:23', 100, 'sender', 'OnPresetTemplateList', 'sender', '', 'Bitrix\\Sender\\TemplateTable', 'onPresetTemplateList', '', 1),
(189, '2018-06-27 10:18:23', 100, 'sender', 'OnPresetMailBlockList', 'sender', '', 'Bitrix\\Sender\\Preset\\MailBlockBase', 'OnPresetMailBlockList', '', 1),
(190, '2018-06-27 10:18:23', 100, 'sender', 'OnTriggerList', 'sender', '', 'bitrix\\sender\\triggermanager', 'onTriggerList', '', 1),
(191, '2018-06-27 10:18:23', 100, 'sender', 'OnAfterRecipientUnsub', 'sender', '', 'Bitrix\\Sender\\TriggerManager', 'onAfterRecipientUnsub', '', 1),
(192, '2018-06-27 10:18:23', 100, 'sender', 'OnAfterRecipientClick', 'sender', '', 'Bitrix\\Sender\\Internals\\ConversionHandler', 'onAfterRecipientClick', '', 1),
(193, '2018-06-27 10:18:23', 100, 'conversion', 'OnSetDayContextAttributes', 'sender', '', 'Bitrix\\Sender\\Internals\\ConversionHandler', 'onSetDayContextAttributes', '', 1),
(194, '2018-06-27 10:18:23', 100, 'main', 'OnBeforeProlog', 'sender', '', 'Bitrix\\Sender\\Internals\\ConversionHandler', 'onBeforeProlog', '', 1),
(195, '2018-06-27 10:18:23', 100, 'conversion', 'OnGetAttributeTypes', 'sender', '', 'Bitrix\\Sender\\Internals\\ConversionHandler', 'onGetAttributeTypes', '', 1),
(196, '2018-06-27 10:18:24', 100, 'sender', 'OnAfterMailingChainSend', 'sender', '', 'Bitrix\\Sender\\TriggerManager', 'onAfterMailingChainSend', '', 2),
(197, '2018-06-27 10:18:24', 100, 'sender', 'OnAfterPostingSendRecipient', 'sender', '', 'Bitrix\\Sender\\TriggerManager', 'onAfterPostingSendRecipient', '', 2),
(198, '2018-06-27 10:18:25', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
(199, '2018-06-27 10:18:25', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
(200, '2018-06-27 10:18:25', 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
(201, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
(202, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
(203, '2018-06-27 10:18:25', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
(204, '2018-06-27 10:18:25', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
(205, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
(206, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
(207, '2018-06-27 10:18:25', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
(208, '2018-06-27 10:18:25', 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
(209, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
(210, '2018-06-27 10:18:25', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
(211, '2018-06-27 10:18:25', 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
(212, '2018-06-27 10:18:25', 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
(213, '2018-06-27 10:18:25', 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
(214, '2018-06-27 10:18:25', 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
(215, '2018-06-27 10:18:25', 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
(216, '2018-06-27 10:18:25', 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2),
(217, '2018-06-27 10:18:25', 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2),
(218, '2018-06-27 10:18:25', 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2),
(219, '2018-06-27 10:18:25', 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2),
(220, '2018-06-27 10:18:25', 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2),
(221, '2018-06-27 10:18:25', 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2),
(222, '2018-06-27 10:18:27', 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
(223, '2018-06-27 10:18:27', 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
(224, '2018-06-27 10:18:27', 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
(225, '2018-06-27 10:18:27', 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
(226, '2018-06-27 10:18:27', 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
(227, '2018-06-27 10:18:29', 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1),
(228, '2018-06-27 10:18:29', 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1),
(229, '2018-06-27 10:18:29', 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1),
(230, '2018-06-27 10:18:29', 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1),
(231, '2018-06-27 10:18:29', 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1),
(232, '2018-06-27 10:18:31', 100, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1),
(233, '2018-06-27 10:18:31', 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'CUserTypeVote', 'GetUserTypeDescription', '', 1),
(234, '2018-06-27 10:18:31', 200, 'main', 'OnUserLogin', 'vote', '', 'CVoteUser', 'OnUserLogin', '', 1),
(235, '2018-06-27 10:18:31', 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1),
(236, '2018-06-27 10:18:42', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1);
-- -----------------------------------
-- Dumping table b_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_operation` VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'clouds_browse', 'clouds', NULL, 'module'),
(37, 'clouds_upload', 'clouds', NULL, 'module'),
(38, 'clouds_config', 'clouds', NULL, 'module'),
(39, 'fileman_view_all_settings', 'fileman', '', 'module'),
(40, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(41, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(42, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(43, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(44, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(45, 'fileman_admin_files', 'fileman', '', 'module'),
(46, 'fileman_admin_folders', 'fileman', '', 'module'),
(47, 'fileman_view_permissions', 'fileman', '', 'module'),
(48, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(49, 'fileman_upload_files', 'fileman', '', 'module'),
(50, 'fileman_view_file_structure', 'fileman', '', 'module'),
(51, 'fileman_install_control', 'fileman', '', 'module'),
(52, 'medialib_view_collection', 'fileman', '', 'medialib'),
(53, 'medialib_new_collection', 'fileman', '', 'medialib'),
(54, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(55, 'medialib_del_collection', 'fileman', '', 'medialib'),
(56, 'medialib_access', 'fileman', '', 'medialib'),
(57, 'medialib_new_item', 'fileman', '', 'medialib'),
(58, 'medialib_edit_item', 'fileman', '', 'medialib'),
(59, 'medialib_del_item', 'fileman', '', 'medialib'),
(60, 'sticker_view', 'fileman', '', 'stickers'),
(61, 'sticker_edit', 'fileman', '', 'stickers'),
(62, 'sticker_new', 'fileman', '', 'stickers'),
(63, 'sticker_del', 'fileman', '', 'stickers'),
(64, 'section_read', 'iblock', NULL, 'iblock'),
(65, 'element_read', 'iblock', NULL, 'iblock'),
(66, 'section_element_bind', 'iblock', NULL, 'iblock'),
(67, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(68, 'element_edit', 'iblock', NULL, 'iblock'),
(69, 'element_edit_price', 'iblock', NULL, 'iblock'),
(70, 'element_delete', 'iblock', NULL, 'iblock'),
(71, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(72, 'section_edit', 'iblock', NULL, 'iblock'),
(73, 'section_delete', 'iblock', NULL, 'iblock'),
(74, 'section_section_bind', 'iblock', NULL, 'iblock'),
(75, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(76, 'iblock_edit', 'iblock', NULL, 'iblock'),
(77, 'iblock_delete', 'iblock', NULL, 'iblock'),
(78, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(79, 'iblock_export', 'iblock', NULL, 'iblock'),
(80, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(81, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(82, 'security_filter_bypass', 'security', NULL, 'module'),
(83, 'security_edit_user_otp', 'security', NULL, 'module'),
(84, 'security_module_settings_read', 'security', NULL, 'module'),
(85, 'security_panel_view', 'security', NULL, 'module'),
(86, 'security_filter_settings_read', 'security', NULL, 'module'),
(87, 'security_otp_settings_read', 'security', NULL, 'module'),
(88, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
(89, 'security_session_settings_read', 'security', NULL, 'module'),
(90, 'security_redirect_settings_read', 'security', NULL, 'module'),
(91, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
(92, 'security_iprule_settings_read', 'security', NULL, 'module'),
(93, 'security_antivirus_settings_read', 'security', NULL, 'module'),
(94, 'security_frame_settings_read', 'security', NULL, 'module'),
(95, 'security_module_settings_write', 'security', NULL, 'module'),
(96, 'security_filter_settings_write', 'security', NULL, 'module'),
(97, 'security_otp_settings_write', 'security', NULL, 'module'),
(98, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
(99, 'security_session_settings_write', 'security', NULL, 'module'),
(100, 'security_redirect_settings_write', 'security', NULL, 'module'),
(101, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
(102, 'security_iprule_settings_write', 'security', NULL, 'module'),
(103, 'security_file_verifier_sign', 'security', NULL, 'module'),
(104, 'security_file_verifier_collect', 'security', NULL, 'module'),
(105, 'security_file_verifier_verify', 'security', NULL, 'module'),
(106, 'security_antivirus_settings_write', 'security', NULL, 'module'),
(107, 'security_frame_settings_write', 'security', NULL, 'module'),
(108, 'seo_settings', 'seo', '', 'module'),
(109, 'seo_tools', 'seo', '', 'module');
-- -----------------------------------
-- Dumping table b_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_option` VALUES
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'admin_passwordh', 'FVoQf2YUBgYtCUVcDxcACgsTAQ==', NULL, NULL),
('main', 'server_uniq_id', 'f17e2d278725b4b98897f994958c71c8', NULL, NULL),
('blog', 'socNetNewPerms', 'Y', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('forum', 'FILTER_DICT_W', '1', NULL, 'ru'),
('forum', 'FILTER_DICT_T', '2', NULL, 'ru'),
('forum', 'FILTER_DICT_W', '3', NULL, 'en'),
('forum', 'FILTER_DICT_T', '4', NULL, 'en'),
('forum', 'FILTER', 'N', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_0d71378e89ee02f1278289bc6b43b1c0', NULL, NULL),
('vote', 'VOTE_DIR', '', NULL, NULL),
('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
('main', 'email_from', 'Esenin@mail.ru', NULL, NULL),
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'menutypes', 'a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}', NULL, 's1'),
('main', 'wizard_template_id', 'furniture', NULL, 's1'),
('main', 'wizard_site_logo', '0', NULL, 's1'),
('main', 'wizard_furniture_theme_id', 'red', NULL, 's1'),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('fileman', 'propstypes', 'a:5:{s:11:\\\"description\\\";s:33:\\\"Описание страницы\\\";s:8:\\\"keywords\\\";s:27:\\\"Ключевые слова\\\";s:5:\\\"title\\\";s:44:\\\"Заголовок окна браузера\\\";s:14:\\\"keywords_inner\\\";s:35:\\\"Продвигаемые слова\\\";s:11:\\\"specialdate\\\";s:20:\\\"Тэг \\\"specialdate\\\"\\\";}', NULL, 's1'),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', NULL, NULL),
('main', 'wizard_firstcorp_furniture_s1', 'Y', NULL, NULL),
('main', 'wizard_solution', 'corp_furniture', NULL, 's1'),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_pspell', 'N', NULL, NULL),
('fileman', 'GROUP_DEFAULT_TASK', '16', NULL, NULL),
('fileman', 'default_edit', 'text', NULL, NULL),
('fileman', 'use_medialib', 'Y', NULL, NULL),
('fileman', 'replace_new_lines', 'Y', NULL, NULL),
('fileman', 'user_dics_path', '/bitrix/modules/fileman/u_dics', NULL, NULL),
('fileman', 'use_separeted_dics', 'N', NULL, NULL),
('fileman', 'use_custom_spell', 'N', NULL, NULL),
('fileman', 'ar_entities', 'none', NULL, NULL),
('fileman', 'editor_body_id', '', NULL, NULL),
('fileman', 'editor_body_class', '', NULL, NULL),
('fileman', 'ml_thumb_width', '140', NULL, NULL),
('fileman', 'ml_thumb_height', '105', NULL, NULL),
('fileman', 'ml_media_extentions', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt', NULL, NULL),
('fileman', 'ml_max_width', '1024', NULL, NULL),
('fileman', 'ml_max_height', '1024', NULL, NULL),
('fileman', 'ml_media_available_ext', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt,aac', NULL, NULL),
('fileman', 'ml_use_default', '1', NULL, NULL),
('fileman', '~script_files', 'php,php3,php4,php5,php6,phtml,pl,asp,aspx,cgi,exe,ico,shtm,shtml', NULL, NULL),
('fileman', '~allowed_components', '', NULL, NULL),
('fileman', 'num_menu_param', '1', NULL, 's1'),
('fileman', 'search_max_open_file_size', '1024', NULL, NULL),
('fileman', 'search_max_res_count', '', NULL, NULL),
('fileman', 'search_time_step', '5', NULL, NULL),
('fileman', 'search_mask', '*.php', NULL, NULL),
('fileman', 'show_inc_icons', 'N', NULL, NULL),
('fileman', 'hide_physical_struc', '', NULL, NULL),
('fileman', 'use_translit', '1', NULL, NULL),
('fileman', 'use_translit_google', '1', NULL, NULL),
('fileman', 'log_menu', 'Y', NULL, NULL),
('fileman', 'log_page', 'Y', NULL, NULL),
('fileman', 'use_code_editor', 'Y', NULL, NULL),
('fileman', 'default_edit_groups', '', NULL, NULL),
('fileman', 'archive_step_time', '30', NULL, NULL),
('fileman', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('main', 'dump_bucket_id', '0', NULL, NULL),
('main', 'dump_encrypt', '0', NULL, NULL),
('main', 'dump_use_compression', '0', NULL, NULL),
('main', 'skip_symlinks', '0', NULL, NULL),
('main', 'dump_max_exec_time', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep', '3', NULL, NULL),
('main', 'dump_archive_size_limit', '104857600', NULL, NULL),
('main', 'dump_max_file_size', '0', NULL, NULL),
('main', 'dump_file_public', '1', NULL, NULL),
('main', 'dump_file_kernel', '0', NULL, NULL),
('main', 'dump_base', '1', NULL, NULL),
('main', 'dump_base_skip_stat', '0', NULL, NULL),
('main', 'dump_base_skip_search', '0', NULL, NULL),
('main', 'dump_base_skip_log', '0', NULL, NULL),
('main', 'dump_integrity_check', '1', NULL, NULL),
('main', 'dump_do_clouds', '0', NULL, NULL),
('main', 'skip_mask', '0', NULL, NULL),
('main', 'dump_site_id', 'a:0:{}', NULL, NULL);
-- -----------------------------------
-- Dumping table b_perf_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_cluster
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_error
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_hit
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_ban
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_complete
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_suggest
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_index_suggest_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL DEFAULT '0',
  `SQL_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_sql
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_sql_backtrace
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL DEFAULT '0',
  `NN` int(18) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_tab_column_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_tab_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_perf_test
-- -----------------------------------
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_posting
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting`;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_posting_email
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_email`;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_posting_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_file`;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_posting_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_group`;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_posting_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_posting_rubric`;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating` VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2018-06-27 10:17:59', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2018-06-27 10:17:59', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
-- -----------------------------------
-- Dumping table b_rating_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_component_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_rule
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_rule` VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-06-27 10:17:59', '2018-06-27 10:17:59', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-06-27 10:17:59', '2018-06-27 10:17:59', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-06-27 10:17:59', '2018-06-27 10:17:59', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-06-27 10:17:59', '2018-06-27 10:17:59', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.10000000000000001;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.10000000000000001;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2018-06-27 10:17:59', '2018-06-27 10:17:59', NULL);
-- -----------------------------------
-- Dumping table b_rating_rule_vetting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_user` VALUES
(1, 2, 1, 3.0000, 30.0000, 13);
-- -----------------------------------
-- Dumping table b_rating_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_vote_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_vote_group` VALUES
(1, 1, 'R'),
(2, 3, 'R'),
(3, 1, 'R'),
(4, 3, 'R'),
(5, 1, 'A'),
(6, 4, 'A');
-- -----------------------------------
-- Dumping table b_rating_voting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_voting_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_weight
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_weight` VALUES
(1, -1000000.0000, 1000000.0000, 1.0000, 10);
-- -----------------------------------
-- Dumping table b_search_content
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_search_content` VALUES
(1, '2018-06-27 10:18:57', 'main', 's1|/services/index.php', 0, NULL, NULL, NULL, '/services/index.php', 'Услуги', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(2, '2018-06-27 10:18:57', 'main', 's1|/search/index.php', 0, NULL, NULL, NULL, '/search/index.php', 'Поиск', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(3, '2018-06-27 10:18:57', 'main', 's1|/search/map.php', 0, NULL, NULL, NULL, '/search/map.php', 'Карта сайта', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(4, '2018-06-27 10:18:57', 'main', 's1|/_index.php', 0, NULL, NULL, NULL, '/_index.php', 'Мебельная компания', 'Наша компания существует на Российском рынке с 1992 года. За это время «Мебельная компания» прошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России.\n«Мебельная компания» осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход – с другой.\nНаша продукция\rНаши услуги', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(5, '2018-06-27 10:18:57', 'main', 's1|/products/index.php', 0, NULL, NULL, NULL, '/products/index.php', 'Продукция', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(6, '2018-06-27 11:28:27', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Новости', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(7, '2018-06-27 10:18:57', 'main', 's1|/login/index.php', 0, NULL, NULL, NULL, '/login/index.php', 'Вход на сайт', 'Вы зарегистрированы и успешно авторизовались.\rВернуться на главную страницу', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(8, '2018-06-27 10:18:57', 'main', 's1|/contacts/index.php', 0, NULL, NULL, NULL, '/contacts/index.php', 'Контакты', 'Обратитесь к нашим специалистам и получите профессиональную консультацию по вопросам создания и покупки мебели (от дизайна, разработки технического задания до доставки мебели к Вам домой).\rВы можете обратиться к нам по телефону, по электронной почте или договориться о встрече в нашем офисе. Будем рады помочь вам и ответить на все ваши вопросы. \rТелефоны\rТелефон/факс:\n(495) 212-85-06\rТелефоны:\n(495) 212-85-07\r(495) 212-85-08\rEmail\rinfo@example.ru\r&mdash; общие вопросы\rsales@example.ru\r&mdash; приобретение продукции\rmarketing@example.ru\r&mdash; маркетинг/мероприятия/PR\rОфис в Москве', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(9, '2018-06-27 10:18:57', 'main', 's1|/company/index.php', 0, NULL, NULL, NULL, '/company/index.php', 'О компании', 'Наша компания существует на Российском рынке с 1992 года. За это время \r&laquo;Мебельная компания&raquo;\rпрошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России. 						 \rГлавное правило - индивидуальный подход к каждому клиенту\rНа сегодняшний день нами разработано более пятисот моделей для офиса и дома. Вместе с тем мы стремимся обеспечить неповторимость своей продукции. Мы изготовим мебель для кухни, детской, гостиной, спальной или ванной комнаты, мебель для офиса особого дизайна и нестандартного размера. \rНаши дизайнеры произведут замеры помещения и вместе с вами разработают дизайн-проект мебели для вашего интерьера, подобрав с высокой точностью размеры, модели, цвета, помогут оптимально расположить мебель. \rВаш проект будет создан с учетом всех нюансов и прорисовкой мельчайших деталей. Результаты совместного творчества вы сможете посмотреть в объемном представлении. Вам наглядно продемонстрируют, как будут выглядеть в жизни выбранные элементы интерьера при разном освещении, в конкретном помещении, сделанные из определенных материалов. В ваше распоряжение будет предоставлено много различных вариантов, из которых Вы сможете выбрать наиболее подходящий именно Вам. 						 					\rЗаказ будет выполнен и доставлен точно в срок. Все работы по сборке и установке мебели осуществляют сотрудники нашей компании. Строгий контроль качества осуществляется на всех этапах работ: от момента оформления заказа до момента приема выполненных работ. \rПередовые технологии и бесценный опыт\rИспользование передовых компьютерных технологий, многолетний опыт наших специалистов позволяют произвести грамотные расчеты и снизить расход материалов и себестоимость продукции, избежать ошибок при проектировании и оптимизировать дизайн комплексных интерьеров. Гарантия на нашу продукцию составляет 18 месяцев, а на отдельную продукцию 36 месяцев. \rМы гордимся нашими сотрудниками прошедшими профессиональное обучение в лучших учебных заведениях России и зарубежья. У нас трудятся высококлассные специалисты разных возрастов. Мы ценим энтузиазм молодежи и бесценный опыт старшего поколения. Все мы разные, но нас объединяет преданность своему делу и вера в идеи нашей компании. \rВысочайшие стандарты качества - залог нашего успеха\r&laquo;Мебельная компания&raquo;\rосуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход &ndash; с другой. \rЕжегодно наша продукция проходит сертификационные испытания в специализированных лабораториях России и имеет сертификаты соответствия продукции нормам безопасности и качества. Кроме того, \r&laquo;Мебельная компания&raquo;\rодной из первых среди мебельных производителей России в 2003 году прошла аудит на соответствие требованиям системы менеджмента качества &laquo;ИСО 9000&raquo; и получила сертификат соответствия системы качества на предприятии нормам международного стандарта.', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(10, '2018-06-27 10:18:57', 'main', 's1|/company/mission.php', 0, NULL, NULL, NULL, '/company/mission.php', 'Миссия и стратегия', '&laquo;Мебельная компания&raquo;\r- динамично развивающееся производственное 							предприятие, которое имеет перед собой \nясно выраженные цели и инструменты для 							их достижени.Мы предоставляем каждому лучшую возможность обустроить свое жизненное \nи рабочее пространство.Мы работаем на долгосрочную перспективу и предлагаем оптимальные 							решения. Компания \r&laquo;Мебельная компания&raquo;\r- \nнадежный, технологичный, гибкий поставщик 							с большими мощностями. 						\rЦели и задачи\rОправдывать ожидания заказчика: &ldquo;Клиент всегда прав&rdquo;. Только Потребитель формирует 									единую систему взглядов на качество \nвыпускаемой продукции и работ.\rДобиться от работников компании понимания их личной ответственности за качество 									работ.\rПутем повышения качества продукции и работ постоянно увеличивать объемы производства 									с целью последующего реинвестирования \nприбыли в развитие компании.\rОбеспечивать строгое соответствие производимой продукции требованиям потребителей, 									нормам и правилам \nбезопасности, требованиям защиты окружающей среды.\rПолитика компании\rПостоянное совершенствование системы качества. Своевременное и эффективное принятие 									корректирующих мер .\rЗабота о работниках компании. Создание условий труда и оснащение рабочих мест, соответствующих 									всем санитарным \nи гигиеническим нормам.\rПовышение благосостояния сотрудников. Обеспечение морального и материального удовлетворения 									работников компании.\rСистематическое обучение работников всех уровней с целью постоянного повышения их 									профессионального мастерства.\rВнедрение высокопроизводительного оборудования и новейших технологий для повышения 									производительности труда, \nоптимизации затрат и, как результат, снижения цен 									на выпускаемую продукцию.\rСоздание новых рабочих мест. Привлечение на работу специалистов высокой квалификации.\rВыход на международный рынок.\rМы развиваем доверительные взаимовыгодные отношения со своими партнерами в долгосрочных 							интересах нашего бизнеса. \n&laquo;Мебельная компания&raquo;\rответственно относится 							к выполнению взятых на себя обязательств и ждет такого же \nподхода к делу от 							своих партнеров по бизнесу. Эта требовательность &ndash; залог нашей долгосрочной прибыльности. 						\rСо дня своего основания \r&laquo;Мебельная компания&raquo;\rсодействует росту благосостояния 							регионов России. Мы понимаем важность \nсоциальной ответственности нашей Компании 							и останемся примером в вопросах социальной защищенности наших сотрудников.', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(11, '2018-06-27 10:18:57', 'main', 's1|/company/management.php', 0, NULL, NULL, NULL, '/company/management.php', 'Руководство', 'Успешное развитие бизнеса &ndash; во многом результат квалифицированной работы руководства. 							\r&laquo;Мебельная компания&raquo;\rна мебельном рынке уже 18 лет. За это время Компания 							не только сохранила, но и упрочила лидирующие позиции среди ведущих игроков мебельного 							рынка. 						\r&laquo;Мебельная компания&raquo;\rиз года в год расширяет ассортимент выпускаемой продукции, 							наращивает темпы и объемы производства, увеличивает производственные и складские 							площади, развивает отношения с партнерами со всех регионов страны и налаживает связи 							с зарубежными партнерами. В большой степени это заслуга хорошо подготовленного руководящего 							состава и его грамотной политики. 						\rСобственник Компании &laquo;Мебельная компания&raquo;\rКолесников Виктор Федорович 								\rРодился 3 сентября 1964 года.\nОбразование: закончил авиационный факультет Воронежского 									государственного политехнического института. В 1994 году прошел обучение по программе 									&laquo;Подготовка малого и среднего бизнеса&raquo; в США.\nВ настоящее время Виктор Федорович 									возглавляет Управляющую компанию, которая координирует деятельность предприятий, 									входящих в Группу Компаний \r&laquo;Мебельная компания&raquo;\r. 								\rГенеральный директор &laquo;Мебельной компании&raquo;\rРатченко Александр Петрович 								\rРодился 5 июня 1962 года.\nОбразование: Воронежский политехнический институт 									по специальности инженер-технолог; программа &laquo;Эффективное развитие производства&raquo; 									(США).\nВ \r&laquo;Мебельной компании&raquo;\rСергей Фомич с 1994 года. За это время прошел 									путь от начальника цеха до генерального директора предприятия. 								\rЗаместитель генерального директора Управляющей компании\rРоговой Андрей Владимирович 								\rОбразование: факультет радиотехники Воронежского государственного технического университета.\nВ Компании с 1 июня 2000 года.', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(12, '2018-06-27 10:18:57', 'main', 's1|/company/history.php', 0, NULL, NULL, NULL, '/company/history.php', 'История', '1992г. 								\r&laquo;Мебельная компания&raquo;\rначиналась с изготовления мебели для школ и офисов. Первое 									производство мебели располагалось в арендуемой мастерской, площадью 400 м2 с одним 									деревообрабатывающим станком. В компании работало двадцать человек. Все заработанные 									средства вкладывались в развитие, что позволило молодой Компании расти быстрыми 									темпами. 								\r1993г. 								\rВведен в эксплуатацию новый цех площадью 700 м2, ставший первой собственностью 									\r&laquo;Мебельной компании&raquo;\r. Модернизация производственной базы предприятия стала хорошей 									традицией. Компания постепенно перешла к более совершенному оборудованию, что позволило 									повысить уровень качества выпускаемой продукции и значительно увеличить объемы производства. 								\r1998г. 								\rВ Воронеже открыт первый фирменный магазин-салон \r&laquo;Мебельная компания&raquo;\r. Шаг за шагом 									продукция предприятия завоевывала регионы Сибири и Урала, Москвы и Подмосковья, 									Юга и Северо-Запада России. Производственные площади компании увеличены до 5000 									м2. 								\r1999г. 								\r&laquo;Мебельная компания&raquo;\rстала дипломантом одной из самых престижных международных 									выставок \r&laquo;ЕвроЭкспоМебель-99&raquo;\r- первое официальное признание мебельной продукции 									&laquo;Мебельной компании&raquo;. В этом же году компания выходит на мировой рынок. Был заключен 									ряд контрактов на поставку мебели в страны СНГ и Ближнего Зарубежья. 								\r2000г. 								\rКоллектив компании насчитывает более 500 сотрудников. Заключаются новые контракт 									на поставку мебели в европейские страны. 								\r2002г. 								\r&laquo;Мебельная компания&raquo;\rвошла в десятку лучших производителей мебели по данным ведущих 									мебельных салонов России, а также в число лидеров организационного развития. 								\r2003г. 								\rПриступили к строительству склада материалов. В Москве открыт филиал компании. \nПроведена первая конференция партнеров, результатом которой стало укрепление взаимовыгодных 									отношений и заключение дилерских договоров. 								\r2004г. 								\rЗавершено строительство и оснащение нового производственного корпуса и склада материалов. \nРасширено представительство компании на российском рынке и за рубежом. \nОткрыто 									региональное представительство \r&laquo;Мебельной компании&raquo;\rв Екатеринбурге. 								\r2005г. 								\rКомпания приобретает новое производственное оборудование концерна - угловую линию 									раскроя материалов и линию загрузки выгрузки. \nНачинается выпуск продукции в 									натуральном шпоне. Формируется отдельный склад материалов и комплектующих. \nВ этом же году открывается Фабрика мягкой мебели \r&laquo;МебельПлюс&raquo;\r2006г. 								\rОткрыты региональные представительства \r&laquo;Мебельной компании&raquo;\rв Санкт-Петербурге 									и Нижнем Новгороде. \nРазвивается собственная розничная сеть фирменных магазинов-салонов 									на территории России. 								\r2007г. 								\rЗавершено строительство второй фабрики. Общая площадь производсвенно-складских корпусов 									Компании составляет уже более 30000 м2. \nПроведена вторая конференция партнеров 									компании \r\"Технология успешного бизнеса\"\r. 								\r2008г. 								\rОткрыто новое предприятие для производства мебели по индивидуальным проектам \r&laquo;Комфорт&raquo;\r. \n&laquo;Мебельная компания&raquo;\rпродолжает обновление оборудования. 								\r2008г. 								\rНовейшим оборудованием укомплектована вторая фабрика. Запущена вторая производственная 									линия. \nПроведена третья конференция \r&laquo;Партнерство - бизнес сегодня&raquo;\rПринято решение о строительстве третьей фабрики. Площадь производственно &mdash; складских 									корпусов составит более 70000м2. \nПо всей стране и зарубежом открыто 37 мебельных 									салонов. \nВ Компании работает более полутора тысяч сотрудников.', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(13, '2018-06-27 10:18:57', 'main', 's1|/company/vacancies.php', 0, NULL, NULL, NULL, '/company/vacancies.php', 'Вакансии', '', '', '', '', 'f722e729490083e8369cd5cf3687bd81', NULL, NULL),
(14, '2010-05-25 00:00:00', 'iblock', '1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news&IBLOCK_EXTERNAL_ID=furniture_news&CODE=', 'Мебельный форум Беларуси', 'С 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году.\r\n\rС 20 по 23 апреля 2010 года состоится \rМебельный Форум Беларуси\r&ndash; важнейшее мероприятии отрасли в текущем году. В экспозиции принимают участие свыше 160 компаний из \rБеларуси, Австрии, Латвии, Литвы, России, Польши \rи\rУкраины\r. В составе форума состоится пять выставок:\"Минский мебельный салон\", \"Мебельные технологии\", \"ОфисКомфорт\", \"Кухня\" и \"Домотех\". Экспозиция будет строиться по принципу двух тематических секторов:\rготовой мебели\rи \rматериалов для ее производства\r.\rВ секторе готовой мебели будут представлены:\rкорпусная и мягкая мебель;\rмебель для детей и молодежи;\rпредметы интерьера;\rкухонная мебель;\rмебель для офиса и административных зданий.\rВ секторе материалов для производства мебели будут демонстрироваться новинки рынка мебельной фурнитуры, материалов, обивочных тканей, элементов и аксессуаров для производства мебели.\rПомимо расширенной экспозиции пяти тематических выставок \"Экспофорум\" подготовил разнообразную деловую программу Мебельного форума. В рамках выставки состоятся семинары и мастер-классы. И поистине масштабным в этом году обещает стать республиканский конкурс форума \"\rНародное признание\r\". В этом году он выходит за рамки выставки и становится республиканским смотром образцов мебели.\rМебельный Форум\rпредоставляет специалистам возможность познакомиться с тенденциями мебельной моды, провести переговоры, получить практические предложения рынка, увидеть перспективы развития и новые конкурентные преимущества. Впервые для участников конкурса будет подготовлен маркетинговый отчет по результатам опроса посетителей выставок \rМебельного Форума\r.\rПрием заявок на участие в конкурсе осуществляется до 12 апреля 2010 года.', '', 'news', '1', NULL, '2010-05-25 00:00:00', NULL),
(15, '2010-05-26 00:00:00', 'iblock', '2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news&IBLOCK_EXTERNAL_ID=furniture_news&CODE=', 'Международная мебельная выставка SALON DEL MOBILE', 'В 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. \r\nВ 2010 году выставка Salon del Mobile обещает быть еще более расширенной и интересной. На выставке Salon del Mobile будут представлены все типы мебели для офиса и дома от спален и гостиных до VIP-кабинетов, включая оборудование для сада и детской мебели. Заявки на участие подали более чем 1 500 компаний со всего мира. Предполагается, что за время проведения выставки ее посетят более 300 000 тысяч человек. Экспозиция выставки разместится на общей площади 149 871 кв.м. В 2010 году эта поистине грандиозная выставка будет проводиться уже в 10-й раз.', '', 'news', '1', NULL, '2010-05-26 00:00:00', NULL),
(16, '2010-05-27 00:00:00', 'iblock', '3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news&IBLOCK_EXTERNAL_ID=furniture_news&CODE=', 'Получено прочное водостойкое соединение', 'Получено новое прочное водостойкое клеевое соединение.Изобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности. Данная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. \r\n\rАвторы изобретения\r: Разиньков Егор Михайлович и Мещерякова Анна Анатольевна \rПатент Российской Федерации RU2277566\rОписание изобретения\rИзобретение относится к области получения и применения клеящих составов, используемых в деревообрабатывающей, мебельной и строительной промышленности.\rДанная клеевая композиция предназначена только для горячего прессования и имеет в своем составе многокомпонентный отвердитель. Прототипом клеевой композиции является клей, состоящий из карбамидоформальдегидной смолы, сополимера акрилонитрила с N-винилкапролактамом и отвердитель. В качестве отвердителя применяют хлористый аммоний либо акриловую кислоту. \rИзобретение решает задачу по получению прочного и водостойкого клеевого соединения.\rЭто достигается тем, что клеевая композиция, включающая синтетическую смолу и отвердитель, согласно изобретению, дополнительно содержит модификатор, причем в качестве синтетической смолы клеевая композиция включает карбамидомеламиноформальдегидную смолу с отвердителем 2542, в качестве модификатора - карбамидоформальдегидную смолу, а в качестве отвердителя - 10%-ный раствор щавелевой кислоты при следующем соотношении компонентов, мас.ч.:\rКарбамидомеламиноформальдегидная смола\r64,5-79,2\r10%-ный Раствор щавелевой кислоты\r4,4-20,5\rОтвердитель для карбамидомеламиноформальдегидной \r0,6-2,0\rсмолы 2542\r13,0-15,8', '', 'news', '1', NULL, '2010-05-27 00:00:00', NULL),
(17, '2018-06-27 16:04:24', 'iblock', 'S1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=', 'Мягкая мебель', 'Диваны, кресла и прочая мягкая мебель', NULL, 'products', '2', NULL, NULL, NULL),
(18, '2018-06-27 16:04:47', 'iblock', 'S2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=', 'Офисная мебель', 'Диваны, столы, стулья', NULL, 'products', '2', NULL, NULL, NULL),
(19, '2018-06-27 18:05:01', 'iblock', 'S3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=', 'Мебель для кухни', 'Полки, ящики, столы и стулья', NULL, 'products', '2', NULL, NULL, NULL),
(20, '2018-06-27 18:04:48', 'iblock', 'S4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=5&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products_s1&IBLOCK_EXTERNAL_ID=furniture_products_s1&CODE=', 'Детская мебель', 'Кровати, стулья, мягкая детская мебель', NULL, 'products', '2', NULL, NULL, NULL),
(21, '2018-06-27 10:19:01', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=10&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Герцог', 'Изящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.\r\r\n \rИзящный каркас с элементами росписи, роскошные ткани для обивки, яркие цвета и богатый декор.', '', 'products', '2', NULL, NULL, NULL),
(22, '2018-06-27 10:19:01', 'iblock', '5', 0, NULL, NULL, NULL, '=ID=5&EXTERNAL_ID=11&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Монализа', 'Богатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.\r\r\n \rБогатство и изыск выражен в данной модели. Каркас дополнительно расписывается золотом.\rПо желанию клиента возможна простежка на спинке и подлокотниках.', '', 'products', '2', NULL, NULL, NULL),
(23, '2018-06-27 10:19:02', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=12&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Министр', 'Кресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.\r\r\n \rКресло руководителя Министр, несмотря на низкую стоимость, впечатляюще выглядит. \rС его помощью можно создать офисный интерьер высокого уровня. К тому же в нем можно работать с комфортом, не чувствуя усталости.', '', 'products', '2', NULL, NULL, NULL),
(24, '2018-06-27 10:19:02', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=13&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Хром', 'Динамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.\r\r\n \rДинамичная модель офисного кресла примечательна оригинальным внешним видом, который достигнут за \rсчет хромированной крестовины,необычных подлокотников и потрясающей эргономики. \rТвердая спинка жестко поддерживает позвоночник.', '', 'products', '2', NULL, NULL, NULL),
(25, '2018-06-27 10:19:02', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=14&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Ливерпуль', 'Деревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.\r\r\n \rДеревянные стулья Ливерпуль, выполненные в классическом английском стиле, \rсоздают особую атмосферу в кухне.', '', 'products', '2', NULL, NULL, NULL),
(26, '2018-06-27 10:19:02', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=15&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Изабелла', 'Изящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.\r\r\n \rИзящный каркас с элементами росписи золотом. Обивка может быть представлена в ткани или коже.', '', 'products', '2', NULL, NULL, NULL),
(27, '2018-06-27 10:19:02', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=16&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Аладдин', 'Комфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»\r\r\n \rКомфортная, массивная модель. Обивка - элитные ткани, ручная строчка, \rпридают изделию необыкновенный шарм и элегантную роскошь. \rПо желанию клиента можно установить механизм трансформации для ежедневного использования или «гостевую раскладушку»', '', 'products', '2', NULL, NULL, NULL),
(28, '2018-06-27 10:19:02', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=17&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Джоконда', 'Изящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.\r\r\n \rИзящный каркас, элитные ткани для обивки, ручная строчка, придают изделию необыкновенный шарм и элегантную роскошь. \rОбивка также может быть в коже, по желанию клиента возможна простежка на подлокотниках и спинке.', '', 'products', '2', NULL, NULL, NULL),
(29, '2018-06-27 10:19:02', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=18&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Флора', 'Классическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.\r\r\n \rКлассическая модель создана для украшения роскошных интерьеров. \rЭлегантность и колоритность модели придают накладки из натурального дерева.', '', 'products', '2', NULL, NULL, NULL),
(30, '2018-06-27 10:19:02', 'iblock', '13', 0, NULL, NULL, NULL, '=ID=13&EXTERNAL_ID=19&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Престиж', 'Тахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.\r\r\n \rТахта в классическом исполнении. Подлокотник находится слева – это стандарт. Обивка может быть как в ткани, так и в коже.', '', 'products', '2', NULL, NULL, NULL),
(31, '2018-06-27 10:19:02', 'iblock', '14', 0, NULL, NULL, NULL, '=ID=14&EXTERNAL_ID=20&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Лаура', 'Двухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.\r\r\n \rДвухместная софа на основе конусных пружин или на основе комбинации плотных поролонов, по Вашему желанию. \rЭлитные ткани для обивки придают модели необыкновенный шарм и элегантную роскошь.', '', 'products', '2', NULL, NULL, NULL),
(32, '2018-06-27 10:19:02', 'iblock', '15', 0, NULL, NULL, NULL, '=ID=15&EXTERNAL_ID=21&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Модерн', 'Основными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.\r\r\n \rОсновными характеристиками данной серии является новизна дизайнерской мысли, \rкоторая воплощена во внешнем облике этой мебели, и оригинальность исполнения классической компоновки, \rкоторая сочетает в себе оптимальный набор всех необходимых элементов и свежие решения в их организации. \rЧто в сочетании с удачными цветовыми решениями создаст в вашем офисе атмосферу неповторимой индивидуальности. \rДанная серия – наилучшее решение для бизнесменов, которые привыкли быть на шаг впереди не только своих конкурентов, \rно и самого времени.', '', 'products', '2', NULL, NULL, NULL),
(33, '2018-06-27 10:19:02', 'iblock', '16', 0, NULL, NULL, NULL, '=ID=16&EXTERNAL_ID=22&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Оптима', 'Удачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. \rПравильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным \rобязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать \rпространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.\r\r\n \rУдачный выбор мебели для персонала во многом определяет успешность деятельности всей компании. Правильно организовать рабочее пространство - значит помочь коллегам выполнять свои функции быстрее и эффективнее.\rСерия \r«Оптима»\rпозволит найти массу решений для обустройства рабочей зоны, приспособить интерьер к должностным обязанностям всех категорий сотрудников. Эргономичные угловые столы, перегородки, шкафы и тумбы помогут рационально использовать пространство под уникальное рабочее место, приспособленное к потребностям каждого работника и всей фирмы в целом.\rМебель \r«Оптима»\r- это полный набор интерьерных решений для обустройства пространства в офисе по современным стандартам.', '', 'products', '2', NULL, NULL, NULL),
(34, '2018-06-27 10:19:02', 'iblock', '17', 0, NULL, NULL, NULL, '=ID=17&EXTERNAL_ID=23&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Собрание', 'Заходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.\r\r\n \rЗаходя в помещение, где находятся столы для переговоров «Собрание», возникает стойкое ощущение, что находишься в кабинете если не президента страны, то премьер-министра как минимум. Вот-вот в комнату войдет высокопоставленный чиновник, и начнется обсуждение глобальных вопросов.\rУдивительное сочетание изысканной роскоши стиля и красоты классических линий столов «Собрание» и привлекательной цены опровергает устоявшееся утверждение о качестве дешевой мебели. Уменьшение себестоимости происходит за счет использования более дешевых материалов – ДСП и ДВП, что позволяет офисной мебели сохранять великолепные эксплуатационные характеристики.', '', 'products', '2', NULL, NULL, NULL),
(35, '2018-06-27 10:19:02', 'iblock', '18', 0, NULL, NULL, NULL, '=ID=18&EXTERNAL_ID=24&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Лидер', 'Этот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.\r\r\n \rЭтот стильный стол абсолютно не симметричен, и это придает ему изящность и оригинальность. \rСлева он опирается на ножку, освобождая полезное пространство для системного блока и ног. \rСправа основанием служит удобная и вместительная тумба. Плавные линии, стильный дизайн и высокая эргономичность являются \rосновными достоинствами данной серии.', '', 'products', '2', NULL, NULL, NULL),
(36, '2018-06-27 10:19:02', 'iblock', '19', 0, NULL, NULL, NULL, '=ID=19&EXTERNAL_ID=25&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Президент', 'Кресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести.\r\r\n \rКресло руководителя Президент\rво главе большого круглого стола поможет создать в вашем кабинете\rобстановку легендарной совещательной комнаты. Ведь это не просто мебель офисная – это настоящий трон, который \rпоможет управленцу решать любые вопросы, согласуясь с понятиями чести и совести. \rДизайн кресла выполнен в строгом классическом стиле. Окантовка и подлокотники кресла выточена вручную и потому уникальны. \rПроизводится ограниченными партиями - не более 10 кресел в год.', '', 'products', '2', NULL, NULL, NULL),
(37, '2018-06-27 10:19:03', 'iblock', '20', 0, NULL, NULL, NULL, '=ID=20&EXTERNAL_ID=26&IBLOCK_SECTION_ID=2&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Плутон', 'Офисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.\r\r\n \rОфисное кресло, подобранное с учетом ваших физиологических особенностей - важная составляющая работоспособности и здоровья. \rДанная модель будет незаменима для тех, кто много работает за компьютером.', '', 'products', '2', NULL, NULL, NULL),
(38, '2018-06-27 10:19:03', 'iblock', '21', 0, NULL, NULL, NULL, '=ID=21&EXTERNAL_ID=27&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Парма', 'Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \rСтул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \rТонировка деревянных деталей может быть выполнена в любой цветовой палитре.\r\r\n \r <p>Стулья Парма внесут в кухню уютное обаяние экологически чистого древесного материала. \r Стул практически целиком сделан из массива бука, исключением стало лишь мягкое сиденье. \r Тонировка деревянных деталей может быть выполнена в любой цветовой палитре.</p>', '', 'products', '2', NULL, NULL, NULL),
(39, '2018-06-27 10:19:03', 'iblock', '22', 0, NULL, NULL, NULL, '=ID=22&EXTERNAL_ID=28&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Палермо', 'Универсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.\r\r\n \rУниверсальный дизайн стульев Палермо позволит с успехом использовать их и в офисных помещениях, \rи в интерьере кафе, и в домашней обстановке. Стулья Палермо добавят уюта в каждое помещение и \rорганично сольются с его стилем.', '', 'products', '2', NULL, NULL, NULL),
(40, '2018-06-27 10:19:03', 'iblock', '23', 0, NULL, NULL, NULL, '=ID=23&EXTERNAL_ID=29&IBLOCK_SECTION_ID=3&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Валенсия', 'Стильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.\r\r\n \rСтильный дизайн стульев Валенсия сразу привлекает внимание, а эргономичная форма спинки и \rмягкое сиденье делают их необычайно удобными. Эти стулья хорошо подойдут к любой офисной мебели для \rперсонала.', '', 'products', '2', NULL, NULL, NULL),
(41, '2018-06-27 10:19:03', 'iblock', '24', 0, NULL, NULL, NULL, '=ID=24&EXTERNAL_ID=30&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Фазенда', 'Складной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.\r\r\n \rСкладной деревянный стул с сиденьем и спинкой из плотного хлопка, изготовленный из натуральных природных материалов. \rТкань и дерево считаются теплыми материалами - даже зимой сидеть на них комфортнее, чем на железе или пластике. Это прекрасное решение для дачи.', '', 'products', '2', NULL, NULL, NULL),
(42, '2018-06-27 10:19:03', 'iblock', '25', 0, NULL, NULL, NULL, '=ID=25&EXTERNAL_ID=31&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Эра', 'Стильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.\r\r\n \rСтильный стул необычный формы с жесткими сиденьями на металлическом каркасе удобен тем, \rчто можно компактно сложить для хранения до 45 таких стульев. Легкая и прочная модель отлично подойдет \rк компьютерной стойке, также ее можно использовать как мебель для кафе и баров.', '', 'products', '2', NULL, NULL, NULL),
(43, '2018-06-27 10:19:03', 'iblock', '26', 0, NULL, NULL, NULL, '=ID=26&EXTERNAL_ID=32&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Сити', 'Стильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.\r\r\n \rСтильный, легкий и удобный стул на хромированном основании сразу привлекает внимание \rсвоей необычной формой. А разнообразные варианты обивки позволяют подобрать наилучшее сочетание с \rлюбой компьютерной мебелью.', '', 'products', '2', NULL, NULL, NULL),
(44, '2018-06-27 10:19:03', 'iblock', '27', 0, NULL, NULL, NULL, '=ID=27&EXTERNAL_ID=33&IBLOCK_SECTION_ID=4&IBLOCK_TYPE_ID=products&IBLOCK_ID=2&IBLOCK_CODE=furniture_products&IBLOCK_EXTERNAL_ID=furniture_products&CODE=', 'Изопласт Хром', 'Популярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.\r\r\n \rПопулярная модель офисного стула на хромированном металлическом каркасе с пластиковыми спинкой и \rсиденьем хорошо вписывается в любой интерьер. Прочные и долговечные, эти стулья удобны для использования \rв качестве аудиторных конференц-кресел, кроме того, их легко хранить.', '', 'products', '2', NULL, NULL, NULL),
(45, '2018-06-27 10:19:03', 'iblock', '28', 0, NULL, NULL, NULL, '=ID=28&EXTERNAL_ID=5&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=', 'Мебель на заказ', 'Наша компания занимается разработкой мебели на заказ.\r\n \rНаша компания занимается разработкой мебели на заказ по индивидуальным проектам: встроенные и корпусные шкафы купе,\rгардеробные комнаты, прихожие, библиотеки, платяные шкафы, комоды и другие сложные конструкции.\rМы создаем мебель идеально подходящую именно к вашему дому и офису, интерьеры, максимально отображающие вашу индивидуальность.\rПо Вашей заявке наш специалист приезжает со всеми образцами материалов, с которыми мы работаем, в любое удобное для Вас время и\rпроизведет все необходимые замеры. Учитывая все Ваши пожелания и особенности помещения, составляется эскизный проект.\rПосле заключения договора, в котором оговариваются сроки доставки и монтажа мебели, эскизный проект передается на производство,\rгде опытными специалистами производятся расчеты в программе трехмерного моделирования. После всех расчетов готовый проект поступает\rнепосредственно на производство, где производят раскрой деталей, их обработку, и сборку некоторых элементов. Накануне дня доставки\rсотрудники отдела транспортных услуг свяжутся с Вами и более конкретно оговорят время доставки. После заключения договора вами\rвносится предоплата в размере 30% от суммы заказанной Вами мебели. Остальная сумма оплачивается Вами по доставке.', '', 'products', '3', NULL, NULL, NULL),
(46, '2018-06-27 10:19:03', 'iblock', '29', 0, NULL, NULL, NULL, '=ID=29&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=products&IBLOCK_ID=3&IBLOCK_CODE=furniture_services&IBLOCK_EXTERNAL_ID=furniture_services&CODE=', 'Услуги дизайнера', 'Мы предлагаем широкий спектр услуг по дизайну мебели.\r\n \rДиагностика возможностей преобразования помещений – определение вариантов перепланировки, отделки, разработка новых решений колористки, освещения, перестановки мебели и декора, разработка специальных функциональных зон для переключения в различные режимы жизни.\rРазработка Идеи-Образа, проведение предварительных расчётов и создание 3D-модели: изображение передает цвет и фактуру, предлагая клиенту экспериментировать и подбирать оптимальный вариант.\rРазработка компьютерных цветных трехмерных моделей мебели. Натуралистичность изображений, их высокая схожесть с оригиналом позволяют представить, как будет выглядеть готовое изделие, рассмотреть его в деталях.\rПодбор и расстановка мебели.\rДекорирование - подбор декора и аксессуаров интерьера в соответствии с образом и стилем помещения. Возможно создание по индивидуальному запросу эксклюзивных, авторских коллекций.', '', 'products', '3', NULL, NULL, NULL),
(47, '2010-05-01 00:00:00', 'iblock', '30', 0, NULL, NULL, NULL, '=ID=30&EXTERNAL_ID=2&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=', 'Продавец-дизайнер (кухни)', 'Требования\rУверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения\rОбязанности\rКонсультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.\rУсловия\rЗарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ', '', 'vacancies', '4', NULL, '2010-05-01 00:00:00', NULL),
(48, '2010-05-01 00:00:00', 'iblock', '31', 0, NULL, NULL, NULL, '=ID=31&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=', 'Директор магазина', 'Требования\rВысшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.\rОбязанности\rРуководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.\rУсловия\rТрудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб', '', 'vacancies', '4', NULL, '2010-05-01 00:00:00', NULL),
(49, '2010-05-01 00:00:00', 'iblock', '32', 0, NULL, NULL, NULL, '=ID=32&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=vacancies&IBLOCK_ID=4&IBLOCK_CODE=furniture_vacancies&IBLOCK_EXTERNAL_ID=furniture_vacancies&CODE=', 'Бухгалтер отдела учета готовой продукции', 'Требования\rЖен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.\rОбязанности\rРабота с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя\rУсловия\rГрафик работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.', '', 'vacancies', '4', NULL, '2010-05-01 00:00:00', NULL),
(50, '2018-06-27 13:19:15', 'main', 's1|/ex2/index.php', 0, NULL, NULL, NULL, '/ex2/index.php', 'Экзамен2', 'Text here....', '', '', '', NULL, NULL, NULL),
(51, '2018-06-27 13:32:08', 'main', 's1|/ex2/feedback/index.php', 0, NULL, NULL, NULL, '/ex2/feedback/index.php', 'Форма обратной связи', '', '', '', '', NULL, NULL, NULL),
(52, '2018-06-27 16:23:29', 'main', 's1|/ex2/simplecomp/index.php', 0, NULL, NULL, NULL, '/ex2/simplecomp/index.php', 'Простой компонент', '', '', '', '', NULL, NULL, NULL),
(53, '2018-06-27 19:26:13', 'main', 's1|/ex2/complexcomponent/index.php', 0, NULL, NULL, NULL, '/ex2/complexcomponent/index.php', 'Комплексный компонент', '', '', '', '', NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_search_content_freq
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_content_param
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_content_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_search_content_right` VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G2'),
(10, 'G2'),
(11, 'G2'),
(12, 'G2'),
(13, 'G2'),
(14, 'G2'),
(15, 'G2'),
(16, 'G2'),
(17, 'G1'),
(17, 'G2'),
(18, 'G1'),
(18, 'G2'),
(19, 'G1'),
(19, 'G2'),
(20, 'G1'),
(20, 'G2'),
(21, 'G2'),
(22, 'G2'),
(23, 'G2'),
(24, 'G2'),
(25, 'G2'),
(26, 'G2'),
(27, 'G2'),
(28, 'G2'),
(29, 'G2'),
(30, 'G2'),
(31, 'G2'),
(32, 'G2'),
(33, 'G2'),
(34, 'G2'),
(35, 'G2'),
(36, 'G2'),
(37, 'G2'),
(38, 'G2'),
(39, 'G2'),
(40, 'G2'),
(41, 'G2'),
(42, 'G2'),
(43, 'G2'),
(44, 'G2'),
(45, 'G2'),
(46, 'G2'),
(47, 'G2'),
(48, 'G2'),
(49, 'G2'),
(50, 'G2'),
(51, 'G2'),
(52, 'G2'),
(53, 'G2');
-- -----------------------------------
-- Dumping table b_search_content_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_search_content_site` VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', ''),
(12, 's1', ''),
(13, 's1', ''),
(14, 's1', ''),
(15, 's1', ''),
(16, 's1', ''),
(17, 's1', ''),
(18, 's1', ''),
(19, 's1', ''),
(20, 's1', ''),
(21, 's1', ''),
(22, 's1', ''),
(23, 's1', ''),
(24, 's1', ''),
(25, 's1', ''),
(26, 's1', ''),
(27, 's1', ''),
(28, 's1', ''),
(29, 's1', ''),
(30, 's1', ''),
(31, 's1', ''),
(32, 's1', ''),
(33, 's1', ''),
(34, 's1', ''),
(35, 's1', ''),
(36, 's1', ''),
(37, 's1', ''),
(38, 's1', ''),
(39, 's1', ''),
(40, 's1', ''),
(41, 's1', ''),
(42, 's1', ''),
(43, 's1', ''),
(44, 's1', ''),
(45, 's1', ''),
(46, 's1', ''),
(47, 's1', ''),
(48, 's1', ''),
(49, 's1', ''),
(50, 's1', ''),
(51, 's1', ''),
(52, 's1', ''),
(53, 's1', '');
-- -----------------------------------
-- Dumping table b_search_content_stem
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

INSERT INTO `b_search_content_stem` VALUES
(1, 'ru', 1, 0.2314, 1),
(2, 'ru', 2, 0.2314, 1),
(3, 'ru', 3, 0.2314, 1),
(3, 'ru', 4, 0.2314, 2),
(4, 'ru', 1, 0.1679, 99),
(4, 'ru', 5, 0.3359, 21.3333),
(4, 'ru', 6, 0.39, 17.75),
(4, 'ru', 7, 0.39, 64.75),
(4, 'ru', 8, 0.1679, 5),
(4, 'ru', 9, 0.1679, 7),
(4, 'ru', 10, 0.1679, 8),
(4, 'ru', 11, 0.1679, 10),
(4, 'ru', 12, 0.1679, 11),
(4, 'ru', 13, 0.1679, 19),
(4, 'ru', 14, 0.1679, 22),
(4, 'ru', 15, 0.1679, 23),
(4, 'ru', 16, 0.1679, 24),
(4, 'ru', 17, 0.1679, 26),
(4, 'ru', 18, 0.1679, 27),
(4, 'ru', 19, 0.1679, 28),
(4, 'ru', 20, 0.2662, 54.5),
(4, 'ru', 21, 0.1679, 32),
(4, 'ru', 22, 0.1679, 33),
(4, 'ru', 23, 0.1679, 34),
(4, 'ru', 24, 0.2662, 41),
(4, 'ru', 25, 0.1679, 37),
(4, 'ru', 26, 0.1679, 45),
(4, 'ru', 27, 0.1679, 46),
(4, 'ru', 28, 0.1679, 49),
(4, 'ru', 29, 0.1679, 50),
(4, 'ru', 30, 0.1679, 52),
(4, 'ru', 31, 0.1679, 53),
(4, 'ru', 32, 0.1679, 54),
(4, 'ru', 33, 0.1679, 55),
(4, 'ru', 34, 0.1679, 56),
(4, 'ru', 35, 0.2662, 69.5),
(4, 'ru', 36, 0.2662, 70.5),
(4, 'ru', 37, 0.1679, 60),
(4, 'ru', 38, 0.1679, 61),
(4, 'ru', 39, 0.2662, 80),
(4, 'ru', 40, 0.1679, 69),
(4, 'ru', 41, 0.1679, 70),
(4, 'ru', 42, 0.1679, 71),
(4, 'ru', 43, 0.1679, 73),
(4, 'ru', 44, 0.2662, 81),
(4, 'ru', 45, 0.1679, 76),
(4, 'ru', 46, 0.1679, 80),
(4, 'ru', 47, 0.1679, 83),
(4, 'ru', 48, 0.1679, 84),
(4, 'ru', 49, 0.1679, 85),
(4, 'ru', 50, 0.1679, 88),
(4, 'ru', 51, 0.1679, 90),
(5, 'ru', 39, 0.2314, 1),
(6, 'ru', 52, 0.2314, 1),
(7, 'ru', 4, 0.2314, 3),
(7, 'ru', 53, 0.2314, 1),
(7, 'ru', 54, 0.2314, 5),
(7, 'ru', 55, 0.2314, 7),
(7, 'ru', 56, 0.2314, 8),
(7, 'ru', 57, 0.2314, 14),
(7, 'ru', 58, 0.2314, 16),
(7, 'ru', 59, 0.2314, 17),
(8, 'ru', 7, 0.2694, 25.5),
(8, 'ru', 24, 0.2694, 19),
(8, 'ru', 39, 0.17, 99),
(8, 'ru', 60, 0.17, 1),
(8, 'ru', 61, 0.2694, 18),
(8, 'ru', 62, 0.17, 5),
(8, 'ru', 63, 0.17, 7),
(8, 'ru', 64, 0.17, 8),
(8, 'ru', 65, 0.17, 9),
(8, 'ru', 66, 0.34, 54.3333),
(8, 'ru', 67, 0.17, 12),
(8, 'ru', 68, 0.17, 14),
(8, 'ru', 69, 0.17, 17),
(8, 'ru', 70, 0.17, 18),
(8, 'ru', 71, 0.17, 19),
(8, 'ru', 72, 0.17, 20),
(8, 'ru', 73, 0.17, 22),
(8, 'ru', 74, 0.17, 26),
(8, 'ru', 75, 0.17, 33),
(8, 'ru', 76, 0.17, 36),
(8, 'ru', 77, 0.3947, 62.75),
(8, 'ru', 78, 0.17, 40),
(8, 'ru', 79, 0.17, 41),
(8, 'ru', 80, 0.17, 43),
(8, 'ru', 81, 0.17, 45),
(8, 'ru', 82, 0.2694, 79.5),
(8, 'ru', 83, 0.17, 54),
(8, 'ru', 84, 0.17, 55),
(8, 'ru', 85, 0.17, 56),
(8, 'ru', 86, 0.17, 59),
(8, 'ru', 87, 0.17, 71),
(8, 'ru', 88, 0.34, 74.6667),
(8, 'ru', 89, 0.17, 73),
(8, 'ru', 90, 0.17, 76),
(8, 'ru', 91, 0.17, 78),
(8, 'ru', 92, 0.17, 79),
(8, 'ru', 93, 0.17, 80),
(8, 'ru', 94, 0.34, 91),
(8, 'ru', 95, 0.17, 88),
(8, 'ru', 96, 0.17, 90),
(8, 'ru', 97, 0.17, 98),
(8, 'ru', 98, 0.17, 100),
(8, 'ru', 99, 0.17, 108),
(8, 'ru', 100, 0.17, 109),
(8, 'ru', 101, 0.17, 110),
(8, 'ru', 102, 0.17, 113),
(9, 'ru', 5, 0.2798, 342.25),
(9, 'ru', 6, 0.3615, 217),
(9, 'ru', 7, 0.4168, 289.4),
(9, 'ru', 8, 0.1205, 5),
(9, 'ru', 9, 0.1205, 7),
(9, 'ru', 10, 0.1205, 8),
(9, 'ru', 11, 0.1205, 10),
(9, 'ru', 12, 0.191, 248),
(9, 'ru', 13, 0.1205, 19),
(9, 'ru', 14, 0.191, 254),
(9, 'ru', 15, 0.1205, 23),
(9, 'ru', 16, 0.1205, 24),
(9, 'ru', 17, 0.1205, 26),
(9, 'ru', 18, 0.1205, 27),
(9, 'ru', 19, 0.1205, 28),
(9, 'ru', 20, 0.241, 312.333),
(9, 'ru', 21, 0.1205, 32),
(9, 'ru', 22, 0.191, 257),
(9, 'ru', 23, 0.1205, 34),
(9, 'ru', 24, 0.3615, 156.286),
(9, 'ru', 25, 0.2798, 327.5),
(9, 'ru', 26, 0.241, 293.667),
(9, 'ru', 27, 0.1205, 398),
(9, 'ru', 28, 0.191, 373),
(9, 'ru', 29, 0.1205, 402),
(9, 'ru', 30, 0.1205, 404),
(9, 'ru', 31, 0.1205, 405),
(9, 'ru', 32, 0.1205, 406),
(9, 'ru', 33, 0.1205, 407),
(9, 'ru', 34, 0.191, 376),
(9, 'ru', 35, 0.241, 374.333),
(9, 'ru', 36, 0.241, 306),
(9, 'ru', 37, 0.191, 267.5),
(9, 'ru', 38, 0.3383, 418.333),
(9, 'ru', 39, 0.3615, 330.857),
(9, 'ru', 40, 0.1205, 421),
(9, 'ru', 41, 0.1205, 422),
(9, 'ru', 42, 0.1205, 423),
(9, 'ru', 43, 0.1205, 425),
(9, 'ru', 44, 0.241, 304),
(9, 'ru', 45, 0.1205, 428),
(9, 'ru', 46, 0.1205, 432),
(9, 'ru', 47, 0.1205, 435),
(9, 'ru', 48, 0.1205, 436),
(9, 'ru', 49, 0.1205, 437),
(9, 'ru', 50, 0.191, 243.5),
(9, 'ru', 51, 0.1205, 442),
(9, 'ru', 58, 0.1205, 43),
(9, 'ru', 62, 0.191, 312.5),
(9, 'ru', 63, 0.1205, 497),
(9, 'ru', 64, 0.1205, 328),
(9, 'ru', 69, 0.191, 197),
(9, 'ru', 74, 0.1205, 62),
(9, 'ru', 76, 0.1205, 54),
(9, 'ru', 82, 0.191, 77.5),
(9, 'ru', 103, 0.1205, 44),
(9, 'ru', 104, 0.1205, 49),
(9, 'ru', 105, 0.1205, 50),
(9, 'ru', 106, 0.1205, 52),
(9, 'ru', 107, 0.1205, 53),
(9, 'ru', 108, 0.191, 85),
(9, 'ru', 109, 0.1205, 56),
(9, 'ru', 110, 0.1205, 57),
(9, 'ru', 111, 0.191, 92),
(9, 'ru', 112, 0.191, 90),
(9, 'ru', 113, 0.1205, 70),
(9, 'ru', 114, 0.1205, 72),
(9, 'ru', 115, 0.1205, 74),
(9, 'ru', 116, 0.1205, 83),
(9, 'ru', 117, 0.1205, 86),
(9, 'ru', 118, 0.1205, 87),
(9, 'ru', 119, 0.1205, 88),
(9, 'ru', 120, 0.1205, 89),
(9, 'ru', 121, 0.1205, 91),
(9, 'ru', 122, 0.1205, 92),
(9, 'ru', 123, 0.1205, 96),
(9, 'ru', 124, 0.1205, 99),
(9, 'ru', 125, 0.191, 112.5),
(9, 'ru', 126, 0.1205, 107),
(9, 'ru', 127, 0.1205, 108),
(9, 'ru', 128, 0.1205, 109),
(9, 'ru', 129, 0.191, 147),
(9, 'ru', 130, 0.1205, 116),
(9, 'ru', 131, 0.241, 199),
(9, 'ru', 132, 0.1205, 121),
(9, 'ru', 133, 0.1205, 124),
(9, 'ru', 134, 0.1205, 127),
(9, 'ru', 135, 0.1205, 128),
(9, 'ru', 136, 0.1205, 129),
(9, 'ru', 137, 0.1205, 130),
(9, 'ru', 138, 0.1205, 138),
(9, 'ru', 139, 0.241, 184.333),
(9, 'ru', 140, 0.1205, 140),
(9, 'ru', 141, 0.1205, 142),
(9, 'ru', 142, 0.191, 196.5),
(9, 'ru', 143, 0.1205, 144),
(9, 'ru', 144, 0.1205, 144),
(9, 'ru', 145, 0.1205, 146),
(9, 'ru', 146, 0.1205, 147),
(9, 'ru', 147, 0.1205, 148),
(9, 'ru', 148, 0.1205, 154),
(9, 'ru', 149, 0.1205, 155),
(9, 'ru', 150, 0.1205, 156),
(9, 'ru', 151, 0.191, 181.5),
(9, 'ru', 152, 0.1205, 159),
(9, 'ru', 153, 0.1205, 161),
(9, 'ru', 154, 0.1205, 162),
(9, 'ru', 155, 0.1205, 169),
(9, 'ru', 156, 0.1205, 170),
(9, 'ru', 157, 0.1205, 172),
(9, 'ru', 158, 0.1205, 173),
(9, 'ru', 159, 0.1205, 175),
(9, 'ru', 160, 0.191, 191),
(9, 'ru', 161, 0.1205, 177),
(9, 'ru', 162, 0.241, 299),
(9, 'ru', 163, 0.1205, 181),
(9, 'ru', 164, 0.1205, 183),
(9, 'ru', 165, 0.1205, 185),
(9, 'ru', 166, 0.1205, 187),
(9, 'ru', 167, 0.191, 237.5),
(9, 'ru', 168, 0.191, 237.5),
(9, 'ru', 169, 0.1205, 196),
(9, 'ru', 170, 0.1205, 198),
(9, 'ru', 171, 0.1205, 199),
(9, 'ru', 172, 0.1205, 200),
(9, 'ru', 173, 0.1205, 201),
(9, 'ru', 174, 0.1205, 201),
(9, 'ru', 175, 0.1205, 203),
(9, 'ru', 176, 0.1205, 207),
(9, 'ru', 177, 0.1205, 208),
(9, 'ru', 178, 0.1205, 209),
(9, 'ru', 179, 0.191, 236),
(9, 'ru', 180, 0.1205, 218),
(9, 'ru', 181, 0.1205, 220),
(9, 'ru', 182, 0.1205, 221),
(9, 'ru', 183, 0.1205, 223),
(9, 'ru', 184, 0.241, 247.667),
(9, 'ru', 185, 0.1205, 232),
(9, 'ru', 186, 0.1205, 234),
(9, 'ru', 187, 0.191, 281.5),
(9, 'ru', 188, 0.1205, 245),
(9, 'ru', 189, 0.1205, 246),
(9, 'ru', 190, 0.1205, 251),
(9, 'ru', 191, 0.191, 256),
(9, 'ru', 192, 0.1205, 255),
(9, 'ru', 193, 0.1205, 259),
(9, 'ru', 194, 0.1205, 260),
(9, 'ru', 195, 0.191, 270),
(9, 'ru', 196, 0.191, 271.5),
(9, 'ru', 197, 0.191, 314.5),
(9, 'ru', 198, 0.241, 302.667),
(9, 'ru', 199, 0.1205, 272),
(9, 'ru', 200, 0.1205, 274),
(9, 'ru', 201, 0.1205, 276),
(9, 'ru', 202, 0.1205, 279),
(9, 'ru', 203, 0.1205, 281),
(9, 'ru', 204, 0.1205, 282),
(9, 'ru', 205, 0.1205, 283),
(9, 'ru', 206, 0.1205, 285),
(9, 'ru', 207, 0.1205, 286),
(9, 'ru', 208, 0.1205, 289),
(9, 'ru', 209, 0.1205, 291),
(9, 'ru', 210, 0.1205, 292),
(9, 'ru', 211, 0.1205, 294),
(9, 'ru', 212, 0.1205, 296),
(9, 'ru', 213, 0.1205, 298),
(9, 'ru', 214, 0.1205, 299),
(9, 'ru', 215, 0.1205, 305),
(9, 'ru', 216, 0.1205, 309),
(9, 'ru', 217, 0.1205, 310),
(9, 'ru', 218, 0.191, 314),
(9, 'ru', 219, 0.191, 314),
(9, 'ru', 220, 0.1205, 314),
(9, 'ru', 221, 0.1205, 316),
(9, 'ru', 222, 0.1205, 324),
(9, 'ru', 223, 0.1205, 327),
(9, 'ru', 224, 0.1205, 329),
(9, 'ru', 225, 0.1205, 331),
(9, 'ru', 226, 0.1205, 332),
(9, 'ru', 227, 0.1205, 333),
(9, 'ru', 228, 0.1205, 336),
(9, 'ru', 229, 0.191, 357.5),
(9, 'ru', 230, 0.1205, 348),
(9, 'ru', 231, 0.1205, 348),
(9, 'ru', 232, 0.1205, 355),
(9, 'ru', 233, 0.1205, 356),
(9, 'ru', 234, 0.1205, 357),
(9, 'ru', 235, 0.1205, 361),
(9, 'ru', 236, 0.1205, 362),
(9, 'ru', 237, 0.1205, 373),
(9, 'ru', 238, 0.1205, 374),
(9, 'ru', 239, 0.1205, 376),
(9, 'ru', 240, 0.1205, 378),
(9, 'ru', 241, 0.1205, 380),
(9, 'ru', 242, 0.1205, 388),
(9, 'ru', 243, 0.191, 447.5),
(9, 'ru', 244, 0.1205, 392),
(9, 'ru', 245, 0.1205, 394),
(9, 'ru', 246, 0.1205, 448),
(9, 'ru', 247, 0.1205, 451),
(9, 'ru', 248, 0.1205, 452),
(9, 'ru', 249, 0.1205, 453),
(9, 'ru', 250, 0.1205, 455),
(9, 'ru', 251, 0.1205, 456),
(9, 'ru', 252, 0.1205, 459),
(9, 'ru', 253, 0.191, 479),
(9, 'ru', 254, 0.241, 483),
(9, 'ru', 255, 0.191, 483.5),
(9, 'ru', 256, 0.1205, 464),
(9, 'ru', 257, 0.1205, 472),
(9, 'ru', 258, 0.1205, 473),
(9, 'ru', 259, 0.1205, 478),
(9, 'ru', 260, 0.1205, 479),
(9, 'ru', 261, 0.1205, 484),
(9, 'ru', 262, 0.1205, 487),
(9, 'ru', 263, 0.1205, 490),
(9, 'ru', 264, 0.191, 495.5),
(9, 'ru', 265, 0.1205, 492),
(9, 'ru', 266, 0.1205, 494),
(9, 'ru', 267, 0.1205, 495),
(9, 'ru', 268, 0.1205, 503),
(9, 'ru', 269, 0.1205, 505),
(10, 'ru', 5, 0.2974, 187.25),
(10, 'ru', 6, 0.4592, 183.636),
(10, 'ru', 7, 0.2974, 359.5),
(10, 'ru', 15, 0.1281, 67),
(10, 'ru', 16, 0.1281, 121),
(10, 'ru', 25, 0.1281, 370),
(10, 'ru', 27, 0.1281, 130),
(10, 'ru', 29, 0.1281, 252),
(10, 'ru', 34, 0.203, 228),
(10, 'ru', 37, 0.1281, 288),
(10, 'ru', 38, 0.2974, 125.25),
(10, 'ru', 39, 0.2974, 159.5),
(10, 'ru', 41, 0.1281, 9),
(10, 'ru', 47, 0.2562, 177.667),
(10, 'ru', 50, 0.1281, 336),
(10, 'ru', 62, 0.1281, 287),
(10, 'ru', 64, 0.1281, 243),
(10, 'ru', 66, 0.1281, 387),
(10, 'ru', 67, 0.203, 235),
(10, 'ru', 103, 0.1281, 82),
(10, 'ru', 104, 0.1281, 30),
(10, 'ru', 105, 0.1281, 80),
(10, 'ru', 136, 0.1281, 51),
(10, 'ru', 142, 0.1281, 236),
(10, 'ru', 148, 0.1281, 264),
(10, 'ru', 175, 0.1281, 11),
(10, 'ru', 184, 0.2974, 156.5),
(10, 'ru', 187, 0.203, 303),
(10, 'ru', 188, 0.1281, 145),
(10, 'ru', 194, 0.1281, 327),
(10, 'ru', 196, 0.1281, 255),
(10, 'ru', 202, 0.1281, 287),
(10, 'ru', 224, 0.1281, 234),
(10, 'ru', 225, 0.1281, 31),
(10, 'ru', 232, 0.1281, 266),
(10, 'ru', 239, 0.1281, 338),
(10, 'ru', 244, 0.1281, 351),
(10, 'ru', 252, 0.1281, 12),
(10, 'ru', 254, 0.203, 174),
(10, 'ru', 255, 0.203, 179),
(10, 'ru', 256, 0.1281, 154),
(10, 'ru', 260, 0.1281, 158),
(10, 'ru', 263, 0.203, 152),
(10, 'ru', 264, 0.1281, 168),
(10, 'ru', 268, 0.1281, 10),
(10, 'ru', 269, 0.1281, 297),
(10, 'ru', 270, 0.1281, 1),
(10, 'ru', 271, 0.1281, 3),
(10, 'ru', 272, 0.1281, 7),
(10, 'ru', 273, 0.203, 156.5),
(10, 'ru', 274, 0.1281, 13),
(10, 'ru', 275, 0.1281, 14),
(10, 'ru', 276, 0.1281, 15),
(10, 'ru', 277, 0.1281, 16),
(10, 'ru', 278, 0.2974, 115.5),
(10, 'ru', 279, 0.1281, 19),
(10, 'ru', 280, 0.1281, 22),
(10, 'ru', 281, 0.1281, 29),
(10, 'ru', 282, 0.1281, 32),
(10, 'ru', 283, 0.1281, 33),
(10, 'ru', 284, 0.1281, 35),
(10, 'ru', 285, 0.2562, 171.333),
(10, 'ru', 286, 0.1281, 38),
(10, 'ru', 287, 0.1281, 45),
(10, 'ru', 288, 0.2562, 237.667),
(10, 'ru', 289, 0.1281, 48),
(10, 'ru', 290, 0.1281, 50),
(10, 'ru', 291, 0.1281, 52),
(10, 'ru', 292, 0.1281, 62),
(10, 'ru', 293, 0.1281, 63),
(10, 'ru', 294, 0.1281, 64),
(10, 'ru', 295, 0.1281, 65),
(10, 'ru', 296, 0.1281, 68),
(10, 'ru', 297, 0.1281, 76),
(10, 'ru', 298, 0.1281, 77),
(10, 'ru', 299, 0.1281, 78),
(10, 'ru', 300, 0.1281, 79),
(10, 'ru', 301, 0.1281, 81),
(10, 'ru', 302, 0.203, 119.5),
(10, 'ru', 303, 0.1281, 90),
(10, 'ru', 304, 0.1281, 91),
(10, 'ru', 305, 0.1281, 92),
(10, 'ru', 306, 0.1281, 93),
(10, 'ru', 307, 0.1281, 93),
(10, 'ru', 308, 0.203, 182),
(10, 'ru', 309, 0.1281, 105),
(10, 'ru', 310, 0.2562, 189.333),
(10, 'ru', 311, 0.2974, 189),
(10, 'ru', 312, 0.1281, 109),
(10, 'ru', 313, 0.1281, 111),
(10, 'ru', 314, 0.2562, 272),
(10, 'ru', 315, 0.2974, 208.25),
(10, 'ru', 316, 0.1281, 128),
(10, 'ru', 317, 0.1281, 129),
(10, 'ru', 318, 0.1281, 133),
(10, 'ru', 319, 0.1281, 134),
(10, 'ru', 320, 0.1281, 135),
(10, 'ru', 321, 0.1281, 137),
(10, 'ru', 322, 0.1281, 144),
(10, 'ru', 323, 0.1281, 147),
(10, 'ru', 324, 0.1281, 153),
(10, 'ru', 325, 0.1281, 156),
(10, 'ru', 326, 0.1281, 157),
(10, 'ru', 327, 0.1281, 164),
(10, 'ru', 328, 0.1281, 167),
(10, 'ru', 329, 0.1281, 175),
(10, 'ru', 330, 0.1281, 177),
(10, 'ru', 331, 0.1281, 178),
(10, 'ru', 332, 0.1281, 179),
(10, 'ru', 333, 0.1281, 180),
(10, 'ru', 334, 0.1281, 186),
(10, 'ru', 335, 0.1281, 196),
(10, 'ru', 336, 0.1281, 199),
(10, 'ru', 337, 0.203, 239.5),
(10, 'ru', 338, 0.1281, 203),
(10, 'ru', 339, 0.1281, 204),
(10, 'ru', 340, 0.1281, 206),
(10, 'ru', 341, 0.203, 291),
(10, 'ru', 342, 0.203, 303),
(10, 'ru', 343, 0.1281, 221),
(10, 'ru', 344, 0.1281, 222),
(10, 'ru', 345, 0.1281, 224),
(10, 'ru', 346, 0.1281, 225),
(10, 'ru', 347, 0.1281, 233),
(10, 'ru', 348, 0.1281, 237),
(10, 'ru', 349, 0.1281, 244),
(10, 'ru', 350, 0.1281, 250),
(10, 'ru', 351, 0.1281, 251),
(10, 'ru', 352, 0.203, 265),
(10, 'ru', 353, 0.1281, 258),
(10, 'ru', 354, 0.1281, 260),
(10, 'ru', 355, 0.1281, 261),
(10, 'ru', 356, 0.1281, 265),
(10, 'ru', 357, 0.1281, 284),
(10, 'ru', 358, 0.1281, 289),
(10, 'ru', 359, 0.1281, 295),
(10, 'ru', 360, 0.1281, 298),
(10, 'ru', 361, 0.1281, 306),
(10, 'ru', 362, 0.1281, 307),
(10, 'ru', 363, 0.1281, 308),
(10, 'ru', 364, 0.203, 334.5),
(10, 'ru', 365, 0.203, 326),
(10, 'ru', 366, 0.1281, 314),
(10, 'ru', 367, 0.203, 329.5),
(10, 'ru', 368, 0.1281, 325),
(10, 'ru', 369, 0.1281, 328),
(10, 'ru', 370, 0.1281, 331),
(10, 'ru', 371, 0.1281, 333),
(10, 'ru', 372, 0.1281, 341),
(10, 'ru', 373, 0.1281, 350),
(10, 'ru', 374, 0.1281, 354),
(10, 'ru', 375, 0.1281, 361),
(10, 'ru', 376, 0.1281, 363),
(10, 'ru', 377, 0.1281, 366),
(10, 'ru', 378, 0.1281, 367),
(10, 'ru', 379, 0.1281, 369),
(10, 'ru', 380, 0.1281, 369),
(10, 'ru', 381, 0.1281, 377),
(10, 'ru', 382, 0.1281, 378),
(10, 'ru', 383, 0.203, 383.5),
(10, 'ru', 384, 0.1281, 384),
(10, 'ru', 385, 0.1281, 385),
(10, 'ru', 386, 0.1281, 389),
(11, 'ru', 5, 0.4303, 101.25),
(11, 'ru', 6, 0.5023, 145.25),
(11, 'ru', 10, 0.2152, 32.5),
(11, 'ru', 12, 0.4073, 150.143),
(11, 'ru', 13, 0.2715, 139.667),
(11, 'ru', 15, 0.1358, 91),
(11, 'ru', 16, 0.1358, 231),
(11, 'ru', 27, 0.2152, 136),
(11, 'ru', 39, 0.1358, 60),
(11, 'ru', 41, 0.1358, 67),
(11, 'ru', 55, 0.1358, 2),
(11, 'ru', 71, 0.1358, 257),
(11, 'ru', 142, 0.1358, 76),
(11, 'ru', 148, 0.1358, 7),
(11, 'ru', 171, 0.1358, 6),
(11, 'ru', 175, 0.1358, 165),
(11, 'ru', 184, 0.1358, 9),
(11, 'ru', 204, 0.1358, 101),
(11, 'ru', 217, 0.1358, 22),
(11, 'ru', 224, 0.1358, 142),
(11, 'ru', 260, 0.1358, 41),
(11, 'ru', 268, 0.2152, 203),
(11, 'ru', 273, 0.1358, 71),
(11, 'ru', 308, 0.1358, 59),
(11, 'ru', 316, 0.1358, 66),
(11, 'ru', 317, 0.1358, 64),
(11, 'ru', 321, 0.2152, 104.5),
(11, 'ru', 327, 0.1358, 102),
(11, 'ru', 330, 0.1358, 205),
(11, 'ru', 363, 0.1358, 72),
(11, 'ru', 364, 0.1358, 75),
(11, 'ru', 365, 0.2152, 79),
(11, 'ru', 367, 0.2152, 76.5),
(11, 'ru', 379, 0.1358, 77),
(11, 'ru', 380, 0.1358, 77),
(11, 'ru', 387, 0.2152, 5.5),
(11, 'ru', 388, 0.1358, 8),
(11, 'ru', 389, 0.1358, 23),
(11, 'ru', 390, 0.1358, 35),
(11, 'ru', 391, 0.1358, 38),
(11, 'ru', 392, 0.1358, 39),
(11, 'ru', 393, 0.1358, 40),
(11, 'ru', 394, 0.1358, 42),
(11, 'ru', 395, 0.1358, 43),
(11, 'ru', 396, 0.1358, 43),
(11, 'ru', 397, 0.1358, 57),
(11, 'ru', 398, 0.1358, 58),
(11, 'ru', 399, 0.1358, 61),
(11, 'ru', 400, 0.1358, 62),
(11, 'ru', 401, 0.1358, 69),
(11, 'ru', 402, 0.1358, 70),
(11, 'ru', 403, 0.1358, 78),
(11, 'ru', 404, 0.1358, 80),
(11, 'ru', 405, 0.1358, 81),
(11, 'ru', 406, 0.1358, 83),
(11, 'ru', 407, 0.1358, 92),
(11, 'ru', 408, 0.1358, 94),
(11, 'ru', 409, 0.1358, 95),
(11, 'ru', 410, 0.1358, 96),
(11, 'ru', 411, 0.1358, 97),
(11, 'ru', 412, 0.1358, 98),
(11, 'ru', 413, 0.1358, 108),
(11, 'ru', 414, 0.1358, 112),
(11, 'ru', 415, 0.1358, 112),
(11, 'ru', 416, 0.2152, 136.5),
(11, 'ru', 417, 0.2152, 137.5),
(11, 'ru', 418, 0.2152, 151),
(11, 'ru', 419, 0.1358, 117),
(11, 'ru', 420, 0.1358, 118),
(11, 'ru', 421, 0.2715, 191.333),
(11, 'ru', 422, 0.1358, 126),
(11, 'ru', 423, 0.1358, 127),
(11, 'ru', 424, 0.2152, 190.5),
(11, 'ru', 425, 0.2715, 194),
(11, 'ru', 426, 0.2152, 193),
(11, 'ru', 427, 0.2152, 165),
(11, 'ru', 428, 0.2152, 166),
(11, 'ru', 429, 0.2152, 179.5),
(11, 'ru', 430, 0.2152, 185.5),
(11, 'ru', 431, 0.2152, 174),
(11, 'ru', 432, 0.1358, 145),
(11, 'ru', 433, 0.1358, 146),
(11, 'ru', 434, 0.1358, 148),
(11, 'ru', 435, 0.2152, 179.5),
(11, 'ru', 436, 0.1358, 158),
(11, 'ru', 437, 0.1358, 162),
(11, 'ru', 438, 0.2152, 205),
(11, 'ru', 439, 0.1358, 166),
(11, 'ru', 440, 0.1358, 167),
(11, 'ru', 441, 0.1358, 169),
(11, 'ru', 442, 0.1358, 171),
(11, 'ru', 443, 0.2715, 220.333),
(11, 'ru', 444, 0.2715, 221.333),
(11, 'ru', 445, 0.1358, 184),
(11, 'ru', 446, 0.1358, 185),
(11, 'ru', 447, 0.1358, 186),
(11, 'ru', 448, 0.2152, 228.5),
(11, 'ru', 449, 0.1358, 190),
(11, 'ru', 450, 0.1358, 202),
(11, 'ru', 451, 0.1358, 203),
(11, 'ru', 452, 0.1358, 217),
(11, 'ru', 453, 0.1358, 218),
(11, 'ru', 454, 0.1358, 233),
(11, 'ru', 455, 0.1358, 234),
(11, 'ru', 456, 0.1358, 244),
(11, 'ru', 457, 0.1358, 249),
(11, 'ru', 458, 0.1358, 250),
(11, 'ru', 459, 0.1358, 251),
(11, 'ru', 460, 0.1358, 254),
(11, 'ru', 461, 0.1358, 258),
(11, 'ru', 462, 0.1358, 269),
(12, 'ru', 5, 0.4392, 287.667),
(12, 'ru', 6, 0.5292, 284.333),
(12, 'ru', 9, 0.1187, 378),
(12, 'ru', 10, 0.1187, 379),
(12, 'ru', 12, 0.1881, 333.5),
(12, 'ru', 20, 0.1881, 113.5),
(12, 'ru', 22, 0.1187, 288),
(12, 'ru', 24, 0.356, 261.143),
(12, 'ru', 25, 0.2374, 315.333),
(12, 'ru', 27, 0.2374, 231),
(12, 'ru', 29, 0.2756, 413.75),
(12, 'ru', 38, 0.1187, 117),
(12, 'ru', 39, 0.2756, 226),
(12, 'ru', 41, 0.3332, 372.167),
(12, 'ru', 44, 0.1187, 548),
(12, 'ru', 55, 0.1187, 528),
(12, 'ru', 80, 0.1187, 347),
(12, 'ru', 82, 0.1187, 17),
(12, 'ru', 95, 0.1187, 507),
(12, 'ru', 102, 0.1881, 242),
(12, 'ru', 109, 0.3068, 426),
(12, 'ru', 138, 0.1187, 549),
(12, 'ru', 148, 0.1187, 338),
(12, 'ru', 167, 0.2756, 385.5),
(12, 'ru', 168, 0.2756, 385.5),
(12, 'ru', 175, 0.1187, 339),
(12, 'ru', 187, 0.1881, 448.5),
(12, 'ru', 196, 0.1187, 527),
(12, 'ru', 216, 0.1187, 512),
(12, 'ru', 220, 0.1187, 438),
(12, 'ru', 225, 0.1187, 287),
(12, 'ru', 228, 0.1881, 432),
(12, 'ru', 259, 0.3068, 156.6),
(12, 'ru', 268, 0.2374, 264.333),
(12, 'ru', 269, 0.1187, 197),
(12, 'ru', 273, 0.1187, 478),
(12, 'ru', 287, 0.1881, 340.5),
(12, 'ru', 291, 0.1187, 599),
(12, 'ru', 303, 0.1187, 437),
(12, 'ru', 308, 0.1187, 118),
(12, 'ru', 317, 0.1187, 123),
(12, 'ru', 321, 0.1881, 179.5),
(12, 'ru', 331, 0.1187, 598),
(12, 'ru', 336, 0.1187, 362),
(12, 'ru', 342, 0.1881, 448.5),
(12, 'ru', 352, 0.3332, 371.167),
(12, 'ru', 359, 0.1187, 218),
(12, 'ru', 360, 0.1187, 221),
(12, 'ru', 362, 0.1187, 342),
(12, 'ru', 363, 0.1187, 343),
(12, 'ru', 365, 0.1881, 431),
(12, 'ru', 367, 0.1881, 562.5),
(12, 'ru', 372, 0.1881, 431),
(12, 'ru', 380, 0.1187, 155),
(12, 'ru', 394, 0.1187, 292),
(12, 'ru', 400, 0.1187, 64),
(12, 'ru', 401, 0.1187, 611),
(12, 'ru', 402, 0.3068, 280),
(12, 'ru', 403, 0.2374, 376),
(12, 'ru', 409, 0.1187, 99),
(12, 'ru', 412, 0.1187, 613),
(12, 'ru', 455, 0.1187, 80),
(12, 'ru', 463, 0.1187, 1),
(12, 'ru', 464, 0.1187, 2),
(12, 'ru', 465, 0.1881, 218),
(12, 'ru', 466, 0.1187, 12),
(12, 'ru', 467, 0.1187, 15),
(12, 'ru', 468, 0.1187, 17),
(12, 'ru', 469, 0.1187, 26),
(12, 'ru', 470, 0.1187, 28),
(12, 'ru', 471, 0.1187, 29),
(12, 'ru', 472, 0.1187, 31),
(12, 'ru', 473, 0.2756, 202),
(12, 'ru', 474, 0.1187, 35),
(12, 'ru', 475, 0.1187, 36),
(12, 'ru', 476, 0.1187, 45),
(12, 'ru', 477, 0.1187, 46),
(12, 'ru', 478, 0.1187, 53),
(12, 'ru', 479, 0.1187, 54),
(12, 'ru', 480, 0.1187, 55),
(12, 'ru', 481, 0.1881, 86.5),
(12, 'ru', 482, 0.1187, 60),
(12, 'ru', 483, 0.1187, 62),
(12, 'ru', 484, 0.1187, 63),
(12, 'ru', 485, 0.1187, 70),
(12, 'ru', 486, 0.1187, 76),
(12, 'ru', 487, 0.1187, 78),
(12, 'ru', 488, 0.1187, 82),
(12, 'ru', 489, 0.1187, 84),
(12, 'ru', 490, 0.1881, 282.5),
(12, 'ru', 491, 0.1187, 94),
(12, 'ru', 492, 0.1187, 96),
(12, 'ru', 493, 0.2374, 209.667),
(12, 'ru', 494, 0.1187, 100),
(12, 'ru', 495, 0.1187, 107),
(12, 'ru', 496, 0.1187, 108),
(12, 'ru', 497, 0.1187, 111),
(12, 'ru', 498, 0.1187, 115),
(12, 'ru', 499, 0.1187, 116),
(12, 'ru', 500, 0.1187, 121),
(12, 'ru', 501, 0.1881, 148),
(12, 'ru', 502, 0.1187, 130),
(12, 'ru', 503, 0.1187, 137),
(12, 'ru', 504, 0.1881, 232),
(12, 'ru', 505, 0.1881, 311),
(12, 'ru', 506, 0.1187, 141),
(12, 'ru', 507, 0.1881, 150),
(12, 'ru', 508, 0.1187, 154),
(12, 'ru', 509, 0.1187, 156),
(12, 'ru', 510, 0.1187, 158),
(12, 'ru', 511, 0.1187, 161),
(12, 'ru', 512, 0.1187, 162),
(12, 'ru', 513, 0.1187, 164),
(12, 'ru', 514, 0.1187, 176),
(12, 'ru', 515, 0.1187, 183),
(12, 'ru', 516, 0.1187, 192),
(12, 'ru', 517, 0.1187, 196),
(12, 'ru', 518, 0.1187, 198),
(12, 'ru', 519, 0.1187, 199),
(12, 'ru', 520, 0.1187, 202),
(12, 'ru', 521, 0.1187, 203),
(12, 'ru', 522, 0.1187, 220),
(12, 'ru', 523, 0.1187, 228),
(12, 'ru', 524, 0.1187, 229),
(12, 'ru', 525, 0.1187, 230),
(12, 'ru', 526, 0.1881, 247),
(12, 'ru', 527, 0.1881, 249),
(12, 'ru', 528, 0.1187, 236),
(12, 'ru', 529, 0.1187, 238),
(12, 'ru', 530, 0.1187, 245),
(12, 'ru', 531, 0.1187, 251),
(12, 'ru', 532, 0.1187, 253),
(12, 'ru', 533, 0.1187, 255),
(12, 'ru', 534, 0.1187, 262),
(12, 'ru', 535, 0.1187, 269),
(12, 'ru', 536, 0.1187, 276),
(12, 'ru', 537, 0.1187, 284),
(12, 'ru', 538, 0.1187, 286),
(12, 'ru', 539, 0.1187, 291),
(12, 'ru', 540, 0.1881, 461.5),
(12, 'ru', 541, 0.1881, 461.5),
(12, 'ru', 542, 0.1187, 297),
(12, 'ru', 543, 0.1187, 299),
(12, 'ru', 544, 0.1187, 300),
(12, 'ru', 545, 0.1187, 300),
(12, 'ru', 546, 0.1187, 301),
(12, 'ru', 547, 0.1187, 308),
(12, 'ru', 548, 0.1187, 314),
(12, 'ru', 549, 0.2756, 444),
(12, 'ru', 550, 0.2374, 374.333),
(12, 'ru', 551, 0.1187, 327),
(12, 'ru', 552, 0.2374, 482.333),
(12, 'ru', 553, 0.2374, 484.333),
(12, 'ru', 554, 0.1187, 341),
(12, 'ru', 555, 0.1187, 345),
(12, 'ru', 556, 0.1187, 346),
(12, 'ru', 557, 0.1187, 347),
(12, 'ru', 558, 0.1187, 353),
(12, 'ru', 559, 0.1881, 428.5),
(12, 'ru', 560, 0.2374, 495.667),
(12, 'ru', 561, 0.1187, 374),
(12, 'ru', 562, 0.2374, 410),
(12, 'ru', 563, 0.1187, 382),
(12, 'ru', 564, 0.2756, 504.5),
(12, 'ru', 565, 0.1881, 426.5),
(12, 'ru', 566, 0.1187, 394),
(12, 'ru', 567, 0.1187, 400),
(12, 'ru', 568, 0.1187, 407),
(12, 'ru', 569, 0.1187, 411),
(12, 'ru', 570, 0.1187, 413),
(12, 'ru', 571, 0.2374, 472.333),
(12, 'ru', 572, 0.1187, 415),
(12, 'ru', 573, 0.1187, 419),
(12, 'ru', 574, 0.1187, 420),
(12, 'ru', 575, 0.1187, 427),
(12, 'ru', 576, 0.1187, 430),
(12, 'ru', 577, 0.1187, 431),
(12, 'ru', 578, 0.1187, 442),
(12, 'ru', 579, 0.1187, 452),
(12, 'ru', 580, 0.2756, 533.25),
(12, 'ru', 581, 0.1187, 454),
(12, 'ru', 582, 0.1187, 456),
(12, 'ru', 583, 0.1187, 457),
(12, 'ru', 584, 0.1187, 469),
(12, 'ru', 585, 0.1187, 471),
(12, 'ru', 586, 0.1187, 472),
(12, 'ru', 587, 0.1187, 480),
(12, 'ru', 588, 0.1187, 481),
(12, 'ru', 589, 0.1187, 483),
(12, 'ru', 590, 0.1187, 483),
(12, 'ru', 591, 0.1187, 485),
(12, 'ru', 592, 0.1187, 492),
(12, 'ru', 593, 0.2756, 545.25),
(12, 'ru', 594, 0.1187, 509),
(12, 'ru', 595, 0.1881, 561),
(12, 'ru', 596, 0.1187, 515),
(12, 'ru', 597, 0.1881, 550.5),
(12, 'ru', 598, 0.1187, 550),
(12, 'ru', 599, 0.1187, 558),
(12, 'ru', 600, 0.1187, 559),
(12, 'ru', 601, 0.1187, 574),
(12, 'ru', 602, 0.1187, 582),
(12, 'ru', 603, 0.1881, 597),
(12, 'ru', 604, 0.1187, 594),
(12, 'ru', 605, 0.1187, 597),
(12, 'ru', 606, 0.1187, 615),
(12, 'ru', 607, 0.1187, 627),
(12, 'ru', 608, 0.1187, 639),
(12, 'ru', 609, 0.1187, 640),
(13, 'ru', 610, 0.2314, 1),
(14, 'ru', 5, 0.4561, 127.1),
(14, 'ru', 6, 0.1318, 54),
(14, 'ru', 10, 0.209, 197.5),
(14, 'ru', 12, 0.3955, 115.714),
(14, 'ru', 23, 0.1318, 115),
(14, 'ru', 24, 0.438, 136.778),
(14, 'ru', 25, 0.1318, 60),
(14, 'ru', 26, 0.1318, 286),
(14, 'ru', 27, 0.2637, 134.667),
(14, 'ru', 62, 0.1318, 235),
(14, 'ru', 63, 0.1318, 244),
(14, 'ru', 82, 0.1318, 130),
(14, 'ru', 100, 0.209, 27),
(14, 'ru', 117, 0.1318, 81),
(14, 'ru', 131, 0.1318, 125),
(14, 'ru', 139, 0.209, 177),
(14, 'ru', 148, 0.1318, 269),
(14, 'ru', 157, 0.209, 129),
(14, 'ru', 161, 0.1318, 154),
(14, 'ru', 167, 0.2637, 130.667),
(14, 'ru', 168, 0.2637, 130.667),
(14, 'ru', 193, 0.1318, 280),
(14, 'ru', 196, 0.1318, 79),
(14, 'ru', 234, 0.1318, 123),
(14, 'ru', 281, 0.1318, 234),
(14, 'ru', 282, 0.1318, 236),
(14, 'ru', 289, 0.1318, 249),
(14, 'ru', 321, 0.1318, 250),
(14, 'ru', 352, 0.1318, 252),
(14, 'ru', 359, 0.1318, 217),
(14, 'ru', 412, 0.1318, 70),
(14, 'ru', 431, 0.1318, 175),
(14, 'ru', 518, 0.2637, 172),
(14, 'ru', 521, 0.1318, 207),
(14, 'ru', 541, 0.1318, 77),
(14, 'ru', 581, 0.1318, 117),
(14, 'ru', 611, 0.4179, 126.25),
(14, 'ru', 612, 0.3061, 27.25),
(14, 'ru', 613, 0.209, 16),
(14, 'ru', 614, 0.209, 18),
(14, 'ru', 615, 0.2637, 109),
(14, 'ru', 616, 0.2637, 110),
(14, 'ru', 617, 0.3061, 75.5),
(14, 'ru', 618, 0.209, 26),
(14, 'ru', 619, 0.209, 28),
(14, 'ru', 620, 0.209, 30),
(14, 'ru', 621, 0.2637, 101.667),
(14, 'ru', 622, 0.1318, 50),
(14, 'ru', 623, 0.209, 167),
(14, 'ru', 624, 0.1318, 52),
(14, 'ru', 625, 0.1318, 53),
(14, 'ru', 626, 0.1318, 57),
(14, 'ru', 627, 0.1318, 58),
(14, 'ru', 628, 0.1318, 59),
(14, 'ru', 629, 0.1318, 61),
(14, 'ru', 630, 0.1318, 63),
(14, 'ru', 631, 0.209, 120.5),
(14, 'ru', 632, 0.1318, 75),
(14, 'ru', 633, 0.1318, 80),
(14, 'ru', 634, 0.1318, 83),
(14, 'ru', 635, 0.1318, 91),
(14, 'ru', 636, 0.1318, 93),
(14, 'ru', 637, 0.1318, 94),
(14, 'ru', 638, 0.209, 132),
(14, 'ru', 639, 0.1318, 96),
(14, 'ru', 640, 0.2637, 115.333),
(14, 'ru', 641, 0.209, 104),
(14, 'ru', 642, 0.1318, 114),
(14, 'ru', 643, 0.1318, 121),
(14, 'ru', 644, 0.1318, 124),
(14, 'ru', 645, 0.1318, 126),
(14, 'ru', 646, 0.1318, 132),
(14, 'ru', 647, 0.1318, 133),
(14, 'ru', 648, 0.1318, 146),
(14, 'ru', 649, 0.1318, 147),
(14, 'ru', 650, 0.1318, 150),
(14, 'ru', 651, 0.1318, 152),
(14, 'ru', 652, 0.1318, 153),
(14, 'ru', 653, 0.1318, 154),
(14, 'ru', 654, 0.1318, 156),
(14, 'ru', 655, 0.1318, 156),
(14, 'ru', 656, 0.1318, 165),
(14, 'ru', 657, 0.1318, 166),
(14, 'ru', 658, 0.1318, 171),
(14, 'ru', 659, 0.1318, 172),
(14, 'ru', 660, 0.1318, 173),
(14, 'ru', 661, 0.1318, 174),
(14, 'ru', 662, 0.209, 201.5),
(14, 'ru', 663, 0.209, 202.5),
(14, 'ru', 664, 0.1318, 187),
(14, 'ru', 665, 0.1318, 189),
(14, 'ru', 666, 0.1318, 196),
(14, 'ru', 667, 0.1318, 197),
(14, 'ru', 668, 0.1318, 201),
(14, 'ru', 669, 0.1318, 202),
(14, 'ru', 670, 0.209, 213),
(14, 'ru', 671, 0.2637, 250.667),
(14, 'ru', 672, 0.1318, 206),
(14, 'ru', 673, 0.1318, 222),
(14, 'ru', 674, 0.1318, 224),
(14, 'ru', 675, 0.1318, 225),
(14, 'ru', 676, 0.1318, 225),
(14, 'ru', 677, 0.1318, 237),
(14, 'ru', 678, 0.1318, 239),
(14, 'ru', 679, 0.1318, 241),
(14, 'ru', 680, 0.1318, 242),
(14, 'ru', 681, 0.1318, 243),
(14, 'ru', 682, 0.1318, 245),
(14, 'ru', 683, 0.1318, 246),
(14, 'ru', 684, 0.1318, 248),
(14, 'ru', 685, 0.1318, 253),
(14, 'ru', 686, 0.1318, 254),
(14, 'ru', 687, 0.1318, 260),
(14, 'ru', 688, 0.1318, 262),
(14, 'ru', 689, 0.1318, 262),
(14, 'ru', 690, 0.1318, 265),
(14, 'ru', 691, 0.1318, 266),
(14, 'ru', 692, 0.1318, 267),
(14, 'ru', 693, 0.1318, 270),
(14, 'ru', 694, 0.1318, 271),
(14, 'ru', 695, 0.1318, 281),
(14, 'ru', 696, 0.1318, 288),
(15, 'ru', 5, 0.1577, 2),
(15, 'ru', 6, 0.1577, 85),
(15, 'ru', 12, 0.3155, 57),
(15, 'ru', 13, 0.1577, 97),
(15, 'ru', 24, 0.25, 62.5),
(15, 'ru', 29, 0.1577, 66),
(15, 'ru', 74, 0.1577, 58),
(15, 'ru', 82, 0.1577, 56),
(15, 'ru', 95, 0.1577, 116),
(15, 'ru', 109, 0.3662, 59),
(15, 'ru', 118, 0.1577, 70),
(15, 'ru', 119, 0.1577, 62),
(15, 'ru', 139, 0.1577, 139),
(15, 'ru', 157, 0.1577, 50),
(15, 'ru', 269, 0.1577, 1),
(15, 'ru', 364, 0.1577, 86),
(15, 'ru', 402, 0.1577, 117),
(15, 'ru', 477, 0.1577, 106),
(15, 'ru', 533, 0.1577, 84),
(15, 'ru', 609, 0.1577, 105),
(15, 'ru', 616, 0.3155, 56),
(15, 'ru', 621, 0.1577, 112),
(15, 'ru', 623, 0.1577, 79),
(15, 'ru', 642, 0.1577, 51),
(15, 'ru', 657, 0.25, 27.5),
(15, 'ru', 663, 0.4732, 62.5714),
(15, 'ru', 666, 0.1577, 136),
(15, 'ru', 668, 0.25, 23.5),
(15, 'ru', 697, 0.3662, 23),
(15, 'ru', 698, 0.3662, 24),
(15, 'ru', 699, 0.3662, 25),
(15, 'ru', 700, 0.25, 29.5),
(15, 'ru', 701, 0.1577, 53),
(15, 'ru', 702, 0.1577, 60),
(15, 'ru', 703, 0.1577, 64),
(15, 'ru', 704, 0.1577, 64),
(15, 'ru', 705, 0.1577, 65),
(15, 'ru', 706, 0.1577, 68),
(15, 'ru', 707, 0.1577, 77),
(15, 'ru', 708, 0.1577, 80),
(15, 'ru', 709, 0.1577, 87),
(15, 'ru', 710, 0.1577, 88),
(15, 'ru', 711, 0.1577, 94),
(15, 'ru', 712, 0.1577, 98),
(15, 'ru', 713, 0.1577, 101),
(15, 'ru', 714, 0.1577, 103),
(15, 'ru', 715, 0.1577, 104),
(15, 'ru', 716, 0.1577, 114),
(15, 'ru', 717, 0.1577, 118),
(15, 'ru', 718, 0.1577, 119),
(15, 'ru', 719, 0.1577, 120),
(15, 'ru', 720, 0.1577, 137),
(15, 'ru', 721, 0.1577, 140),
(15, 'ru', 722, 0.1577, 143),
(15, 'ru', 723, 0.1577, 144),
(16, 'ru', 5, 0.2176, 56),
(16, 'ru', 9, 0.1373, 67),
(16, 'ru', 30, 0.2176, 50),
(16, 'ru', 38, 0.3187, 176.25),
(16, 'ru', 63, 0.2176, 3),
(16, 'ru', 113, 0.1373, 164),
(16, 'ru', 252, 0.2176, 74),
(16, 'ru', 297, 0.1373, 149),
(16, 'ru', 352, 0.1373, 6),
(16, 'ru', 368, 0.2176, 45),
(16, 'ru', 412, 0.3187, 64.5),
(16, 'ru', 474, 0.2176, 55),
(16, 'ru', 539, 0.2176, 65),
(16, 'ru', 724, 0.2745, 53.6667),
(16, 'ru', 725, 0.2745, 55),
(16, 'ru', 726, 0.2745, 56.6667),
(16, 'ru', 727, 0.4118, 108.429),
(16, 'ru', 728, 0.3853, 89.6667),
(16, 'ru', 729, 0.2176, 47),
(16, 'ru', 730, 0.2745, 82.3333),
(16, 'ru', 731, 0.2176, 51),
(16, 'ru', 732, 0.2176, 52),
(16, 'ru', 733, 0.2176, 53),
(16, 'ru', 734, 0.2176, 58),
(16, 'ru', 735, 0.2176, 59),
(16, 'ru', 736, 0.3548, 120),
(16, 'ru', 737, 0.2176, 68),
(16, 'ru', 738, 0.2176, 71),
(16, 'ru', 739, 0.2176, 72),
(16, 'ru', 740, 0.2176, 78),
(16, 'ru', 741, 0.4351, 152.125),
(16, 'ru', 742, 0.1373, 57),
(16, 'ru', 743, 0.1373, 59),
(16, 'ru', 744, 0.1373, 59),
(16, 'ru', 745, 0.1373, 60),
(16, 'ru', 746, 0.1373, 61),
(16, 'ru', 747, 0.1373, 63),
(16, 'ru', 748, 0.1373, 63),
(16, 'ru', 749, 0.1373, 64),
(16, 'ru', 750, 0.1373, 65),
(16, 'ru', 751, 0.1373, 66),
(16, 'ru', 752, 0.1373, 68),
(16, 'ru', 753, 0.1373, 69),
(16, 'ru', 754, 0.1373, 70),
(16, 'ru', 755, 0.1373, 113),
(16, 'ru', 756, 0.1373, 116),
(16, 'ru', 757, 0.1373, 117),
(16, 'ru', 758, 0.1373, 118),
(16, 'ru', 759, 0.2176, 157.5),
(16, 'ru', 760, 0.4118, 188.857),
(16, 'ru', 761, 0.1373, 122),
(16, 'ru', 762, 0.1373, 123),
(16, 'ru', 763, 0.1373, 125),
(16, 'ru', 764, 0.1373, 136),
(16, 'ru', 765, 0.1373, 137),
(16, 'ru', 766, 0.1373, 138),
(16, 'ru', 767, 0.1373, 140),
(16, 'ru', 768, 0.2745, 193),
(16, 'ru', 769, 0.1373, 148),
(16, 'ru', 770, 0.1373, 163),
(16, 'ru', 771, 0.2176, 176.5),
(16, 'ru', 772, 0.2176, 175),
(16, 'ru', 773, 0.1373, 173),
(16, 'ru', 774, 0.1373, 175),
(16, 'ru', 775, 0.1373, 176),
(16, 'ru', 776, 0.2176, 185),
(16, 'ru', 777, 0.1373, 178),
(16, 'ru', 778, 0.2745, 215.667),
(16, 'ru', 779, 0.2176, 216.5),
(16, 'ru', 780, 0.2176, 215),
(16, 'ru', 781, 0.2176, 216),
(16, 'ru', 782, 0.2176, 217),
(16, 'ru', 783, 0.2176, 218),
(16, 'ru', 784, 0.1373, 208),
(16, 'ru', 785, 0.1373, 209),
(16, 'ru', 786, 0.1373, 210),
(16, 'ru', 787, 0.1373, 210),
(16, 'ru', 788, 0.1373, 211),
(16, 'ru', 789, 0.1373, 225),
(16, 'ru', 790, 0.1373, 226),
(16, 'ru', 791, 0.1373, 234),
(16, 'ru', 792, 0.1373, 240),
(16, 'ru', 793, 0.1373, 244),
(16, 'ru', 794, 0.1373, 245),
(17, 'ru', 24, 0.3667, 5),
(17, 'ru', 581, 0.3667, 4),
(17, 'ru', 795, 0.2314, 3),
(17, 'ru', 796, 0.2314, 4),
(17, 'ru', 797, 0.2314, 6),
(18, 'ru', 24, 0.2314, 2),
(18, 'ru', 795, 0.2314, 3),
(18, 'ru', 798, 0.2314, 1),
(18, 'ru', 799, 0.2314, 4),
(18, 'ru', 800, 0.2314, 5),
(19, 'ru', 24, 0.2314, 1),
(19, 'ru', 117, 0.2314, 3),
(19, 'ru', 799, 0.2314, 6),
(19, 'ru', 800, 0.2314, 8),
(19, 'ru', 801, 0.2314, 4),
(19, 'ru', 802, 0.2314, 5),
(20, 'ru', 24, 0.3667, 4.5),
(20, 'ru', 118, 0.3667, 3.5),
(20, 'ru', 581, 0.2314, 5),
(20, 'ru', 800, 0.2314, 4),
(20, 'ru', 803, 0.2314, 3),
(21, 'ru', 134, 0.3504, 21.5),
(21, 'ru', 161, 0.3504, 14.5),
(21, 'ru', 652, 0.3504, 17.5),
(21, 'ru', 804, 0.2211, 1),
(21, 'ru', 805, 0.3504, 11.5),
(21, 'ru', 806, 0.3504, 12.5),
(21, 'ru', 807, 0.3504, 15.5),
(21, 'ru', 808, 0.3504, 16.5),
(21, 'ru', 809, 0.3504, 19.5),
(21, 'ru', 810, 0.3504, 20.5),
(21, 'ru', 811, 0.3504, 23.5),
(21, 'ru', 812, 0.3504, 24.5),
(22, 'ru', 105, 0.3199, 42.5),
(22, 'ru', 111, 0.3199, 25.5),
(22, 'ru', 282, 0.3199, 43.5),
(22, 'ru', 539, 0.3199, 24.5),
(22, 'ru', 774, 0.3199, 32.5),
(22, 'ru', 806, 0.3199, 31.5),
(22, 'ru', 813, 0.2018, 1),
(22, 'ru', 814, 0.3199, 19.5),
(22, 'ru', 815, 0.3199, 21.5),
(22, 'ru', 816, 0.3199, 22.5),
(22, 'ru', 817, 0.3199, 33.5),
(22, 'ru', 818, 0.3199, 34.5),
(22, 'ru', 819, 0.3199, 41.5),
(22, 'ru', 820, 0.3199, 44.5),
(22, 'ru', 821, 0.3199, 46.5),
(22, 'ru', 822, 0.3199, 48.5),
(23, 'ru', 37, 0.2886, 45.5),
(23, 'ru', 131, 0.2886, 44.5),
(23, 'ru', 140, 0.2886, 42.5),
(23, 'ru', 287, 0.2886, 58.5),
(23, 'ru', 348, 0.2886, 46.5),
(23, 'ru', 598, 0.2886, 60.5),
(23, 'ru', 796, 0.2886, 24.5),
(23, 'ru', 798, 0.2886, 43.5),
(23, 'ru', 823, 0.3642, 18),
(23, 'ru', 824, 0.2886, 25.5),
(23, 'ru', 825, 0.2886, 27.5),
(23, 'ru', 826, 0.2886, 29.5),
(23, 'ru', 827, 0.2886, 30.5),
(23, 'ru', 828, 0.2886, 31.5),
(23, 'ru', 829, 0.2886, 32.5),
(23, 'ru', 830, 0.2886, 40.5),
(23, 'ru', 831, 0.4228, 49.5),
(23, 'ru', 832, 0.2886, 53.5),
(23, 'ru', 833, 0.2886, 56.5),
(23, 'ru', 834, 0.2886, 62.5),
(23, 'ru', 835, 0.2886, 63.5),
(24, 'ru', 111, 0.2853, 20),
(24, 'ru', 175, 0.2853, 27),
(24, 'ru', 272, 0.2853, 19),
(24, 'ru', 796, 0.2853, 22),
(24, 'ru', 798, 0.2853, 21),
(24, 'ru', 821, 0.2853, 44),
(24, 'ru', 822, 0.2853, 34),
(24, 'ru', 836, 0.18, 1),
(24, 'ru', 837, 0.2853, 23),
(24, 'ru', 838, 0.2853, 24),
(24, 'ru', 839, 0.2853, 25),
(24, 'ru', 840, 0.2853, 26),
(24, 'ru', 841, 0.2853, 28),
(24, 'ru', 842, 0.2853, 30),
(24, 'ru', 843, 0.2853, 31),
(24, 'ru', 844, 0.2853, 32),
(24, 'ru', 845, 0.2853, 33),
(24, 'ru', 846, 0.2853, 34),
(24, 'ru', 847, 0.2853, 36),
(24, 'ru', 848, 0.2853, 37),
(24, 'ru', 849, 0.2853, 43),
(24, 'ru', 850, 0.2853, 45),
(24, 'ru', 851, 0.2853, 46),
(24, 'ru', 852, 0.2853, 47),
(25, 'ru', 117, 0.3504, 23),
(25, 'ru', 123, 0.3504, 20),
(25, 'ru', 140, 0.3504, 19),
(25, 'ru', 194, 0.3504, 14),
(25, 'ru', 800, 0.3504, 12),
(25, 'ru', 853, 0.4421, 9),
(25, 'ru', 854, 0.3504, 11),
(25, 'ru', 855, 0.3504, 16),
(25, 'ru', 856, 0.3504, 17),
(25, 'ru', 857, 0.3504, 18),
(25, 'ru', 858, 0.3504, 21),
(26, 'ru', 75, 0.3608, 26),
(26, 'ru', 161, 0.3608, 17),
(26, 'ru', 642, 0.3608, 28),
(26, 'ru', 652, 0.3608, 30),
(26, 'ru', 805, 0.3608, 14),
(26, 'ru', 806, 0.3608, 15),
(26, 'ru', 807, 0.3608, 18),
(26, 'ru', 809, 0.3608, 25),
(26, 'ru', 818, 0.3608, 19),
(26, 'ru', 859, 0.2277, 1),
(26, 'ru', 860, 0.3608, 32),
(27, 'ru', 33, 0.2823, 33.5),
(27, 'ru', 49, 0.2823, 36.5),
(27, 'ru', 105, 0.2823, 49.5),
(27, 'ru', 111, 0.2823, 23.5),
(27, 'ru', 199, 0.2823, 56.5),
(27, 'ru', 652, 0.2823, 32.5),
(27, 'ru', 809, 0.2823, 29.5),
(27, 'ru', 819, 0.2823, 48.5),
(27, 'ru', 831, 0.2823, 50.5),
(27, 'ru', 861, 0.1781, 1),
(27, 'ru', 862, 0.2823, 21.5),
(27, 'ru', 863, 0.2823, 22.5),
(27, 'ru', 864, 0.2823, 31.5),
(27, 'ru', 865, 0.2823, 34.5),
(27, 'ru', 866, 0.2823, 35.5),
(27, 'ru', 867, 0.2823, 37.5),
(27, 'ru', 868, 0.2823, 38.5),
(27, 'ru', 869, 0.2823, 40.5),
(27, 'ru', 870, 0.2823, 41.5),
(27, 'ru', 871, 0.2823, 51.5),
(27, 'ru', 872, 0.2823, 52.5),
(27, 'ru', 873, 0.2823, 53.5),
(27, 'ru', 874, 0.2823, 55.5),
(27, 'ru', 875, 0.2823, 58.5),
(27, 'ru', 876, 0.2823, 59.5),
(28, 'ru', 33, 0.2853, 28),
(28, 'ru', 49, 0.2853, 31),
(28, 'ru', 75, 0.2853, 44),
(28, 'ru', 105, 0.2853, 50),
(28, 'ru', 282, 0.2853, 51),
(28, 'ru', 542, 0.2853, 43),
(28, 'ru', 652, 0.2853, 25),
(28, 'ru', 805, 0.2853, 22),
(28, 'ru', 806, 0.2853, 23),
(28, 'ru', 809, 0.418, 34.5),
(28, 'ru', 819, 0.2853, 49),
(28, 'ru', 820, 0.2853, 52),
(28, 'ru', 821, 0.2853, 56),
(28, 'ru', 822, 0.2853, 54),
(28, 'ru', 860, 0.2853, 47),
(28, 'ru', 864, 0.2853, 24),
(28, 'ru', 865, 0.2853, 29),
(28, 'ru', 866, 0.2853, 30),
(28, 'ru', 867, 0.2853, 32),
(28, 'ru', 868, 0.2853, 33),
(28, 'ru', 869, 0.2853, 35),
(28, 'ru', 870, 0.2853, 36),
(28, 'ru', 877, 0.18, 1),
(29, 'ru', 111, 0.4687, 23),
(29, 'ru', 131, 0.3199, 21),
(29, 'ru', 140, 0.3199, 17),
(29, 'ru', 214, 0.3199, 21),
(29, 'ru', 576, 0.3199, 34),
(29, 'ru', 808, 0.3199, 20),
(29, 'ru', 855, 0.3199, 15),
(29, 'ru', 866, 0.3199, 31),
(29, 'ru', 869, 0.3199, 27),
(29, 'ru', 878, 0.2018, 1),
(29, 'ru', 879, 0.3199, 19),
(29, 'ru', 880, 0.3199, 29),
(29, 'ru', 881, 0.3199, 32),
(29, 'ru', 882, 0.3199, 35),
(29, 'ru', 883, 0.3199, 35),
(30, 'ru', 75, 0.3413, 39),
(30, 'ru', 243, 0.3413, 32),
(30, 'ru', 652, 0.3413, 43),
(30, 'ru', 809, 0.3413, 38),
(30, 'ru', 822, 0.3413, 28),
(30, 'ru', 855, 0.3413, 21),
(30, 'ru', 860, 0.3413, 47),
(30, 'ru', 884, 0.2153, 1),
(30, 'ru', 885, 0.3413, 19),
(30, 'ru', 886, 0.3413, 22),
(30, 'ru', 887, 0.3413, 29),
(30, 'ru', 888, 0.5, 30),
(31, 'ru', 111, 0.2886, 45),
(31, 'ru', 652, 0.2886, 41),
(31, 'ru', 809, 0.2886, 43),
(31, 'ru', 819, 0.2886, 34),
(31, 'ru', 864, 0.2886, 40),
(31, 'ru', 866, 0.2886, 44),
(31, 'ru', 867, 0.2886, 46),
(31, 'ru', 868, 0.2886, 47),
(31, 'ru', 869, 0.2886, 49),
(31, 'ru', 870, 0.2886, 50),
(31, 'ru', 889, 0.1821, 1),
(31, 'ru', 890, 0.2886, 20),
(31, 'ru', 891, 0.2886, 21),
(31, 'ru', 892, 0.4228, 25.5),
(31, 'ru', 893, 0.4228, 25.5),
(31, 'ru', 894, 0.2886, 24),
(31, 'ru', 895, 0.2886, 25),
(31, 'ru', 896, 0.2886, 29),
(31, 'ru', 897, 0.2886, 30),
(31, 'ru', 898, 0.2886, 31),
(31, 'ru', 899, 0.2886, 31),
(32, 'ru', 24, 0.238, 58),
(32, 'ru', 44, 0.238, 97),
(32, 'ru', 82, 0.238, 94),
(32, 'ru', 115, 0.238, 96),
(32, 'ru', 136, 0.238, 68),
(32, 'ru', 142, 0.238, 70),
(32, 'ru', 161, 0.238, 72),
(32, 'ru', 175, 0.4216, 75),
(32, 'ru', 291, 0.4216, 90.3333),
(32, 'ru', 507, 0.238, 113),
(32, 'ru', 539, 0.3487, 74.5),
(32, 'ru', 653, 0.238, 72),
(32, 'ru', 756, 0.238, 48),
(32, 'ru', 838, 0.238, 60),
(32, 'ru', 839, 0.238, 55),
(32, 'ru', 855, 0.238, 62),
(32, 'ru', 858, 0.238, 95),
(32, 'ru', 886, 0.238, 61),
(32, 'ru', 900, 0.1502, 1),
(32, 'ru', 901, 0.238, 44),
(32, 'ru', 902, 0.238, 45),
(32, 'ru', 903, 0.3487, 75.5),
(32, 'ru', 904, 0.238, 49),
(32, 'ru', 905, 0.238, 50),
(32, 'ru', 906, 0.238, 51),
(32, 'ru', 907, 0.238, 53),
(32, 'ru', 908, 0.238, 56),
(32, 'ru', 909, 0.238, 63),
(32, 'ru', 910, 0.238, 65),
(32, 'ru', 911, 0.238, 69),
(32, 'ru', 912, 0.238, 71),
(32, 'ru', 913, 0.238, 74),
(32, 'ru', 914, 0.238, 78),
(32, 'ru', 915, 0.238, 86),
(32, 'ru', 916, 0.238, 88),
(32, 'ru', 917, 0.238, 89),
(32, 'ru', 918, 0.238, 91),
(32, 'ru', 919, 0.238, 105),
(32, 'ru', 920, 0.238, 108),
(32, 'ru', 921, 0.238, 108),
(32, 'ru', 922, 0.238, 110),
(32, 'ru', 923, 0.238, 114),
(32, 'ru', 924, 0.238, 118),
(32, 'ru', 925, 0.238, 118),
(32, 'ru', 926, 0.238, 122),
(33, 'ru', 6, 0.224, 68),
(33, 'ru', 19, 0.224, 138),
(33, 'ru', 24, 0.3281, 102.5),
(33, 'ru', 55, 0.224, 65),
(33, 'ru', 82, 0.224, 158),
(33, 'ru', 85, 0.224, 80),
(33, 'ru', 104, 0.224, 134),
(33, 'ru', 131, 0.224, 104),
(33, 'ru', 135, 0.224, 123),
(33, 'ru', 142, 0.224, 108),
(33, 'ru', 171, 0.224, 63),
(33, 'ru', 187, 0.224, 110),
(33, 'ru', 243, 0.224, 161),
(33, 'ru', 278, 0.224, 140),
(33, 'ru', 285, 0.3967, 102),
(33, 'ru', 286, 0.3967, 119.667),
(33, 'ru', 291, 0.3281, 125.5),
(33, 'ru', 311, 0.224, 135),
(33, 'ru', 330, 0.224, 87),
(33, 'ru', 337, 0.224, 130),
(33, 'ru', 342, 0.224, 110),
(33, 'ru', 440, 0.224, 66),
(33, 'ru', 481, 0.224, 95),
(33, 'ru', 484, 0.224, 85),
(33, 'ru', 570, 0.224, 117),
(33, 'ru', 799, 0.224, 118),
(33, 'ru', 903, 0.224, 93),
(33, 'ru', 911, 0.224, 151),
(33, 'ru', 916, 0.224, 57),
(33, 'ru', 927, 0.3653, 96.6),
(33, 'ru', 928, 0.224, 58),
(33, 'ru', 929, 0.224, 61),
(33, 'ru', 930, 0.224, 64),
(33, 'ru', 931, 0.224, 74),
(33, 'ru', 932, 0.224, 75),
(33, 'ru', 933, 0.224, 79),
(33, 'ru', 934, 0.224, 81),
(33, 'ru', 935, 0.224, 82),
(33, 'ru', 936, 0.224, 84),
(33, 'ru', 937, 0.224, 96),
(33, 'ru', 938, 0.224, 97),
(33, 'ru', 939, 0.3281, 127.5),
(33, 'ru', 940, 0.224, 102),
(33, 'ru', 941, 0.224, 103),
(33, 'ru', 942, 0.224, 106),
(33, 'ru', 943, 0.224, 107),
(33, 'ru', 944, 0.224, 109),
(33, 'ru', 945, 0.224, 116),
(33, 'ru', 946, 0.224, 119),
(33, 'ru', 947, 0.224, 120),
(33, 'ru', 948, 0.224, 122),
(33, 'ru', 949, 0.224, 124),
(33, 'ru', 950, 0.224, 125),
(33, 'ru', 951, 0.224, 128),
(33, 'ru', 952, 0.224, 131),
(33, 'ru', 953, 0.224, 133),
(33, 'ru', 954, 0.224, 150),
(33, 'ru', 955, 0.224, 152),
(33, 'ru', 956, 0.224, 160),
(34, 'ru', 24, 0.3322, 125.5),
(34, 'ru', 35, 0.2268, 134),
(34, 'ru', 38, 0.2268, 113),
(34, 'ru', 66, 0.2268, 89),
(34, 'ru', 109, 0.2268, 127),
(34, 'ru', 122, 0.2268, 81),
(34, 'ru', 129, 0.2268, 52),
(34, 'ru', 167, 0.2268, 129),
(34, 'ru', 168, 0.2268, 129),
(34, 'ru', 199, 0.2268, 126),
(34, 'ru', 208, 0.2268, 122),
(34, 'ru', 232, 0.2268, 108),
(34, 'ru', 403, 0.2268, 69),
(34, 'ru', 571, 0.2268, 103),
(34, 'ru', 681, 0.2268, 57),
(34, 'ru', 798, 0.2268, 135),
(34, 'ru', 799, 0.3322, 79.5),
(34, 'ru', 842, 0.2268, 125),
(34, 'ru', 855, 0.2268, 102),
(34, 'ru', 857, 0.2268, 99),
(34, 'ru', 870, 0.2268, 98),
(34, 'ru', 887, 0.3322, 58.5),
(34, 'ru', 902, 0.2268, 140),
(34, 'ru', 915, 0.2268, 96),
(34, 'ru', 957, 0.3699, 65.4),
(34, 'ru', 958, 0.2268, 50),
(34, 'ru', 959, 0.2268, 57),
(34, 'ru', 960, 0.2268, 59),
(34, 'ru', 961, 0.2268, 60),
(34, 'ru', 962, 0.2268, 61),
(34, 'ru', 963, 0.2268, 65),
(34, 'ru', 964, 0.2268, 68),
(34, 'ru', 965, 0.2268, 71),
(34, 'ru', 966, 0.2268, 73),
(34, 'ru', 967, 0.2268, 79),
(34, 'ru', 968, 0.2268, 82),
(34, 'ru', 969, 0.2268, 83),
(34, 'ru', 970, 0.2268, 84),
(34, 'ru', 971, 0.2268, 86),
(34, 'ru', 972, 0.2268, 87),
(34, 'ru', 973, 0.2268, 88),
(34, 'ru', 974, 0.2268, 89),
(34, 'ru', 975, 0.2268, 95),
(34, 'ru', 976, 0.2268, 97),
(34, 'ru', 977, 0.2268, 101),
(34, 'ru', 978, 0.2268, 104),
(34, 'ru', 979, 0.2268, 107),
(34, 'ru', 980, 0.2268, 109),
(34, 'ru', 981, 0.2268, 110),
(34, 'ru', 982, 0.2268, 111),
(34, 'ru', 983, 0.3322, 121),
(34, 'ru', 984, 0.2268, 121),
(34, 'ru', 985, 0.2268, 123),
(34, 'ru', 986, 0.2268, 130),
(34, 'ru', 987, 0.2268, 132),
(34, 'ru', 988, 0.2268, 137),
(34, 'ru', 989, 0.2268, 138),
(34, 'ru', 990, 0.2268, 139),
(35, 'ru', 37, 0.2577, 87.5),
(35, 'ru', 69, 0.2577, 85.5),
(35, 'ru', 286, 0.2577, 59.5),
(35, 'ru', 376, 0.2577, 71.5),
(35, 'ru', 539, 0.2577, 92.5),
(35, 'ru', 545, 0.1626, 1),
(35, 'ru', 571, 0.2577, 83.5),
(35, 'ru', 756, 0.2577, 89.5),
(35, 'ru', 799, 0.2577, 36.5),
(35, 'ru', 805, 0.2577, 44.5),
(35, 'ru', 838, 0.2577, 46.5),
(35, 'ru', 866, 0.2577, 42.5),
(35, 'ru', 888, 0.3776, 52.5),
(35, 'ru', 901, 0.2577, 90.5),
(35, 'ru', 903, 0.2577, 93.5),
(35, 'ru', 945, 0.2577, 88.5),
(35, 'ru', 948, 0.2577, 76.5),
(35, 'ru', 991, 0.3776, 60),
(35, 'ru', 992, 0.2577, 37.5),
(35, 'ru', 993, 0.2577, 39.5),
(35, 'ru', 994, 0.2577, 43.5),
(35, 'ru', 995, 0.2577, 54.5),
(35, 'ru', 996, 0.2577, 56.5),
(35, 'ru', 997, 0.2577, 57.5),
(35, 'ru', 998, 0.2577, 58.5),
(35, 'ru', 999, 0.2577, 61.5),
(35, 'ru', 1000, 0.2577, 62.5),
(35, 'ru', 1001, 0.2577, 64.5),
(35, 'ru', 1002, 0.2577, 70.5),
(35, 'ru', 1003, 0.2577, 72.5),
(35, 'ru', 1004, 0.2577, 73.5),
(35, 'ru', 1005, 0.2577, 75.5),
(35, 'ru', 1006, 0.2577, 82.5),
(35, 'ru', 1007, 0.2577, 91.5),
(36, 'ru', 12, 0.1577, 133),
(36, 'ru', 15, 0.25, 31),
(36, 'ru', 24, 0.25, 52),
(36, 'ru', 66, 0.25, 62),
(36, 'ru', 69, 0.1577, 98),
(36, 'ru', 109, 0.1577, 129),
(36, 'ru', 122, 0.25, 42),
(36, 'ru', 140, 0.25, 35),
(36, 'ru', 175, 0.25, 57),
(36, 'ru', 180, 0.1577, 100),
(36, 'ru', 188, 0.1577, 102),
(36, 'ru', 436, 0.25, 55),
(36, 'ru', 769, 0.25, 60),
(36, 'ru', 780, 0.1577, 130),
(36, 'ru', 796, 0.3662, 66),
(36, 'ru', 798, 0.25, 53),
(36, 'ru', 799, 0.25, 33),
(36, 'ru', 822, 0.1577, 112),
(36, 'ru', 824, 0.25, 27),
(36, 'ru', 855, 0.1577, 103),
(36, 'ru', 857, 0.1577, 104),
(36, 'ru', 951, 0.1577, 118),
(36, 'ru', 963, 0.25, 38),
(36, 'ru', 964, 0.3155, 19),
(36, 'ru', 1008, 0.25, 30),
(36, 'ru', 1009, 0.25, 32),
(36, 'ru', 1010, 0.3662, 46),
(36, 'ru', 1011, 0.25, 39),
(36, 'ru', 1012, 0.25, 40),
(36, 'ru', 1013, 0.25, 41),
(36, 'ru', 1014, 0.25, 48),
(36, 'ru', 1015, 0.25, 51),
(36, 'ru', 1016, 0.25, 56),
(36, 'ru', 1017, 0.25, 59),
(36, 'ru', 1018, 0.25, 61),
(36, 'ru', 1019, 0.25, 63),
(36, 'ru', 1020, 0.25, 65),
(36, 'ru', 1021, 0.25, 66),
(36, 'ru', 1022, 0.25, 68),
(36, 'ru', 1023, 0.1577, 110),
(36, 'ru', 1024, 0.1577, 114),
(36, 'ru', 1025, 0.1577, 115),
(36, 'ru', 1026, 0.1577, 117),
(36, 'ru', 1027, 0.1577, 124),
(36, 'ru', 1028, 0.1577, 125),
(36, 'ru', 1029, 0.1577, 126),
(36, 'ru', 1030, 0.1577, 131),
(37, 'ru', 111, 0.3042, 39.5),
(37, 'ru', 132, 0.3042, 21.5),
(37, 'ru', 139, 0.3042, 40.5),
(37, 'ru', 141, 0.3042, 23.5),
(37, 'ru', 171, 0.3042, 45.5),
(37, 'ru', 216, 0.3042, 29.5),
(37, 'ru', 287, 0.3042, 46.5),
(37, 'ru', 539, 0.3042, 38.5),
(37, 'ru', 618, 0.3042, 28.5),
(37, 'ru', 796, 0.3042, 20.5),
(37, 'ru', 798, 0.3042, 19.5),
(37, 'ru', 1031, 0.192, 1),
(37, 'ru', 1032, 0.3042, 25.5),
(37, 'ru', 1033, 0.3042, 26.5),
(37, 'ru', 1034, 0.3042, 30.5),
(37, 'ru', 1035, 0.3042, 32.5),
(37, 'ru', 1036, 0.3042, 41.5),
(37, 'ru', 1037, 0.3042, 43.5),
(37, 'ru', 1038, 0.3042, 48.5),
(38, 'ru', 75, 0.2694, 62.5),
(38, 'ru', 117, 0.2694, 30.5),
(38, 'ru', 147, 0.2694, 61.5),
(38, 'ru', 165, 0.2694, 45.5),
(38, 'ru', 180, 0.2694, 64.5),
(38, 'ru', 493, 0.2694, 50.5),
(38, 'ru', 581, 0.2694, 52.5),
(38, 'ru', 682, 0.2694, 43.5),
(38, 'ru', 800, 0.3947, 34.5),
(38, 'ru', 854, 0.2694, 60.5),
(38, 'ru', 917, 0.2694, 67.5),
(38, 'ru', 1018, 0.2694, 66.5),
(38, 'ru', 1039, 0.34, 18.6667),
(38, 'ru', 1040, 0.2694, 28.5),
(38, 'ru', 1041, 0.2694, 31.5),
(38, 'ru', 1042, 0.2694, 32.5),
(38, 'ru', 1043, 0.2694, 33.5),
(38, 'ru', 1044, 0.2694, 34.5),
(38, 'ru', 1045, 0.2694, 35.5),
(38, 'ru', 1046, 0.2694, 36.5),
(38, 'ru', 1047, 0.2694, 44.5),
(38, 'ru', 1048, 0.2694, 47.5),
(38, 'ru', 1049, 0.2694, 48.5),
(38, 'ru', 1050, 0.2694, 49.5),
(38, 'ru', 1051, 0.2694, 51.5),
(38, 'ru', 1052, 0.2694, 53.5),
(38, 'ru', 1053, 0.2694, 59.5),
(38, 'ru', 1054, 0.2694, 68.5),
(39, 'ru', 69, 0.2853, 25),
(39, 'ru', 104, 0.2853, 55),
(39, 'ru', 129, 0.418, 46),
(39, 'ru', 131, 0.2853, 39),
(39, 'ru', 245, 0.2853, 30),
(39, 'ru', 481, 0.2853, 28),
(39, 'ru', 798, 0.2853, 35),
(39, 'ru', 800, 0.418, 38),
(39, 'ru', 857, 0.2853, 62),
(39, 'ru', 950, 0.2853, 31),
(39, 'ru', 1011, 0.2853, 44),
(39, 'ru', 1055, 0.4654, 31.4),
(39, 'ru', 1056, 0.2853, 24),
(39, 'ru', 1057, 0.2853, 26),
(39, 'ru', 1058, 0.2853, 40),
(39, 'ru', 1059, 0.2853, 43),
(39, 'ru', 1060, 0.2853, 52),
(39, 'ru', 1061, 0.2853, 53),
(39, 'ru', 1062, 0.2853, 58),
(39, 'ru', 1063, 0.2853, 59),
(40, 'ru', 24, 0.2853, 51),
(40, 'ru', 69, 0.2853, 22),
(40, 'ru', 409, 0.2853, 46),
(40, 'ru', 581, 0.2853, 33),
(40, 'ru', 798, 0.2853, 50),
(40, 'ru', 800, 0.418, 34),
(40, 'ru', 821, 0.2853, 31),
(40, 'ru', 929, 0.2853, 53),
(40, 'ru', 945, 0.2853, 29),
(40, 'ru', 991, 0.2853, 21),
(40, 'ru', 1004, 0.2853, 38),
(40, 'ru', 1018, 0.2853, 49),
(40, 'ru', 1052, 0.2853, 34),
(40, 'ru', 1057, 0.2853, 23),
(40, 'ru', 1064, 0.3601, 16.3333),
(40, 'ru', 1065, 0.2853, 25),
(40, 'ru', 1066, 0.2853, 26),
(40, 'ru', 1067, 0.2853, 27),
(40, 'ru', 1068, 0.2853, 30),
(40, 'ru', 1069, 0.2853, 35),
(40, 'ru', 1070, 0.2853, 37),
(40, 'ru', 1071, 0.2853, 47),
(41, 'ru', 167, 0.2767, 42.5),
(41, 'ru', 168, 0.4054, 48),
(41, 'ru', 291, 0.2767, 73.5),
(41, 'ru', 466, 0.2767, 38.5),
(41, 'ru', 576, 0.2767, 40.5),
(41, 'ru', 652, 0.2767, 48.5),
(41, 'ru', 800, 0.2767, 30.5),
(41, 'ru', 821, 0.2767, 34.5),
(41, 'ru', 854, 0.2767, 29.5),
(41, 'ru', 862, 0.2767, 60.5),
(41, 'ru', 882, 0.2767, 50.5),
(41, 'ru', 897, 0.2767, 36.5),
(41, 'ru', 1052, 0.2767, 32.5),
(41, 'ru', 1072, 0.1746, 1),
(41, 'ru', 1073, 0.2767, 28.5),
(41, 'ru', 1074, 0.2767, 37.5),
(41, 'ru', 1075, 0.2767, 41.5),
(41, 'ru', 1076, 0.2767, 51.5),
(41, 'ru', 1077, 0.2767, 52.5),
(41, 'ru', 1078, 0.2767, 56.5),
(41, 'ru', 1079, 0.2767, 57.5),
(41, 'ru', 1080, 0.2767, 59.5),
(41, 'ru', 1081, 0.2767, 63.5),
(41, 'ru', 1082, 0.2767, 65.5),
(41, 'ru', 1083, 0.2767, 72.5),
(41, 'ru', 1084, 0.2767, 75.5),
(42, 'ru', 24, 0.2652, 68.5),
(42, 'ru', 111, 0.2652, 57.5),
(42, 'ru', 113, 0.2652, 38.5),
(42, 'ru', 200, 0.2652, 61.5),
(42, 'ru', 542, 0.2652, 63.5),
(42, 'ru', 724, 0.2652, 56.5),
(42, 'ru', 800, 0.3885, 38.5),
(42, 'ru', 806, 0.2652, 36.5),
(42, 'ru', 831, 0.3885, 53),
(42, 'ru', 845, 0.2652, 29.5),
(42, 'ru', 850, 0.2652, 32.5),
(42, 'ru', 950, 0.2652, 66.5),
(42, 'ru', 961, 0.2652, 62.5),
(42, 'ru', 991, 0.2652, 27.5),
(42, 'ru', 1052, 0.2652, 33.5),
(42, 'ru', 1057, 0.2652, 48.5),
(42, 'ru', 1058, 0.2652, 70.5),
(42, 'ru', 1068, 0.2652, 30.5),
(42, 'ru', 1085, 0.1673, 1),
(42, 'ru', 1086, 0.2652, 35.5),
(42, 'ru', 1087, 0.2652, 37.5),
(42, 'ru', 1088, 0.2652, 41.5),
(42, 'ru', 1089, 0.2652, 42.5),
(42, 'ru', 1090, 0.2652, 44.5),
(42, 'ru', 1091, 0.2652, 46.5),
(42, 'ru', 1092, 0.2652, 54.5),
(42, 'ru', 1093, 0.2652, 58.5),
(42, 'ru', 1094, 0.2652, 59.5),
(42, 'ru', 1095, 0.2652, 72.5),
(42, 'ru', 1096, 0.2652, 72.5),
(43, 'ru', 24, 0.2921, 50),
(43, 'ru', 35, 0.2921, 43),
(43, 'ru', 132, 0.2921, 44),
(43, 'ru', 174, 0.2921, 41),
(43, 'ru', 200, 0.2921, 49),
(43, 'ru', 376, 0.2921, 27),
(43, 'ru', 660, 0.2921, 40),
(43, 'ru', 800, 0.2921, 24),
(43, 'ru', 809, 0.2921, 42),
(43, 'ru', 843, 0.2921, 26),
(43, 'ru', 845, 0.2921, 32),
(43, 'ru', 915, 0.2921, 46),
(43, 'ru', 919, 0.2921, 45),
(43, 'ru', 991, 0.2921, 20),
(43, 'ru', 1004, 0.2921, 23),
(43, 'ru', 1018, 0.2921, 48),
(43, 'ru', 1065, 0.2921, 28),
(43, 'ru', 1066, 0.2921, 29),
(43, 'ru', 1067, 0.2921, 30),
(43, 'ru', 1068, 0.2921, 33),
(43, 'ru', 1092, 0.2921, 21),
(43, 'ru', 1097, 0.1843, 1),
(44, 'ru', 38, 0.2754, 57.5),
(44, 'ru', 111, 0.2754, 26.5),
(44, 'ru', 131, 0.2754, 42.5),
(44, 'ru', 199, 0.2754, 55.5),
(44, 'ru', 257, 0.2754, 60.5),
(44, 'ru', 258, 0.2754, 61.5),
(44, 'ru', 409, 0.2754, 38.5),
(44, 'ru', 724, 0.2754, 48.5),
(44, 'ru', 798, 0.2754, 27.5),
(44, 'ru', 800, 0.4035, 40.5),
(44, 'ru', 806, 0.2754, 32.5),
(44, 'ru', 821, 0.2754, 35.5),
(44, 'ru', 836, 0.1738, 2),
(44, 'ru', 843, 0.2754, 30.5),
(44, 'ru', 1004, 0.2754, 53.5),
(44, 'ru', 1018, 0.2754, 41.5),
(44, 'ru', 1052, 0.2754, 37.5),
(44, 'ru', 1086, 0.2754, 31.5),
(44, 'ru', 1092, 0.2754, 63.5),
(44, 'ru', 1098, 0.1738, 1),
(44, 'ru', 1099, 0.2754, 25.5),
(44, 'ru', 1100, 0.2754, 34.5),
(44, 'ru', 1101, 0.2754, 39.5),
(44, 'ru', 1102, 0.2754, 50.5),
(44, 'ru', 1103, 0.2754, 58.5),
(44, 'ru', 1104, 0.2754, 59.5),
(44, 'ru', 1105, 0.2754, 64.5),
(45, 'ru', 1, 0.1424, 173),
(45, 'ru', 6, 0.2257, 11),
(45, 'ru', 7, 0.2848, 30.3333),
(45, 'ru', 13, 0.2257, 134),
(45, 'ru', 23, 0.1424, 28),
(45, 'ru', 24, 0.3998, 67),
(45, 'ru', 27, 0.2257, 139.5),
(45, 'ru', 44, 0.2257, 43),
(45, 'ru', 51, 0.1424, 39),
(45, 'ru', 62, 0.2257, 101.5),
(45, 'ru', 70, 0.2257, 13),
(45, 'ru', 73, 0.3306, 170.75),
(45, 'ru', 74, 0.1424, 55),
(45, 'ru', 80, 0.2257, 152.5),
(45, 'ru', 82, 0.1424, 57),
(45, 'ru', 109, 0.1424, 178),
(45, 'ru', 122, 0.1424, 32),
(45, 'ru', 125, 0.1424, 195),
(45, 'ru', 128, 0.1424, 92),
(45, 'ru', 129, 0.1424, 104),
(45, 'ru', 131, 0.1424, 58),
(45, 'ru', 138, 0.3306, 101),
(45, 'ru', 140, 0.1424, 48),
(45, 'ru', 142, 0.1424, 144),
(45, 'ru', 147, 0.1424, 155),
(45, 'ru', 161, 0.1424, 161),
(45, 'ru', 164, 0.1424, 179),
(45, 'ru', 167, 0.1424, 77),
(45, 'ru', 168, 0.1424, 77),
(45, 'ru', 175, 0.2257, 98),
(45, 'ru', 177, 0.1424, 51),
(45, 'ru', 178, 0.1424, 52),
(45, 'ru', 179, 0.2848, 11.6667),
(45, 'ru', 183, 0.1424, 119),
(45, 'ru', 185, 0.1424, 159),
(45, 'ru', 187, 0.1424, 170),
(45, 'ru', 205, 0.2257, 139),
(45, 'ru', 216, 0.1424, 105),
(45, 'ru', 287, 0.1424, 81),
(45, 'ru', 338, 0.1424, 75),
(45, 'ru', 364, 0.1424, 74),
(45, 'ru', 375, 0.1424, 168),
(45, 'ru', 431, 0.1424, 135),
(45, 'ru', 555, 0.2257, 151.5),
(45, 'ru', 641, 0.1424, 146),
(45, 'ru', 653, 0.1424, 161),
(45, 'ru', 676, 0.1424, 76),
(45, 'ru', 707, 0.1424, 70),
(45, 'ru', 912, 0.1424, 91),
(45, 'ru', 947, 0.2257, 32.5),
(45, 'ru', 1004, 0.1424, 84),
(45, 'ru', 1018, 0.1424, 83),
(45, 'ru', 1027, 0.2257, 142.5),
(45, 'ru', 1033, 0.1424, 103),
(45, 'ru', 1106, 0.2257, 12),
(45, 'ru', 1107, 0.1424, 26),
(45, 'ru', 1108, 0.1424, 30),
(45, 'ru', 1109, 0.1424, 31),
(45, 'ru', 1110, 0.1424, 33),
(45, 'ru', 1111, 0.1424, 34),
(45, 'ru', 1112, 0.1424, 35),
(45, 'ru', 1113, 0.1424, 37),
(45, 'ru', 1114, 0.1424, 40),
(45, 'ru', 1115, 0.1424, 41),
(45, 'ru', 1116, 0.1424, 50),
(45, 'ru', 1117, 0.1424, 59),
(45, 'ru', 1118, 0.1424, 60),
(45, 'ru', 1119, 0.1424, 73),
(45, 'ru', 1120, 0.1424, 86),
(45, 'ru', 1121, 0.1424, 89),
(45, 'ru', 1122, 0.1424, 98),
(45, 'ru', 1123, 0.1424, 101),
(45, 'ru', 1124, 0.2257, 115),
(45, 'ru', 1125, 0.2848, 148),
(45, 'ru', 1126, 0.1424, 118),
(45, 'ru', 1127, 0.1424, 122),
(45, 'ru', 1128, 0.1424, 126),
(45, 'ru', 1129, 0.1424, 130),
(45, 'ru', 1130, 0.1424, 136),
(45, 'ru', 1131, 0.1424, 137),
(45, 'ru', 1132, 0.1424, 145),
(45, 'ru', 1133, 0.1424, 148),
(45, 'ru', 1134, 0.1424, 149),
(45, 'ru', 1135, 0.1424, 154),
(45, 'ru', 1136, 0.1424, 157),
(45, 'ru', 1137, 0.1424, 160),
(45, 'ru', 1138, 0.1424, 167),
(45, 'ru', 1139, 0.1424, 171),
(45, 'ru', 1140, 0.1424, 172),
(45, 'ru', 1141, 0.1424, 174),
(45, 'ru', 1142, 0.1424, 180),
(45, 'ru', 1143, 0.1424, 192),
(45, 'ru', 1144, 0.1424, 193),
(45, 'ru', 1145, 0.1424, 196),
(45, 'ru', 1146, 0.2257, 203),
(45, 'ru', 1147, 0.1424, 199),
(45, 'ru', 1148, 0.1424, 207),
(45, 'ru', 1149, 0.1424, 209),
(46, 'ru', 1, 0.2441, 4),
(46, 'ru', 24, 0.3577, 57),
(46, 'ru', 35, 0.154, 91),
(46, 'ru', 37, 0.154, 87),
(46, 'ru', 44, 0.154, 138),
(46, 'ru', 49, 0.154, 97),
(46, 'ru', 67, 0.2441, 95),
(46, 'ru', 69, 0.154, 9),
(46, 'ru', 70, 0.3577, 44.5),
(46, 'ru', 105, 0.154, 62),
(46, 'ru', 111, 0.154, 77),
(46, 'ru', 126, 0.154, 2),
(46, 'ru', 129, 0.2441, 74),
(46, 'ru', 131, 0.154, 122),
(46, 'ru', 134, 0.154, 58),
(46, 'ru', 136, 0.154, 66),
(46, 'ru', 139, 0.154, 94),
(46, 'ru', 147, 0.154, 101),
(46, 'ru', 158, 0.154, 95),
(46, 'ru', 159, 0.154, 42),
(46, 'ru', 163, 0.154, 28),
(46, 'ru', 166, 0.154, 20),
(46, 'ru', 172, 0.154, 40),
(46, 'ru', 173, 0.154, 21),
(46, 'ru', 174, 0.2441, 44),
(46, 'ru', 200, 0.154, 74),
(46, 'ru', 205, 0.154, 52),
(46, 'ru', 254, 0.154, 124),
(46, 'ru', 282, 0.2441, 76),
(46, 'ru', 290, 0.154, 4),
(46, 'ru', 291, 0.154, 26),
(46, 'ru', 352, 0.154, 25),
(46, 'ru', 450, 0.154, 34),
(46, 'ru', 641, 0.154, 96),
(46, 'ru', 654, 0.154, 121),
(46, 'ru', 655, 0.154, 121),
(46, 'ru', 712, 0.154, 50),
(46, 'ru', 812, 0.2441, 75.5),
(46, 'ru', 857, 0.154, 128),
(46, 'ru', 940, 0.154, 36),
(46, 'ru', 1128, 0.154, 57),
(46, 'ru', 1130, 0.154, 76),
(46, 'ru', 1132, 0.154, 52),
(46, 'ru', 1150, 0.154, 5),
(46, 'ru', 1151, 0.154, 6),
(46, 'ru', 1152, 0.154, 16),
(46, 'ru', 1153, 0.154, 18),
(46, 'ru', 1154, 0.154, 22),
(46, 'ru', 1155, 0.154, 23),
(46, 'ru', 1156, 0.154, 27),
(46, 'ru', 1157, 0.154, 29),
(46, 'ru', 1158, 0.154, 35),
(46, 'ru', 1159, 0.154, 38),
(46, 'ru', 1160, 0.154, 41),
(46, 'ru', 1161, 0.154, 49),
(46, 'ru', 1162, 0.154, 51),
(46, 'ru', 1163, 0.154, 55),
(46, 'ru', 1164, 0.2441, 70.5),
(46, 'ru', 1165, 0.154, 60),
(46, 'ru', 1166, 0.154, 61),
(46, 'ru', 1167, 0.154, 63),
(46, 'ru', 1168, 0.154, 65),
(46, 'ru', 1169, 0.154, 75),
(46, 'ru', 1170, 0.154, 84),
(46, 'ru', 1171, 0.154, 88),
(46, 'ru', 1172, 0.154, 90),
(46, 'ru', 1173, 0.154, 92),
(46, 'ru', 1174, 0.154, 98),
(46, 'ru', 1175, 0.2441, 112.5),
(46, 'ru', 1176, 0.154, 109),
(46, 'ru', 1177, 0.154, 116),
(46, 'ru', 1178, 0.154, 126),
(46, 'ru', 1179, 0.154, 139),
(46, 'ru', 1180, 0.154, 140),
(46, 'ru', 1181, 0.154, 141),
(46, 'ru', 1182, 0.154, 142),
(47, 'ru', 5, 0.1763, 19),
(47, 'ru', 24, 0.1763, 29),
(47, 'ru', 105, 0.1763, 26),
(47, 'ru', 117, 0.1763, 2),
(47, 'ru', 126, 0.1763, 16),
(47, 'ru', 138, 0.1763, 32),
(47, 'ru', 179, 0.1763, 36),
(47, 'ru', 184, 0.1763, 15),
(47, 'ru', 192, 0.2794, 49),
(47, 'ru', 193, 0.1763, 33),
(47, 'ru', 198, 0.1763, 14),
(47, 'ru', 263, 0.1763, 3),
(47, 'ru', 313, 0.1763, 47),
(47, 'ru', 335, 0.1763, 42),
(47, 'ru', 431, 0.1763, 13),
(47, 'ru', 645, 0.1763, 28),
(47, 'ru', 661, 0.1763, 22),
(47, 'ru', 773, 0.1763, 64),
(47, 'ru', 943, 0.1763, 24),
(47, 'ru', 954, 0.1763, 55),
(47, 'ru', 1183, 0.1763, 1),
(47, 'ru', 1184, 0.1763, 4),
(47, 'ru', 1185, 0.1763, 5),
(47, 'ru', 1186, 0.1763, 6),
(47, 'ru', 1187, 0.1763, 7),
(47, 'ru', 1188, 0.1763, 8),
(47, 'ru', 1189, 0.1763, 10),
(47, 'ru', 1190, 0.1763, 17),
(47, 'ru', 1191, 0.1763, 20),
(47, 'ru', 1192, 0.1763, 21),
(47, 'ru', 1193, 0.1763, 23),
(47, 'ru', 1194, 0.1763, 25),
(47, 'ru', 1195, 0.1763, 26),
(47, 'ru', 1196, 0.1763, 30),
(47, 'ru', 1197, 0.1763, 31),
(47, 'ru', 1198, 0.1763, 32),
(47, 'ru', 1199, 0.1763, 36),
(47, 'ru', 1200, 0.1763, 43),
(47, 'ru', 1201, 0.1763, 44),
(47, 'ru', 1202, 0.1763, 45),
(47, 'ru', 1203, 0.1763, 48),
(47, 'ru', 1204, 0.1763, 49),
(47, 'ru', 1205, 0.1763, 50),
(47, 'ru', 1206, 0.1763, 51),
(47, 'ru', 1207, 0.1763, 53),
(47, 'ru', 1208, 0.1763, 54),
(47, 'ru', 1209, 0.1763, 56),
(47, 'ru', 1210, 0.1763, 62),
(47, 'ru', 1211, 0.1763, 65),
(47, 'ru', 1212, 0.1763, 66),
(48, 'ru', 18, 0.1637, 28),
(48, 'ru', 80, 0.1637, 25),
(48, 'ru', 184, 0.3274, 43.3333),
(48, 'ru', 194, 0.1637, 53),
(48, 'ru', 198, 0.1637, 6),
(48, 'ru', 263, 0.1637, 3),
(48, 'ru', 314, 0.1637, 32),
(48, 'ru', 330, 0.1637, 45),
(48, 'ru', 335, 0.1637, 62),
(48, 'ru', 387, 0.1637, 41),
(48, 'ru', 389, 0.1637, 13),
(48, 'ru', 411, 0.1637, 7),
(48, 'ru', 421, 0.1637, 5),
(48, 'ru', 440, 0.2595, 46),
(48, 'ru', 444, 0.1637, 1),
(48, 'ru', 555, 0.1637, 24),
(48, 'ru', 557, 0.1637, 25),
(48, 'ru', 661, 0.1637, 18),
(48, 'ru', 914, 0.1637, 44),
(48, 'ru', 929, 0.1637, 47),
(48, 'ru', 943, 0.1637, 40),
(48, 'ru', 954, 0.1637, 67),
(48, 'ru', 1093, 0.1637, 26),
(48, 'ru', 1129, 0.1637, 14),
(48, 'ru', 1185, 0.1637, 15),
(48, 'ru', 1186, 0.1637, 16),
(48, 'ru', 1192, 0.1637, 17),
(48, 'ru', 1193, 0.1637, 19),
(48, 'ru', 1200, 0.1637, 83),
(48, 'ru', 1202, 0.1637, 84),
(48, 'ru', 1203, 0.1637, 55),
(48, 'ru', 1204, 0.1637, 88),
(48, 'ru', 1205, 0.1637, 89),
(48, 'ru', 1206, 0.1637, 90),
(48, 'ru', 1208, 0.1637, 93),
(48, 'ru', 1209, 0.1637, 68),
(48, 'ru', 1210, 0.1637, 74),
(48, 'ru', 1211, 0.1637, 65),
(48, 'ru', 1212, 0.1637, 66),
(48, 'ru', 1213, 0.3274, 31),
(48, 'ru', 1214, 0.1637, 4),
(48, 'ru', 1215, 0.1637, 10),
(48, 'ru', 1216, 0.2595, 23.5),
(48, 'ru', 1217, 0.1637, 21),
(48, 'ru', 1218, 0.1637, 21),
(48, 'ru', 1219, 0.1637, 22),
(48, 'ru', 1220, 0.1637, 30),
(48, 'ru', 1221, 0.1637, 31),
(48, 'ru', 1222, 0.1637, 33),
(48, 'ru', 1223, 0.1637, 34),
(48, 'ru', 1224, 0.1637, 49),
(48, 'ru', 1225, 0.2595, 54),
(48, 'ru', 1226, 0.1637, 54),
(48, 'ru', 1227, 0.1637, 63),
(48, 'ru', 1228, 0.1637, 75),
(48, 'ru', 1229, 0.1637, 78),
(48, 'ru', 1230, 0.1637, 80),
(48, 'ru', 1231, 0.1637, 81),
(48, 'ru', 1232, 0.1637, 82),
(48, 'ru', 1233, 0.1637, 85),
(48, 'ru', 1234, 0.1637, 87),
(48, 'ru', 1235, 0.1637, 92),
(49, 'ru', 39, 0.1637, 5),
(49, 'ru', 41, 0.1637, 49),
(49, 'ru', 141, 0.3274, 23.3333),
(49, 'ru', 184, 0.3801, 47.25),
(49, 'ru', 198, 0.1637, 17),
(49, 'ru', 263, 0.1637, 6),
(49, 'ru', 287, 0.1637, 32),
(49, 'ru', 314, 0.1637, 27),
(49, 'ru', 335, 0.1637, 61),
(49, 'ru', 345, 0.1637, 52),
(49, 'ru', 484, 0.1637, 29),
(49, 'ru', 499, 0.1637, 25),
(49, 'ru', 607, 0.1637, 79),
(49, 'ru', 641, 0.1637, 4),
(49, 'ru', 692, 0.1637, 53),
(49, 'ru', 774, 0.1637, 56),
(49, 'ru', 780, 0.1637, 87),
(49, 'ru', 819, 0.1637, 31),
(49, 'ru', 824, 0.1637, 60),
(49, 'ru', 842, 0.1637, 50),
(49, 'ru', 886, 0.1637, 55),
(49, 'ru', 936, 0.1637, 57),
(49, 'ru', 943, 0.1637, 38),
(49, 'ru', 954, 0.1637, 99),
(49, 'ru', 1139, 0.1637, 2),
(49, 'ru', 1184, 0.1637, 14),
(49, 'ru', 1185, 0.1637, 15),
(49, 'ru', 1186, 0.1637, 16),
(49, 'ru', 1200, 0.1637, 85),
(49, 'ru', 1202, 0.2595, 92),
(49, 'ru', 1204, 0.1637, 95),
(49, 'ru', 1209, 0.1637, 100),
(49, 'ru', 1210, 0.1637, 106),
(49, 'ru', 1216, 0.1637, 21),
(49, 'ru', 1228, 0.1637, 62),
(49, 'ru', 1236, 0.2595, 10),
(49, 'ru', 1237, 0.1637, 7),
(49, 'ru', 1238, 0.1637, 13),
(49, 'ru', 1239, 0.1637, 20),
(49, 'ru', 1240, 0.1637, 22),
(49, 'ru', 1241, 0.1637, 24),
(49, 'ru', 1242, 0.1637, 26),
(49, 'ru', 1243, 0.1637, 28),
(49, 'ru', 1244, 0.1637, 30),
(49, 'ru', 1245, 0.1637, 41),
(49, 'ru', 1246, 0.1637, 42),
(49, 'ru', 1247, 0.1637, 45),
(49, 'ru', 1248, 0.1637, 46),
(49, 'ru', 1249, 0.1637, 47),
(49, 'ru', 1250, 0.1637, 47),
(49, 'ru', 1251, 0.1637, 51),
(49, 'ru', 1252, 0.1637, 53),
(49, 'ru', 1253, 0.1637, 54),
(49, 'ru', 1254, 0.1637, 59),
(49, 'ru', 1255, 0.1637, 65),
(49, 'ru', 1256, 0.1637, 67),
(49, 'ru', 1257, 0.1637, 68),
(49, 'ru', 1258, 0.1637, 76),
(49, 'ru', 1259, 0.1637, 77),
(49, 'ru', 1260, 0.1637, 78),
(49, 'ru', 1261, 0.1637, 88),
(49, 'ru', 1262, 0.1637, 96),
(50, 'ru', 1263, 0.2314, 1),
(50, 'ru', 1264, 0.2314, 2),
(50, 'ru', 1265, 0.2314, 3),
(51, 'ru', 405, 0.2314, 3),
(51, 'ru', 1068, 0.2314, 1),
(51, 'ru', 1266, 0.2314, 2),
(52, 'ru', 787, 0.2314, 2),
(52, 'ru', 1015, 0.2314, 1),
(53, 'ru', 213, 0.2314, 1),
(53, 'ru', 787, 0.2314, 2);
-- -----------------------------------
-- Dumping table b_search_content_text
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_search_content_text` VALUES
(1, '3140fa939e82d14de3829b731863cd80', 'УСЛУГИ\r\n\r\n'),
(2, 'f58e028735b5d07233c4a161c9231405', 'ПОИСК\r\n\r\n'),
(3, 'be3fe2336ca014ea48484837a6379cf7', 'КАРТА САЙТА\r\n\r\n'),
(4, '9dc81310e5f6940cd74425623ed50b52', 'МЕБЕЛЬНАЯ КОМПАНИЯ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ «МЕБЕЛЬНАЯ КОМПАНИЯ» ПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ.\n«МЕБЕЛЬНАЯ КОМПАНИЯ» ОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД – С ДРУГОЙ.\nНАША ПРОДУКЦИЯ\rНАШИ УСЛУГИ\r\n'),
(5, '43974ce3161b1536a23aab70dfdf083c', 'ПРОДУКЦИЯ\r\n\r\n'),
(6, '626a5d1bd18fcc622fbe4e4e3619a88a', 'НОВОСТИ\r\n\r\n'),
(7, '7c285f6a61d238a340b43f0ef846a536', 'ВХОД НА САЙТ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),
(8, 'd63c4b77cf485102f232c0d0d27f8bc3', 'КОНТАКТЫ\r\nОБРАТИТЕСЬ К НАШИМ СПЕЦИАЛИСТАМ И ПОЛУЧИТЕ ПРОФЕССИОНАЛЬНУЮ КОНСУЛЬТАЦИЮ ПО ВОПРОСАМ СОЗДАНИЯ И ПОКУПКИ МЕБЕЛИ (ОТ ДИЗАЙНА, РАЗРАБОТКИ ТЕХНИЧЕСКОГО ЗАДАНИЯ ДО ДОСТАВКИ МЕБЕЛИ К ВАМ ДОМОЙ).\rВЫ МОЖЕТЕ ОБРАТИТЬСЯ К НАМ ПО ТЕЛЕФОНУ, ПО ЭЛЕКТРОННОЙ ПОЧТЕ ИЛИ ДОГОВОРИТЬСЯ О ВСТРЕЧЕ В НАШЕМ ОФИСЕ. БУДЕМ РАДЫ ПОМОЧЬ ВАМ И ОТВЕТИТЬ НА ВСЕ ВАШИ ВОПРОСЫ. \rТЕЛЕФОНЫ\rТЕЛЕФОН/ФАКС:\n(495) 212-85-06\rТЕЛЕФОНЫ:\n(495) 212-85-07\r(495) 212-85-08\rEMAIL\rINFO@EXAMPLE.RU\r ОБЩИЕ ВОПРОСЫ\rSALES@EXAMPLE.RU\r ПРИОБРЕТЕНИЕ ПРОДУКЦИИ\rMARKETING@EXAMPLE.RU\r МАРКЕТИНГ/МЕРОПРИЯТИЯ/PR\rОФИС В МОСКВЕ\r\n'),
(9, 'b535d9cb75c64e695d6ebad33b22d99c', 'О КОМПАНИИ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ. 						 \rГЛАВНОЕ ПРАВИЛО - ИНДИВИДУАЛЬНЫЙ ПОДХОД К КАЖДОМУ КЛИЕНТУ\rНА СЕГОДНЯШНИЙ ДЕНЬ НАМИ РАЗРАБОТАНО БОЛЕЕ ПЯТИСОТ МОДЕЛЕЙ ДЛЯ ОФИСА И ДОМА. ВМЕСТЕ С ТЕМ МЫ СТРЕМИМСЯ ОБЕСПЕЧИТЬ НЕПОВТОРИМОСТЬ СВОЕЙ ПРОДУКЦИИ. МЫ ИЗГОТОВИМ МЕБЕЛЬ ДЛЯ КУХНИ, ДЕТСКОЙ, ГОСТИНОЙ, СПАЛЬНОЙ ИЛИ ВАННОЙ КОМНАТЫ, МЕБЕЛЬ ДЛЯ ОФИСА ОСОБОГО ДИЗАЙНА И НЕСТАНДАРТНОГО РАЗМЕРА. \rНАШИ ДИЗАЙНЕРЫ ПРОИЗВЕДУТ ЗАМЕРЫ ПОМЕЩЕНИЯ И ВМЕСТЕ С ВАМИ РАЗРАБОТАЮТ ДИЗАЙН-ПРОЕКТ МЕБЕЛИ ДЛЯ ВАШЕГО ИНТЕРЬЕРА, ПОДОБРАВ С ВЫСОКОЙ ТОЧНОСТЬЮ РАЗМЕРЫ, МОДЕЛИ, ЦВЕТА, ПОМОГУТ ОПТИМАЛЬНО РАСПОЛОЖИТЬ МЕБЕЛЬ. \rВАШ ПРОЕКТ БУДЕТ СОЗДАН С УЧЕТОМ ВСЕХ НЮАНСОВ И ПРОРИСОВКОЙ МЕЛЬЧАЙШИХ ДЕТАЛЕЙ. РЕЗУЛЬТАТЫ СОВМЕСТНОГО ТВОРЧЕСТВА ВЫ СМОЖЕТЕ ПОСМОТРЕТЬ В ОБЪЕМНОМ ПРЕДСТАВЛЕНИИ. ВАМ НАГЛЯДНО ПРОДЕМОНСТРИРУЮТ, КАК БУДУТ ВЫГЛЯДЕТЬ В ЖИЗНИ ВЫБРАННЫЕ ЭЛЕМЕНТЫ ИНТЕРЬЕРА ПРИ РАЗНОМ ОСВЕЩЕНИИ, В КОНКРЕТНОМ ПОМЕЩЕНИИ, СДЕЛАННЫЕ ИЗ ОПРЕДЕЛЕННЫХ МАТЕРИАЛОВ. В ВАШЕ РАСПОРЯЖЕНИЕ БУДЕТ ПРЕДОСТАВЛЕНО МНОГО РАЗЛИЧНЫХ ВАРИАНТОВ, ИЗ КОТОРЫХ ВЫ СМОЖЕТЕ ВЫБРАТЬ НАИБОЛЕЕ ПОДХОДЯЩИЙ ИМЕННО ВАМ. 						 					\rЗАКАЗ БУДЕТ ВЫПОЛНЕН И ДОСТАВЛЕН ТОЧНО В СРОК. ВСЕ РАБОТЫ ПО СБОРКЕ И УСТАНОВКЕ МЕБЕЛИ ОСУЩЕСТВЛЯЮТ СОТРУДНИКИ НАШЕЙ КОМПАНИИ. СТРОГИЙ КОНТРОЛЬ КАЧЕСТВА ОСУЩЕСТВЛЯЕТСЯ НА ВСЕХ ЭТАПАХ РАБОТ: ОТ МОМЕНТА ОФОРМЛЕНИЯ ЗАКАЗА ДО МОМЕНТА ПРИЕМА ВЫПОЛНЕННЫХ РАБОТ. \rПЕРЕДОВЫЕ ТЕХНОЛОГИИ И БЕСЦЕННЫЙ ОПЫТ\rИСПОЛЬЗОВАНИЕ ПЕРЕДОВЫХ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ, МНОГОЛЕТНИЙ ОПЫТ НАШИХ СПЕЦИАЛИСТОВ ПОЗВОЛЯЮТ ПРОИЗВЕСТИ ГРАМОТНЫЕ РАСЧЕТЫ И СНИЗИТЬ РАСХОД МАТЕРИАЛОВ И СЕБЕСТОИМОСТЬ ПРОДУКЦИИ, ИЗБЕЖАТЬ ОШИБОК ПРИ ПРОЕКТИРОВАНИИ И ОПТИМИЗИРОВАТЬ ДИЗАЙН КОМПЛЕКСНЫХ ИНТЕРЬЕРОВ. ГАРАНТИЯ НА НАШУ ПРОДУКЦИЮ СОСТАВЛЯЕТ 18 МЕСЯЦЕВ, А НА ОТДЕЛЬНУЮ ПРОДУКЦИЮ 36 МЕСЯЦЕВ. \rМЫ ГОРДИМСЯ НАШИМИ СОТРУДНИКАМИ ПРОШЕДШИМИ ПРОФЕССИОНАЛЬНОЕ ОБУЧЕНИЕ В ЛУЧШИХ УЧЕБНЫХ ЗАВЕДЕНИЯХ РОССИИ И ЗАРУБЕЖЬЯ. У НАС ТРУДЯТСЯ ВЫСОКОКЛАССНЫЕ СПЕЦИАЛИСТЫ РАЗНЫХ ВОЗРАСТОВ. МЫ ЦЕНИМ ЭНТУЗИАЗМ МОЛОДЕЖИ И БЕСЦЕННЫЙ ОПЫТ СТАРШЕГО ПОКОЛЕНИЯ. ВСЕ МЫ РАЗНЫЕ, НО НАС ОБЪЕДИНЯЕТ ПРЕДАННОСТЬ СВОЕМУ ДЕЛУ И ВЕРА В ИДЕИ НАШЕЙ КОМПАНИИ. \rВЫСОЧАЙШИЕ СТАНДАРТЫ КАЧЕСТВА - ЗАЛОГ НАШЕГО УСПЕХА\rМЕБЕЛЬНАЯ КОМПАНИЯ\rОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД  С ДРУГОЙ. \rЕЖЕГОДНО НАША ПРОДУКЦИЯ ПРОХОДИТ СЕРТИФИКАЦИОННЫЕ ИСПЫТАНИЯ В СПЕЦИАЛИЗИРОВАННЫХ ЛАБОРАТОРИЯХ РОССИИ И ИМЕЕТ СЕРТИФИКАТЫ СООТВЕТСТВИЯ ПРОДУКЦИИ НОРМАМ БЕЗОПАСНОСТИ И КАЧЕСТВА. КРОМЕ ТОГО, \rМЕБЕЛЬНАЯ КОМПАНИЯ\rОДНОЙ ИЗ ПЕРВЫХ СРЕДИ МЕБЕЛЬНЫХ ПРОИЗВОДИТЕЛЕЙ РОССИИ В 2003 ГОДУ ПРОШЛА АУДИТ НА СООТВЕТСТВИЕ ТРЕБОВАНИЯМ СИСТЕМЫ МЕНЕДЖМЕНТА КАЧЕСТВА ИСО 9000 И ПОЛУЧИЛА СЕРТИФИКАТ СООТВЕТСТВИЯ СИСТЕМЫ КАЧЕСТВА НА ПРЕДПРИЯТИИ НОРМАМ МЕЖДУНАРОДНОГО СТАНДАРТА.\r\n'),
(10, '17e08217818f62561b1d2f0f3a016a1f', 'МИССИЯ И СТРАТЕГИЯ\r\nМЕБЕЛЬНАЯ КОМПАНИЯ\r- ДИНАМИЧНО РАЗВИВАЮЩЕЕСЯ ПРОИЗВОДСТВЕННОЕ 							ПРЕДПРИЯТИЕ, КОТОРОЕ ИМЕЕТ ПЕРЕД СОБОЙ \nЯСНО ВЫРАЖЕННЫЕ ЦЕЛИ И ИНСТРУМЕНТЫ ДЛЯ 							ИХ ДОСТИЖЕНИ.МЫ ПРЕДОСТАВЛЯЕМ КАЖДОМУ ЛУЧШУЮ ВОЗМОЖНОСТЬ ОБУСТРОИТЬ СВОЕ ЖИЗНЕННОЕ \nИ РАБОЧЕЕ ПРОСТРАНСТВО.МЫ РАБОТАЕМ НА ДОЛГОСРОЧНУЮ ПЕРСПЕКТИВУ И ПРЕДЛАГАЕМ ОПТИМАЛЬНЫЕ 							РЕШЕНИЯ. КОМПАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r- \nНАДЕЖНЫЙ, ТЕХНОЛОГИЧНЫЙ, ГИБКИЙ ПОСТАВЩИК 							С БОЛЬШИМИ МОЩНОСТЯМИ. 						\rЦЕЛИ И ЗАДАЧИ\rОПРАВДЫВАТЬ ОЖИДАНИЯ ЗАКАЗЧИКА: КЛИЕНТ ВСЕГДА ПРАВ. ТОЛЬКО ПОТРЕБИТЕЛЬ ФОРМИРУЕТ 									ЕДИНУЮ СИСТЕМУ ВЗГЛЯДОВ НА КАЧЕСТВО \nВЫПУСКАЕМОЙ ПРОДУКЦИИ И РАБОТ.\rДОБИТЬСЯ ОТ РАБОТНИКОВ КОМПАНИИ ПОНИМАНИЯ ИХ ЛИЧНОЙ ОТВЕТСТВЕННОСТИ ЗА КАЧЕСТВО 									РАБОТ.\rПУТЕМ ПОВЫШЕНИЯ КАЧЕСТВА ПРОДУКЦИИ И РАБОТ ПОСТОЯННО УВЕЛИЧИВАТЬ ОБЪЕМЫ ПРОИЗВОДСТВА 									С ЦЕЛЬЮ ПОСЛЕДУЮЩЕГО РЕИНВЕСТИРОВАНИЯ \nПРИБЫЛИ В РАЗВИТИЕ КОМПАНИИ.\rОБЕСПЕЧИВАТЬ СТРОГОЕ СООТВЕТСТВИЕ ПРОИЗВОДИМОЙ ПРОДУКЦИИ ТРЕБОВАНИЯМ ПОТРЕБИТЕЛЕЙ, 									НОРМАМ И ПРАВИЛАМ \nБЕЗОПАСНОСТИ, ТРЕБОВАНИЯМ ЗАЩИТЫ ОКРУЖАЮЩЕЙ СРЕДЫ.\rПОЛИТИКА КОМПАНИИ\rПОСТОЯННОЕ СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ КАЧЕСТВА. СВОЕВРЕМЕННОЕ И ЭФФЕКТИВНОЕ ПРИНЯТИЕ 									КОРРЕКТИРУЮЩИХ МЕР .\rЗАБОТА О РАБОТНИКАХ КОМПАНИИ. СОЗДАНИЕ УСЛОВИЙ ТРУДА И ОСНАЩЕНИЕ РАБОЧИХ МЕСТ, СООТВЕТСТВУЮЩИХ 									ВСЕМ САНИТАРНЫМ \nИ ГИГИЕНИЧЕСКИМ НОРМАМ.\rПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ СОТРУДНИКОВ. ОБЕСПЕЧЕНИЕ МОРАЛЬНОГО И МАТЕРИАЛЬНОГО УДОВЛЕТВОРЕНИЯ 									РАБОТНИКОВ КОМПАНИИ.\rСИСТЕМАТИЧЕСКОЕ ОБУЧЕНИЕ РАБОТНИКОВ ВСЕХ УРОВНЕЙ С ЦЕЛЬЮ ПОСТОЯННОГО ПОВЫШЕНИЯ ИХ 									ПРОФЕССИОНАЛЬНОГО МАСТЕРСТВА.\rВНЕДРЕНИЕ ВЫСОКОПРОИЗВОДИТЕЛЬНОГО ОБОРУДОВАНИЯ И НОВЕЙШИХ ТЕХНОЛОГИЙ ДЛЯ ПОВЫШЕНИЯ 									ПРОИЗВОДИТЕЛЬНОСТИ ТРУДА, \nОПТИМИЗАЦИИ ЗАТРАТ И, КАК РЕЗУЛЬТАТ, СНИЖЕНИЯ ЦЕН 									НА ВЫПУСКАЕМУЮ ПРОДУКЦИЮ.\rСОЗДАНИЕ НОВЫХ РАБОЧИХ МЕСТ. ПРИВЛЕЧЕНИЕ НА РАБОТУ СПЕЦИАЛИСТОВ ВЫСОКОЙ КВАЛИФИКАЦИИ.\rВЫХОД НА МЕЖДУНАРОДНЫЙ РЫНОК.\rМЫ РАЗВИВАЕМ ДОВЕРИТЕЛЬНЫЕ ВЗАИМОВЫГОДНЫЕ ОТНОШЕНИЯ СО СВОИМИ ПАРТНЕРАМИ В ДОЛГОСРОЧНЫХ 							ИНТЕРЕСАХ НАШЕГО БИЗНЕСА. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rОТВЕТСТВЕННО ОТНОСИТСЯ 							К ВЫПОЛНЕНИЮ ВЗЯТЫХ НА СЕБЯ ОБЯЗАТЕЛЬСТВ И ЖДЕТ ТАКОГО ЖЕ \nПОДХОДА К ДЕЛУ ОТ 							СВОИХ ПАРТНЕРОВ ПО БИЗНЕСУ. ЭТА ТРЕБОВАТЕЛЬНОСТЬ  ЗАЛОГ НАШЕЙ ДОЛГОСРОЧНОЙ ПРИБЫЛЬНОСТИ. 						\rСО ДНЯ СВОЕГО ОСНОВАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rСОДЕЙСТВУЕТ РОСТУ БЛАГОСОСТОЯНИЯ 							РЕГИОНОВ РОССИИ. МЫ ПОНИМАЕМ ВАЖНОСТЬ \nСОЦИАЛЬНОЙ ОТВЕТСТВЕННОСТИ НАШЕЙ КОМПАНИИ 							И ОСТАНЕМСЯ ПРИМЕРОМ В ВОПРОСАХ СОЦИАЛЬНОЙ ЗАЩИЩЕННОСТИ НАШИХ СОТРУДНИКОВ.\r\n'),
(11, 'c501a4fb29fd5bc92bc4babebf160ed9', 'РУКОВОДСТВО\r\nУСПЕШНОЕ РАЗВИТИЕ БИЗНЕСА  ВО МНОГОМ РЕЗУЛЬТАТ КВАЛИФИЦИРОВАННОЙ РАБОТЫ РУКОВОДСТВА. 							\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНА МЕБЕЛЬНОМ РЫНКЕ УЖЕ 18 ЛЕТ. ЗА ЭТО ВРЕМЯ КОМПАНИЯ 							НЕ ТОЛЬКО СОХРАНИЛА, НО И УПРОЧИЛА ЛИДИРУЮЩИЕ ПОЗИЦИИ СРЕДИ ВЕДУЩИХ ИГРОКОВ МЕБЕЛЬНОГО 							РЫНКА. 						\rМЕБЕЛЬНАЯ КОМПАНИЯ\rИЗ ГОДА В ГОД РАСШИРЯЕТ АССОРТИМЕНТ ВЫПУСКАЕМОЙ ПРОДУКЦИИ, 							НАРАЩИВАЕТ ТЕМПЫ И ОБЪЕМЫ ПРОИЗВОДСТВА, УВЕЛИЧИВАЕТ ПРОИЗВОДСТВЕННЫЕ И СКЛАДСКИЕ 							ПЛОЩАДИ, РАЗВИВАЕТ ОТНОШЕНИЯ С ПАРТНЕРАМИ СО ВСЕХ РЕГИОНОВ СТРАНЫ И НАЛАЖИВАЕТ СВЯЗИ 							С ЗАРУБЕЖНЫМИ ПАРТНЕРАМИ. В БОЛЬШОЙ СТЕПЕНИ ЭТО ЗАСЛУГА ХОРОШО ПОДГОТОВЛЕННОГО РУКОВОДЯЩЕГО 							СОСТАВА И ЕГО ГРАМОТНОЙ ПОЛИТИКИ. 						\rСОБСТВЕННИК КОМПАНИИ МЕБЕЛЬНАЯ КОМПАНИЯ\rКОЛЕСНИКОВ ВИКТОР ФЕДОРОВИЧ 								\rРОДИЛСЯ 3 СЕНТЯБРЯ 1964 ГОДА.\nОБРАЗОВАНИЕ: ЗАКОНЧИЛ АВИАЦИОННЫЙ ФАКУЛЬТЕТ ВОРОНЕЖСКОГО 									ГОСУДАРСТВЕННОГО ПОЛИТЕХНИЧЕСКОГО ИНСТИТУТА. В 1994 ГОДУ ПРОШЕЛ ОБУЧЕНИЕ ПО ПРОГРАММЕ 									ПОДГОТОВКА МАЛОГО И СРЕДНЕГО БИЗНЕСА В США.\nВ НАСТОЯЩЕЕ ВРЕМЯ ВИКТОР ФЕДОРОВИЧ 									ВОЗГЛАВЛЯЕТ УПРАВЛЯЮЩУЮ КОМПАНИЮ, КОТОРАЯ КООРДИНИРУЕТ ДЕЯТЕЛЬНОСТЬ ПРЕДПРИЯТИЙ, 									ВХОДЯЩИХ В ГРУППУ КОМПАНИЙ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. 								\rГЕНЕРАЛЬНЫЙ ДИРЕКТОР МЕБЕЛЬНОЙ КОМПАНИИ\rРАТЧЕНКО АЛЕКСАНДР ПЕТРОВИЧ 								\rРОДИЛСЯ 5 ИЮНЯ 1962 ГОДА.\nОБРАЗОВАНИЕ: ВОРОНЕЖСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ 									ПО СПЕЦИАЛЬНОСТИ ИНЖЕНЕР-ТЕХНОЛОГ; ПРОГРАММА ЭФФЕКТИВНОЕ РАЗВИТИЕ ПРОИЗВОДСТВА 									(США).\nВ \rМЕБЕЛЬНОЙ КОМПАНИИ\rСЕРГЕЙ ФОМИЧ С 1994 ГОДА. ЗА ЭТО ВРЕМЯ ПРОШЕЛ 									ПУТЬ ОТ НАЧАЛЬНИКА ЦЕХА ДО ГЕНЕРАЛЬНОГО ДИРЕКТОРА ПРЕДПРИЯТИЯ. 								\rЗАМЕСТИТЕЛЬ ГЕНЕРАЛЬНОГО ДИРЕКТОРА УПРАВЛЯЮЩЕЙ КОМПАНИИ\rРОГОВОЙ АНДРЕЙ ВЛАДИМИРОВИЧ 								\rОБРАЗОВАНИЕ: ФАКУЛЬТЕТ РАДИОТЕХНИКИ ВОРОНЕЖСКОГО ГОСУДАРСТВЕННОГО ТЕХНИЧЕСКОГО УНИВЕРСИТЕТА.\nВ КОМПАНИИ С 1 ИЮНЯ 2000 ГОДА.\r\n'),
(12, '55171aa121806afa21b564e0af9ed46f', 'ИСТОРИЯ\r\n1992Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНАЧИНАЛАСЬ С ИЗГОТОВЛЕНИЯ МЕБЕЛИ ДЛЯ ШКОЛ И ОФИСОВ. ПЕРВОЕ 									ПРОИЗВОДСТВО МЕБЕЛИ РАСПОЛАГАЛОСЬ В АРЕНДУЕМОЙ МАСТЕРСКОЙ, ПЛОЩАДЬЮ 400 М2 С ОДНИМ 									ДЕРЕВООБРАБАТЫВАЮЩИМ СТАНКОМ. В КОМПАНИИ РАБОТАЛО ДВАДЦАТЬ ЧЕЛОВЕК. ВСЕ ЗАРАБОТАННЫЕ 									СРЕДСТВА ВКЛАДЫВАЛИСЬ В РАЗВИТИЕ, ЧТО ПОЗВОЛИЛО МОЛОДОЙ КОМПАНИИ РАСТИ БЫСТРЫМИ 									ТЕМПАМИ. 								\r1993Г. 								\rВВЕДЕН В ЭКСПЛУАТАЦИЮ НОВЫЙ ЦЕХ ПЛОЩАДЬЮ 700 М2, СТАВШИЙ ПЕРВОЙ СОБСТВЕННОСТЬЮ 									\rМЕБЕЛЬНОЙ КОМПАНИИ\r. МОДЕРНИЗАЦИЯ ПРОИЗВОДСТВЕННОЙ БАЗЫ ПРЕДПРИЯТИЯ СТАЛА ХОРОШЕЙ 									ТРАДИЦИЕЙ. КОМПАНИЯ ПОСТЕПЕННО ПЕРЕШЛА К БОЛЕЕ СОВЕРШЕННОМУ ОБОРУДОВАНИЮ, ЧТО ПОЗВОЛИЛО 									ПОВЫСИТЬ УРОВЕНЬ КАЧЕСТВА ВЫПУСКАЕМОЙ ПРОДУКЦИИ И ЗНАЧИТЕЛЬНО УВЕЛИЧИТЬ ОБЪЕМЫ ПРОИЗВОДСТВА. 								\r1998Г. 								\rВ ВОРОНЕЖЕ ОТКРЫТ ПЕРВЫЙ ФИРМЕННЫЙ МАГАЗИН-САЛОН \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. ШАГ ЗА ШАГОМ 									ПРОДУКЦИЯ ПРЕДПРИЯТИЯ ЗАВОЕВЫВАЛА РЕГИОНЫ СИБИРИ И УРАЛА, МОСКВЫ И ПОДМОСКОВЬЯ, 									ЮГА И СЕВЕРО-ЗАПАДА РОССИИ. ПРОИЗВОДСТВЕННЫЕ ПЛОЩАДИ КОМПАНИИ УВЕЛИЧЕНЫ ДО 5000 									М2. 								\r1999Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rСТАЛА ДИПЛОМАНТОМ ОДНОЙ ИЗ САМЫХ ПРЕСТИЖНЫХ МЕЖДУНАРОДНЫХ 									ВЫСТАВОК \rЕВРОЭКСПОМЕБЕЛЬ-99\r- ПЕРВОЕ ОФИЦИАЛЬНОЕ ПРИЗНАНИЕ МЕБЕЛЬНОЙ ПРОДУКЦИИ 									МЕБЕЛЬНОЙ КОМПАНИИ. В ЭТОМ ЖЕ ГОДУ КОМПАНИЯ ВЫХОДИТ НА МИРОВОЙ РЫНОК. БЫЛ ЗАКЛЮЧЕН 									РЯД КОНТРАКТОВ НА ПОСТАВКУ МЕБЕЛИ В СТРАНЫ СНГ И БЛИЖНЕГО ЗАРУБЕЖЬЯ. 								\r2000Г. 								\rКОЛЛЕКТИВ КОМПАНИИ НАСЧИТЫВАЕТ БОЛЕЕ 500 СОТРУДНИКОВ. ЗАКЛЮЧАЮТСЯ НОВЫЕ КОНТРАКТ 									НА ПОСТАВКУ МЕБЕЛИ В ЕВРОПЕЙСКИЕ СТРАНЫ. 								\r2002Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rВОШЛА В ДЕСЯТКУ ЛУЧШИХ ПРОИЗВОДИТЕЛЕЙ МЕБЕЛИ ПО ДАННЫМ ВЕДУЩИХ 									МЕБЕЛЬНЫХ САЛОНОВ РОССИИ, А ТАКЖЕ В ЧИСЛО ЛИДЕРОВ ОРГАНИЗАЦИОННОГО РАЗВИТИЯ. 								\r2003Г. 								\rПРИСТУПИЛИ К СТРОИТЕЛЬСТВУ СКЛАДА МАТЕРИАЛОВ. В МОСКВЕ ОТКРЫТ ФИЛИАЛ КОМПАНИИ. \nПРОВЕДЕНА ПЕРВАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ, РЕЗУЛЬТАТОМ КОТОРОЙ СТАЛО УКРЕПЛЕНИЕ ВЗАИМОВЫГОДНЫХ 									ОТНОШЕНИЙ И ЗАКЛЮЧЕНИЕ ДИЛЕРСКИХ ДОГОВОРОВ. 								\r2004Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО И ОСНАЩЕНИЕ НОВОГО ПРОИЗВОДСТВЕННОГО КОРПУСА И СКЛАДА МАТЕРИАЛОВ. \nРАСШИРЕНО ПРЕДСТАВИТЕЛЬСТВО КОМПАНИИ НА РОССИЙСКОМ РЫНКЕ И ЗА РУБЕЖОМ. \nОТКРЫТО 									РЕГИОНАЛЬНОЕ ПРЕДСТАВИТЕЛЬСТВО \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ ЕКАТЕРИНБУРГЕ. 								\r2005Г. 								\rКОМПАНИЯ ПРИОБРЕТАЕТ НОВОЕ ПРОИЗВОДСТВЕННОЕ ОБОРУДОВАНИЕ КОНЦЕРНА - УГЛОВУЮ ЛИНИЮ 									РАСКРОЯ МАТЕРИАЛОВ И ЛИНИЮ ЗАГРУЗКИ ВЫГРУЗКИ. \nНАЧИНАЕТСЯ ВЫПУСК ПРОДУКЦИИ В 									НАТУРАЛЬНОМ ШПОНЕ. ФОРМИРУЕТСЯ ОТДЕЛЬНЫЙ СКЛАД МАТЕРИАЛОВ И КОМПЛЕКТУЮЩИХ. \nВ ЭТОМ ЖЕ ГОДУ ОТКРЫВАЕТСЯ ФАБРИКА МЯГКОЙ МЕБЕЛИ \rМЕБЕЛЬПЛЮС\r2006Г. 								\rОТКРЫТЫ РЕГИОНАЛЬНЫЕ ПРЕДСТАВИТЕЛЬСТВА \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ САНКТ-ПЕТЕРБУРГЕ 									И НИЖНЕМ НОВГОРОДЕ. \nРАЗВИВАЕТСЯ СОБСТВЕННАЯ РОЗНИЧНАЯ СЕТЬ ФИРМЕННЫХ МАГАЗИНОВ-САЛОНОВ 									НА ТЕРРИТОРИИ РОССИИ. 								\r2007Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО ВТОРОЙ ФАБРИКИ. ОБЩАЯ ПЛОЩАДЬ ПРОИЗВОДСВЕННО-СКЛАДСКИХ КОРПУСОВ 									КОМПАНИИ СОСТАВЛЯЕТ УЖЕ БОЛЕЕ 30000 М2. \nПРОВЕДЕНА ВТОРАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ 									КОМПАНИИ \r\"ТЕХНОЛОГИЯ УСПЕШНОГО БИЗНЕСА\"\r. 								\r2008Г. 								\rОТКРЫТО НОВОЕ ПРЕДПРИЯТИЕ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ \rКОМФОРТ\r. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОДОЛЖАЕТ ОБНОВЛЕНИЕ ОБОРУДОВАНИЯ. 								\r2008Г. 								\rНОВЕЙШИМ ОБОРУДОВАНИЕМ УКОМПЛЕКТОВАНА ВТОРАЯ ФАБРИКА. ЗАПУЩЕНА ВТОРАЯ ПРОИЗВОДСТВЕННАЯ 									ЛИНИЯ. \nПРОВЕДЕНА ТРЕТЬЯ КОНФЕРЕНЦИЯ \rПАРТНЕРСТВО - БИЗНЕС СЕГОДНЯ\rПРИНЯТО РЕШЕНИЕ О СТРОИТЕЛЬСТВЕ ТРЕТЬЕЙ ФАБРИКИ. ПЛОЩАДЬ ПРОИЗВОДСТВЕННО  СКЛАДСКИХ 									КОРПУСОВ СОСТАВИТ БОЛЕЕ 70000М2. \nПО ВСЕЙ СТРАНЕ И ЗАРУБЕЖОМ ОТКРЫТО 37 МЕБЕЛЬНЫХ 									САЛОНОВ. \nВ КОМПАНИИ РАБОТАЕТ БОЛЕЕ ПОЛУТОРА ТЫСЯЧ СОТРУДНИКОВ.\r\n'),
(13, 'd6ae18283686e0f65091531174c8b418', 'ВАКАНСИИ\r\n\r\n'),
(14, '92742420ff489208277435770b2dba28', 'МЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r\nС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ.\r\n\rС 20 ПО 23 АПРЕЛЯ 2010 ГОДА СОСТОИТСЯ \rМЕБЕЛЬНЫЙ ФОРУМ БЕЛАРУСИ\r ВАЖНЕЙШЕЕ МЕРОПРИЯТИИ ОТРАСЛИ В ТЕКУЩЕМ ГОДУ. В ЭКСПОЗИЦИИ ПРИНИМАЮТ УЧАСТИЕ СВЫШЕ 160 КОМПАНИЙ ИЗ \rБЕЛАРУСИ, АВСТРИИ, ЛАТВИИ, ЛИТВЫ, РОССИИ, ПОЛЬШИ \rИ\rУКРАИНЫ\r. В СОСТАВЕ ФОРУМА СОСТОИТСЯ ПЯТЬ ВЫСТАВОК:\"МИНСКИЙ МЕБЕЛЬНЫЙ САЛОН\", \"МЕБЕЛЬНЫЕ ТЕХНОЛОГИИ\", \"ОФИСКОМФОРТ\", \"КУХНЯ\" И \"ДОМОТЕХ\". ЭКСПОЗИЦИЯ БУДЕТ СТРОИТЬСЯ ПО ПРИНЦИПУ ДВУХ ТЕМАТИЧЕСКИХ СЕКТОРОВ:\rГОТОВОЙ МЕБЕЛИ\rИ \rМАТЕРИАЛОВ ДЛЯ ЕЕ ПРОИЗВОДСТВА\r.\rВ СЕКТОРЕ ГОТОВОЙ МЕБЕЛИ БУДУТ ПРЕДСТАВЛЕНЫ:\rКОРПУСНАЯ И МЯГКАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ДЕТЕЙ И МОЛОДЕЖИ;\rПРЕДМЕТЫ ИНТЕРЬЕРА;\rКУХОННАЯ МЕБЕЛЬ;\rМЕБЕЛЬ ДЛЯ ОФИСА И АДМИНИСТРАТИВНЫХ ЗДАНИЙ.\rВ СЕКТОРЕ МАТЕРИАЛОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ БУДУТ ДЕМОНСТРИРОВАТЬСЯ НОВИНКИ РЫНКА МЕБЕЛЬНОЙ ФУРНИТУРЫ, МАТЕРИАЛОВ, ОБИВОЧНЫХ ТКАНЕЙ, ЭЛЕМЕНТОВ И АКСЕССУАРОВ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ.\rПОМИМО РАСШИРЕННОЙ ЭКСПОЗИЦИИ ПЯТИ ТЕМАТИЧЕСКИХ ВЫСТАВОК \"ЭКСПОФОРУМ\" ПОДГОТОВИЛ РАЗНООБРАЗНУЮ ДЕЛОВУЮ ПРОГРАММУ МЕБЕЛЬНОГО ФОРУМА. В РАМКАХ ВЫСТАВКИ СОСТОЯТСЯ СЕМИНАРЫ И МАСТЕР-КЛАССЫ. И ПОИСТИНЕ МАСШТАБНЫМ В ЭТОМ ГОДУ ОБЕЩАЕТ СТАТЬ РЕСПУБЛИКАНСКИЙ КОНКУРС ФОРУМА \"\rНАРОДНОЕ ПРИЗНАНИЕ\r\". В ЭТОМ ГОДУ ОН ВЫХОДИТ ЗА РАМКИ ВЫСТАВКИ И СТАНОВИТСЯ РЕСПУБЛИКАНСКИМ СМОТРОМ ОБРАЗЦОВ МЕБЕЛИ.\rМЕБЕЛЬНЫЙ ФОРУМ\rПРЕДОСТАВЛЯЕТ СПЕЦИАЛИСТАМ ВОЗМОЖНОСТЬ ПОЗНАКОМИТЬСЯ С ТЕНДЕНЦИЯМИ МЕБЕЛЬНОЙ МОДЫ, ПРОВЕСТИ ПЕРЕГОВОРЫ, ПОЛУЧИТЬ ПРАКТИЧЕСКИЕ ПРЕДЛОЖЕНИЯ РЫНКА, УВИДЕТЬ ПЕРСПЕКТИВЫ РАЗВИТИЯ И НОВЫЕ КОНКУРЕНТНЫЕ ПРЕИМУЩЕСТВА. ВПЕРВЫЕ ДЛЯ УЧАСТНИКОВ КОНКУРСА БУДЕТ ПОДГОТОВЛЕН МАРКЕТИНГОВЫЙ ОТЧЕТ ПО РЕЗУЛЬТАТАМ ОПРОСА ПОСЕТИТЕЛЕЙ ВЫСТАВОК \rМЕБЕЛЬНОГО ФОРУМА\r.\rПРИЕМ ЗАЯВОК НА УЧАСТИЕ В КОНКУРСЕ ОСУЩЕСТВЛЯЕТСЯ ДО 12 АПРЕЛЯ 2010 ГОДА.\r\n'),
(15, 'd28b14fc723b19c85e2a5f17daa89898', 'МЕЖДУНАРОДНАЯ МЕБЕЛЬНАЯ ВЫСТАВКА SALON DEL MOBILE\r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. \r\nВ 2010 ГОДУ ВЫСТАВКА SALON DEL MOBILE ОБЕЩАЕТ БЫТЬ ЕЩЕ БОЛЕЕ РАСШИРЕННОЙ И ИНТЕРЕСНОЙ. НА ВЫСТАВКЕ SALON DEL MOBILE БУДУТ ПРЕДСТАВЛЕНЫ ВСЕ ТИПЫ МЕБЕЛИ ДЛЯ ОФИСА И ДОМА ОТ СПАЛЕН И ГОСТИНЫХ ДО VIP-КАБИНЕТОВ, ВКЛЮЧАЯ ОБОРУДОВАНИЕ ДЛЯ САДА И ДЕТСКОЙ МЕБЕЛИ. ЗАЯВКИ НА УЧАСТИЕ ПОДАЛИ БОЛЕЕ ЧЕМ 1 500 КОМПАНИЙ СО ВСЕГО МИРА. ПРЕДПОЛАГАЕТСЯ, ЧТО ЗА ВРЕМЯ ПРОВЕДЕНИЯ ВЫСТАВКИ ЕЕ ПОСЕТЯТ БОЛЕЕ 300 000 ТЫСЯЧ ЧЕЛОВЕК. ЭКСПОЗИЦИЯ ВЫСТАВКИ РАЗМЕСТИТСЯ НА ОБЩЕЙ ПЛОЩАДИ 149 871 КВ.М. В 2010 ГОДУ ЭТА ПОИСТИНЕ ГРАНДИОЗНАЯ ВЫСТАВКА БУДЕТ ПРОВОДИТЬСЯ УЖЕ В 10-Й РАЗ.\r\n'),
(16, '6e9c53b4377c8bda27a391c004332b06', 'ПОЛУЧЕНО ПРОЧНОЕ ВОДОСТОЙКОЕ СОЕДИНЕНИЕ\r\nПОЛУЧЕНО НОВОЕ ПРОЧНОЕ ВОДОСТОЙКОЕ КЛЕЕВОЕ СОЕДИНЕНИЕ.ИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ. ДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. \r\n\rАВТОРЫ ИЗОБРЕТЕНИЯ\r: РАЗИНЬКОВ ЕГОР МИХАЙЛОВИЧ И МЕЩЕРЯКОВА АННА АНАТОЛЬЕВНА \rПАТЕНТ РОССИЙСКОЙ ФЕДЕРАЦИИ RU2277566\rОПИСАНИЕ ИЗОБРЕТЕНИЯ\rИЗОБРЕТЕНИЕ ОТНОСИТСЯ К ОБЛАСТИ ПОЛУЧЕНИЯ И ПРИМЕНЕНИЯ КЛЕЯЩИХ СОСТАВОВ, ИСПОЛЬЗУЕМЫХ В ДЕРЕВООБРАБАТЫВАЮЩЕЙ, МЕБЕЛЬНОЙ И СТРОИТЕЛЬНОЙ ПРОМЫШЛЕННОСТИ.\rДАННАЯ КЛЕЕВАЯ КОМПОЗИЦИЯ ПРЕДНАЗНАЧЕНА ТОЛЬКО ДЛЯ ГОРЯЧЕГО ПРЕССОВАНИЯ И ИМЕЕТ В СВОЕМ СОСТАВЕ МНОГОКОМПОНЕНТНЫЙ ОТВЕРДИТЕЛЬ. ПРОТОТИПОМ КЛЕЕВОЙ КОМПОЗИЦИИ ЯВЛЯЕТСЯ КЛЕЙ, СОСТОЯЩИЙ ИЗ КАРБАМИДОФОРМАЛЬДЕГИДНОЙ СМОЛЫ, СОПОЛИМЕРА АКРИЛОНИТРИЛА С N-ВИНИЛКАПРОЛАКТАМОМ И ОТВЕРДИТЕЛЬ. В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ ПРИМЕНЯЮТ ХЛОРИСТЫЙ АММОНИЙ ЛИБО АКРИЛОВУЮ КИСЛОТУ. \rИЗОБРЕТЕНИЕ РЕШАЕТ ЗАДАЧУ ПО ПОЛУЧЕНИЮ ПРОЧНОГО И ВОДОСТОЙКОГО КЛЕЕВОГО СОЕДИНЕНИЯ.\rЭТО ДОСТИГАЕТСЯ ТЕМ, ЧТО КЛЕЕВАЯ КОМПОЗИЦИЯ, ВКЛЮЧАЮЩАЯ СИНТЕТИЧЕСКУЮ СМОЛУ И ОТВЕРДИТЕЛЬ, СОГЛАСНО ИЗОБРЕТЕНИЮ, ДОПОЛНИТЕЛЬНО СОДЕРЖИТ МОДИФИКАТОР, ПРИЧЕМ В КАЧЕСТВЕ СИНТЕТИЧЕСКОЙ СМОЛЫ КЛЕЕВАЯ КОМПОЗИЦИЯ ВКЛЮЧАЕТ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНУЮ СМОЛУ С ОТВЕРДИТЕЛЕМ 2542, В КАЧЕСТВЕ МОДИФИКАТОРА - КАРБАМИДОФОРМАЛЬДЕГИДНУЮ СМОЛУ, А В КАЧЕСТВЕ ОТВЕРДИТЕЛЯ - 10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ ПРИ СЛЕДУЮЩЕМ СООТНОШЕНИИ КОМПОНЕНТОВ, МАС.Ч.:\rКАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНАЯ СМОЛА\r64,5-79,2\r10%-НЫЙ РАСТВОР ЩАВЕЛЕВОЙ КИСЛОТЫ\r4,4-20,5\rОТВЕРДИТЕЛЬ ДЛЯ КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДНОЙ \r0,6-2,0\rСМОЛЫ 2542\r13,0-15,8\r\n'),
(17, '2efa39d6fa529b12dd51fd7139adec0e', 'МЯГКАЯ МЕБЕЛЬ\r\nДИВАНЫ, КРЕСЛА И ПРОЧАЯ МЯГКАЯ МЕБЕЛЬ\r\n'),
(18, '2c9244e9e768ea36f0bb298526f21402', 'ОФИСНАЯ МЕБЕЛЬ\r\nДИВАНЫ, СТОЛЫ, СТУЛЬЯ\r\n'),
(19, 'acd32268f26f878af2a96d753ccbc9c8', 'МЕБЕЛЬ ДЛЯ КУХНИ\r\nПОЛКИ, ЯЩИКИ, СТОЛЫ И СТУЛЬЯ\r\n'),
(20, 'e986498f11e924c98c57e35939cf927f', 'ДЕТСКАЯ МЕБЕЛЬ\r\nКРОВАТИ, СТУЛЬЯ, МЯГКАЯ ДЕТСКАЯ МЕБЕЛЬ\r\n'),
(21, 'f86144adfc89dc75855e25d200a5e333', 'ГЕРЦОГ\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ, РОСКОШНЫЕ ТКАНИ ДЛЯ ОБИВКИ, ЯРКИЕ ЦВЕТА И БОГАТЫЙ ДЕКОР.\r\n'),
(22, '3a7ce138fe31e4cc12b2809a04e0db25', 'МОНАЛИЗА\r\nБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\r\n \rБОГАТСТВО И ИЗЫСК ВЫРАЖЕН В ДАННОЙ МОДЕЛИ. КАРКАС ДОПОЛНИТЕЛЬНО РАСПИСЫВАЕТСЯ ЗОЛОТОМ.\rПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА СПИНКЕ И ПОДЛОКОТНИКАХ.\r\n'),
(23, 'df6d1da3eabe6c40954a796579d554cb', 'МИНИСТР\r\nКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ МИНИСТР, НЕСМОТРЯ НА НИЗКУЮ СТОИМОСТЬ, ВПЕЧАТЛЯЮЩЕ ВЫГЛЯДИТ. \rС ЕГО ПОМОЩЬЮ МОЖНО СОЗДАТЬ ОФИСНЫЙ ИНТЕРЬЕР ВЫСОКОГО УРОВНЯ. К ТОМУ ЖЕ В НЕМ МОЖНО РАБОТАТЬ С КОМФОРТОМ, НЕ ЧУВСТВУЯ УСТАЛОСТИ.\r\n'),
(24, 'bc3cb6280475204c00312b331b7c2fa9', 'ХРОМ\r\nДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\r\n \rДИНАМИЧНАЯ МОДЕЛЬ ОФИСНОГО КРЕСЛА ПРИМЕЧАТЕЛЬНА ОРИГИНАЛЬНЫМ ВНЕШНИМ ВИДОМ, КОТОРЫЙ ДОСТИГНУТ ЗА \rСЧЕТ ХРОМИРОВАННОЙ КРЕСТОВИНЫ,НЕОБЫЧНЫХ ПОДЛОКОТНИКОВ И ПОТРЯСАЮЩЕЙ ЭРГОНОМИКИ. \rТВЕРДАЯ СПИНКА ЖЕСТКО ПОДДЕРЖИВАЕТ ПОЗВОНОЧНИК.\r\n'),
(25, '5c32b6f62c6126843cbd44b1a593d952', 'ЛИВЕРПУЛЬ\r\nДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\r\n \rДЕРЕВЯННЫЕ СТУЛЬЯ ЛИВЕРПУЛЬ, ВЫПОЛНЕННЫЕ В КЛАССИЧЕСКОМ АНГЛИЙСКОМ СТИЛЕ, \rСОЗДАЮТ ОСОБУЮ АТМОСФЕРУ В КУХНЕ.\r\n'),
(26, '7955bfe502463895d32a336f267421a8', 'ИЗАБЕЛЛА\r\nИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС С ЭЛЕМЕНТАМИ РОСПИСИ ЗОЛОТОМ. ОБИВКА МОЖЕТ БЫТЬ ПРЕДСТАВЛЕНА В ТКАНИ ИЛИ КОЖЕ.\r\n'),
(27, '00e3040c167611cbe598003e6d5427ae', 'АЛАДДИН\r\nКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\r\n \rКОМФОРТНАЯ, МАССИВНАЯ МОДЕЛЬ. ОБИВКА - ЭЛИТНЫЕ ТКАНИ, РУЧНАЯ СТРОЧКА, \rПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rПО ЖЕЛАНИЮ КЛИЕНТА МОЖНО УСТАНОВИТЬ МЕХАНИЗМ ТРАНСФОРМАЦИИ ДЛЯ ЕЖЕДНЕВНОГО ИСПОЛЬЗОВАНИЯ ИЛИ «ГОСТЕВУЮ РАСКЛАДУШКУ»\r\n'),
(28, 'f5e7877d0bc889cce24427c1d1e8d96f', 'ДЖОКОНДА\r\nИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\r\n \rИЗЯЩНЫЙ КАРКАС, ЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ, РУЧНАЯ СТРОЧКА, ПРИДАЮТ ИЗДЕЛИЮ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ. \rОБИВКА ТАКЖЕ МОЖЕТ БЫТЬ В КОЖЕ, ПО ЖЕЛАНИЮ КЛИЕНТА ВОЗМОЖНА ПРОСТЕЖКА НА ПОДЛОКОТНИКАХ И СПИНКЕ.\r\n'),
(29, '13ffbc270cbe931d486a5511fd6da896', 'ФЛОРА\r\nКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\r\n \rКЛАССИЧЕСКАЯ МОДЕЛЬ СОЗДАНА ДЛЯ УКРАШЕНИЯ РОСКОШНЫХ ИНТЕРЬЕРОВ. \rЭЛЕГАНТНОСТЬ И КОЛОРИТНОСТЬ МОДЕЛИ ПРИДАЮТ НАКЛАДКИ ИЗ НАТУРАЛЬНОГО ДЕРЕВА.\r\n'),
(30, '81fb3b3fcb9358b5de6446706e8e132c', 'ПРЕСТИЖ\r\nТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\r\n \rТАХТА В КЛАССИЧЕСКОМ ИСПОЛНЕНИИ. ПОДЛОКОТНИК НАХОДИТСЯ СЛЕВА – ЭТО СТАНДАРТ. ОБИВКА МОЖЕТ БЫТЬ КАК В ТКАНИ, ТАК И В КОЖЕ.\r\n'),
(31, 'fee2bd8c63d03b8452efa69f751e6fb2', 'ЛАУРА\r\nДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\r\n \rДВУХМЕСТНАЯ СОФА НА ОСНОВЕ КОНУСНЫХ ПРУЖИН ИЛИ НА ОСНОВЕ КОМБИНАЦИИ ПЛОТНЫХ ПОРОЛОНОВ, ПО ВАШЕМУ ЖЕЛАНИЮ. \rЭЛИТНЫЕ ТКАНИ ДЛЯ ОБИВКИ ПРИДАЮТ МОДЕЛИ НЕОБЫКНОВЕННЫЙ ШАРМ И ЭЛЕГАНТНУЮ РОСКОШЬ.\r\n'),
(32, 'e980bf84fb99998e698762a99222ea9a', 'МОДЕРН\r\nОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\r\n \rОСНОВНЫМИ ХАРАКТЕРИСТИКАМИ ДАННОЙ СЕРИИ ЯВЛЯЕТСЯ НОВИЗНА ДИЗАЙНЕРСКОЙ МЫСЛИ, \rКОТОРАЯ ВОПЛОЩЕНА ВО ВНЕШНЕМ ОБЛИКЕ ЭТОЙ МЕБЕЛИ, И ОРИГИНАЛЬНОСТЬ ИСПОЛНЕНИЯ КЛАССИЧЕСКОЙ КОМПОНОВКИ, \rКОТОРАЯ СОЧЕТАЕТ В СЕБЕ ОПТИМАЛЬНЫЙ НАБОР ВСЕХ НЕОБХОДИМЫХ ЭЛЕМЕНТОВ И СВЕЖИЕ РЕШЕНИЯ В ИХ ОРГАНИЗАЦИИ. \rЧТО В СОЧЕТАНИИ С УДАЧНЫМИ ЦВЕТОВЫМИ РЕШЕНИЯМИ СОЗДАСТ В ВАШЕМ ОФИСЕ АТМОСФЕРУ НЕПОВТОРИМОЙ ИНДИВИДУАЛЬНОСТИ. \rДАННАЯ СЕРИЯ – НАИЛУЧШЕЕ РЕШЕНИЕ ДЛЯ БИЗНЕСМЕНОВ, КОТОРЫЕ ПРИВЫКЛИ БЫТЬ НА ШАГ ВПЕРЕДИ НЕ ТОЛЬКО СВОИХ КОНКУРЕНТОВ, \rНО И САМОГО ВРЕМЕНИ.\r\n'),
(33, '286e9f6fd660a7a29d1c58fd03b7cbfa', 'ОПТИМА\r\nУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. \rПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ \rОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ \rПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\r\n \rУДАЧНЫЙ ВЫБОР МЕБЕЛИ ДЛЯ ПЕРСОНАЛА ВО МНОГОМ ОПРЕДЕЛЯЕТ УСПЕШНОСТЬ ДЕЯТЕЛЬНОСТИ ВСЕЙ КОМПАНИИ. ПРАВИЛЬНО ОРГАНИЗОВАТЬ РАБОЧЕЕ ПРОСТРАНСТВО - ЗНАЧИТ ПОМОЧЬ КОЛЛЕГАМ ВЫПОЛНЯТЬ СВОИ ФУНКЦИИ БЫСТРЕЕ И ЭФФЕКТИВНЕЕ.\rСЕРИЯ \r«ОПТИМА»\rПОЗВОЛИТ НАЙТИ МАССУ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА РАБОЧЕЙ ЗОНЫ, ПРИСПОСОБИТЬ ИНТЕРЬЕР К ДОЛЖНОСТНЫМ ОБЯЗАННОСТЯМ ВСЕХ КАТЕГОРИЙ СОТРУДНИКОВ. ЭРГОНОМИЧНЫЕ УГЛОВЫЕ СТОЛЫ, ПЕРЕГОРОДКИ, ШКАФЫ И ТУМБЫ ПОМОГУТ РАЦИОНАЛЬНО ИСПОЛЬЗОВАТЬ ПРОСТРАНСТВО ПОД УНИКАЛЬНОЕ РАБОЧЕЕ МЕСТО, ПРИСПОСОБЛЕННОЕ К ПОТРЕБНОСТЯМ КАЖДОГО РАБОТНИКА И ВСЕЙ ФИРМЫ В ЦЕЛОМ.\rМЕБЕЛЬ \r«ОПТИМА»\r- ЭТО ПОЛНЫЙ НАБОР ИНТЕРЬЕРНЫХ РЕШЕНИЙ ДЛЯ ОБУСТРОЙСТВА ПРОСТРАНСТВА В ОФИСЕ ПО СОВРЕМЕННЫМ СТАНДАРТАМ.\r\n'),
(34, '37c339b919a986e466960961039e1d6a', 'СОБРАНИЕ\r\nЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\r\n \rЗАХОДЯ В ПОМЕЩЕНИЕ, ГДЕ НАХОДЯТСЯ СТОЛЫ ДЛЯ ПЕРЕГОВОРОВ «СОБРАНИЕ», ВОЗНИКАЕТ СТОЙКОЕ ОЩУЩЕНИЕ, ЧТО НАХОДИШЬСЯ В КАБИНЕТЕ ЕСЛИ НЕ ПРЕЗИДЕНТА СТРАНЫ, ТО ПРЕМЬЕР-МИНИСТРА КАК МИНИМУМ. ВОТ-ВОТ В КОМНАТУ ВОЙДЕТ ВЫСОКОПОСТАВЛЕННЫЙ ЧИНОВНИК, И НАЧНЕТСЯ ОБСУЖДЕНИЕ ГЛОБАЛЬНЫХ ВОПРОСОВ.\rУДИВИТЕЛЬНОЕ СОЧЕТАНИЕ ИЗЫСКАННОЙ РОСКОШИ СТИЛЯ И КРАСОТЫ КЛАССИЧЕСКИХ ЛИНИЙ СТОЛОВ «СОБРАНИЕ» И ПРИВЛЕКАТЕЛЬНОЙ ЦЕНЫ ОПРОВЕРГАЕТ УСТОЯВШЕЕСЯ УТВЕРЖДЕНИЕ О КАЧЕСТВЕ ДЕШЕВОЙ МЕБЕЛИ. УМЕНЬШЕНИЕ СЕБЕСТОИМОСТИ ПРОИСХОДИТ ЗА СЧЕТ ИСПОЛЬЗОВАНИЯ БОЛЕЕ ДЕШЕВЫХ МАТЕРИАЛОВ – ДСП И ДВП, ЧТО ПОЗВОЛЯЕТ ОФИСНОЙ МЕБЕЛИ СОХРАНЯТЬ ВЕЛИКОЛЕПНЫЕ ЭКСПЛУАТАЦИОННЫЕ ХАРАКТЕРИСТИКИ.\r\n'),
(35, 'cae6ed5ad18b5af81c184a7d384f6dd3', 'ЛИДЕР\r\nЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\r\n \rЭТОТ СТИЛЬНЫЙ СТОЛ АБСОЛЮТНО НЕ СИММЕТРИЧЕН, И ЭТО ПРИДАЕТ ЕМУ ИЗЯЩНОСТЬ И ОРИГИНАЛЬНОСТЬ. \rСЛЕВА ОН ОПИРАЕТСЯ НА НОЖКУ, ОСВОБОЖДАЯ ПОЛЕЗНОЕ ПРОСТРАНСТВО ДЛЯ СИСТЕМНОГО БЛОКА И НОГ. \rСПРАВА ОСНОВАНИЕМ СЛУЖИТ УДОБНАЯ И ВМЕСТИТЕЛЬНАЯ ТУМБА. ПЛАВНЫЕ ЛИНИИ, СТИЛЬНЫЙ ДИЗАЙН И ВЫСОКАЯ ЭРГОНОМИЧНОСТЬ ЯВЛЯЮТСЯ \rОСНОВНЫМИ ДОСТОИНСТВАМИ ДАННОЙ СЕРИИ.\r\n'),
(36, '07e40b7ee85f6e0586e6b7dca7071207', 'ПРЕЗИДЕНТ\r\nКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ.\r\r\n \rКРЕСЛО РУКОВОДИТЕЛЯ ПРЕЗИДЕНТ\rВО ГЛАВЕ БОЛЬШОГО КРУГЛОГО СТОЛА ПОМОЖЕТ СОЗДАТЬ В ВАШЕМ КАБИНЕТЕ\rОБСТАНОВКУ ЛЕГЕНДАРНОЙ СОВЕЩАТЕЛЬНОЙ КОМНАТЫ. ВЕДЬ ЭТО НЕ ПРОСТО МЕБЕЛЬ ОФИСНАЯ – ЭТО НАСТОЯЩИЙ ТРОН, КОТОРЫЙ \rПОМОЖЕТ УПРАВЛЕНЦУ РЕШАТЬ ЛЮБЫЕ ВОПРОСЫ, СОГЛАСУЯСЬ С ПОНЯТИЯМИ ЧЕСТИ И СОВЕСТИ. \rДИЗАЙН КРЕСЛА ВЫПОЛНЕН В СТРОГОМ КЛАССИЧЕСКОМ СТИЛЕ. ОКАНТОВКА И ПОДЛОКОТНИКИ КРЕСЛА ВЫТОЧЕНА ВРУЧНУЮ И ПОТОМУ УНИКАЛЬНЫ. \rПРОИЗВОДИТСЯ ОГРАНИЧЕННЫМИ ПАРТИЯМИ - НЕ БОЛЕЕ 10 КРЕСЕЛ В ГОД.\r\n'),
(37, 'eafc4c3a71f8b67e539a59cd7f90eeda', 'ПЛУТОН\r\nОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\r\n \rОФИСНОЕ КРЕСЛО, ПОДОБРАННОЕ С УЧЕТОМ ВАШИХ ФИЗИОЛОГИЧЕСКИХ ОСОБЕННОСТЕЙ - ВАЖНАЯ СОСТАВЛЯЮЩАЯ РАБОТОСПОСОБНОСТИ И ЗДОРОВЬЯ. \rДАННАЯ МОДЕЛЬ БУДЕТ НЕЗАМЕНИМА ДЛЯ ТЕХ, КТО МНОГО РАБОТАЕТ ЗА КОМПЬЮТЕРОМ.\r\n'),
(38, 'd9c1fcdf56ed763d069672a51edaf886', 'ПАРМА\r\nСТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \rСТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \rТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.\r\r\n \r <P>СТУЛЬЯ ПАРМА ВНЕСУТ В КУХНЮ УЮТНОЕ ОБАЯНИЕ ЭКОЛОГИЧЕСКИ ЧИСТОГО ДРЕВЕСНОГО МАТЕРИАЛА. \r СТУЛ ПРАКТИЧЕСКИ ЦЕЛИКОМ СДЕЛАН ИЗ МАССИВА БУКА, ИСКЛЮЧЕНИЕМ СТАЛО ЛИШЬ МЯГКОЕ СИДЕНЬЕ. \r ТОНИРОВКА ДЕРЕВЯННЫХ ДЕТАЛЕЙ МОЖЕТ БЫТЬ ВЫПОЛНЕНА В ЛЮБОЙ ЦВЕТОВОЙ ПАЛИТРЕ.</P>\r\n'),
(39, '6b34dc50a2008617635888607e22f36c', 'ПАЛЕРМО\r\nУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\r\n \rУНИВЕРСАЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ПАЛЕРМО ПОЗВОЛИТ С УСПЕХОМ ИСПОЛЬЗОВАТЬ ИХ И В ОФИСНЫХ ПОМЕЩЕНИЯХ, \rИ В ИНТЕРЬЕРЕ КАФЕ, И В ДОМАШНЕЙ ОБСТАНОВКЕ. СТУЛЬЯ ПАЛЕРМО ДОБАВЯТ УЮТА В КАЖДОЕ ПОМЕЩЕНИЕ И \rОРГАНИЧНО СОЛЬЮТСЯ С ЕГО СТИЛЕМ.\r\n'),
(40, 'dde02b9a7017c12f3635df242d7fec2d', 'ВАЛЕНСИЯ\r\nСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\r\n \rСТИЛЬНЫЙ ДИЗАЙН СТУЛЬЕВ ВАЛЕНСИЯ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ, А ЭРГОНОМИЧНАЯ ФОРМА СПИНКИ И \rМЯГКОЕ СИДЕНЬЕ ДЕЛАЮТ ИХ НЕОБЫЧАЙНО УДОБНЫМИ. ЭТИ СТУЛЬЯ ХОРОШО ПОДОЙДУТ К ЛЮБОЙ ОФИСНОЙ МЕБЕЛИ ДЛЯ \rПЕРСОНАЛА.\r\n'),
(41, 'e8afd744f2236f58877667738872c313', 'ФАЗЕНДА\r\nСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\r\n \rСКЛАДНОЙ ДЕРЕВЯННЫЙ СТУЛ С СИДЕНЬЕМ И СПИНКОЙ ИЗ ПЛОТНОГО ХЛОПКА, ИЗГОТОВЛЕННЫЙ ИЗ НАТУРАЛЬНЫХ ПРИРОДНЫХ МАТЕРИАЛОВ. \rТКАНЬ И ДЕРЕВО СЧИТАЮТСЯ ТЕПЛЫМИ МАТЕРИАЛАМИ - ДАЖЕ ЗИМОЙ СИДЕТЬ НА НИХ КОМФОРТНЕЕ, ЧЕМ НА ЖЕЛЕЗЕ ИЛИ ПЛАСТИКЕ. ЭТО ПРЕКРАСНОЕ РЕШЕНИЕ ДЛЯ ДАЧИ.\r\n'),
(42, 'fc9d38eebe941fe855bc8731bfa026c1', 'ЭРА\r\nСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\r\n \rСТИЛЬНЫЙ СТУЛ НЕОБЫЧНЫЙ ФОРМЫ С ЖЕСТКИМИ СИДЕНЬЯМИ НА МЕТАЛЛИЧЕСКОМ КАРКАСЕ УДОБЕН ТЕМ, \rЧТО МОЖНО КОМПАКТНО СЛОЖИТЬ ДЛЯ ХРАНЕНИЯ ДО 45 ТАКИХ СТУЛЬЕВ. ЛЕГКАЯ И ПРОЧНАЯ МОДЕЛЬ ОТЛИЧНО ПОДОЙДЕТ \rК КОМПЬЮТЕРНОЙ СТОЙКЕ, ТАКЖЕ ЕЕ МОЖНО ИСПОЛЬЗОВАТЬ КАК МЕБЕЛЬ ДЛЯ КАФЕ И БАРОВ.\r\n'),
(43, '3485e5d80bb6fbae95a83915c4aca23f', 'СИТИ\r\nСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\r\n \rСТИЛЬНЫЙ, ЛЕГКИЙ И УДОБНЫЙ СТУЛ НА ХРОМИРОВАННОМ ОСНОВАНИИ СРАЗУ ПРИВЛЕКАЕТ ВНИМАНИЕ \rСВОЕЙ НЕОБЫЧНОЙ ФОРМОЙ. А РАЗНООБРАЗНЫЕ ВАРИАНТЫ ОБИВКИ ПОЗВОЛЯЮТ ПОДОБРАТЬ НАИЛУЧШЕЕ СОЧЕТАНИЕ С \rЛЮБОЙ КОМПЬЮТЕРНОЙ МЕБЕЛЬЮ.\r\n'),
(44, '53dd08f5b5b2624b7521c7f382c7f9f6', 'ИЗОПЛАСТ ХРОМ\r\nПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\r\n \rПОПУЛЯРНАЯ МОДЕЛЬ ОФИСНОГО СТУЛА НА ХРОМИРОВАННОМ МЕТАЛЛИЧЕСКОМ КАРКАСЕ С ПЛАСТИКОВЫМИ СПИНКОЙ И \rСИДЕНЬЕМ ХОРОШО ВПИСЫВАЕТСЯ В ЛЮБОЙ ИНТЕРЬЕР. ПРОЧНЫЕ И ДОЛГОВЕЧНЫЕ, ЭТИ СТУЛЬЯ УДОБНЫ ДЛЯ ИСПОЛЬЗОВАНИЯ \rВ КАЧЕСТВЕ АУДИТОРНЫХ КОНФЕРЕНЦ-КРЕСЕЛ, КРОМЕ ТОГО, ИХ ЛЕГКО ХРАНИТЬ.\r\n'),
(45, 'da430218f51fdea19711a3806fb7a3c4', 'МЕБЕЛЬ НА ЗАКАЗ\r\nНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ.\r\n \rНАША КОМПАНИЯ ЗАНИМАЕТСЯ РАЗРАБОТКОЙ МЕБЕЛИ НА ЗАКАЗ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ: ВСТРОЕННЫЕ И КОРПУСНЫЕ ШКАФЫ КУПЕ,\rГАРДЕРОБНЫЕ КОМНАТЫ, ПРИХОЖИЕ, БИБЛИОТЕКИ, ПЛАТЯНЫЕ ШКАФЫ, КОМОДЫ И ДРУГИЕ СЛОЖНЫЕ КОНСТРУКЦИИ.\rМЫ СОЗДАЕМ МЕБЕЛЬ ИДЕАЛЬНО ПОДХОДЯЩУЮ ИМЕННО К ВАШЕМУ ДОМУ И ОФИСУ, ИНТЕРЬЕРЫ, МАКСИМАЛЬНО ОТОБРАЖАЮЩИЕ ВАШУ ИНДИВИДУАЛЬНОСТЬ.\rПО ВАШЕЙ ЗАЯВКЕ НАШ СПЕЦИАЛИСТ ПРИЕЗЖАЕТ СО ВСЕМИ ОБРАЗЦАМИ МАТЕРИАЛОВ, С КОТОРЫМИ МЫ РАБОТАЕМ, В ЛЮБОЕ УДОБНОЕ ДЛЯ ВАС ВРЕМЯ И\rПРОИЗВЕДЕТ ВСЕ НЕОБХОДИМЫЕ ЗАМЕРЫ. УЧИТЫВАЯ ВСЕ ВАШИ ПОЖЕЛАНИЯ И ОСОБЕННОСТИ ПОМЕЩЕНИЯ, СОСТАВЛЯЕТСЯ ЭСКИЗНЫЙ ПРОЕКТ.\rПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА, В КОТОРОМ ОГОВАРИВАЮТСЯ СРОКИ ДОСТАВКИ И МОНТАЖА МЕБЕЛИ, ЭСКИЗНЫЙ ПРОЕКТ ПЕРЕДАЕТСЯ НА ПРОИЗВОДСТВО,\rГДЕ ОПЫТНЫМИ СПЕЦИАЛИСТАМИ ПРОИЗВОДЯТСЯ РАСЧЕТЫ В ПРОГРАММЕ ТРЕХМЕРНОГО МОДЕЛИРОВАНИЯ. ПОСЛЕ ВСЕХ РАСЧЕТОВ ГОТОВЫЙ ПРОЕКТ ПОСТУПАЕТ\rНЕПОСРЕДСТВЕННО НА ПРОИЗВОДСТВО, ГДЕ ПРОИЗВОДЯТ РАСКРОЙ ДЕТАЛЕЙ, ИХ ОБРАБОТКУ, И СБОРКУ НЕКОТОРЫХ ЭЛЕМЕНТОВ. НАКАНУНЕ ДНЯ ДОСТАВКИ\rСОТРУДНИКИ ОТДЕЛА ТРАНСПОРТНЫХ УСЛУГ СВЯЖУТСЯ С ВАМИ И БОЛЕЕ КОНКРЕТНО ОГОВОРЯТ ВРЕМЯ ДОСТАВКИ. ПОСЛЕ ЗАКЛЮЧЕНИЯ ДОГОВОРА ВАМИ\rВНОСИТСЯ ПРЕДОПЛАТА В РАЗМЕРЕ 30% ОТ СУММЫ ЗАКАЗАННОЙ ВАМИ МЕБЕЛИ. ОСТАЛЬНАЯ СУММА ОПЛАЧИВАЕТСЯ ВАМИ ПО ДОСТАВКЕ.\r\n'),
(46, '6ae9d8e3d86f6edc36947e4e39db948b', 'УСЛУГИ ДИЗАЙНЕРА\r\nМЫ ПРЕДЛАГАЕМ ШИРОКИЙ СПЕКТР УСЛУГ ПО ДИЗАЙНУ МЕБЕЛИ.\r\n \rДИАГНОСТИКА ВОЗМОЖНОСТЕЙ ПРЕОБРАЗОВАНИЯ ПОМЕЩЕНИЙ – ОПРЕДЕЛЕНИЕ ВАРИАНТОВ ПЕРЕПЛАНИРОВКИ, ОТДЕЛКИ, РАЗРАБОТКА НОВЫХ РЕШЕНИЙ КОЛОРИСТКИ, ОСВЕЩЕНИЯ, ПЕРЕСТАНОВКИ МЕБЕЛИ И ДЕКОРА, РАЗРАБОТКА СПЕЦИАЛЬНЫХ ФУНКЦИОНАЛЬНЫХ ЗОН ДЛЯ ПЕРЕКЛЮЧЕНИЯ В РАЗЛИЧНЫЕ РЕЖИМЫ ЖИЗНИ.\rРАЗРАБОТКА ИДЕИ-ОБРАЗА, ПРОВЕДЕНИЕ ПРЕДВАРИТЕЛЬНЫХ РАСЧЁТОВ И СОЗДАНИЕ 3D-МОДЕЛИ: ИЗОБРАЖЕНИЕ ПЕРЕДАЕТ ЦВЕТ И ФАКТУРУ, ПРЕДЛАГАЯ КЛИЕНТУ ЭКСПЕРИМЕНТИРОВАТЬ И ПОДБИРАТЬ ОПТИМАЛЬНЫЙ ВАРИАНТ.\rРАЗРАБОТКА КОМПЬЮТЕРНЫХ ЦВЕТНЫХ ТРЕХМЕРНЫХ МОДЕЛЕЙ МЕБЕЛИ. НАТУРАЛИСТИЧНОСТЬ ИЗОБРАЖЕНИЙ, ИХ ВЫСОКАЯ СХОЖЕСТЬ С ОРИГИНАЛОМ ПОЗВОЛЯЮТ ПРЕДСТАВИТЬ, КАК БУДЕТ ВЫГЛЯДЕТЬ ГОТОВОЕ ИЗДЕЛИЕ, РАССМОТРЕТЬ ЕГО В ДЕТАЛЯХ.\rПОДБОР И РАССТАНОВКА МЕБЕЛИ.\rДЕКОРИРОВАНИЕ - ПОДБОР ДЕКОРА И АКСЕССУАРОВ ИНТЕРЬЕРА В СООТВЕТСТВИИ С ОБРАЗОМ И СТИЛЕМ ПОМЕЩЕНИЯ. ВОЗМОЖНО СОЗДАНИЕ ПО ИНДИВИДУАЛЬНОМУ ЗАПРОСУ ЭКСКЛЮЗИВНЫХ, АВТОРСКИХ КОЛЛЕКЦИЙ.\r\n'),
(47, '73b0737b640ddf58dcbdd46d5175e414', 'ПРОДАВЕЦ-ДИЗАЙНЕР (КУХНИ)\r\nТРЕБОВАНИЯ\rУВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, НАВЫКИ ЧЕРЧЕНИЯ ОТ РУКИ И В ПРОГРАММАХ, ОПЫТ РАБОТЫ ДИЗАЙНЕРОМ/КОНСТРУКТОРОМ В МЕБЕЛЬНОЙ СФЕРЕ, ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ\rОБЯЗАННОСТИ\rКОНСУЛЬТИРОВАНИЕ КЛИЕНТОВ ПО КУХОННОЙ МЕБЕЛИ, ОСТАВЛЕНИЕ ХУДОЖЕСТВЕННО-КОНСТРУКТОРСКИХ ПРОЕКТОВ, ПРИЕМ И ОФОРМЛЕНИЕ ЗАКАЗОВ.\rУСЛОВИЯ\rЗАРПЛАТА: 13500 ОКЛАД + % ОТ ЛИЧНЫХ ПРОДАЖ + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 20000 РУБ,ПОЛНЫЙ СОЦ. ПАКЕТ‚ ОФОРМЛЕНИЕ СОГЛАСНО ТК РФ\r\n'),
(48, 'fa5c9c5ac99f37b001a1a0421af4b144', 'ДИРЕКТОР МАГАЗИНА\r\nТРЕБОВАНИЯ\rВЫСШЕЕ ОБРАЗОВАНИЕ‚ ОПЫТ РУКОВОДЯЩЕЙ РАБОТЫ В РОЗНИЦЕ ОТ 3 ЛЕТ‚ ОПЫТНЫЙ ПОЛЬЗОВАТЕЛЬ ПК‚ ЭТИКА ДЕЛОВОГО ОБЩЕНИЯ‚ ЗНАНИЕ МЕТОДОВ УПРАВЛЕНИЯ И ЗАКЛЮЧЕНИЯ ДОГОВОРОВ‚ ОТЛИЧНОЕ ЗНАНИЕ ТОРГОВОГО И ТРУДОВОГО ЗАКОНОДАТЕЛЬСТВ‚ ОТВЕТСТВЕННОСТЬ‚ ИНИЦИАТИВНОСТЬ‚ АКТИВНОСТЬ.\rОБЯЗАННОСТИ\rРУКОВОДСТВО ДЕЯТЕЛЬНОСТЬЮ МАГАЗИНА‚ ОРГАНИЗАЦИЯ ЭФФЕКТИВНОЙ РАБОТЫ ПЕРСОНАЛА МАГАЗИНА‚ ФИНАНСОВО-ХОЗЯЙСТВЕННАЯ ДЕЯТЕЛЬНОСТЬ И ОТЧЕТНОСТЬ‚ ВЫПОЛНЕНИЕ ПЛАНА ПРОДАЖ‚ ОТЧЕТНОСТЬ.\rУСЛОВИЯ\rТРУДОУСТРОЙСТВО ПО ТК РФ‚ ПОЛНЫЙ СОЦ. ПАКЕТ‚ ГРАФИК РАБОТЫ 5 ЧЕРЕ 2 (168 ЧАС/МЕС)‚ ЗАРПЛАТА: ОКЛАД 28000 + % ОТ ОБОРОТА + ПРЕМИИ‚ СОВОКУПНЫЙ ДОХОД ОТ 35000 РУБ\r\n'),
(49, '3187d1b1ae8eb650d8851807a7ab248b', 'БУХГАЛТЕР ОТДЕЛА УЧЕТА ГОТОВОЙ ПРОДУКЦИИ\r\nТРЕБОВАНИЯ\rЖЕН., 22-45, УВЕРЕННЫЙ ПОЛЬЗОВАТЕЛЬ ПК, ОПЫТ РАБОТЫ БУХГАЛТЕРОМ ПРИВЕТСВУЕТСЯ, ЗНАНИЕ БУХГАЛТЕРСКОГО УЧЕТА (БАЗОВЫЙ УРОВЕНЬ), САМОСТОЯТЕЛЬНОСТЬ, ОТВЕТСТВЕННОСТЬ, КОММУНИКАБЕЛЬНОСТЬ, БЫСТРАЯ ОБУЧАЕМОСТЬ, ЖЕЛАНИЕ РАБОТАТЬ.\rОБЯЗАННОСТИ\rРАБОТА С ПЕРВИЧНЫМИ ДОКУМЕНТАМИ ПО УЧЕТУ МПЗ ВЕДЕНИЕ ЖУРНАЛОВ-ОРДЕРОВ ПО ПРОИЗВОДСТВЕННЫМ СЧЕТАМ ФОРМИРОВАНИЕ МАТЕРИАЛЬНЫХ ОТЧЕТОВ ПОДРАЗДЕЛЕНИЙ ИСПОЛНЕНИЕ ДОПОЛНИТЕЛЬНЫХ ФУНКЦИЙ ПО УКАЗАНИЮ РУКОВОДИТЕЛЯ\rУСЛОВИЯ\rГРАФИК РАБОТЫ 5 ДНЕЙ В НЕДЕЛЮ, АДРЕС РАБОТЫ Г. ШАТУРА, БОТИНСКИЙ ПР-Д, 37. ЗАРПЛАТА: ОКЛАД 10 800 Р. + ПРЕМИЯ 40% ОТ ОКЛАДА, ПОЛНЫЙ СОЦ. ПАКЕТ.\r\n'),
(50, '2988bab0912d60e150015fcb7be704d4', 'ЭКЗАМЕН2\r\nTEXT HERE....\r\n'),
(51, '682d247c59302d68d320dcbbc2f5009d', 'ФОРМА ОБРАТНОЙ СВЯЗИ\r\n\r\n'),
(52, '67a29ffd4338d6feabdb94a0e62e6eeb', 'ПРОСТОЙ КОМПОНЕНТ\r\n\r\n'),
(53, 'c0889d6b4ab4a1dfe26d63ac50fe38d9', 'КОМПЛЕКСНЫЙ КОМПОНЕНТ\r\n\r\n');
-- -----------------------------------
-- Dumping table b_search_content_title
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

INSERT INTO `b_search_content_title` VALUES
(1, 's1', 0, 'УСЛУГИ'),
(2, 's1', 0, 'ПОИСК'),
(3, 's1', 0, 'КАРТА'),
(3, 's1', 6, 'САЙТА'),
(4, 's1', 10, 'КОМПАНИЯ'),
(4, 's1', 0, 'МЕБЕЛЬНАЯ'),
(5, 's1', 0, 'ПРОДУКЦИЯ'),
(6, 's1', 0, 'НОВОСТИ'),
(7, 's1', 0, 'ВХОД'),
(7, 's1', 5, 'НА'),
(7, 's1', 8, 'САЙТ'),
(8, 's1', 0, 'КОНТАКТЫ'),
(9, 's1', 2, 'КОМПАНИИ'),
(9, 's1', 0, 'О'),
(10, 's1', 1, 'И'),
(10, 's1', 0, 'МИССИЯ'),
(10, 's1', 9, 'СТРАТЕГИЯ'),
(11, 's1', 0, 'РУКОВОДСТВО'),
(12, 's1', 0, 'ИСТОРИЯ'),
(13, 's1', 0, 'ВАКАНСИИ'),
(14, 's1', 16, 'БЕЛАРУСИ'),
(14, 's1', 0, 'МЕБЕЛЬНЫЙ'),
(14, 's1', 10, 'ФОРУМ'),
(15, 's1', 39, 'DEL'),
(15, 's1', 43, 'MOBILE'),
(15, 's1', 33, 'SALON'),
(15, 's1', 24, 'ВЫСТАВКА'),
(15, 's1', 14, 'МЕБЕЛЬНАЯ'),
(15, 's1', 0, 'МЕЖДУНАРОДНАЯ'),
(16, 's1', 17, 'ВОДОСТОЙКОЕ'),
(16, 's1', 0, 'ПОЛУЧЕНО'),
(16, 's1', 9, 'ПРОЧНОЕ'),
(16, 's1', 29, 'СОЕДИНЕНИЕ'),
(17, 's1', 7, 'МЕБЕЛЬ'),
(17, 's1', 0, 'МЯГКАЯ'),
(18, 's1', 8, 'МЕБЕЛЬ'),
(18, 's1', 0, 'ОФИСНАЯ'),
(19, 's1', 7, 'ДЛЯ'),
(19, 's1', 11, 'КУХНИ'),
(19, 's1', 0, 'МЕБЕЛЬ'),
(20, 's1', 0, 'ДЕТСКАЯ'),
(20, 's1', 8, 'МЕБЕЛЬ'),
(21, 's1', 0, 'ГЕРЦОГ'),
(22, 's1', 0, 'МОНАЛИЗА'),
(23, 's1', 0, 'МИНИСТР'),
(24, 's1', 0, 'ХРОМ'),
(25, 's1', 0, 'ЛИВЕРПУЛЬ'),
(26, 's1', 0, 'ИЗАБЕЛЛА'),
(27, 's1', 0, 'АЛАДДИН'),
(28, 's1', 0, 'ДЖОКОНДА'),
(29, 's1', 0, 'ФЛОРА'),
(30, 's1', 0, 'ПРЕСТИЖ'),
(31, 's1', 0, 'ЛАУРА'),
(32, 's1', 0, 'МОДЕРН'),
(33, 's1', 0, 'ОПТИМА'),
(34, 's1', 0, 'СОБРАНИЕ'),
(35, 's1', 0, 'ЛИДЕР'),
(36, 's1', 0, 'ПРЕЗИДЕНТ'),
(37, 's1', 0, 'ПЛУТОН'),
(38, 's1', 0, 'ПАРМА'),
(39, 's1', 0, 'ПАЛЕРМО'),
(40, 's1', 0, 'ВАЛЕНСИЯ'),
(41, 's1', 0, 'ФАЗЕНДА'),
(42, 's1', 0, 'ЭРА'),
(43, 's1', 0, 'СИТИ'),
(44, 's1', 0, 'ИЗОПЛАСТ'),
(44, 's1', 9, 'ХРОМ'),
(45, 's1', 10, 'ЗАКАЗ'),
(45, 's1', 0, 'МЕБЕЛЬ'),
(45, 's1', 7, 'НА'),
(46, 's1', 7, 'ДИЗАЙНЕРА'),
(46, 's1', 0, 'УСЛУГИ'),
(47, 's1', 19, 'КУХНИ'),
(47, 's1', 0, 'ПРОДАВЕЦ-ДИЗАЙНЕР'),
(48, 's1', 0, 'ДИРЕКТОР'),
(48, 's1', 9, 'МАГАЗИНА'),
(49, 's1', 0, 'БУХГАЛТЕР'),
(49, 's1', 23, 'ГОТОВОЙ'),
(49, 's1', 10, 'ОТДЕЛА'),
(49, 's1', 31, 'ПРОДУКЦИИ'),
(49, 's1', 17, 'УЧЕТА'),
(50, 's1', 0, 'ЭКЗАМЕН2'),
(51, 's1', 6, 'ОБРАТНОЙ'),
(51, 's1', 15, 'СВЯЗИ'),
(51, 's1', 0, 'ФОРМА'),
(52, 's1', 8, 'КОМПОНЕНТ'),
(52, 's1', 0, 'ПРОСТОЙ'),
(53, 's1', 0, 'КОМПЛЕКСНЫЙ'),
(53, 's1', 12, 'КОМПОНЕНТ');
-- -----------------------------------
-- Dumping table b_search_custom_rank
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_phrase
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_stem
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=1267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_search_stem` VALUES
(1, 'УСЛУГ'),
(2, 'ПОИСК'),
(3, 'КАРТ'),
(4, 'САЙТ'),
(5, 'МЕБЕЛЬН'),
(6, 'КОМПАН'),
(7, 'НАШ'),
(8, 'СУЩЕСТВ'),
(9, 'РОССИЙСК'),
(10, 'РЫНК'),
(11, '1992'),
(12, 'ГОД'),
(13, 'ВРЕМ'),
(14, 'ПРОШЛ'),
(15, 'БОЛЬШ'),
(16, 'ПУТ'),
(17, 'МАЛЕНЬК'),
(18, 'ТОРГОВ'),
(19, 'ФИРМ'),
(20, 'ОДН'),
(21, 'КРУПН'),
(22, 'ПРОИЗВОДИТЕЛ'),
(23, 'КОРПУСН'),
(24, 'МЕБЕЛ'),
(25, 'РОСС'),
(26, 'ОСУЩЕСТВЛЯ'),
(27, 'ПРОИЗВОДСТВ'),
(28, 'ВЫСОКОКЛАССН'),
(29, 'ОБОРУДОВАН'),
(30, 'ПРИМЕНЕН'),
(31, 'МИНИМАЛЬН'),
(32, 'ДОЛ'),
(33, 'РУЧН'),
(34, 'ТРУД'),
(35, 'ПОЗВОЛЯ'),
(36, 'ОБЕСПЕЧ'),
(37, 'ВЫСОК'),
(38, 'КАЧЕСТВ'),
(39, 'ПРОДУКЦ'),
(40, 'НАЛАЖ'),
(41, 'ПРОИЗВОДСТВЕН'),
(42, 'ПРОЦЕСС'),
(43, 'МАССОВ'),
(44, 'ИНДИВИДУАЛЬН'),
(45, 'ХАРАКТЕР'),
(46, 'СТОРОН'),
(47, 'ПОСТОЯ'),
(48, 'НОМЕНКЛАТУР'),
(49, 'ИЗДЕЛ'),
(50, 'ПОДХОД'),
(51, 'ДРУГ'),
(52, 'НОВОСТ'),
(53, 'ВХОД'),
(54, 'ЗАРЕГИСТРИРОВА'),
(55, 'УСПЕШН'),
(56, 'АВТОРИЗОВА'),
(57, 'ВЕРНУТ'),
(58, 'ГЛАВН'),
(59, 'СТРАНИЦ'),
(60, 'КОНТАКТ'),
(61, 'ОБРАТ'),
(62, 'СПЕЦИАЛИСТ'),
(63, 'ПОЛУЧ'),
(64, 'ПРОФЕССИОНАЛЬН'),
(65, 'КОНСУЛЬТАЦ'),
(66, 'ВОПРОС'),
(67, 'СОЗДАН'),
(68, 'ПОКУПК'),
(69, 'ДИЗАЙН'),
(70, 'РАЗРАБОТК'),
(71, 'ТЕХНИЧЕСК'),
(72, 'ЗАДАН'),
(73, 'ДОСТАВК'),
(74, 'ДОМ'),
(75, 'МОЖЕТ'),
(76, 'НАМ'),
(77, 'ТЕЛЕФОН'),
(78, 'ЭЛЕКТРОН'),
(79, 'ПОЧТ'),
(80, 'ДОГОВОР'),
(81, 'ВСТРЕЧ'),
(82, 'ОФИС'),
(83, 'БУД'),
(84, 'РАД'),
(85, 'ПОМОЧ'),
(86, 'ОТВЕТ'),
(87, 'ФАКС'),
(88, '495'),
(89, '212-85-06'),
(90, '212-85-07'),
(91, '212-85-08'),
(92, 'EMAIL'),
(93, 'INFO'),
(94, 'EXAMPLE'),
(95, 'ОБЩ'),
(96, 'SALES'),
(97, 'ПРИОБРЕТЕН'),
(98, 'MARKETING'),
(99, 'МАРКЕТИНГ'),
(100, 'МЕРОПРИЯТ'),
(101, 'PR'),
(102, 'МОСКВ'),
(103, 'ПРАВ'),
(104, 'КАЖД'),
(105, 'КЛИЕНТ'),
(106, 'СЕГОДНЯШН'),
(107, 'ДЕН'),
(108, 'РАЗРАБОТА'),
(109, 'БОЛ'),
(110, 'ПЯТИСОТ'),
(111, 'МОДЕЛ'),
(112, 'ВМЕСТ'),
(113, 'ТЕМ'),
(114, 'СТРЕМ'),
(115, 'НЕПОВТОРИМ'),
(116, 'ИЗГОТОВ'),
(117, 'КУХН'),
(118, 'ДЕТСК'),
(119, 'ГОСТИН'),
(120, 'СПАЛЬН'),
(121, 'ВАН'),
(122, 'КОМНАТ'),
(123, 'ОСОБ'),
(124, 'НЕСТАНДАРТН'),
(125, 'РАЗМЕР'),
(126, 'ДИЗАЙНЕР'),
(127, 'ПРОИЗВЕДУТ'),
(128, 'ЗАМЕР'),
(129, 'ПОМЕЩЕН'),
(130, 'ДИЗАЙН-ПРОЕКТ'),
(131, 'ИНТЕРЬЕР'),
(132, 'ПОДОБРА'),
(133, 'ТОЧНОСТ'),
(134, 'ЦВЕТ'),
(135, 'ПОМОГУТ'),
(136, 'ОПТИМАЛЬН'),
(137, 'РАСПОЛОЖ'),
(138, 'ПРОЕКТ'),
(139, 'БУДЕТ'),
(140, 'СОЗДА'),
(141, 'УЧЕТ'),
(142, 'ВСЕХ'),
(143, 'НЮАНСОВ'),
(144, 'НЮАНС'),
(145, 'ПРОРИСОВК'),
(146, 'МЕЛЬЧАЙШ'),
(147, 'ДЕТАЛ'),
(148, 'РЕЗУЛЬТАТ'),
(149, 'СОВМЕСТН'),
(150, 'ТВОРЧЕСТВ'),
(151, 'СМОЖЕТ'),
(152, 'ПОСМОТРЕТ'),
(153, 'ОБЪЕМН'),
(154, 'ПРЕДСТАВЛЕН'),
(155, 'НАГЛЯДН'),
(156, 'ПРОДЕМОНСТРИР'),
(157, 'БУДУТ'),
(158, 'ВЫГЛЯДЕТ'),
(159, 'ЖИЗН'),
(160, 'ВЫБРА'),
(161, 'ЭЛЕМЕНТ'),
(162, 'РАЗН'),
(163, 'ОСВЕЩЕН'),
(164, 'КОНКРЕТН'),
(165, 'СДЕЛА'),
(166, 'ОПРЕДЕЛЕН'),
(167, 'МАТЕРИАЛОВ'),
(168, 'МАТЕРИАЛ'),
(169, 'РАСПОРЯЖЕН'),
(170, 'ПРЕДОСТАВЛ'),
(171, 'МНОГ'),
(172, 'РАЗЛИЧН'),
(173, 'ВАРИАНТОВ'),
(174, 'ВАРИАНТ'),
(175, 'КОТОР'),
(176, 'НАИБОЛ'),
(177, 'ПОДХОДЯ'),
(178, 'ИМЕН'),
(179, 'ЗАКАЗ'),
(180, 'ВЫПОЛН'),
(181, 'ДОСТАВЛ'),
(182, 'ТОЧН'),
(183, 'СРОК'),
(184, 'РАБОТ'),
(185, 'СБОРК'),
(186, 'УСТАНОВК'),
(187, 'СОТРУДНИК'),
(188, 'СТРОГ'),
(189, 'КОНТРОЛ'),
(190, 'ЭТАП'),
(191, 'МОМЕНТ'),
(192, 'ОФОРМЛЕН'),
(193, 'ПРИЕМ'),
(194, 'ВЫПОЛНЕН'),
(195, 'ПЕРЕДОВ'),
(196, 'ТЕХНОЛОГ'),
(197, 'БЕСЦЕН'),
(198, 'ОП'),
(199, 'ИСПОЛЬЗОВАН'),
(200, 'КОМПЬЮТЕРН'),
(201, 'МНОГОЛЕТН'),
(202, 'СПЕЦИАЛИСТОВ'),
(203, 'ПРОИЗВЕСТ'),
(204, 'ГРАМОТН'),
(205, 'РАСЧЕТ'),
(206, 'СНИЗ'),
(207, 'РАСХОД'),
(208, 'СЕБЕСТОИМ'),
(209, 'ИЗБЕЖА'),
(210, 'ОШИБОК'),
(211, 'ПРОЕКТИРОВАН'),
(212, 'ОПТИМИЗИРОВА'),
(213, 'КОМПЛЕКСН'),
(214, 'ИНТЕРЬЕРОВ'),
(215, 'ГАРАНТ'),
(216, 'СОСТАВЛЯ'),
(217, '18'),
(218, 'МЕСЯЦЕВ'),
(219, 'МЕСЯЦ'),
(220, 'ОТДЕЛЬН'),
(221, '36'),
(222, 'ГОРД'),
(223, 'ПРОШЕДШ'),
(224, 'ОБУЧЕН'),
(225, 'ЛУЧШ'),
(226, 'УЧЕБН'),
(227, 'ЗАВЕДЕН'),
(228, 'ЗАРУБЕЖ'),
(229, 'НАС'),
(230, 'ВОЗРАСТОВ'),
(231, 'ВОЗРАСТ'),
(232, 'ЦЕН'),
(233, 'ЭНТУЗИАЗМ'),
(234, 'МОЛОДЕЖ'),
(235, 'СТАРШ'),
(236, 'ПОКОЛЕН'),
(237, 'ОБЪЕДИНЯ'),
(238, 'ПРЕДАН'),
(239, 'ДЕЛ'),
(240, 'ВЕР'),
(241, 'ИД'),
(242, 'ВЫСОЧАЙШ'),
(243, 'СТАНДАРТ'),
(244, 'ЗАЛОГ'),
(245, 'УСПЕХ'),
(246, 'ЕЖЕГОДН'),
(247, 'ПРОХОД'),
(248, 'СЕРТИФИКАЦИОН'),
(249, 'ИСПЫТАН'),
(250, 'СПЕЦИАЛИЗИРОВА'),
(251, 'ЛАБОРАТОР'),
(252, 'ИМЕЕТ'),
(253, 'СЕРТИФИКАТ'),
(254, 'СООТВЕТСТВ'),
(255, 'НОРМ'),
(256, 'БЕЗОПАСН'),
(257, 'КРОМ'),
(258, 'ТОГ'),
(259, 'ПЕРВ'),
(260, 'СРЕД'),
(261, '2003'),
(262, 'АУД'),
(263, 'ТРЕБОВАН'),
(264, 'СИСТЕМ'),
(265, 'МЕНЕДЖМЕНТ'),
(266, 'ИС'),
(267, '9000'),
(268, 'ПРЕДПРИЯТ'),
(269, 'МЕЖДУНАРОДН'),
(270, 'МИСС'),
(271, 'СТРАТЕГ'),
(272, 'ДИНАМИЧН'),
(273, 'РАЗВИВА'),
(274, 'ПЕРЕД'),
(275, 'СОБ'),
(276, 'ЯСН'),
(277, 'ВЫРАЖЕН'),
(278, 'ЦЕЛ'),
(279, 'ИНСТРУМЕНТ'),
(280, 'ДОСТИЖЕН'),
(281, 'ПРЕДОСТАВЛЯ'),
(282, 'ВОЗМОЖН'),
(283, 'ОБУСТРО'),
(284, 'ЖИЗНЕН'),
(285, 'РАБОЧ'),
(286, 'ПРОСТРАНСТВ'),
(287, 'РАБОТА'),
(288, 'ДОЛГОСРОЧН'),
(289, 'ПЕРСПЕКТИВ'),
(290, 'ПРЕДЛАГА'),
(291, 'РЕШЕН'),
(292, 'НАДЕЖН'),
(293, 'ТЕХНОЛОГИЧН'),
(294, 'ГИБК'),
(295, 'ПОСТАВЩИК'),
(296, 'МОЩНОСТ'),
(297, 'ЗАДАЧ'),
(298, 'ОПРАВДЫВА'),
(299, 'ОЖИДАН'),
(300, 'ЗАКАЗЧИК'),
(301, 'ВСЕГД'),
(302, 'ПОТРЕБИТЕЛ'),
(303, 'ФОРМИР'),
(304, 'ЕДИН'),
(305, 'СИСТ'),
(306, 'ВЗГЛЯДОВ'),
(307, 'ВЗГЛЯД'),
(308, 'ВЫПУСКА'),
(309, 'ДОБ'),
(310, 'РАБОТНИКОВ'),
(311, 'РАБОТНИК'),
(312, 'ПОНИМАН'),
(313, 'ЛИЧН'),
(314, 'ОТВЕТСТВЕН'),
(315, 'ПОВЫШЕН'),
(316, 'УВЕЛИЧИВА'),
(317, 'ОБЪЕМ'),
(318, 'ПОСЛЕД'),
(319, 'РЕИНВЕСТИРОВАН'),
(320, 'ПРИБ'),
(321, 'РАЗВИТ'),
(322, 'ОБЕСПЕЧИВА'),
(323, 'ПРОИЗВОДИМ'),
(324, 'ПРАВИЛ'),
(325, 'ЗАЩИТ'),
(326, 'ОКРУЖА'),
(327, 'ПОЛИТИК'),
(328, 'СОВЕРШЕНСТВОВАН'),
(329, 'СВОЕВРЕМЕН'),
(330, 'ЭФФЕКТИВН'),
(331, 'ПРИНЯТ'),
(332, 'КОРРЕКТИР'),
(333, 'МЕР'),
(334, 'ЗАБОТ'),
(335, 'УСЛОВ'),
(336, 'ОСНАЩЕН'),
(337, 'МЕСТ'),
(338, 'ВСЕМ'),
(339, 'САНИТАРН'),
(340, 'ГИГИЕНИЧЕСК'),
(341, 'БЛАГОСОСТОЯН'),
(342, 'СОТРУДНИКОВ'),
(343, 'ОБЕСПЕЧЕН'),
(344, 'МОРАЛЬН'),
(345, 'МАТЕРИАЛЬН'),
(346, 'УДОВЛЕТВОРЕН'),
(347, 'СИСТЕМАТИЧЕСК'),
(348, 'УРОВН'),
(349, 'МАСТЕРСТВ'),
(350, 'ВНЕДРЕН'),
(351, 'ВЫСОКОПРОИЗВОДИТЕЛЬН'),
(352, 'НОВ'),
(353, 'ПРОИЗВОДИТЕЛЬН'),
(354, 'ОПТИМИЗАЦ'),
(355, 'ЗАТРАТ'),
(356, 'СНИЖЕН'),
(357, 'ПРИВЛЕЧЕН'),
(358, 'КВАЛИФИКАЦ'),
(359, 'ВЫХОД'),
(360, 'РЫНОК'),
(361, 'ДОВЕРИТЕЛЬН'),
(362, 'ВЗАИМОВЫГОДН'),
(363, 'ОТНОШЕН'),
(364, 'СО'),
(365, 'ПАРТНЕР'),
(366, 'ИНТЕРЕС'),
(367, 'БИЗНЕС'),
(368, 'ОТНОС'),
(369, 'ВЗЯТ'),
(370, 'ОБЯЗАТЕЛЬСТВ'),
(371, 'ЖДЕТ'),
(372, 'ПАРТНЕРОВ'),
(373, 'ТРЕБОВАТЕЛЬН'),
(374, 'ПРИБЫЛЬН'),
(375, 'ДНЯ'),
(376, 'ОСНОВАН'),
(377, 'СОДЕЙСТВ'),
(378, 'РОСТ'),
(379, 'РЕГИОНОВ'),
(380, 'РЕГИОН'),
(381, 'ПОНИМА'),
(382, 'ВАЖНОСТ'),
(383, 'СОЦИАЛЬН'),
(384, 'ОСТАН'),
(385, 'ПРИМЕР'),
(386, 'ЗАЩИЩЕН'),
(387, 'РУКОВОДСТВ'),
(388, 'КВАЛИФИЦИРОВА'),
(389, 'ЛЕТ'),
(390, 'СОХРАН'),
(391, 'УПРОЧ'),
(392, 'ЛИДИР'),
(393, 'ПОЗИЦ'),
(394, 'ВЕДУЩ'),
(395, 'ИГРОКОВ'),
(396, 'ИГРОК'),
(397, 'РАСШИРЯ'),
(398, 'АССОРТИМЕНТ'),
(399, 'НАРАЩИВА'),
(400, 'ТЕМП'),
(401, 'СКЛАДСК'),
(402, 'ПЛОЩАД'),
(403, 'СТРАН'),
(404, 'НАЛАЖИВА'),
(405, 'СВЯЗ'),
(406, 'ЗАРУБЕЖН'),
(407, 'СТЕПЕН'),
(408, 'ЗАСЛУГ'),
(409, 'ХОРОШ'),
(410, 'ПОДГОТОВЛЕН'),
(411, 'РУКОВОДЯ'),
(412, 'СОСТАВ'),
(413, 'СОБСТВЕННИК'),
(414, 'КОЛЕСНИКОВ'),
(415, 'КОЛЕСНИК'),
(416, 'ВИКТОР'),
(417, 'ФЕДОРОВИЧ'),
(418, 'РОД'),
(419, 'СЕНТЯБР'),
(420, '1964'),
(421, 'ОБРАЗОВАН'),
(422, 'ЗАКОНЧ'),
(423, 'АВИАЦИОН'),
(424, 'ФАКУЛЬТЕТ'),
(425, 'ВОРОНЕЖСК'),
(426, 'ГОСУДАРСТВЕН'),
(427, 'ПОЛИТЕХНИЧЕСК'),
(428, 'ИНСТИТУТ'),
(429, '1994'),
(430, 'ПРОШЕЛ'),
(431, 'ПРОГРАММ'),
(432, 'ПОДГОТОВК'),
(433, 'МАЛ'),
(434, 'СРЕДН'),
(435, 'США'),
(436, 'НАСТОЯ'),
(437, 'ВОЗГЛАВЛЯ'),
(438, 'УПРАВЛЯ'),
(439, 'КООРДИНИР'),
(440, 'ДЕЯТЕЛЬН'),
(441, 'ВХОДЯ'),
(442, 'ГРУПП'),
(443, 'ГЕНЕРАЛЬН'),
(444, 'ДИРЕКТОР'),
(445, 'РАТЧЕНК'),
(446, 'АЛЕКСАНДР'),
(447, 'ПЕТРОВИЧ'),
(448, 'ИЮН'),
(449, '1962'),
(450, 'СПЕЦИАЛЬН'),
(451, 'ИНЖЕНЕР-ТЕХНОЛОГ'),
(452, 'СЕРГ'),
(453, 'ФОМИЧ'),
(454, 'НАЧАЛЬНИК'),
(455, 'ЦЕХ'),
(456, 'ЗАМЕСТИТЕЛ'),
(457, 'РОГОВ'),
(458, 'АНДР'),
(459, 'ВЛАДИМИРОВИЧ'),
(460, 'РАДИОТЕХНИК'),
(461, 'УНИВЕРСИТЕТ'),
(462, '2000'),
(463, 'ИСТОР'),
(464, '1992Г'),
(465, 'НАЧИНА'),
(466, 'ИЗГОТОВЛЕН'),
(467, 'ШКОЛ'),
(468, 'ОФИСОВ'),
(469, 'РАСПОЛАГА'),
(470, 'АРЕНДУЕМ'),
(471, 'МАСТЕРСК'),
(472, '400'),
(473, 'М2'),
(474, 'ДЕРЕВООБРАБАТЫВА'),
(475, 'СТАНК'),
(476, 'ДВАДЦА'),
(477, 'ЧЕЛОВЕК'),
(478, 'ЗАРАБОТА'),
(479, 'СРЕДСТВ'),
(480, 'ВКЛАДЫВА'),
(481, 'ПОЗВОЛ'),
(482, 'МОЛОД'),
(483, 'РАСТ'),
(484, 'БЫСТР'),
(485, '1993Г'),
(486, 'ВВЕД'),
(487, 'ЭКСПЛУАТАЦ'),
(488, '700'),
(489, 'СТАВШ'),
(490, 'СОБСТВЕН'),
(491, 'МОДЕРНИЗАЦ'),
(492, 'БАЗ'),
(493, 'СТАЛ'),
(494, 'ТРАДИЦ'),
(495, 'ПОСТЕПЕН'),
(496, 'ПЕРЕШЛ'),
(497, 'СОВЕРШЕН'),
(498, 'ПОВЫС'),
(499, 'УРОВЕН'),
(500, 'ЗНАЧИТЕЛЬН'),
(501, 'УВЕЛИЧ'),
(502, '1998Г'),
(503, 'ВОРОНЕЖ'),
(504, 'ОТКР'),
(505, 'ФИРМЕН'),
(506, 'МАГАЗИН-САЛОН'),
(507, 'ШАГ'),
(508, 'ЗАВОЕВЫВА'),
(509, 'СИБИР'),
(510, 'УРА'),
(511, 'ПОДМОСКОВ'),
(512, 'ЮГ'),
(513, 'СЕВЕРО-ЗАПАД'),
(514, '5000'),
(515, '1999Г'),
(516, 'ДИПЛОМАНТ'),
(517, 'ПРЕСТИЖН'),
(518, 'ВЫСТАВОК'),
(519, 'ЕВРОЭКСПОМЕБЕЛЬ-99'),
(520, 'ОФИЦИАЛЬН'),
(521, 'ПРИЗНАН'),
(522, 'МИРОВ'),
(523, 'ЗАКЛЮЧ'),
(524, 'РЯД'),
(525, 'КОНТРАКТОВ'),
(526, 'КОНТРАКТ'),
(527, 'ПОСТАВК'),
(528, 'СНГ'),
(529, 'БЛИЖН'),
(530, '2000Г'),
(531, 'КОЛЛЕКТ'),
(532, 'НАСЧИТЫВА'),
(533, '500'),
(534, 'ЗАКЛЮЧА'),
(535, 'ЕВРОПЕЙСК'),
(536, '2002Г'),
(537, 'ВОШЛ'),
(538, 'ДЕСЯТК'),
(539, 'ДАН'),
(540, 'САЛОНОВ'),
(541, 'САЛОН'),
(542, 'ТАКЖ'),
(543, 'ЧИСЛ'),
(544, 'ЛИДЕРОВ'),
(545, 'ЛИДЕР'),
(546, 'ОРГАНИЗАЦИОН'),
(547, '2003Г'),
(548, 'ПРИСТУП'),
(549, 'СТРОИТЕЛЬСТВ'),
(550, 'СКЛАД'),
(551, 'ФИЛИА'),
(552, 'ПРОВЕД'),
(553, 'КОНФЕРЕНЦ'),
(554, 'УКРЕПЛЕН'),
(555, 'ЗАКЛЮЧЕН'),
(556, 'ДИЛЕРСК'),
(557, 'ДОГОВОРОВ'),
(558, '2004Г'),
(559, 'ЗАВЕРШ'),
(560, 'КОРПУС'),
(561, 'РАСШИР'),
(562, 'ПРЕДСТАВИТЕЛЬСТВ'),
(563, 'РУБЕЖ'),
(564, 'ОТКРЫТ'),
(565, 'РЕГИОНАЛЬН'),
(566, 'ЕКАТЕРИНБУРГ'),
(567, '2005Г'),
(568, 'ПРИОБРЕТА'),
(569, 'КОНЦЕРН'),
(570, 'УГЛОВ'),
(571, 'ЛИН'),
(572, 'РАСКРО'),
(573, 'ЗАГРУЗК'),
(574, 'ВЫГРУЗК'),
(575, 'ВЫПУСК'),
(576, 'НАТУРАЛЬН'),
(577, 'ШПОН'),
(578, 'КОМПЛЕКТ'),
(579, 'ОТКРЫВА'),
(580, 'ФАБРИК'),
(581, 'МЯГК'),
(582, 'МЕБЕЛЬПЛЮС'),
(583, '2006Г'),
(584, 'САНКТ-ПЕТЕРБУРГ'),
(585, 'НИЖН'),
(586, 'НОВГОРОД'),
(587, 'РОЗНИЧН'),
(588, 'СЕТ'),
(589, 'МАГАЗИНОВ-САЛОНОВ'),
(590, 'МАГАЗИНОВ-САЛОН'),
(591, 'ТЕРРИТОР'),
(592, '2007Г'),
(593, 'ВТОР'),
(594, 'ПРОИЗВОДСВЕННО-СКЛАДСК'),
(595, 'КОРПУСОВ'),
(596, '30000'),
(597, '2008Г'),
(598, 'КОМФОРТ'),
(599, 'ПРОДОЛЖА'),
(600, 'ОБНОВЛЕН'),
(601, 'УКОМПЛЕКТОВА'),
(602, 'ЗАПУЩ'),
(603, 'ТРЕТ'),
(604, 'ПАРТНЕРСТВ'),
(605, 'СЕГОДН'),
(606, '70000М2'),
(607, '37'),
(608, 'ПОЛУТОР'),
(609, 'ТЫСЯЧ'),
(610, 'ВАКАНС'),
(611, 'ФОРУМ'),
(612, 'БЕЛАРУС'),
(613, '20'),
(614, '23'),
(615, 'АПРЕЛ'),
(616, '2010'),
(617, 'СОСТО'),
(618, 'ВАЖН'),
(619, 'ОТРАСЛ'),
(620, 'ТЕКУЩ'),
(621, 'ЭКСПОЗИЦ'),
(622, 'ПРИНИМА'),
(623, 'УЧАСТ'),
(624, 'СВЫШ'),
(625, '160'),
(626, 'АВСТР'),
(627, 'ЛАТВ'),
(628, 'ЛИТВ'),
(629, 'ПОЛЬШ'),
(630, 'УКРАИН'),
(631, 'ПЯТ'),
(632, 'МИНСК'),
(633, 'ОФИСКОМФОРТ'),
(634, 'ДОМОТЕХ'),
(635, 'СТРО'),
(636, 'ПРИНЦИП'),
(637, 'ДВУХ'),
(638, 'ТЕМАТИЧЕСК'),
(639, 'СЕКТОРОВ'),
(640, 'СЕКТОР'),
(641, 'ГОТОВ'),
(642, 'ПРЕДСТАВЛ'),
(643, 'ДЕТ'),
(644, 'ПРЕДМЕТ'),
(645, 'КУХОН'),
(646, 'АДМИНИСТРАТИВН'),
(647, 'ЗДАН'),
(648, 'ДЕМОНСТРИРОВА'),
(649, 'НОВИНК'),
(650, 'ФУРНИТУР'),
(651, 'ОБИВОЧН'),
(652, 'ТКАН'),
(653, 'ЭЛЕМЕНТОВ'),
(654, 'АКСЕССУАРОВ'),
(655, 'АКСЕССУАР'),
(656, 'ПОМИМ'),
(657, 'РАСШИРЕН'),
(658, 'ЭКСПОФОРУМ'),
(659, 'ПОДГОТОВ'),
(660, 'РАЗНООБРАЗН'),
(661, 'ДЕЛОВ'),
(662, 'РАМК'),
(663, 'ВЫСТАВК'),
(664, 'СЕМИНАР'),
(665, 'МАСТЕР-КЛАСС'),
(666, 'ПОИСТИН'),
(667, 'МАСШТАБН'),
(668, 'ОБЕЩА'),
(669, 'СТАТ'),
(670, 'РЕСПУБЛИКАНСК'),
(671, 'КОНКУРС'),
(672, 'НАРОДН'),
(673, 'СТАНОВ'),
(674, 'СМОТР'),
(675, 'ОБРАЗЦОВ'),
(676, 'ОБРАЗЦ'),
(677, 'ПОЗНАКОМ'),
(678, 'ТЕНДЕНЦ'),
(679, 'МОД'),
(680, 'ПРОВЕСТ'),
(681, 'ПЕРЕГОВОР'),
(682, 'ПРАКТИЧЕСК'),
(683, 'ПРЕДЛОЖЕН'),
(684, 'УВИДЕТ'),
(685, 'КОНКУРЕНТН'),
(686, 'ПРЕИМУЩЕСТВ'),
(687, 'ВПЕРВ'),
(688, 'УЧАСТНИКОВ'),
(689, 'УЧАСТНИК'),
(690, 'ПОДГОТОВЛ'),
(691, 'МАРКЕТИНГОВ'),
(692, 'ОТЧЕТ'),
(693, 'ОПРОС'),
(694, 'ПОСЕТИТЕЛ'),
(695, 'ЗАЯВОК'),
(696, '12'),
(697, 'SALON'),
(698, 'DEL'),
(699, 'MOBILE'),
(700, 'ИНТЕРЕСН'),
(701, 'ТИП'),
(702, 'СПАЛ'),
(703, 'VIP-КАБИНЕТОВ'),
(704, 'VIP-КАБИНЕТ'),
(705, 'ВКЛЮЧ'),
(706, 'САД'),
(707, 'ЗАЯВК'),
(708, 'ПОДА'),
(709, 'ВСЕГ'),
(710, 'МИР'),
(711, 'ПРЕДПОЛАГА'),
(712, 'ПРОВЕДЕН'),
(713, 'ПОСЕТ'),
(714, '300'),
(715, '000'),
(716, 'РАЗМЕСТ'),
(717, '149'),
(718, '871'),
(719, 'КВ'),
(720, 'ГРАНДИОЗН'),
(721, 'ПРОВОД'),
(722, '10-Й'),
(723, 'РАЗ'),
(724, 'ПРОЧН'),
(725, 'ВОДОСТОЙК'),
(726, 'СОЕДИНЕН'),
(727, 'КЛЕЕВ'),
(728, 'ИЗОБРЕТЕН'),
(729, 'ОБЛАСТ'),
(730, 'ПОЛУЧЕН'),
(731, 'КЛЕЯ'),
(732, 'СОСТАВОВ'),
(733, 'ИСПОЛЬЗУЕМ'),
(734, 'СТРОИТЕЛЬН'),
(735, 'ПРОМЫШЛЕН'),
(736, 'КОМПОЗИЦ'),
(737, 'ПРЕДНАЗНАЧ'),
(738, 'ГОРЯЧ'),
(739, 'ПРЕССОВАН'),
(740, 'МНОГОКОМПОНЕНТН'),
(741, 'ОТВЕРДИТЕЛ'),
(742, 'АВТОР'),
(743, 'РАЗИНЬКОВ'),
(744, 'РАЗИНЬК'),
(745, 'ЕГОР'),
(746, 'МИХАЙЛОВИЧ'),
(747, 'МЕЩЕРЯКОВ'),
(748, 'МЕЩЕРЯК'),
(749, 'АН'),
(750, 'АНАТОЛЬЕВН'),
(751, 'ПАТЕНТ'),
(752, 'ФЕДЕРАЦ'),
(753, 'RU2277566'),
(754, 'ОПИСАН'),
(755, 'ПРОТОТИП'),
(756, 'ЯВЛЯ'),
(757, 'КЛЕ'),
(758, 'СОСТОЯ'),
(759, 'КАРБАМИДОФОРМАЛЬДЕГИДН'),
(760, 'СМОЛ'),
(761, 'СОПОЛИМЕР'),
(762, 'АКРИЛОНИТР'),
(763, 'N-ВИНИЛКАПРОЛАКТАМ'),
(764, 'ПРИМЕНЯ'),
(765, 'ХЛОРИСТ'),
(766, 'АММОН'),
(767, 'АКРИЛОВ'),
(768, 'КИСЛОТ'),
(769, 'РЕША'),
(770, 'ДОСТИГА'),
(771, 'ВКЛЮЧА'),
(772, 'СИНТЕТИЧЕСК'),
(773, 'СОГЛАСН'),
(774, 'ДОПОЛНИТЕЛЬН'),
(775, 'СОДЕРЖ'),
(776, 'МОДИФИКАТОР'),
(777, 'ПРИЧ'),
(778, 'КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДН'),
(779, '2542'),
(780, '10'),
(781, '-НЫ'),
(782, 'РАСТВОР'),
(783, 'ЩАВЕЛЕВ'),
(784, 'СЛЕД'),
(785, 'СООТНОШЕН'),
(786, 'КОМПОНЕНТОВ'),
(787, 'КОМПОНЕНТ'),
(788, 'МАС'),
(789, '64'),
(790, '5-79'),
(791, '4-20'),
(792, '6-2'),
(793, '13'),
(794, '0-15'),
(795, 'ДИВА'),
(796, 'КРЕСЛ'),
(797, 'ПРОЧ'),
(798, 'ОФИСН'),
(799, 'СТОЛ'),
(800, 'СТУЛ'),
(801, 'ПОЛК'),
(802, 'ЯЩИК'),
(803, 'КРОВАТ'),
(804, 'ГЕРЦОГ'),
(805, 'ИЗЯЩН'),
(806, 'КАРКАС'),
(807, 'РОСПИС'),
(808, 'РОСКОШН'),
(809, 'ОБИВК'),
(810, 'ЯРК'),
(811, 'БОГАТ'),
(812, 'ДЕКОР'),
(813, 'МОНАЛИЗ'),
(814, 'БОГАТСТВ'),
(815, 'ИЗЫСК'),
(816, 'ВЫРАЖ'),
(817, 'РАСПИСЫВА'),
(818, 'ЗОЛОТ'),
(819, 'ЖЕЛАН'),
(820, 'ПРОСТЕЖК'),
(821, 'СПИНК'),
(822, 'ПОДЛОКОТНИК'),
(823, 'МИНИСТР'),
(824, 'РУКОВОДИТЕЛ'),
(825, 'НЕСМОТР'),
(826, 'НИЗК'),
(827, 'СТОИМОСТ'),
(828, 'ВПЕЧАТЛЯЮЩ'),
(829, 'ВЫГЛЯД'),
(830, 'ПОМОЩ'),
(831, 'МОЖН'),
(832, 'ТОМ'),
(833, 'НЕМ'),
(834, 'ЧУВСТВУ'),
(835, 'УСТАЛ'),
(836, 'ХРОМ'),
(837, 'ПРИМЕЧАТЕЛЬН'),
(838, 'ОРИГИНАЛЬН'),
(839, 'ВНЕШН'),
(840, 'ВИД'),
(841, 'ДОСТИГНУТ'),
(842, 'СЧЕТ'),
(843, 'ХРОМИРОВА'),
(844, 'КРЕСТОВИН'),
(845, 'НЕОБЫЧН'),
(846, 'ПОДЛОКОТНИКОВ'),
(847, 'ПОТРЯСА'),
(848, 'ЭРГОНОМИК'),
(849, 'ТВЕРД'),
(850, 'ЖЕСТК'),
(851, 'ПОДДЕРЖИВА'),
(852, 'ПОЗВОНОЧНИК'),
(853, 'ЛИВЕРПУЛ'),
(854, 'ДЕРЕВЯ'),
(855, 'КЛАССИЧЕСК'),
(856, 'АНГЛИЙСК'),
(857, 'СТИЛ'),
(858, 'АТМОСФЕР'),
(859, 'ИЗАБЕЛЛ'),
(860, 'КОЖ'),
(861, 'АЛАДДИН'),
(862, 'КОМФОРТН'),
(863, 'МАССИВН'),
(864, 'ЭЛИТН'),
(865, 'СТРОЧК'),
(866, 'ПРИДА'),
(867, 'НЕОБЫКНОВЕН'),
(868, 'ШАРМ'),
(869, 'ЭЛЕГАНТН'),
(870, 'РОСКОШ'),
(871, 'УСТАНОВ'),
(872, 'МЕХАНИЗМ'),
(873, 'ТРАНСФОРМАЦ'),
(874, 'ЕЖЕДНЕВН'),
(875, 'ГОСТЕВ'),
(876, 'РАСКЛАДУШК'),
(877, 'ДЖОКОНД'),
(878, 'ФЛОР'),
(879, 'УКРАШЕН'),
(880, 'КОЛОРИТН'),
(881, 'НАКЛАДК'),
(882, 'ДЕРЕВ'),
(883, 'ДЕР'),
(884, 'ПРЕСТИЖ'),
(885, 'ТАХТ'),
(886, 'ИСПОЛНЕН'),
(887, 'НАХОД'),
(888, 'СЛЕВ'),
(889, 'ЛАУР'),
(890, 'ДВУХМЕСТН'),
(891, 'СОФ'),
(892, 'ОСНОВ'),
(893, 'ОСН'),
(894, 'КОНУСН'),
(895, 'ПРУЖИН'),
(896, 'КОМБИНАЦ'),
(897, 'ПЛОТН'),
(898, 'ПОРОЛОНОВ'),
(899, 'ПОРОЛОН'),
(900, 'МОДЕРН'),
(901, 'ОСНОВН'),
(902, 'ХАРАКТЕРИСТИК'),
(903, 'СЕР'),
(904, 'НОВИЗН'),
(905, 'ДИЗАЙНЕРСК'),
(906, 'МЫСЛ'),
(907, 'ВОПЛОЩ'),
(908, 'ОБЛИК'),
(909, 'КОМПОНОВК'),
(910, 'СОЧЕТА'),
(911, 'НАБОР'),
(912, 'НЕОБХОДИМ'),
(913, 'СВЕЖ'),
(914, 'ОРГАНИЗАЦ'),
(915, 'СОЧЕТАН'),
(916, 'УДАЧН'),
(917, 'ЦВЕТОВ'),
(918, 'СОЗДАСТ'),
(919, 'НАИЛУЧШ'),
(920, 'БИЗНЕСМЕНОВ'),
(921, 'БИЗНЕСМЕН'),
(922, 'ПРИВЫКЛ'),
(923, 'ВПЕРЕД'),
(924, 'КОНКУРЕНТОВ'),
(925, 'КОНКУРЕНТ'),
(926, 'ВРЕМЕН'),
(927, 'ОПТИМ'),
(928, 'ВЫБОР'),
(929, 'ПЕРСОНА'),
(930, 'ОПРЕДЕЛЯ'),
(931, 'ПРАВИЛЬН'),
(932, 'ОРГАНИЗОВА'),
(933, 'ЗНАЧ'),
(934, 'КОЛЛЕГ'),
(935, 'ВЫПОЛНЯ'),
(936, 'ФУНКЦ'),
(937, 'НАЙТ'),
(938, 'МАСС'),
(939, 'ОБУСТРОЙСТВ'),
(940, 'ЗОН'),
(941, 'ПРИСПОСОБ'),
(942, 'ДОЛЖНОСТН'),
(943, 'ОБЯЗАН'),
(944, 'КАТЕГОР'),
(945, 'ЭРГОНОМИЧН'),
(946, 'ПЕРЕГОРОДК'),
(947, 'ШКАФ'),
(948, 'ТУМБ'),
(949, 'РАЦИОНАЛЬН'),
(950, 'ИСПОЛЬЗОВА'),
(951, 'УНИКАЛЬН'),
(952, 'ПРИСПОСОБЛЕН'),
(953, 'ПОТРЕБН'),
(954, 'ПОЛН'),
(955, 'ИНТЕРЬЕРН'),
(956, 'СОВРЕМЕН'),
(957, 'СОБРАН'),
(958, 'ЗАХОД'),
(959, 'ПЕРЕГОВОРОВ'),
(960, 'ВОЗНИКА'),
(961, 'СТОЙК'),
(962, 'ОЩУЩЕН'),
(963, 'КАБИНЕТ'),
(964, 'ПРЕЗИДЕНТ'),
(965, 'ПРЕМЬЕР-МИНИСТР'),
(966, 'МИНИМУМ'),
(967, 'ВОТ-ВОТ'),
(968, 'ВОЙДЕТ'),
(969, 'ВЫСОКОПОСТАВЛЕН'),
(970, 'ЧИНОВНИК'),
(971, 'НАЧНЕТ'),
(972, 'ОБСУЖДЕН'),
(973, 'ГЛОБАЛЬН'),
(974, 'ВОПРОСОВ'),
(975, 'УДИВИТЕЛЬН'),
(976, 'ИЗЫСКА'),
(977, 'КРАСОТ'),
(978, 'СТОЛОВ'),
(979, 'ПРИВЛЕКАТЕЛЬН'),
(980, 'ОПРОВЕРГА'),
(981, 'УСТОЯ'),
(982, 'УТВЕРЖДЕН'),
(983, 'ДЕШЕВ'),
(984, 'УМЕНЬШЕН'),
(985, 'ПРОИСХОД'),
(986, 'ДСП'),
(987, 'ДВП'),
(988, 'СОХРАНЯ'),
(989, 'ВЕЛИКОЛЕПН'),
(990, 'ЭКСПЛУАТАЦИОН'),
(991, 'СТИЛЬН'),
(992, 'АБСОЛЮТН'),
(993, 'СИММЕТРИЧ'),
(994, 'ЕМ'),
(995, 'ОПИРА'),
(996, 'НОЖК'),
(997, 'ОСВОБОЖД'),
(998, 'ПОЛЕЗН'),
(999, 'СИСТЕМН'),
(1000, 'БЛОК'),
(1001, 'НОГ'),
(1002, 'СПРАВ'),
(1003, 'СЛУЖ'),
(1004, 'УДОБН'),
(1005, 'ВМЕСТИТЕЛЬН'),
(1006, 'ПЛАВН'),
(1007, 'ДОСТОИНСТВ'),
(1008, 'ГЛАВ'),
(1009, 'КРУГЛ'),
(1010, 'ПОМОЖЕТ'),
(1011, 'ОБСТАНОВК'),
(1012, 'ЛЕГЕНДАРН'),
(1013, 'СОВЕЩАТЕЛЬН'),
(1014, 'ВЕД'),
(1015, 'ПРОСТ'),
(1016, 'ТРОН'),
(1017, 'УПРАВЛЕНЦ'),
(1018, 'ЛЮБ'),
(1019, 'СОГЛАСУ'),
(1020, 'ПОНЯТ'),
(1021, 'ЧЕСТ'),
(1022, 'СОВЕСТ'),
(1023, 'ОКАНТОВК'),
(1024, 'ВЫТОЧ'),
(1025, 'ВРУЧН'),
(1026, 'ПОТ'),
(1027, 'ПРОИЗВОД'),
(1028, 'ОГРАНИЧЕН'),
(1029, 'ПАРТ'),
(1030, 'КРЕСЕЛ'),
(1031, 'ПЛУТОН'),
(1032, 'ФИЗИОЛОГИЧЕСК'),
(1033, 'ОСОБЕН'),
(1034, 'РАБОТОСПОСОБН'),
(1035, 'ЗДОРОВ'),
(1036, 'НЕЗАМЕНИМ'),
(1037, 'ТЕХ'),
(1038, 'КОМПЬЮТЕР'),
(1039, 'ПАРМ'),
(1040, 'ВНЕСУТ'),
(1041, 'УЮТН'),
(1042, 'ОБАЯН'),
(1043, 'ЭКОЛОГИЧЕСК'),
(1044, 'ЧИСТ'),
(1045, 'ДРЕВЕСН'),
(1046, 'МАТЕРИА'),
(1047, 'ЦЕЛИК'),
(1048, 'МАССИВ'),
(1049, 'БУК'),
(1050, 'ИСКЛЮЧЕН'),
(1051, 'ЛИШ'),
(1052, 'СИДЕН'),
(1053, 'ТОНИРОВК'),
(1054, 'ПАЛИТР'),
(1055, 'ПАЛЕРМ'),
(1056, 'УНИВЕРСАЛЬН'),
(1057, 'СТУЛЬЕВ'),
(1058, 'КАФ'),
(1059, 'ДОМАШН'),
(1060, 'ДОБАВ'),
(1061, 'УЮТ'),
(1062, 'ОРГАНИЧН'),
(1063, 'СОЛЬЮТ'),
(1064, 'ВАЛЕНС'),
(1065, 'СРАЗ'),
(1066, 'ПРИВЛЕКА'),
(1067, 'ВНИМАН'),
(1068, 'ФОРМ'),
(1069, 'ДЕЛА'),
(1070, 'НЕОБЫЧАЙН'),
(1071, 'ПОДОЙДУТ'),
(1072, 'ФАЗЕНД'),
(1073, 'СКЛАДН'),
(1074, 'ХЛОПК'),
(1075, 'ПРИРОДН'),
(1076, 'СЧИТА'),
(1077, 'ТЕПЛ'),
(1078, 'ЗИМ'),
(1079, 'СИДЕТ'),
(1080, 'НИХ'),
(1081, 'ЖЕЛЕЗ'),
(1082, 'ПЛАСТИК'),
(1083, 'ПРЕКРАСН'),
(1084, 'ДАЧ'),
(1085, 'ЭР'),
(1086, 'МЕТАЛЛИЧЕСК'),
(1087, 'УДОБ'),
(1088, 'КОМПАКТН'),
(1089, 'СЛОЖ'),
(1090, 'ХРАНЕН'),
(1091, '45'),
(1092, 'ЛЕГК'),
(1093, 'ОТЛИЧН'),
(1094, 'ПОДОЙДЕТ'),
(1095, 'БАРОВ'),
(1096, 'БАР'),
(1097, 'СИТ'),
(1098, 'ИЗОПЛАСТ'),
(1099, 'ПОПУЛЯРН'),
(1100, 'ПЛАСТИКОВ'),
(1101, 'ВПИСЫВА'),
(1102, 'ДОЛГОВЕЧН'),
(1103, 'АУДИТОРН'),
(1104, 'КОНФЕРЕНЦ-КРЕСЕЛ'),
(1105, 'ХРАН'),
(1106, 'ЗАНИМА'),
(1107, 'ВСТРОЕН'),
(1108, 'КУП'),
(1109, 'ГАРДЕРОБН'),
(1110, 'ПРИХОЖ'),
(1111, 'БИБЛИОТЕК'),
(1112, 'ПЛАТЯН'),
(1113, 'КОМОД'),
(1114, 'СЛОЖН'),
(1115, 'КОНСТРУКЦ'),
(1116, 'ИДЕАЛЬН'),
(1117, 'МАКСИМАЛЬН'),
(1118, 'ОТОБРАЖА'),
(1119, 'ПРИЕЗЖА'),
(1120, 'ВАС'),
(1121, 'ПРОИЗВЕДЕТ'),
(1122, 'УЧИТЫВ'),
(1123, 'ПОЖЕЛАН'),
(1124, 'ЭСКИЗН'),
(1125, 'ПОСЛ'),
(1126, 'ОГОВАРИВА'),
(1127, 'МОНТАЖ'),
(1128, 'ПЕРЕДА'),
(1129, 'ОПЫТН'),
(1130, 'ТРЕХМЕРН'),
(1131, 'МОДЕЛИРОВАН'),
(1132, 'РАСЧЕТОВ'),
(1133, 'ПОСТУПА'),
(1134, 'НЕПОСРЕДСТВЕН'),
(1135, 'РАСКР'),
(1136, 'ОБРАБОТК'),
(1137, 'НЕКОТОР'),
(1138, 'НАКАНУН'),
(1139, 'ОТДЕЛ'),
(1140, 'ТРАНСПОРТН'),
(1141, 'СВЯЖУТ'),
(1142, 'ОГОВОР'),
(1143, 'ВНОС'),
(1144, 'ПРЕДОПЛАТ'),
(1145, '30'),
(1146, 'СУММ'),
(1147, 'ЗАКАЗА'),
(1148, 'ОСТАЛЬН'),
(1149, 'ОПЛАЧИВА'),
(1150, 'ШИРОК'),
(1151, 'СПЕКТР'),
(1152, 'ДИАГНОСТИК'),
(1153, 'ПРЕОБРАЗОВАН'),
(1154, 'ПЕРЕПЛАНИРОВК'),
(1155, 'ОТДЕЛК'),
(1156, 'КОЛОРИСТК'),
(1157, 'ПЕРЕСТАНОВК'),
(1158, 'ФУНКЦИОНАЛЬН'),
(1159, 'ПЕРЕКЛЮЧЕН'),
(1160, 'РЕЖИМ'),
(1161, 'ИДЕИ-ОБРАЗ'),
(1162, 'ПРЕДВАРИТЕЛЬН'),
(1163, '3D-МОДЕЛ'),
(1164, 'ИЗОБРАЖЕН'),
(1165, 'ФАКТУР'),
(1166, 'ПРЕДЛАГ'),
(1167, 'ЭКСПЕРИМЕНТИРОВА'),
(1168, 'ПОДБИРА'),
(1169, 'ЦВЕТН'),
(1170, 'НАТУРАЛИСТИЧН'),
(1171, 'СХОЖЕСТ'),
(1172, 'ОРИГИНАЛ'),
(1173, 'ПРЕДСТАВ'),
(1174, 'РАССМОТРЕТ'),
(1175, 'ПОДБОР'),
(1176, 'РАССТАНОВК'),
(1177, 'ДЕКОРИРОВАН'),
(1178, 'ОБРАЗ'),
(1179, 'ЗАПРОС'),
(1180, 'ЭКСКЛЮЗИВН'),
(1181, 'АВТОРСК'),
(1182, 'КОЛЛЕКЦ'),
(1183, 'ПРОДАВЕЦ-ДИЗАЙНЕР'),
(1184, 'УВЕРЕН'),
(1185, 'ПОЛЬЗОВАТЕЛ'),
(1186, 'ПК'),
(1187, 'НАВЫК'),
(1188, 'ЧЕРЧЕН'),
(1189, 'РУК'),
(1190, 'КОНСТРУКТОР'),
(1191, 'СФЕР'),
(1192, 'ЭТИК'),
(1193, 'ОБЩЕН'),
(1194, 'КОНСУЛЬТИРОВАН'),
(1195, 'КЛИЕНТОВ'),
(1196, 'ОСТАВЛЕН'),
(1197, 'ХУДОЖЕСТВЕННО-КОНСТРУКТОРСК'),
(1198, 'ПРОЕКТОВ'),
(1199, 'ЗАКАЗОВ'),
(1200, 'ЗАРПЛАТ'),
(1201, '13500'),
(1202, 'ОКЛАД'),
(1203, 'ПРОДАЖ'),
(1204, 'ПРЕМ'),
(1205, 'СОВОКУПН'),
(1206, 'ДОХОД'),
(1207, '20000'),
(1208, 'РУБ'),
(1209, 'СОЦ'),
(1210, 'ПАКЕТ'),
(1211, 'ТК'),
(1212, 'РФ'),
(1213, 'МАГАЗИН'),
(1214, 'ВЫСШ'),
(1215, 'РОЗНИЦ'),
(1216, 'ЗНАН'),
(1217, 'МЕТОДОВ'),
(1218, 'МЕТОД'),
(1219, 'УПРАВЛЕН'),
(1220, 'ТРУДОВ'),
(1221, 'ЗАКОНОДАТЕЛЬСТВ'),
(1222, 'ИНИЦИАТИВН'),
(1223, 'АКТИВН'),
(1224, 'ФИНАНСОВО-ХОЗЯЙСТВЕН'),
(1225, 'ОТЧЕТН'),
(1226, 'ПЛАН'),
(1227, 'ТРУДОУСТРОЙСТВ'),
(1228, 'ГРАФИК'),
(1229, 'ЧЕР'),
(1230, '168'),
(1231, 'ЧАС'),
(1232, 'МЕС'),
(1233, '28000'),
(1234, 'ОБОРОТ'),
(1235, '35000'),
(1236, 'БУХГАЛТЕР'),
(1237, 'ЖЕН'),
(1238, '22-45'),
(1239, 'ПРИВЕТСВ'),
(1240, 'БУХГАЛТЕРСК'),
(1241, 'БАЗОВ'),
(1242, 'САМОСТОЯТЕЛЬН'),
(1243, 'КОММУНИКАБЕЛЬН'),
(1244, 'ОБУЧАЕМ'),
(1245, 'ПЕРВИЧН'),
(1246, 'ДОКУМЕНТ'),
(1247, 'МПЗ'),
(1248, 'ВЕДЕН'),
(1249, 'ЖУРНАЛОВ-ОРДЕРОВ'),
(1250, 'ЖУРНАЛОВ-ОРДЕР'),
(1251, 'ФОРМИРОВАН'),
(1252, 'ОТЧЕТОВ'),
(1253, 'ПОДРАЗДЕЛЕН'),
(1254, 'УКАЗАН'),
(1255, 'ДНЕ'),
(1256, 'НЕДЕЛ'),
(1257, 'АДРЕС'),
(1258, 'ШАТУР'),
(1259, 'БОТИНСК'),
(1260, 'ПР-Д'),
(1261, '800'),
(1262, '40'),
(1263, 'ЭКЗАМЕН2'),
(1264, 'TEXT'),
(1265, 'HERE'),
(1266, 'ОБРАТН');
-- -----------------------------------
-- Dumping table b_search_suggest
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_search_tags
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- -----------------------------------
-- Dumping table b_search_user_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_filter_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_filter_mask`;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_frame_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_frame_mask`;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_iprule
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule`;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_iprule_excl_ip
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_iprule_excl_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_iprule_incl_ip
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_iprule_incl_mask
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_recovery_codes
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_recovery_codes`;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_redirect_url
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_redirect_url`;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sec_redirect_url` VALUES
('Y', 10, '/bitrix/redirect.php', 'goto'),
('Y', 20, '/bitrix/rk.php', 'goto'),
('Y', 30, '/bitrix/click.php', 'goto');
-- -----------------------------------
-- Dumping table b_sec_session
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_session`;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_user`;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_virus
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_virus`;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sec_white_list
-- -----------------------------------
DROP TABLE IF EXISTS `b_sec_white_list`;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_security_sitecheck
-- -----------------------------------
DROP TABLE IF EXISTS `b_security_sitecheck`;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_contact
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_contact`;
CREATE TABLE `b_sender_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SENDER_CONTACT_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_contact_list
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_contact_list`;
CREATE TABLE `b_sender_contact_list` (
  `CONTACT_ID` int(11) NOT NULL,
  `LIST_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SENDER_CONTACT_LIST` (`CONTACT_ID`,`LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_group`;
CREATE TABLE `b_sender_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADDRESS_COUNT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_group_connector
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_group_connector`;
CREATE TABLE `b_sender_group_connector` (
  `GROUP_ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENDPOINT` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS_COUNT` int(11) NOT NULL DEFAULT '0',
  KEY `IX_SENDER_GROUP_CONNECTOR` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_list
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_list`;
CREATE TABLE `b_sender_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing`;
CREATE TABLE `b_sender_mailing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `IS_PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TRACK_CLICK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TRIGGER_FIELDS` text COLLATE utf8_unicode_ci,
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_TRIGGER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing_attachment`;
CREATE TABLE `b_sender_mailing_attachment` (
  `CHAIN_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`CHAIN_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing_chain
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing_chain`;
CREATE TABLE `b_sender_mailing_chain` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAILING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `POSTING_ID` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `IS_TRIGGER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_INSERT` datetime DEFAULT NULL,
  `TIME_SHIFT` int(11) NOT NULL DEFAULT '0',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `REITERATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_MAILING_CHAIN_MAILING` (`MAILING_ID`,`STATUS`),
  KEY `IX_SENDER_MAILING_CHAIN_REITERATE` (`REITERATE`,`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing_group`;
CREATE TABLE `b_sender_mailing_group` (
  `MAILING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `INCLUDE` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `UK_SENDER_MAILING_GROUP` (`MAILING_ID`,`GROUP_ID`,`INCLUDE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing_subscription
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing_subscription`;
CREATE TABLE `b_sender_mailing_subscription` (
  `MAILING_ID` int(11) NOT NULL,
  `CONTACT_ID` int(11) NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  PRIMARY KEY (`MAILING_ID`,`CONTACT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_mailing_trigger
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_mailing_trigger`;
CREATE TABLE `b_sender_mailing_trigger` (
  `MAILING_CHAIN_ID` int(11) NOT NULL,
  `IS_TYPE_START` int(1) NOT NULL DEFAULT '1',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_posting
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_posting`;
CREATE TABLE `b_sender_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `MAILING_ID` int(11) NOT NULL,
  `MAILING_CHAIN_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_POSTING_MAILING_CHAIN` (`MAILING_ID`,`STATUS`),
  KEY `IX_SENDER_POSTING_MAILING` (`MAILING_CHAIN_ID`,`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_posting_click
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_posting_click`;
CREATE TABLE `b_sender_posting_click` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `RECIPIENT_ID` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `URL` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_POSTING_CLICK` (`POSTING_ID`,`RECIPIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_posting_read
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_posting_read`;
CREATE TABLE `b_sender_posting_read` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `RECIPIENT_ID` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_POSTING_READ` (`POSTING_ID`,`RECIPIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_posting_recipient
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_posting_recipient`;
CREATE TABLE `b_sender_posting_recipient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `DATE_DENY` datetime DEFAULT NULL,
  `FIELDS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROOT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_POSTING_RECIP_STATUS` (`STATUS`,`POSTING_ID`),
  KEY `IX_SENDER_POSTING_RECIP_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_posting_unsub
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_posting_unsub`;
CREATE TABLE `b_sender_posting_unsub` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECIPIENT_ID` int(11) NOT NULL,
  `POSTING_ID` int(11) NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SENDER_POSTING_UNSUB` (`POSTING_ID`,`RECIPIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sender_preset_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_sender_preset_template`;
CREATE TABLE `b_sender_preset_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_banner
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_campaign
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_order
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_adv_region
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_keywords
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_search_engine
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_seo_search_engine` VALUES
(1, 'google', 'Y', 200, 'Google', '950140266760.apps.googleusercontent.com', 'IBktWJ_dS3rMKh43PSHO-zo5', 'urn:ietf:wg:oauth:2.0:oob', NULL),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', 'e46a29a748d84036baee1e2ae2a84fc6', '7122987f5a99479bb756d79ed7986e6c', 'https://oauth.yandex.ru/verification_code', NULL);
-- -----------------------------------
-- Dumping table b_seo_sitemap
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_sitemap_runtime
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_seo_yandex_direct_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_short_uri
-- -----------------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_USED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_site_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SITE_TEMPLATE` (`SITE_ID`,`CONDITION`,`TEMPLATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_site_template` VALUES
(1, 's1', '', 150, 'furniture_red');
-- -----------------------------------
-- Dumping table b_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_HR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile` VALUES
(1, 'S', 1, 100, ':) :-)', 'Y', 'smile_smile.png', 'Y', 16, 16),
(2, 'S', 1, 105, ';) ;-)', 'Y', 'smile_wink.png', 'Y', 16, 16),
(3, 'S', 1, 110, ':D :-D', 'Y', 'smile_biggrin.png', 'Y', 16, 16),
(4, 'S', 1, 115, '8) 8-)', 'Y', 'smile_cool.png', 'Y', 16, 16),
(5, 'S', 1, 120, ':( :-(', 'Y', 'smile_sad.png', 'Y', 16, 16),
(6, 'S', 1, 125, ':| :-|', 'Y', 'smile_neutral.png', 'Y', 16, 16),
(7, 'S', 1, 130, ':oops:', 'Y', 'smile_redface.png', 'Y', 16, 16),
(8, 'S', 1, 135, ':cry: :~(', 'Y', 'smile_cry.png', 'Y', 16, 16),
(9, 'S', 1, 140, ':evil: >:-<', 'Y', 'smile_evil.png', 'Y', 16, 16),
(10, 'S', 1, 145, ':o :-o :shock:', 'Y', 'smile_eek.png', 'Y', 16, 16),
(11, 'S', 1, 150, ':/ :-/', 'Y', 'smile_confuse.png', 'Y', 16, 16),
(12, 'S', 1, 155, ':{} :-{}', 'Y', 'smile_kiss.png', 'Y', 16, 16),
(13, 'S', 1, 160, ':idea:', 'Y', 'smile_idea.png', 'Y', 16, 16),
(14, 'S', 1, 165, ':?:', 'Y', 'smile_question.png', 'Y', 16, 16),
(15, 'S', 1, 170, ':!:', 'Y', 'smile_exclaim.png', 'Y', 16, 16),
(16, 'I', 1, 175, '', 'Y', 'icon1.gif', 'N', 15, 15),
(17, 'I', 1, 180, '', 'Y', 'icon2.gif', 'N', 15, 15),
(18, 'I', 1, 185, '', 'Y', 'icon3.gif', 'N', 15, 15),
(19, 'I', 1, 190, '', 'Y', 'icon4.gif', 'N', 15, 15),
(20, 'I', 1, 195, '', 'Y', 'icon5.gif', 'N', 15, 15),
(21, 'I', 1, 200, '', 'Y', 'icon6.gif', 'N', 15, 15),
(22, 'I', 1, 205, NULL, 'Y', 'icon7.gif', 'N', 15, 15);
-- -----------------------------------
-- Dumping table b_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_lang` VALUES
(1, 'G', 1, 'ru', 'Основной набор'),
(2, 'G', 1, 'en', 'Default set'),
(3, 'S', 1, 'ru', 'С улыбкой'),
(4, 'S', 1, 'en', 'Smile'),
(5, 'S', 2, 'ru', 'Шутливо'),
(6, 'S', 2, 'en', 'Wink'),
(7, 'S', 3, 'ru', 'Широкая улыбка'),
(8, 'S', 3, 'en', 'Big grin'),
(9, 'S', 4, 'ru', 'Здорово'),
(10, 'S', 4, 'en', 'Cool'),
(11, 'S', 5, 'ru', 'Печально'),
(12, 'S', 5, 'en', 'Sad'),
(13, 'S', 6, 'ru', 'Скептически'),
(14, 'S', 6, 'en', 'Skeptic'),
(15, 'S', 7, 'ru', 'Смущенный'),
(16, 'S', 7, 'en', 'Embarrassed'),
(17, 'S', 8, 'ru', 'Очень грустно'),
(18, 'S', 8, 'en', 'Crying'),
(19, 'S', 9, 'ru', 'Со злостью'),
(20, 'S', 9, 'en', 'Angry'),
(21, 'S', 10, 'ru', 'Удивленно'),
(22, 'S', 10, 'en', 'Surprised'),
(23, 'S', 11, 'ru', 'Смущенно'),
(24, 'S', 11, 'en', 'Confused'),
(25, 'S', 12, 'ru', 'Поцелуй'),
(26, 'S', 12, 'en', 'Kiss'),
(27, 'S', 13, 'ru', 'Идея'),
(28, 'S', 13, 'en', 'Idea'),
(29, 'S', 14, 'ru', 'Вопрос'),
(30, 'S', 14, 'en', 'Question'),
(31, 'S', 15, 'ru', 'Восклицание'),
(32, 'S', 15, 'en', 'Exclamation');
-- -----------------------------------
-- Dumping table b_smile_set
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_set` VALUES
(1, 'main', 150);
-- -----------------------------------
-- Dumping table b_socialservices_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_2` (`INITIALIZED`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_user_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sticker_group_task` VALUES
(5, 27);
-- -----------------------------------
-- Dumping table b_subscription
-- -----------------------------------
DROP TABLE IF EXISTS `b_subscription`;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_subscription_rubric
-- -----------------------------------
DROP TABLE IF EXISTS `b_subscription_rubric`;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task` VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(13, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(14, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(16, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(17, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(18, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(19, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(20, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(21, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(25, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(26, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(27, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(28, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(29, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(30, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(31, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(32, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(33, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(36, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
(37, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
(38, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
(39, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
(40, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
(41, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(42, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(43, 'seo_full_access', 'W', 'seo', 'Y', '', 'module'),
(44, 'Контент-редакторы', 'Q', 'main', 'N', 'Разрешено изменять информацию в своем профайле. Управление кешем', 'module');
-- -----------------------------------
-- Dumping table b_task_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task_operation` VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(14, 36),
(14, 37),
(15, 36),
(15, 37),
(15, 38),
(17, 41),
(17, 42),
(17, 43),
(17, 44),
(17, 45),
(17, 46),
(17, 47),
(17, 49),
(17, 50),
(18, 39),
(18, 40),
(18, 41),
(18, 42),
(18, 43),
(18, 44),
(18, 45),
(18, 46),
(18, 47),
(18, 48),
(18, 49),
(18, 50),
(18, 51),
(20, 52),
(21, 52),
(21, 53),
(21, 57),
(22, 52),
(22, 57),
(22, 58),
(22, 59),
(23, 52),
(23, 53),
(23, 54),
(23, 55),
(23, 57),
(23, 58),
(23, 59),
(24, 52),
(24, 53),
(24, 54),
(24, 55),
(24, 56),
(24, 57),
(24, 58),
(24, 59),
(26, 60),
(27, 60),
(27, 61),
(27, 62),
(27, 63),
(29, 64),
(29, 65),
(30, 66),
(31, 64),
(31, 65),
(31, 67),
(32, 64),
(32, 65),
(32, 66),
(32, 67),
(33, 64),
(33, 65),
(33, 66),
(33, 67),
(33, 68),
(33, 69),
(33, 70),
(33, 71),
(34, 64),
(34, 65),
(34, 66),
(34, 67),
(34, 68),
(34, 69),
(34, 70),
(34, 71),
(34, 72),
(34, 73),
(34, 74),
(34, 75),
(35, 64),
(35, 65),
(35, 66),
(35, 67),
(35, 68),
(35, 69),
(35, 70),
(35, 71),
(35, 72),
(35, 73),
(35, 74),
(35, 75),
(35, 76),
(35, 77),
(35, 78),
(35, 79),
(35, 80),
(35, 81),
(37, 82),
(38, 83),
(39, 84),
(39, 85),
(39, 86),
(39, 87),
(39, 88),
(39, 89),
(39, 90),
(39, 91),
(39, 92),
(39, 93),
(39, 94),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(40, 88),
(40, 89),
(40, 90),
(40, 91),
(40, 92),
(40, 93),
(40, 94),
(40, 95),
(40, 96),
(40, 97),
(40, 98),
(40, 99),
(40, 100),
(40, 101),
(40, 102),
(40, 103),
(40, 104),
(40, 105),
(40, 106),
(40, 107),
(42, 109),
(43, 108),
(43, 109),
(44, 2),
(44, 3),
(44, 14);
-- -----------------------------------
-- Dumping table b_undo
-- -----------------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_undo` VALUES
('110c72d21865dc961597675092c2e8aa7', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:196:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?>Text here....<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530102169),
('11426fa8ec91cd3e2c980ba14500d9e1c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:264:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:simplecomp.exam\",\n	\"\",\n	Array(\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530105786),
('11b66a9daae1616c5a5850b0138ae60c3', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/home/bitrix_exam/www/news/index.php\";s:7:\"content\";s:2534:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"1\",\n		\"NEWS_COUNT\" => \"5\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_RSS\" => \"Y\",\n		\"NUM_NEWS\" => \"20\",\n		\"NUM_DAYS\" => \"30\",\n		\"YANDEX\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"CHECK_DATES\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_SHADOW\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"Y\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"Y\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"DISPLAY_PANEL\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"arrows\",\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"USE_REVIEW\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"USE_SPECIALDATE\" => \"Y\",\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n			\"rss\" => \"rss/\",\n			\"rss_section\" => \"#SECTION_ID#/rss/\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530088106),
('12acf87fb7d9bfb97e496f8383f829f18', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:25:\"/home/bitrix_exam/www/ex2\";s:4:\"path\";s:4:\"/ex2\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:14:\"/.top.menu.php\";s:8:\"menuName\";s:15:\"Экзамен2\";s:8:\"menuPath\";s:5:\"/ex2/\";}}', 1, 1530094747),
('145e8fd8ea3ad8574cdb526666832c96d', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:2368:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:complexcomp.exam\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SECTION_COUNT\" => \"20\",\n		\"TOP_ELEMENT_COUNT\" => \"9\",\n		\"TOP_LINE_ELEMENT_COUNT\" => \"3\",\n		\"SECTION_SORT_FIELD\" => \"sort\",\n		\"SECTION_SORT_ORDER\" => \"asc\",\n		\"TOP_ELEMENT_SORT_FIELD\" => \"sort\",\n		\"TOP_ELEMENT_SORT_ORDER\" => \"asc\",\n		\"TOP_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"TOP_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SECTION_PAGE_ELEMENT_COUNT\" => \"20\",\n		\"SECTION_LINE_ELEMENT_COUNT\" => \"3\",\n		\"ELEMENT_SORT_FIELD\" => \"sort\",\n		\"ELEMENT_SORT_ORDER\" => \"asc\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_BROWSER_TITLE\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Фотографии\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_FOLDER\" => \"/ex2/complexcomponent/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"sections_top\" => \"\",\n			\"section\" => \"#SECTION_ID#/\",\n			\"detail\" => \"#SECTION_ID#/#ELEMENT_ID#/\",\n			\"exampage\" => \"exam/new/#PARAM1#/?PARAM2=#PARAM2#\",\n		),\n		\"VARIABLE_ALIASES\" => array(\n			\"exampage\" => array(\n				\"PARAM2\" => \"PARAM2\",\n			),\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530116384),
('15d46e5e96754b1b5756936d2e9159b52', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:261:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my: simplecomp.exam\",\n	\"\",\n	Array(\n	)\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530102247),
('1662a7001d00c59e9dc05bdbeb2eb91f0', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:2233:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:complexcomp.exam\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SECTION_COUNT\" => \"20\",\n		\"TOP_ELEMENT_COUNT\" => \"9\",\n		\"TOP_LINE_ELEMENT_COUNT\" => \"3\",\n		\"SECTION_SORT_FIELD\" => \"sort\",\n		\"SECTION_SORT_ORDER\" => \"asc\",\n		\"TOP_ELEMENT_SORT_FIELD\" => \"sort\",\n		\"TOP_ELEMENT_SORT_ORDER\" => \"asc\",\n		\"TOP_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"TOP_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SECTION_PAGE_ELEMENT_COUNT\" => \"20\",\n		\"SECTION_LINE_ELEMENT_COUNT\" => \"3\",\n		\"ELEMENT_SORT_FIELD\" => \"sort\",\n		\"ELEMENT_SORT_ORDER\" => \"asc\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_BROWSER_TITLE\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Фотографии\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_FOLDER\" => \"/ex2/complexcomponent/\",\n		\"VARIABLE_ALIASES\" => array(\n			\"SECTION_ID\" => \"SECTION_ID\",\n			\"ELEMENT_ID\" => \"ELEMENT_ID\",\n			\"PARAM1\" => \"PARAM1\",\n			\"PARAM2\" => \"PARAM2\",\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530116772),
('168480ac5a54cf6fed7e3717c8cba0163', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:42:\"/home/bitrix_exam/www/ex2/complexcomponent\";s:4:\"path\";s:21:\"/ex2/complexcomponent\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:19:\"/ex2/.left.menu.php\";s:8:\"menuName\";s:41:\"Комплексный компонент\";s:8:\"menuPath\";s:22:\"/ex2/complexcomponent/\";}}', 1, 1530113865),
('1807416aa83b861287ae6143db2b2700a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:2368:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:complexcomp.exam\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SECTION_COUNT\" => \"20\",\n		\"TOP_ELEMENT_COUNT\" => \"9\",\n		\"TOP_LINE_ELEMENT_COUNT\" => \"3\",\n		\"SECTION_SORT_FIELD\" => \"sort\",\n		\"SECTION_SORT_ORDER\" => \"asc\",\n		\"TOP_ELEMENT_SORT_FIELD\" => \"sort\",\n		\"TOP_ELEMENT_SORT_ORDER\" => \"asc\",\n		\"TOP_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"TOP_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SECTION_PAGE_ELEMENT_COUNT\" => \"20\",\n		\"SECTION_LINE_ELEMENT_COUNT\" => \"3\",\n		\"ELEMENT_SORT_FIELD\" => \"sort\",\n		\"ELEMENT_SORT_ORDER\" => \"asc\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_BROWSER_TITLE\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Фотографии\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_FOLDER\" => \"/ex2/complexcomponent/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"sections_top\" => \"\",\n			\"section\" => \"#SECTION_ID#/\",\n			\"detail\" => \"#SECTION_ID#/#ELEMENT_ID#/\",\n			\"exampage\" => \"exam/new/#PARAM1#/?PARAM2=#PARAM2#\",\n		),\n		\"VARIABLE_ALIASES\" => array(\n			\"exampage\" => array(\n				\"PARAM2\" => \"PARAM2\",\n			),\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530116454),
('182e2dd6d8e24aaa3c1df084949153c91', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:443:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:simplecomp.exam\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"CATALOG_ID\" => \"2\",\n		\"NEWS_ID\" => \"1\",\n		\"CODE\" => \"UF_NEWS_LINK\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\"\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530105808),
('1846241b3072b684a5b952f2a18c9ebcb', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:1973:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:complexcomp.exam\",\n	\"\",\n	Array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"\",\n		\"SEF_MODE\" => \"N\",\n		\"VARIABLE_ALIASES\" => Array(\"SECTION_ID\"=>\"SECTION_ID\",\"ELEMENT_ID\"=>\"ELEMENT_ID\"),\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SECTION_COUNT\" => \"20\",\n		\"TOP_ELEMENT_COUNT\" => \"9\",\n		\"TOP_LINE_ELEMENT_COUNT\" => \"3\",\n		\"SECTION_SORT_FIELD\" => \"sort\",\n		\"SECTION_SORT_ORDER\" => \"asc\",\n		\"TOP_ELEMENT_SORT_FIELD\" => \"sort\",\n		\"TOP_ELEMENT_SORT_ORDER\" => \"asc\",\n		\"TOP_FIELD_CODE\" => array(\"\",\"\"),\n		\"TOP_PROPERTY_CODE\" => array(\"\",\"\"),\n		\"SECTION_PAGE_ELEMENT_COUNT\" => \"20\",\n		\"SECTION_LINE_ELEMENT_COUNT\" => \"3\",\n		\"ELEMENT_SORT_FIELD\" => \"sort\",\n		\"ELEMENT_SORT_ORDER\" => \"asc\",\n		\"LIST_FIELD_CODE\" => array(\"\",\"\"),\n		\"LIST_PROPERTY_CODE\" => array(\"\",\"\"),\n		\"LIST_BROWSER_TITLE\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_FIELD_CODE\" => array(\"\",\"\"),\n		\"DETAIL_PROPERTY_CODE\" => array(\"\",\"\"),\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Фотографии\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\"\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530115391),
('193fbbf3e4898959d38a15577a8707e76', 'fileman', 'edit_menu', 'CFileman::UndoNewFile', 'a:3:{s:7:\"absPath\";s:40:\"/home/bitrix_exam/www/ex2/.left.menu.php\";s:4:\"path\";s:19:\"/ex2/.left.menu.php\";s:4:\"site\";s:2:\"s1\";}', 1, 1530094791),
('1945c6722dde49ca44b989c2d660e7723', 'fileman', 'edit_section', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:35:\"/home/bitrix_exam/www//.section.php\";s:7:\"content\";s:611:\"<?\n$sSectionName = \"Главная\";\n$arDirProperties = array(\n   \"description\" => \"Мебельная компания осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции.\",\n   \"keywords\" => \"мягкая мебель, офисная мебель, мебель для кухни, детская мебель\",\n   \"robots\" => \"index, follow\"\n);\n?>\";}', 1, 1530084235),
('19729c2ba77869bc0ae33508252ebb388', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:\"absPath\";s:34:\"/home/bitrix_exam/www/ex2/feedback\";s:4:\"path\";s:13:\"/ex2/feedback\";s:4:\"site\";s:2:\"s1\";}', 1, 1530094828),
('198cd94f8cc4aaaaaea8454c1ffe2b8c3', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:187:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530103867),
('1a9c3d9e3c6254fe6fa9d17f367c1f16e', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:208:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?>\n\nText here....\n\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530113989),
('1b422ed3056cf170ae9e0a06b54e733ce', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/home/bitrix_exam/www/news/index.php\";s:7:\"content\";s:2534:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:news\", \n	\".default\", \n	array(\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"1\",\n		\"NEWS_COUNT\" => \"5\",\n		\"USE_SEARCH\" => \"N\",\n		\"USE_RSS\" => \"Y\",\n		\"NUM_NEWS\" => \"20\",\n		\"NUM_DAYS\" => \"30\",\n		\"YANDEX\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_CATEGORIES\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SORT_BY1\" => \"ACTIVE_FROM\",\n		\"SORT_ORDER1\" => \"DESC\",\n		\"SORT_BY2\" => \"SORT\",\n		\"SORT_ORDER2\" => \"ASC\",\n		\"CHECK_DATES\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/news/\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_SHADOW\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"Y\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"Y\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"DISPLAY_PANEL\" => \"N\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_STATUS_404\" => \"Y\",\n		\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n		\"ADD_SECTIONS_CHAIN\" => \"Y\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"PREVIEW_TRUNCATE_LEN\" => \"\",\n		\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n		\"DISPLAY_NAME\" => \"Y\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n		\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"DETAIL_PAGER_TITLE\" => \"Страница\",\n		\"DETAIL_PAGER_TEMPLATE\" => \"arrows\",\n		\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Новости\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_TEMPLATE\" => \"\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"USE_REVIEW\" => \"N\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"ADD_ELEMENT_CHAIN\" => \"N\",\n		\"USE_SPECIALDATE\" => \"N\",\n		\"DETAIL_SET_CANONICAL_URL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"news\" => \"\",\n			\"section\" => \"\",\n			\"detail\" => \"#ELEMENT_ID#/\",\n			\"rss\" => \"rss/\",\n			\"rss_section\" => \"#SECTION_ID#/rss/\",\n		)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530086472),
('1c77f7041e8177325a173a04e14364406', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/home/bitrix_exam/www/news/index.php\";s:7:\"content\";s:2210:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Новости\");\n?><?$APPLICATION->IncludeComponent(\"bitrix:news\", \".default\", array(\n	\"IBLOCK_TYPE\" => \"news\",\n	\"IBLOCK_ID\" => \"1\",\n	\"NEWS_COUNT\" => \"5\",\n	\"USE_SEARCH\" => \"N\",\n	\"USE_RSS\" => \"Y\",\n	\"NUM_NEWS\" => \"20\",\n	\"NUM_DAYS\" => \"30\",\n	\"YANDEX\" => \"N\",\n	\"USE_RATING\" => \"N\",\n	\"USE_CATEGORIES\" => \"N\",\n	\"USE_FILTER\" => \"N\",\n	\"SORT_BY1\" => \"ACTIVE_FROM\",\n	\"SORT_ORDER1\" => \"DESC\",\n	\"SORT_BY2\" => \"SORT\",\n	\"SORT_ORDER2\" => \"ASC\",\n	\"CHECK_DATES\" => \"Y\",\n	\"SEF_MODE\" => \"Y\",\n	\"SEF_FOLDER\" => \"/news/\",\n	\"AJAX_MODE\" => \"N\",\n	\"AJAX_OPTION_SHADOW\" => \"N\",\n	\"AJAX_OPTION_JUMP\" => \"Y\",\n	\"AJAX_OPTION_STYLE\" => \"Y\",\n	\"AJAX_OPTION_HISTORY\" => \"Y\",\n	\"CACHE_TYPE\" => \"A\",\n	\"CACHE_TIME\" => \"36000000\",\n	\"CACHE_FILTER\" => \"N\",\n	\"CACHE_GROUPS\" => \"Y\",\n	\"DISPLAY_PANEL\" => \"N\",\n	\"SET_TITLE\" => \"Y\",\n	\"SET_STATUS_404\" => \"Y\",\n	\"INCLUDE_IBLOCK_INTO_CHAIN\" => \"Y\",\n	\"ADD_SECTIONS_CHAIN\" => \"Y\",\n	\"USE_PERMISSIONS\" => \"N\",\n	\"PREVIEW_TRUNCATE_LEN\" => \"\",\n	\"LIST_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n	\"LIST_FIELD_CODE\" => array(\n		0 => \"\",\n		1 => \"\",\n	),\n	\"LIST_PROPERTY_CODE\" => array(\n		0 => \"\",\n		1 => \"\",\n	),\n	\"HIDE_LINK_WHEN_NO_DETAIL\" => \"Y\",\n	\"DISPLAY_NAME\" => \"Y\",\n	\"META_KEYWORDS\" => \"-\",\n	\"META_DESCRIPTION\" => \"-\",\n	\"BROWSER_TITLE\" => \"-\",\n	\"DETAIL_ACTIVE_DATE_FORMAT\" => \"d.m.Y\",\n	\"DETAIL_FIELD_CODE\" => array(\n		0 => \"\",\n		1 => \"\",\n	),\n	\"DETAIL_PROPERTY_CODE\" => array(\n		0 => \"\",\n		1 => \"\",\n	),\n	\"DETAIL_DISPLAY_TOP_PAGER\" => \"N\",\n	\"DETAIL_DISPLAY_BOTTOM_PAGER\" => \"Y\",\n	\"DETAIL_PAGER_TITLE\" => \"Страница\",\n	\"DETAIL_PAGER_TEMPLATE\" => \"arrows\",\n	\"DETAIL_PAGER_SHOW_ALL\" => \"N\",\n	\"DISPLAY_TOP_PAGER\" => \"N\",\n	\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n	\"PAGER_TITLE\" => \"Новости\",\n	\"PAGER_SHOW_ALWAYS\" => \"N\",\n	\"PAGER_TEMPLATE\" => \"\",\n	\"PAGER_DESC_NUMBERING\" => \"N\",\n	\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000000\",\n	\"PAGER_SHOW_ALL\" => \"N\",\n	\"AJAX_OPTION_ADDITIONAL\" => \"\",\n	\"SEF_URL_TEMPLATES\" => array(\n		\"news\" => \"\",\n		\"section\" => \"\",\n		\"detail\" => \"#ELEMENT_ID#/\",\n		\"search\" => \"search/\",\n		\"rss\" => \"rss/\",\n		\"rss_section\" => \"#SECTION_ID#/rss/\",\n	)\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530085018),
('1e52e442be67457b16cd2ee97bde38f04', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:46:\"/home/bitrix_exam/www/ex2/simplecomp/index.php\";s:7:\"content\";s:265:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Простой компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my: simplecomp.exam\",\n	\"\",\n	Array(\n	)\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530102262),
('1ed5fe6ef387c977c76eea3a41475453c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:52:\"/home/bitrix_exam/www/ex2/complexcomponent/index.php\";s:7:\"content\";s:2370:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Комплексный компонент\");\n?><?$APPLICATION->IncludeComponent(\n	\"my:complexcomp.exam\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"news\",\n		\"IBLOCK_ID\" => \"\",\n		\"SEF_MODE\" => \"Y\",\n		\"AJAX_MODE\" => \"N\",\n		\"AJAX_OPTION_JUMP\" => \"N\",\n		\"AJAX_OPTION_STYLE\" => \"Y\",\n		\"AJAX_OPTION_HISTORY\" => \"N\",\n		\"AJAX_OPTION_ADDITIONAL\" => \"\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"36000000\",\n		\"CACHE_FILTER\" => \"N\",\n		\"CACHE_GROUPS\" => \"Y\",\n		\"SET_TITLE\" => \"Y\",\n		\"SET_LAST_MODIFIED\" => \"N\",\n		\"USE_PERMISSIONS\" => \"N\",\n		\"USE_RATING\" => \"N\",\n		\"USE_REVIEW\" => \"N\",\n		\"USE_FILTER\" => \"N\",\n		\"SECTION_COUNT\" => \"20\",\n		\"TOP_ELEMENT_COUNT\" => \"9\",\n		\"TOP_LINE_ELEMENT_COUNT\" => \"3\",\n		\"SECTION_SORT_FIELD\" => \"sort\",\n		\"SECTION_SORT_ORDER\" => \"asc\",\n		\"TOP_ELEMENT_SORT_FIELD\" => \"sort\",\n		\"TOP_ELEMENT_SORT_ORDER\" => \"asc\",\n		\"TOP_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"TOP_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"SECTION_PAGE_ELEMENT_COUNT\" => \"20\",\n		\"SECTION_LINE_ELEMENT_COUNT\" => \"3\",\n		\"ELEMENT_SORT_FIELD\" => \"sort\",\n		\"ELEMENT_SORT_ORDER\" => \"asc\",\n		\"LIST_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"LIST_BROWSER_TITLE\" => \"-\",\n		\"META_KEYWORDS\" => \"-\",\n		\"META_DESCRIPTION\" => \"-\",\n		\"BROWSER_TITLE\" => \"-\",\n		\"DETAIL_FIELD_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"DETAIL_PROPERTY_CODE\" => array(\n			0 => \"\",\n			1 => \"\",\n		),\n		\"PAGER_TEMPLATE\" => \".default\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"Y\",\n		\"PAGER_TITLE\" => \"Фотографии\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n		\"PAGER_SHOW_ALL\" => \"N\",\n		\"PAGER_BASE_LINK_ENABLE\" => \"N\",\n		\"SET_STATUS_404\" => \"N\",\n		\"SHOW_404\" => \"N\",\n		\"MESSAGE_404\" => \"\",\n		\"SEF_FOLDER\" => \"/ex2/complexcomponent/\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"sections_top\" => \"\",\n			\"section\" => \"#SECTION_ID#/\",\n			\"detail\" => \"#SECTION_ID#/#ELEMENT_ID#/\",\n			\"exampage\" => \"exam/newss/#PARAM1#/?PARAM2=#PARAM2#\",\n		),\n		\"VARIABLE_ALIASES\" => array(\n			\"exampage\" => array(\n				\"PARAM2\" => \"PARAM2\",\n			),\n		)\n	),\n	false\n);?><br><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530116403),
('1f353a06167f7dfed7d92de386c5a7cea', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:36:\"/home/bitrix_exam/www/ex2/simplecomp\";s:4:\"path\";s:15:\"/ex2/simplecomp\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:19:\"/ex2/.left.menu.php\";s:8:\"menuName\";s:33:\"Простой компонент\";s:8:\"menuPath\";s:16:\"/ex2/simplecomp/\";}}', 1, 1530100247),
('1f4b4eca74b7b1d64aa58269b40a208f7', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/home/bitrix_exam/www/ex2/feedback/index.php\";s:7:\"content\";s:201:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Форма обратной связи\");\n?>Text here....<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1530095527),
('28d63dab5df5e8f6cd3103d2eb2ca4cc6', 'main', 'autosave', 'CAutoSave::_Restore', 'a:42:{s:12:\"USER_TYPE_ID\";s:5:\"video\";s:9:\"ENTITY_ID\";s:16:\"IBLOCK_2_SECTION\";s:10:\"FIELD_NAME\";s:12:\"UF_NEWS_LINK\";s:6:\"XML_ID\";s:0:\"\";s:4:\"SORT\";s:3:\"100\";s:8:\"MULTIPLE\";s:1:\"Y\";s:9:\"MANDATORY\";s:0:\"\";s:11:\"SHOW_FILTER\";s:1:\"N\";s:12:\"SHOW_IN_LIST\";s:0:\"\";s:12:\"EDIT_IN_LIST\";s:0:\"\";s:13:\"IS_SEARCHABLE\";s:0:\"\";s:37:\"SETTINGSX000091XBUFFER_LENGTHX000093X\";s:2:\"10\";s:34:\"SETTINGSX000091XCONTROLBARX000093X\";s:6:\"bottom\";s:33:\"SETTINGSX000091XAUTOSTARTX000093X\";s:0:\"\";s:30:\"SETTINGSX000091XVOLUMEX000093X\";s:2:\"90\";s:29:\"SETTINGSX000091XWIDTHX000093X\";s:3:\"400\";s:30:\"SETTINGSX000091XHEIGHTX000093X\";s:3:\"300\";s:28:\"SETTINGSX000091XSKINX000093X\";s:0:\"\";s:33:\"SETTINGSX000091XFLASHVARSX000093X\";s:0:\"\";s:33:\"SETTINGSX000091XWMODE_FLVX000093X\";s:11:\"transparent\";s:31:\"SETTINGSX000091XBGCOLORX000093X\";s:6:\"FFFFFF\";s:29:\"SETTINGSX000091XCOLORX000093X\";s:6:\"000000\";s:34:\"SETTINGSX000091XOVER_COLORX000093X\";s:6:\"000000\";s:36:\"SETTINGSX000091XSCREEN_COLORX000093X\";s:6:\"000000\";s:34:\"SETTINGSX000091XSILVERVARSX000093X\";s:0:\"\";s:33:\"SETTINGSX000091XWMODE_WMVX000093X\";s:10:\"windowless\";s:33:\"EDIT_FORM_LABELX000091XruX000093X\";s:0:\"\";s:35:\"LIST_COLUMN_LABELX000091XruX000093X\";s:0:\"\";s:35:\"LIST_FILTER_LABELX000091XruX000093X\";s:0:\"\";s:31:\"ERROR_MESSAGEX000091XruX000093X\";s:0:\"\";s:30:\"HELP_MESSAGEX000091XruX000093X\";s:0:\"\";s:33:\"EDIT_FORM_LABELX000091XenX000093X\";s:0:\"\";s:35:\"LIST_COLUMN_LABELX000091XenX000093X\";s:0:\"\";s:35:\"LIST_FILTER_LABELX000091XenX000093X\";s:0:\"\";s:31:\"ERROR_MESSAGEX000091XenX000093X\";s:0:\"\";s:30:\"HELP_MESSAGEX000091XenX000093X\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:8:\"back_url\";s:163:\"/bitrix/admin/iblock_section_edit.php?IBLOCK_ID=2&type=products&ID=1&lang=ru&from=iblock_section_admin&find_section_section=0&tabControl_active_tab=user_fields_tab\";s:8:\"list_url\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1530104519);
-- -----------------------------------
-- Dumping table b_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user` VALUES
(1, '2018-06-27 10:18:42', 'admin', 'W4SUKInh5362f11751010ab803678bdaf245967f', 'h9ozXsCi0e450ce5ca98838231c2495428ceb0ad', 'Y', 'Сергей', 'Есенин', 'esenin@mail.ru', '2018-06-27 13:12:53', '2018-06-27 10:18:42', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-27 10:18:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_access
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_access` VALUES
(0, 'group', 'G2'),
(1, 'user', 'U1'),
(1, 'group', 'G1'),
(1, 'group', 'G3'),
(1, 'group', 'G4'),
(1, 'group', 'G2');
-- -----------------------------------
-- Dumping table b_user_access_check
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_access_check` VALUES
(1, 'group'),
(1, 'user');
-- -----------------------------------
-- Dumping table b_user_counter
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_sent` (`SENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_digest
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_field` VALUES
(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
(3, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
(4, 'IBLOCK_2_SECTION', 'UF_NEWS_LINK', 'iblock_element', '', 100, 'Y', 'N', 'N', 'Y', 'Y', 'N', 'a:5:{s:7:\"DISPLAY\";s:4:\"LIST\";s:11:\"LIST_HEIGHT\";i:5;s:9:\"IBLOCK_ID\";i:1;s:13:\"DEFAULT_VALUE\";s:0:\"\";s:13:\"ACTIVE_FILTER\";s:1:\"N\";}');
-- -----------------------------------
-- Dumping table b_user_field_confirm
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_field_lang` VALUES
(4, 'en', '', '', '', '', ''),
(4, 'ru', '', '', '', '', '');
-- -----------------------------------
-- Dumping table b_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_group` VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_hit_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_option_user` (`USER_ID`,`CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_option` VALUES
(1, NULL, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:7:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, NULL, 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:3:\"red\";}', 'Y'),
(3, 1, 'admin_panel', 'settings', 'a:1:{s:4:\"edit\";s:2:\"on\";}', 'N'),
(4, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(5, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:99:\"menu_system,menu_util,menu_iblock,iblock_admin,menu_iblock_/products,menu_iblock_/products/2,backup\";}', 'N'),
(6, 1, 'BX.WindowManager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:\"width\";s:3:\"977\";s:6:\"height\";s:3:\"405\";}', 'N'),
(7, 1, 'html_editor', 'user_settings__filesrc_pub', 'a:2:{s:13:\"taskbar_shown\";s:1:\"1\";s:4:\"view\";s:7:\"wysiwyg\";}', 'N');
-- -----------------------------------
-- Dumping table b_user_stored_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_stored_auth` VALUES
(1, 1, '2018-06-27 10:18:42', '2018-06-27 13:12:53', '36b8cb15f278496fcf93ad48147c2f5a', 'N', 2130706433);
-- -----------------------------------
-- Dumping table b_utm_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_utm_blog_comment`;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_utm_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_utm_blog_post`;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_utm_iblock_2_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_utm_iblock_2_section`;
CREATE TABLE `b_utm_iblock_2_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_IBLOCK_2_SECTION_1` (`FIELD_ID`),
  KEY `ix_utm_IBLOCK_2_SECTION_2` (`VALUE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_utm_iblock_2_section` VALUES
(1, 1, 4, NULL, 1, NULL, NULL),
(2, 1, 4, NULL, 2, NULL, NULL),
(3, 2, 4, NULL, 2, NULL, NULL),
(4, 2, 4, NULL, 3, NULL, NULL),
(10, 4, 4, NULL, 3, NULL, NULL),
(11, 3, 4, NULL, 1, NULL, NULL);
-- -----------------------------------
-- Dumping table b_uts_blog_comment
-- -----------------------------------
DROP TABLE IF EXISTS `b_uts_blog_comment`;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_uts_blog_post
-- -----------------------------------
DROP TABLE IF EXISTS `b_uts_blog_post`;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_uts_iblock_2_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_uts_iblock_2_section`;
CREATE TABLE `b_uts_iblock_2_section` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_NEWS_LINK` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_uts_iblock_2_section` VALUES
(1, 'a:2:{i:0;i:1;i:1;i:2;}'),
(2, 'a:2:{i:0;i:2;i:1;i:3;}'),
(3, 'a:1:{i:0;i:1;}'),
(4, 'a:1:{i:0;i:3;}');
-- -----------------------------------
-- Dumping table b_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote`;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_START` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_END` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `DELAY` int(18) DEFAULT NULL,
  `DELAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_answer`;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_channel
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel`;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_channel_2_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_group`;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_channel_2_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_site`;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event`;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_event_answer
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event_answer`;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_event_question
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_event_question`;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_question
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_question`;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_vote_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_vote_user`;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_LAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_xml_tree
-- -----------------------------------
DROP TABLE IF EXISTS `b_xml_tree`;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_xml_tree` VALUES
(1, 0, 1, 320, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),
(2, 1, 2, 67, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '2', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Вакансии', NULL),
(5, 2, 7, 64, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_ACTIVE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'БитриксАктивность', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_CODE', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Символьный код', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_SORT', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Сортировка', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Начало активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Окончание активности', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Анонс', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 63, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Картинка анонса', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 2, 65, 66, 2, 'Группы', NULL, NULL),
(35, 1, 68, 319, 1, 'Каталог', NULL, NULL),
(36, 35, 69, 70, 2, 'Ид', 'furniture_vacancies', NULL),
(37, 35, 71, 72, 2, 'ИдКлассификатора', '2', NULL),
(38, 35, 73, 74, 2, 'Наименование', 'Вакансии', NULL),
(39, 35, 75, 76, 2, 'БитриксКод', 'furniture_vacancies', NULL),
(40, 35, 77, 78, 2, 'БитриксСортировка', '500', NULL),
(41, 35, 79, 80, 2, 'БитриксURLСписок', '#SITE_DIR#/company/vacancies.php', NULL),
(42, 35, 81, 82, 2, 'БитриксURLДеталь', '#SITE_DIR#/company/vacancies.php##ID#', NULL),
(43, 35, 83, 84, 2, 'БитриксURLРаздел', NULL, NULL),
(44, 35, 85, 86, 2, 'БитриксКартинка', NULL, NULL),
(45, 35, 87, 88, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(46, 35, 89, 90, 2, 'БитриксИндексироватьРазделы', 'false', NULL),
(47, 35, 91, 92, 2, 'БитриксДокументооборот', 'false', NULL),
(48, 35, 93, 154, 2, 'БитриксПодписи', NULL, NULL),
(49, 48, 94, 99, 3, 'БитриксПодпись', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', 'ELEMENT_NAME', NULL),
(51, 49, 97, 98, 4, 'Значение', 'Вакансия', NULL),
(52, 48, 100, 105, 3, 'БитриксПодпись', NULL, NULL),
(53, 52, 101, 102, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(54, 52, 103, 104, 4, 'Значение', 'Вакансии', NULL),
(55, 48, 106, 111, 3, 'БитриксПодпись', NULL, NULL),
(56, 55, 107, 108, 4, 'Ид', 'ELEMENT_ADD', NULL),
(57, 55, 109, 110, 4, 'Значение', 'Добавить вакансию', NULL),
(58, 48, 112, 117, 3, 'БитриксПодпись', NULL, NULL),
(59, 58, 113, 114, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(60, 58, 115, 116, 4, 'Значение', 'Изменить вакансию', NULL),
(61, 48, 118, 123, 3, 'БитриксПодпись', NULL, NULL),
(62, 61, 119, 120, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(63, 61, 121, 122, 4, 'Значение', 'Удалить вакансию', NULL),
(64, 48, 124, 129, 3, 'БитриксПодпись', NULL, NULL),
(65, 64, 125, 126, 4, 'Ид', 'SECTION_NAME', NULL),
(66, 64, 127, 128, 4, 'Значение', 'Раздел', NULL),
(67, 48, 130, 135, 3, 'БитриксПодпись', NULL, NULL),
(68, 67, 131, 132, 4, 'Ид', 'SECTIONS_NAME', NULL),
(69, 67, 133, 134, 4, 'Значение', 'Разделы', NULL),
(70, 48, 136, 141, 3, 'БитриксПодпись', NULL, NULL),
(71, 70, 137, 138, 4, 'Ид', 'SECTION_ADD', NULL),
(72, 70, 139, 140, 4, 'Значение', 'Добавить раздел', NULL),
(73, 48, 142, 147, 3, 'БитриксПодпись', NULL, NULL),
(74, 73, 143, 144, 4, 'Ид', 'SECTION_EDIT', NULL),
(75, 73, 145, 146, 4, 'Значение', 'Изменить раздел', NULL),
(76, 48, 148, 153, 3, 'БитриксПодпись', NULL, NULL),
(77, 76, 149, 150, 4, 'Ид', 'SECTION_DELETE', NULL),
(78, 76, 151, 152, 4, 'Значение', 'Удалить раздел', NULL),
(79, 35, 155, 318, 2, 'Товары', NULL, NULL),
(80, 79, 156, 209, 3, 'Товар', NULL, NULL),
(81, 80, 157, 158, 4, 'Ид', '2', NULL),
(82, 80, 159, 160, 4, 'Наименование', 'Продавец-дизайнер (кухни)', NULL),
(83, 80, 161, 162, 4, 'БитриксТеги', NULL, NULL),
(84, 80, 163, 164, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ', NULL),
(85, 80, 165, 208, 4, 'ЗначенияСвойств', NULL, NULL),
(86, 85, 166, 171, 5, 'ЗначенияСвойства', NULL, NULL),
(87, 86, 167, 168, 6, 'Ид', 'CML2_ACTIVE', NULL),
(88, 86, 169, 170, 6, 'Значение', 'true', NULL),
(89, 85, 172, 177, 5, 'ЗначенияСвойства', NULL, NULL),
(90, 89, 173, 174, 6, 'Ид', 'CML2_CODE', NULL),
(91, 89, 175, 176, 6, 'Значение', NULL, NULL),
(92, 85, 178, 183, 5, 'ЗначенияСвойства', NULL, NULL),
(93, 92, 179, 180, 6, 'Ид', 'CML2_SORT', NULL),
(94, 92, 181, 182, 6, 'Значение', '200', NULL),
(95, 85, 184, 189, 5, 'ЗначенияСвойства', NULL, NULL),
(96, 95, 185, 186, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(97, 95, 187, 188, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(98, 85, 190, 195, 5, 'ЗначенияСвойства', NULL, NULL),
(99, 98, 191, 192, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(100, 98, 193, 194, 6, 'Значение', NULL, NULL),
(101, 85, 196, 201, 5, 'ЗначенияСвойства', NULL, NULL),
(102, 101, 197, 198, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(103, 101, 199, 200, 6, 'Значение', NULL, NULL),
(104, 85, 202, 207, 5, 'ЗначенияСвойства', NULL, NULL),
(105, 104, 203, 204, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(106, 104, 205, 206, 6, 'Значение', NULL, NULL),
(107, 79, 210, 263, 3, 'Товар', NULL, NULL),
(108, 107, 211, 212, 4, 'Ид', '3', NULL),
(109, 107, 213, 214, 4, 'Наименование', 'Директор магазина', NULL),
(110, 107, 215, 216, 4, 'БитриксТеги', NULL, NULL),
(111, 107, 217, 218, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ', NULL),
(112, 107, 219, 262, 4, 'ЗначенияСвойств', NULL, NULL),
(113, 112, 220, 225, 5, 'ЗначенияСвойства', NULL, NULL),
(114, 113, 221, 222, 6, 'Ид', 'CML2_ACTIVE', NULL),
(115, 113, 223, 224, 6, 'Значение', 'true', NULL),
(116, 112, 226, 231, 5, 'ЗначенияСвойства', NULL, NULL),
(117, 116, 227, 228, 6, 'Ид', 'CML2_CODE', NULL),
(118, 116, 229, 230, 6, 'Значение', NULL, NULL),
(119, 112, 232, 237, 5, 'ЗначенияСвойства', NULL, NULL),
(120, 119, 233, 234, 6, 'Ид', 'CML2_SORT', NULL),
(121, 119, 235, 236, 6, 'Значение', '300', NULL),
(122, 112, 238, 243, 5, 'ЗначенияСвойства', NULL, NULL),
(123, 122, 239, 240, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(124, 122, 241, 242, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(125, 112, 244, 249, 5, 'ЗначенияСвойства', NULL, NULL),
(126, 125, 245, 246, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(127, 125, 247, 248, 6, 'Значение', NULL, NULL),
(128, 112, 250, 255, 5, 'ЗначенияСвойства', NULL, NULL),
(129, 128, 251, 252, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(130, 128, 253, 254, 6, 'Значение', NULL, NULL),
(131, 112, 256, 261, 5, 'ЗначенияСвойства', NULL, NULL),
(132, 131, 257, 258, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(133, 131, 259, 260, 6, 'Значение', NULL, NULL),
(134, 79, 264, 317, 3, 'Товар', NULL, NULL),
(135, 134, 265, 266, 4, 'Ид', '4', NULL),
(136, 134, 267, 268, 4, 'Наименование', 'Бухгалтер отдела учета готовой продукции', NULL),
(137, 134, 269, 270, 4, 'БитриксТеги', NULL, NULL),
(138, 134, 271, 272, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ', NULL),
(139, 134, 273, 316, 4, 'ЗначенияСвойств', NULL, NULL),
(140, 139, 274, 279, 5, 'ЗначенияСвойства', NULL, NULL),
(141, 140, 275, 276, 6, 'Ид', 'CML2_ACTIVE', NULL),
(142, 140, 277, 278, 6, 'Значение', 'true', NULL),
(143, 139, 280, 285, 5, 'ЗначенияСвойства', NULL, NULL),
(144, 143, 281, 282, 6, 'Ид', 'CML2_CODE', NULL),
(145, 143, 283, 284, 6, 'Значение', NULL, NULL),
(146, 139, 286, 291, 5, 'ЗначенияСвойства', NULL, NULL),
(147, 146, 287, 288, 6, 'Ид', 'CML2_SORT', NULL),
(148, 146, 289, 290, 6, 'Значение', '400', NULL),
(149, 139, 292, 297, 5, 'ЗначенияСвойства', NULL, NULL),
(150, 149, 293, 294, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(151, 149, 295, 296, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(152, 139, 298, 303, 5, 'ЗначенияСвойства', NULL, NULL),
(153, 152, 299, 300, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(154, 152, 301, 302, 6, 'Значение', NULL, NULL),
(155, 139, 304, 309, 5, 'ЗначенияСвойства', NULL, NULL),
(156, 155, 305, 306, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(157, 155, 307, 308, 6, 'Значение', NULL, NULL),
(158, 139, 310, 315, 5, 'ЗначенияСвойства', NULL, NULL),
(159, 158, 311, 312, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(160, 158, 313, 314, 6, 'Значение', NULL, NULL),
(161, 0, 30, 0, 0, '', NULL, NULL),
(162, 0, 31, 0, 0, '', NULL, NULL),
(163, 0, 32, 0, 0, '', NULL, NULL);
-- Finished: 2018-06-27 19:37:23