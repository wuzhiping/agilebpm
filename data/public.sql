-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: agilebpm
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `act_ge_bytearray_ibfk_1` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','0',0),('schema.history','create(5.22.0.0) upgrade(5.21.0.0->5.22.0.0)',2),('schema.version','5.22.0.0',2);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) NOT NULL,
  `PROC_DEF_ID_` varchar(64) NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LAST_UPDATE_TIME_` datetime NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `act_ru_execution_ibfk_1` (`PARENT_ID_`) USING BTREE,
  KEY `act_ru_execution_ibfk_2` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_execution_ibfk_4` (`SUPER_EXEC_`) USING BTREE,
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_1` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_2` (`PROC_INST_ID_`) USING BTREE,
  KEY `act_ru_identitylink_ibfk_3` (`TASK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUEDATE_` datetime NOT NULL,
  PRIMARY KEY (`ID_`),
  KEY `act_ru_job_ibfk_1` (`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_RU_TASK_IBFK_1` (`EXECUTION_ID_`) USING BTREE,
  KEY `act_ru_task_ibfk_2` (`PROC_DEF_ID_`) USING BTREE,
  KEY `act_ru_task_ibfk_3` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_1` (`BYTEARRAY_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_2` (`EXECUTION_ID_`) USING BTREE,
  KEY `act_ru_variable_ibfk_3` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_bus_link`
--

DROP TABLE IF EXISTS `bpm_bus_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_bus_link` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `def_id_` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  `inst_id_` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `biz_id_` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_code_` varchar(64) NOT NULL COMMENT 'bo_code',
  PRIMARY KEY (`id_`,`biz_code_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例与业务数据关系表'
/*!50500 PARTITION BY LIST  COLUMNS(biz_code_)
(PARTITION p01 VALUES IN ('unknown') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_bus_link`
--

LOCK TABLES `bpm_bus_link` WRITE;
/*!40000 ALTER TABLE `bpm_bus_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_bus_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_definition`
--

DROP TABLE IF EXISTS `bpm_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_definition` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程定义ID',
  `name_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程名称',
  `key_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程业务主键',
  `desc_` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '流程描述',
  `type_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属分类ID',
  `status_` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '流程状态。草稿、发布、禁用',
  `act_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'BPMN - 流程定义ID',
  `act_model_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `act_deploy_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'BPMN - 流程发布ID',
  `version_` int(11) DEFAULT NULL COMMENT '版本 - 当前版本号',
  `main_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '版本 - 主版本流程ID',
  `is_main_` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '版本 - 是否主版本',
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `support_mobile_` int(11) DEFAULT '0',
  `def_setting_` text COLLATE utf8_bin,
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `bpm_process_def_key` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_definition`
--

LOCK TABLES `bpm_definition` WRITE;
/*!40000 ALTER TABLE `bpm_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_instance`
--

DROP TABLE IF EXISTS `bpm_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_instance` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程实例ID',
  `subject_` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '流程实例标题',
  `def_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程定义ID',
  `act_def_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'BPMN流程定义ID',
  `def_key_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '流程定义Key',
  `def_name_` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '流程名称',
  `biz_key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '关联数据业务主键',
  `status_` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '实例状态',
  `end_time_` datetime DEFAULT NULL COMMENT '实例结束时间',
  `duration_` bigint(20) DEFAULT NULL COMMENT '持续时间(ms)',
  `type_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属分类ID',
  `act_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'BPMN流程实例ID',
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人ID',
  `creator_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `is_formmal_` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否正式数据',
  `parent_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父实例Id',
  `is_forbidden_` smallint(6) DEFAULT NULL COMMENT '禁止',
  `data_mode_` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `support_mobile_` int(11) DEFAULT '0',
  `super_node_id_` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父流程定义节点ID',
  PRIMARY KEY (`id_`),
  KEY `idx_proinst_bpminstid` (`act_inst_id_`) USING BTREE,
  KEY `idx_proinst_parentId` (`parent_inst_id_`) USING BTREE,
  KEY `idx_proinst_bizkey` (`biz_key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程实例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_instance`
--

LOCK TABLES `bpm_instance` WRITE;
/*!40000 ALTER TABLE `bpm_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_plugin_reminder_log`
--

DROP TABLE IF EXISTS `bpm_plugin_reminder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_plugin_reminder_log` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `instance_id_` varchar(20) DEFAULT NULL COMMENT '实例ID',
  `reminder_title_` varchar(255) DEFAULT NULL COMMENT '催办标题',
  `subject_` varchar(500) DEFAULT NULL COMMENT '流程标题',
  `node_id_` varchar(64) DEFAULT NULL COMMENT '节点ID',
  `msg_type_` varchar(64) DEFAULT NULL COMMENT '催办消息类型',
  `reminder_users_` varchar(500) DEFAULT NULL COMMENT '催办人',
  `reminder_userids_` varchar(500) DEFAULT NULL COMMENT '催办人ID',
  `reminder_date_` datetime DEFAULT NULL COMMENT '催办时间',
  `extend_` varchar(500) DEFAULT NULL COMMENT '其他说明',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程催办日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_plugin_reminder_log`
--

LOCK TABLES `bpm_plugin_reminder_log` WRITE;
/*!40000 ALTER TABLE `bpm_plugin_reminder_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_plugin_reminder_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_plugin_reminder_trigger`
--

DROP TABLE IF EXISTS `bpm_plugin_reminder_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_plugin_reminder_trigger` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `task_id_` varchar(20) NOT NULL COMMENT '任务ID',
  `reminder_desc_` varchar(255) DEFAULT NULL COMMENT '催办的描述',
  `before_script_` varchar(500) DEFAULT NULL COMMENT '催办前置脚本',
  `msg_type_` varchar(10) DEFAULT NULL COMMENT '催办消息类型',
  `html_msg_` varchar(1000) DEFAULT NULL COMMENT 'html消息',
  `text_msg_` varchar(500) DEFAULT NULL COMMENT '普通消息',
  `is_calc_workday_` int(1) DEFAULT NULL COMMENT '是否工作日计算',
  `is_urgent_` int(1) DEFAULT NULL COMMENT '是否加急任务',
  `max_reminder_times` int(10) DEFAULT NULL COMMENT '最多催办次数',
  `reminder_times_` int(10) DEFAULT NULL COMMENT '催办次数',
  `reminder_cycle_` int(12) DEFAULT NULL COMMENT '催办周期',
  `duedate_` datetime NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id_`),
  KEY `task_id_` (`task_id_`) USING BTREE,
  KEY `duedate_` (`duedate_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程催办触发';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_plugin_reminder_trigger`
--

LOCK TABLES `bpm_plugin_reminder_trigger` WRITE;
/*!40000 ALTER TABLE `bpm_plugin_reminder_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_plugin_reminder_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_submit_data_log`
--

DROP TABLE IF EXISTS `bpm_submit_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_submit_data_log` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `task_id_` varchar(64) DEFAULT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) DEFAULT NULL COMMENT '实例ID',
  `data` longtext COMMENT '业务数据',
  `destination` varchar(255) DEFAULT NULL COMMENT '目标节点',
  `extendConf` varchar(500) DEFAULT NULL COMMENT '特殊配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象数据提交日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_submit_data_log`
--

LOCK TABLES `bpm_submit_data_log` WRITE;
/*!40000 ALTER TABLE `bpm_submit_data_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_submit_data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_task`
--

DROP TABLE IF EXISTS `bpm_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_task` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务ID',
  `name_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `subject_` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '待办事项标题',
  `inst_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '关联 - 流程实例ID',
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '关联的任务ID',
  `act_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'activiti 实例id',
  `act_execution_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'activiti 执行id',
  `node_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '关联 - 任务节点ID',
  `def_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '关联 - 流程定义ID',
  `assignee_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务执行人ID',
  `assignee_names_` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `status_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务状态',
  `priority_` int(11) DEFAULT NULL COMMENT '任务优先级',
  `due_time_` datetime DEFAULT NULL COMMENT '任务到期时间',
  `task_type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务类型',
  `parent_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父任务ID',
  `type_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分类ID',
  `create_time_` datetime NOT NULL COMMENT '任务创建时间',
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `support_mobile_` int(11) DEFAULT '0',
  `back_node_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '返回节点',
  PRIMARY KEY (`id_`),
  KEY `idx_bpmtask_instid` (`inst_id_`) USING BTREE,
  KEY `idx_bpmtask_taskid` (`task_id_`) USING BTREE,
  KEY `idx_bpmtask_parentid` (`parent_id_`) USING BTREE,
  KEY `idx_bpmtask_userid` (`assignee_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_task`
--

LOCK TABLES `bpm_task` WRITE;
/*!40000 ALTER TABLE `bpm_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_task_identitylink`
--

DROP TABLE IF EXISTS `bpm_task_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_task_identitylink` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type_` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '候选人类型',
  `identity_name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `identity_` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'ID',
  `permission_code_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `idx_taskcandidate_taskid` (`task_id_`) USING BTREE,
  KEY `idx_candidate_instid` (`inst_id_`) USING BTREE,
  KEY `idx_permission_code_` (`permission_code_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='任务候选人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_task_identitylink`
--

LOCK TABLES `bpm_task_identitylink` WRITE;
/*!40000 ALTER TABLE `bpm_task_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_task_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_task_opinion`
--

DROP TABLE IF EXISTS `bpm_task_opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_task_opinion` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '意见ID',
  `inst_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程实例ID',
  `sup_inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父流程实例ID',
  `task_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务ID',
  `task_key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务定义Key',
  `task_name_` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '任务名称',
  `token_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务令牌',
  `assign_info_` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '任务分配情况',
  `approver_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `approver_name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人名字',
  `approve_time_` datetime DEFAULT NULL COMMENT '审批时间',
  `opinion_` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '审批意见',
  `status_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '审批状态。start=发起流程；awaiting_check=待审批；agree=同意；against=反对；return=驳回；abandon=弃权；retrieve=追回',
  `form_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '表单定义ID',
  `create_by_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '执行开始时间',
  `dur_ms_` bigint(20) DEFAULT NULL COMMENT '持续时间(ms)',
  PRIMARY KEY (`id_`),
  KEY `idx_opinion_supinstid` (`sup_inst_id_`) USING BTREE,
  KEY `idx_opinion_task` (`task_id_`) USING BTREE,
  KEY `idx_opinion_instId` (`inst_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程任务审批记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_task_opinion`
--

LOCK TABLES `bpm_task_opinion` WRITE;
/*!40000 ALTER TABLE `bpm_task_opinion` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_task_opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_task_stack`
--

DROP TABLE IF EXISTS `bpm_task_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_task_stack` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `task_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务ID',
  `inst_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `parent_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父ID',
  `node_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '节点ID',
  `node_name_` varchar(125) COLLATE utf8_bin DEFAULT NULL,
  `start_time_` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `is_muliti_task_` smallint(6) DEFAULT NULL COMMENT '1=是\r\n                        0=否',
  `node_type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '节点类型',
  `action_name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '响应动作',
  PRIMARY KEY (`id_`),
  KEY `idx_exestack_instid` (`inst_id_`) USING BTREE,
  KEY `idx_exestack_taskid` (`task_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程执行堆栈树';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_task_stack`
--

LOCK TABLES `bpm_task_stack` WRITE;
/*!40000 ALTER TABLE `bpm_task_stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_task_stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_user_agency_config`
--

DROP TABLE IF EXISTS `bpm_user_agency_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_user_agency_config` (
  `id_` varchar(64) NOT NULL COMMENT '配置ID',
  `start_datetime_` datetime NOT NULL COMMENT '起始时间',
  `end_datetime_` datetime NOT NULL COMMENT '结束时间',
  `agency_flow_key_` varchar(1000) NOT NULL COMMENT '代理流程编码，多个中间逗号分隔(,)',
  `agency_flow_name_` varchar(5000) NOT NULL COMMENT '代理流程名称，多个中间逗号分隔(,)',
  `config_user_id_` varchar(64) NOT NULL COMMENT '配置用户编码',
  `target_user_id_` varchar(1000) NOT NULL COMMENT '目标用户编码，多个中间逗号分隔(,)',
  `target_user_name_` varchar(1000) NOT NULL COMMENT '目标用户姓名，多个中间逗哥分隔(,)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用/未启用(1/0)',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `config_user_id_` (`config_user_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务流程用户代理配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_user_agency_config`
--

LOCK TABLES `bpm_user_agency_config` WRITE;
/*!40000 ALTER TABLE `bpm_user_agency_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_user_agency_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpm_user_agency_log`
--

DROP TABLE IF EXISTS `bpm_user_agency_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpm_user_agency_log` (
  `id_` varchar(64) NOT NULL COMMENT '日志ID',
  `config_id_` varchar(64) NOT NULL COMMENT '配置ID',
  `flow_instance_id_` varchar(64) NOT NULL COMMENT '流程实例编号',
  `task_id_` varchar(64) NOT NULL COMMENT '代理任务编号',
  `task_node_id_` varchar(64) NOT NULL COMMENT '代理任务节点',
  `task_node_name_` varchar(64) NOT NULL COMMENT '代理任务节点名称',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_org_id_` varchar(64) DEFAULT NULL COMMENT '创建者所属组织ID',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `rev_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `config_id_` (`config_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务流程用户代理日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpm_user_agency_log`
--

LOCK TABLES `bpm_user_agency_log` WRITE;
/*!40000 ALTER TABLE `bpm_user_agency_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bpm_user_agency_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_column`
--

DROP TABLE IF EXISTS `bus_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_column` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `table_id_` varchar(64) DEFAULT NULL COMMENT '表id',
  `key_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) DEFAULT NULL COMMENT '名字',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型',
  `length_` int(11) DEFAULT NULL,
  `decimal_` int(11) DEFAULT NULL,
  `required_` tinyint(4) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  `default_value_` varchar(128) DEFAULT NULL,
  `comment_` varchar(256) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_column`
--

LOCK TABLES `bus_column` WRITE;
/*!40000 ALTER TABLE `bus_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_column_ctrl`
--

DROP TABLE IF EXISTS `bus_column_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_column_ctrl` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `column_id_` varchar(64) DEFAULT NULL COMMENT '字段ID',
  `type_` varchar(64) DEFAULT NULL COMMENT '控件类型',
  `config_` varchar(256) DEFAULT NULL COMMENT '控件配置',
  `valid_rule_` varchar(256) DEFAULT NULL COMMENT '验证规则',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `column_id_unique` (`column_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段控件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_column_ctrl`
--

LOCK TABLES `bus_column_ctrl` WRITE;
/*!40000 ALTER TABLE `bus_column_ctrl` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus_column_ctrl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_object`
--

DROP TABLE IF EXISTS `bus_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_object` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT 'key',
  `name_` varchar(128) DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) DEFAULT NULL COMMENT '描述',
  `relation_json_` text COMMENT 'relation字段用来持久化入库的字符串字段',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `persistence_type_` varchar(64) DEFAULT NULL COMMENT '持久化类型',
  `overall_arrangement_` text COMMENT '整体布局',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_object`
--

LOCK TABLES `bus_object` WRITE;
/*!40000 ALTER TABLE `bus_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_permission`
--

DROP TABLE IF EXISTS `bus_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_permission` (
  `id_` varchar(64) NOT NULL,
  `bo_key_` varchar(128) DEFAULT NULL COMMENT 'boKey',
  `obj_type_` varchar(64) NOT NULL COMMENT '配置这个权限的对象，可以是表单，流程，或流程节点',
  `obj_val_` varchar(128) DEFAULT NULL COMMENT '能获取到配置权限的对象的唯一值\r\n 通常是key 或 id \r\n 可以是自定义的\r\n 例如 某个流程的某个节点，可以是 流程key.nodeKey\r\n 这样的格式\r\n',
  `bus_obj_map_json_` longtext COMMENT 'busObjMap的json数据',
  `rights_json_` longtext COMMENT 'rights的json数据',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `obj_type_obj_val_unique_idx_` (`obj_type_`,`obj_val_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bo权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_permission`
--

LOCK TABLES `bus_permission` WRITE;
/*!40000 ALTER TABLE `bus_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_table`
--

DROP TABLE IF EXISTS `bus_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_table` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `key_` varchar(64) DEFAULT NULL COMMENT '业务表key',
  `name_` varchar(64) DEFAULT NULL COMMENT '表名',
  `comment_` varchar(256) DEFAULT NULL COMMENT '描述',
  `ds_key_` varchar(64) DEFAULT NULL COMMENT '数据源的别名',
  `ds_name_` varchar(128) DEFAULT NULL COMMENT '数据源名称',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) DEFAULT NULL COMMENT '分组名称',
  `external_` smallint(6) DEFAULT NULL COMMENT '是否外部表',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_table`
--

LOCK TABLES `bus_table` WRITE;
/*!40000 ALTER TABLE `bus_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `bus_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_holiday_conf`
--

DROP TABLE IF EXISTS `c_holiday_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_holiday_conf` (
  `id_` varchar(64) NOT NULL,
  `name_` varchar(255) DEFAULT NULL,
  `system_` varchar(255) DEFAULT NULL,
  `year_` int(255) DEFAULT NULL,
  `startDay_` date DEFAULT NULL,
  `endDay_` date DEFAULT NULL,
  `type_` varchar(255) DEFAULT NULL,
  `remark_` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_holiday_conf`
--

LOCK TABLES `c_holiday_conf` WRITE;
/*!40000 ALTER TABLE `c_holiday_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_holiday_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_schedule`
--

DROP TABLE IF EXISTS `c_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_schedule` (
  `id_` varchar(20) NOT NULL COMMENT 'ID',
  `title_` varchar(500) DEFAULT NULL COMMENT '标题',
  `desc_` varchar(2000) DEFAULT NULL COMMENT '描述',
  `task_url_` varchar(255) DEFAULT NULL COMMENT '任务连接',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型',
  `open_type_` varchar(64) DEFAULT NULL COMMENT '任务打开方式',
  `owner_` varchar(64) DEFAULT NULL COMMENT '所属人',
  `owner_name_` varchar(64) DEFAULT NULL COMMENT '所属人',
  `participant_names_` varchar(1000) DEFAULT NULL COMMENT '参与者',
  `start_time_` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time_` datetime DEFAULT NULL COMMENT '结束日期',
  `actual_start_time_` datetime DEFAULT NULL COMMENT '实际开始日期',
  `complete_time_` datetime DEFAULT NULL COMMENT '完成时间',
  `rate_progress_` int(10) DEFAULT NULL COMMENT '进度',
  `submitter_` varchar(64) DEFAULT NULL COMMENT '提交人',
  `submitNamer_` varchar(64) DEFAULT NULL COMMENT '提交人',
  `remark_` varchar(500) DEFAULT NULL,
  `isLock_` varchar(10) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `delete_flag_` varchar(10) DEFAULT NULL COMMENT '删除标记',
  `rev_` int(10) DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_schedule`
--

LOCK TABLES `c_schedule` WRITE;
/*!40000 ALTER TABLE `c_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_schedule_biz`
--

DROP TABLE IF EXISTS `c_schedule_biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_schedule_biz` (
  `id_` varchar(20) NOT NULL COMMENT 'id',
  `schedule_id_` varchar(20) NOT NULL COMMENT '日程id',
  `biz_id_` varchar(20) NOT NULL COMMENT '业务id',
  `from_` varchar(64) NOT NULL COMMENT '来源',
  PRIMARY KEY (`id_`),
  KEY `idx_schedule_id` (`schedule_id_`),
  KEY `idx_biz_id` (`biz_id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程业务关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_schedule_biz`
--

LOCK TABLES `c_schedule_biz` WRITE;
/*!40000 ALTER TABLE `c_schedule_biz` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_schedule_biz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_schedule_participant`
--

DROP TABLE IF EXISTS `c_schedule_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_schedule_participant` (
  `id_` varchar(20) NOT NULL COMMENT 'id',
  `schedule_id_` varchar(20) DEFAULT NULL COMMENT '日程ID',
  `participantor_name_` varchar(255) DEFAULT NULL COMMENT '参与者名字',
  `participantor_` varchar(64) DEFAULT NULL COMMENT '参与者',
  `rate_progress_` int(10) DEFAULT NULL COMMENT 'ilka完成比例',
  `submit_comment_` varchar(500) DEFAULT NULL COMMENT 'ilka提交注释',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `actual_start_time_` datetime DEFAULT NULL COMMENT 'ilka实际开始时间',
  `complete_time_` datetime DEFAULT NULL COMMENT 'ilka完成时间',
  PRIMARY KEY (`id_`),
  KEY `idx_schedule_id` (`schedule_id_`),
  KEY `idx_participantor` (`participantor_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程参与者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_schedule_participant`
--

LOCK TABLES `c_schedule_participant` WRITE;
/*!40000 ALTER TABLE `c_schedule_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_schedule_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_work_calendar`
--

DROP TABLE IF EXISTS `c_work_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_work_calendar` (
  `id_` varchar(20) NOT NULL,
  `day_` date DEFAULT NULL,
  `isWorkDay_` varchar(20) DEFAULT NULL,
  `type_` varchar(255) DEFAULT NULL,
  `system_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_work_calendar`
--

LOCK TABLES `c_work_calendar` WRITE;
/*!40000 ALTER TABLE `c_work_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_work_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_uploader`
--

DROP TABLE IF EXISTS `db_uploader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_uploader` (
  `id_` varchar(64) NOT NULL,
  `bytes_` longblob,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_uploader`
--

LOCK TABLES `db_uploader` WRITE;
/*!40000 ALTER TABLE `db_uploader` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_uploader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_cust_dialog`
--

DROP TABLE IF EXISTS `form_cust_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_cust_dialog` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `name_` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '名字',
  `desc_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `style_` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '显示类型',
  `ds_key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源别名',
  `ds_name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名字',
  `obj_type_` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '对象类型',
  `obj_name_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '对象名称',
  `page_` tinyint(4) DEFAULT NULL COMMENT '是否分页',
  `page_size_` int(11) DEFAULT NULL COMMENT '分页大小',
  `width_` int(11) DEFAULT NULL COMMENT '弹出框的宽度',
  `height_` int(11) DEFAULT NULL COMMENT '弹出框的高度',
  `system_` tinyint(4) DEFAULT NULL COMMENT '是否系统内置',
  `multiple_` tinyint(4) DEFAULT NULL COMMENT '是否多选',
  `tree_config_json_` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '树形的配置信息，json字段',
  `display_fields_json_` text COLLATE utf8_bin COMMENT '显示字段',
  `condition_fields_json_` text COLLATE utf8_bin COMMENT '条件字段的json',
  `return_fields_json_` text COLLATE utf8_bin COMMENT '返回字段json',
  `sort_fields_json_` text COLLATE utf8_bin COMMENT '排序字段',
  `data_source_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `idx_unqiue` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自定义对话框';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_cust_dialog`
--

LOCK TABLES `form_cust_dialog` WRITE;
/*!40000 ALTER TABLE `form_cust_dialog` DISABLE KEYS */;
INSERT INTO `form_cust_dialog` VALUES ('10000005290006','zdydhklb','自定义对话框列表','自定义对话框列表','list','dataSourceDefault','本地数据源','table','form_cust_dialog',1,10,1300,800,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"formatter\":\"\",\"showName\":\"名字\"},{\"columnName\":\"key_\",\"showName\":\"别名\"},{\"columnName\":\"style_\",\"formatter\":\"var span = \'<span class=\\\"label label-primary\\\">表</span>\';\\n\\t\\tif (value == \'view\')\\n\\t\\t\\tspan = \'<span class=\\\"label label-warning\\\">视图</span>\';\\n\\t\\treturn span;\",\"showName\":\"显示类型\"}]','[{\"columnName\":\"key_\",\"condition\":\"EQ\",\"dbType\":\"varchar\",\"showName\":\"别名\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"name_\",\"condition\":\"EQ\",\"dbType\":\"varchar\",\"showName\":\"名字\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"name_\",\"returnName\":\"name\"}]','[{\"columnName\":\"id_\",\"sortType\":\"desc\"}]',NULL),('10000005470001','ywblb','业务表列表','业务表列表','list','dataSourceDefault','本地数据源','table','bus_table',1,10,1300,600,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"comment_\",\"showName\":\"描述\"},{\"columnName\":\"key_\",\"showName\":\"业务表key\"},{\"columnName\":\"name_\",\"showName\":\"表名\"}]','[{\"columnName\":\"key_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"业务表key\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"表名\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"ds_key_\",\"returnName\":\"dsKey\"},{\"columnName\":\"comment_\",\"returnName\":\"comment\"}]','[]',NULL),('20000002250001','busObjectSelect','业务对象选择',NULL,'list','dataSourceDefault','本地数据源','table','bus_object',1,10,800,600,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"key_\",\"showName\":\"别名\"},{\"columnName\":\"name_\",\"showName\":\"名字\"},{\"columnName\":\"desc_\",\"showName\":\"描述\"}]','[{\"columnName\":\"key_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"key\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"名字\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"desc_\",\"returnName\":\"desc\"}]','[]',NULL),('20000003130001','userSelector','用户查询',NULL,'list','dataSourceDefault','本地数据源','table','org_user',1,10,930,660,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"fullname_\",\"showName\":\"姓名\"},{\"columnName\":\"account_\",\"showName\":\"账号\"},{\"columnName\":\"mobile_\",\"showName\":\"手机号码\"}]','[{\"columnName\":\"fullname_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"姓名\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"account_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"账号\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"status_\",\"condition\":\"EQ\",\"dbType\":\"number\",\"showName\":\"0:禁用，1正常\",\"value\":{\"text\":\"1\"},\"valueSource\":\"fixedValue\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"fullname_\",\"returnName\":\"name\"},{\"columnName\":\"account_\",\"returnName\":\"account\"},{\"columnName\":\"email_\",\"returnName\":\"email\"},{\"columnName\":\"mobile_\",\"returnName\":\"mobile\"},{\"columnName\":\"weixin_\",\"returnName\":\"weixin\"},{\"columnName\":\"address_\",\"returnName\":\"address\"},{\"columnName\":\"sex_\",\"returnName\":\"sex\"},{\"columnName\":\"status_\",\"returnName\":\"status\"}]','[]',NULL),('20000003160001','orgSelector','组织选择框',NULL,'tree','dataSourceDefault','本地数据源','table','org_group',1,10,800,600,1,1,'{\"id\":\"id_\",\"pid\":\"parent_id_\",\"pidInitVal\":\"0\",\"pidInitValScript\":false,\"showColumn\":\"name_\"}','[]','[]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"parent_id_\",\"returnName\":\"parentId\"},{\"columnName\":\"code_\",\"returnName\":\"key\"},{\"columnName\":\"type_\",\"returnName\":\"type\"}]','[]',NULL),('20000003160002','roleSelector','角色对话框','','list','dataSourceDefault','本地数据源','table','org_role',1,10,800,600,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"showName\":\"角色名称\"},{\"columnName\":\"alias_\",\"showName\":\"别名\"}]','[{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"名称\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"alias_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"别名\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"alias_\",\"returnName\":\"key\"},{\"columnName\":\"enabled_\",\"returnName\":\"enabled\"}]','[]',NULL),('20000003460003','formSelector','表单选择框',NULL,'list','dataSourceDefault','本地数据源','table','form_def',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"showName\":\"名字\"},{\"columnName\":\"key_\",\"showName\":\"key\"},{\"columnName\":\"desc_\",\"showName\":\"描述\"},{\"columnName\":\"bo_name_\",\"showName\":\"业务对象\"},{\"columnName\":\"bo_key_\",\"showName\":\"业务对象key\"}]','[{\"columnName\":\"bo_key_\",\"condition\":\"IN\",\"dbType\":\"varchar\",\"showName\":\"别名\",\"value\":{\"ctrlType\":\"\"},\"valueSource\":\"param\"},{\"columnName\":\"type_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"分类\",\"value\":{},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"desc_\",\"returnName\":\"desc\"},{\"columnName\":\"group_id_\",\"returnName\":\"groupId\"},{\"columnName\":\"bo_key_\",\"returnName\":\"boKey\"},{\"columnName\":\"bo_name_\",\"returnName\":\"boName\"},{\"columnName\":\"type_\",\"returnName\":\"type_\"}]','[]',NULL),('20000004660004','getMyUsablePanels','获取可用面板','面板布局获取可用的面板','list','dataSourceDefault','本地数据源','table','workbenchPanelManager.getMyUsablePanels',1,10,800,600,1,1,'{\"pidInitValScript\":false}','[{\"columnName\":\"name\",\"showName\":\"名字\"},{\"columnName\":\"desc\",\"showName\":\"描述\"}]','[{\"columnName\":\"layoutKey\",\"condition\":\"EQ\",\"dbType\":\"varchar\",\"showName\":\"layoutKey\",\"value\":{},\"valueSource\":\"param\"}]','[{\"columnName\":\"type\",\"returnName\":\"type\"},{\"columnName\":\"alias\",\"returnName\":\"alias\"},{\"columnName\":\"name\",\"returnName\":\"name\"},{\"columnName\":\"type\",\"returnName\":\"type\"},{\"columnName\":\"desc\",\"returnName\":\"desc\"},{\"columnName\":\"dataType\",\"returnName\":\"dataType\"},{\"columnName\":\"dataSource\",\"returnName\":\"dataSource\"},{\"columnName\":\"autoRefresh\",\"returnName\":\"autoRefresh\"},{\"columnName\":\"width\",\"returnName\":\"width\"},{\"columnName\":\"height\",\"returnName\":\"height\"},{\"columnName\":\"displayContent\",\"returnName\":\"displayContent\"},{\"columnName\":\"moreUrl\",\"returnName\":\"moreUrl\"},{\"columnName\":\"id\",\"returnName\":\"id\"},{\"columnName\":\"height\",\"returnName\":\"custHeight\"},{\"columnName\":\"width\",\"returnName\":\"custWidth\"}]','[]','interface'),('20000005180002','scriptSelector','常用脚本选择框','选择常用脚本','list','dataSourceDefault','本地数据源','table','sys_script',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"showName\":\"名称\"},{\"columnName\":\"category_\",\"showName\":\"分类\"},{\"columnName\":\"memo_\",\"showName\":\"备注\"}]','[{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"脚本名称\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"script_\",\"returnName\":\"script\"}]','[]',NULL),('20000008820001','IdentitySeletor','流水号选择','流水号选择','list','dataSourceDefault','本地数据源','table','sys_serialno',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"showName\":\"名称\"},{\"columnName\":\"alias_\",\"showName\":\"别名\"},{\"columnName\":\"regulation_\",\"showName\":\"规则\"},{\"columnName\":\"step_\",\"showName\":\"步长\"}]','[{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"名称\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"alias_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"别名\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"alias_\",\"returnName\":\"alias\"},{\"columnName\":\"regulation_\",\"returnName\":\"regulation\"}]','[]',NULL),('20000013260001','bpmDefSelector','流程定义选择','流程定义主版本','list','dataSourceDefault','本地数据源','table','bpm_definition',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"name_\",\"showName\":\"流程名称\"},{\"columnName\":\"key_\",\"showName\":\"流程业务主键\"},{\"columnName\":\"desc_\",\"showName\":\"流程描述\"}]','[{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"流程名称\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"is_main_\",\"condition\":\"EQ\",\"dbType\":\"varchar\",\"showName\":\"版本 - 是否主版本\",\"value\":{\"text\":\"Y\"},\"valueSource\":\"fixedValue\"}]','[{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"desc_\",\"returnName\":\"desc\"},{\"columnName\":\"type_id_\",\"returnName\":\"typeId\"},{\"columnName\":\"is_main_\",\"returnName\":\"isMain\"}]','[]',NULL),('405338661247254529','postSelector','岗位选择','岗位','list','dataSourceDefault','本地数据源','view','org_relation_view',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"groupName\",\"showName\":\"组织名\"},{\"columnName\":\"roleName\",\"showName\":\"职务\"}]','[{\"columnName\":\"status_\",\"condition\":\"EQ\",\"dbType\":\"number\",\"showName\":\"状态：1启用，2禁用\",\"value\":{\"text\":\"1\"},\"valueSource\":\"fixedValue\"},{\"columnName\":\"type_\",\"condition\":\"EQ\",\"dbType\":\"varchar\",\"showName\":\"类型：groupUser,groupRole,userRole,groupUserRole\",\"value\":{\"text\":\"groupRole\"},\"valueSource\":\"fixedValue\"},{\"columnName\":\"groupName\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"组织\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"},{\"columnName\":\"roleName\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"职务\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"groupName\",\"returnName\":\"groupName\"},{\"columnName\":\"roleName\",\"returnName\":\"roleName\"},{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"group_id_\",\"returnName\":\"groupId\"},{\"columnName\":\"role_id_\",\"returnName\":\"roleId\"},{\"columnName\":\"status_\",\"returnName\":\"status_\"},{\"columnName\":\"type_\",\"returnName\":\"type_\"},{\"columnName\":\"id_\",\"returnName\":\"key\"},{\"columnName\":\"postName\",\"returnName\":\"name\"}]','[]',NULL),('405608679250853889','workbenchPanelTempl','面板模板选择',NULL,'list','dataSourceDefault','本地数据源','table','sys_workbench_panel_templ',1,10,800,600,1,0,'{\"pidInitValScript\":false}','[{\"columnName\":\"key_\",\"showName\":\"别名\"},{\"columnName\":\"name_\",\"showName\":\"名字\"},{\"columnName\":\"desc_\",\"showName\":\"描述\"}]','[{\"columnName\":\"name_\",\"condition\":\"LK\",\"dbType\":\"varchar\",\"showName\":\"名字\",\"value\":{\"ctrlType\":\"inputText\"},\"valueSource\":\"param\"}]','[{\"columnName\":\"id_\",\"returnName\":\"id\"},{\"columnName\":\"key_\",\"returnName\":\"key\"},{\"columnName\":\"name_\",\"returnName\":\"name\"},{\"columnName\":\"desc_\",\"returnName\":\"desc\"},{\"columnName\":\"html_\",\"returnName\":\"html\"}]','[]',NULL);
/*!40000 ALTER TABLE `form_cust_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_def`
--

DROP TABLE IF EXISTS `form_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_def` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `type_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '分类（pc/mobile）',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'key',
  `name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `group_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分组id',
  `group_name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '分组名称',
  `bo_key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务对象key',
  `bo_name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '业务对象名称',
  `html_` longtext COLLATE utf8_bin COMMENT 'html',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人ID',
  `creator_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人名字',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人ID',
  `updator_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人名字',
  `version_` int(11) DEFAULT NULL COMMENT '版本号',
  `delete_` tinyint(4) DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_idx` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='表单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_def`
--

LOCK TABLES `form_def` WRITE;
/*!40000 ALTER TABLE `form_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_template`
--

DROP TABLE IF EXISTS `form_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_template` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '模板id',
  `name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '模板名称',
  `form_type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '表单类型（pc/mobile/vuepc）',
  `type_` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模板类型',
  `html_` text COLLATE utf8_bin COMMENT '模板内容',
  `desc_` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '模板描述',
  `editable_` tinyint(4) DEFAULT NULL COMMENT '是否可以编辑',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='表单模版';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_template`
--

LOCK TABLES `form_template` WRITE;
/*!40000 ALTER TABLE `form_template` DISABLE KEYS */;
INSERT INTO `form_template` VALUES ('409456328600453121','单列模板','pc','main','<table class=\"form-table\">\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n	<tr>								\r\n		<th>${column.comment}</th>\r\n		<td>${generator.getColumn(column,relation)}</td>								\r\n	</tr>\r\n	</#list>\r\n</table>\r\n${getOne2OneChild(relation)}\r\n\r\n\r\n\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<tr>\r\n							<th>${column.comment}</th>\r\n							<td>${generator.getColumn(column,relation)} </td>\r\n						</tr>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','单列模板',0,'mainOneColumn'),('409456328601763841','两列模板','pc','main','<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n	<#if index==1>\r\n	<tr>\r\n	</#if>								\r\n		<th>${column.comment}</th>\r\n		<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>								\r\n	<#if field.isSeparator==true || !column_has_next || index==2>\r\n	</tr>\r\n	<#assign index=0>\r\n	</#if>\r\n	<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n${getOne2OneChild(relation)}\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==2>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if !hasNext && index !=2>\r\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','两列模板',0,'mainTwoColumn'),('409456328602812417','三列模板','pc','main','<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n		<#if index==1>\r\n		<tr>\r\n		</#if>\r\n			<th>${column.comment}</th>\r\n			<td ${getColspan(index,column_has_next)}> ${generator.getColumn(column,relation)} </td>\r\n		<#if !column_has_next || index==3>\r\n		</tr>\r\n		<#assign index=0>\r\n		</#if> \r\n		<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n ${getOne2OneChild(relation)}\r\n \r\n \r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==3>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if !hasNext && index !=3>\r\n		<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','三列模板',0,'mainThreeColumn'),('409456328603860993','四列模板','pc','main','<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n		<#if index==1>\r\n		<tr>\r\n		</#if>\r\n			<th>${column.comment}</th>\r\n			<td ${getColspan(index,column_has_next)}> ${generator.getColumn(column,relation)} </td>\r\n		<#if !column_has_next || index==4>\r\n		</tr>\r\n		<#assign index=0>\r\n		</#if> \r\n		<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==4>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if (!hasNext || isSeparator==true) && index !=4>\r\n		<#assign rtn=\"colspan=\'\"+((4-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','四列模板',0,'mainFourColumn'),('409456328604909569','子表单列模板','pc','subTable','<div ${generator.getSubAttrs(relation)} ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n		<a href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" ng-model=\"${generator.getScopePath(relation)}\" ab-sub-add=\"initData.${relation.busObj.key}.${relation.tableKey}\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加</a>\r\n	</div>\r\n	<div class=\"ibox-content\" ng-repeat=\"${relation.tableKey} in ${generator.getScopePath(relation)} track by $index\"> ${getOne2ManyChild(relation)}<a class=\"btn btn-danger btn-xs fa fa-delete pull-right\" ng-click=\"ArrayTool.del($index,${generator.getScopePath(relation)})\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"> 移除</a>\r\n		<table class=\"form-table\">\r\n		<#list relation.table.columnsWithOutHidden as column>\r\n			<tr>\r\n				<th>${column.comment}</th>\r\n				<td>${generator.getColumn(column,relation)} </td>\r\n			</tr>\r\n		</#list>\r\n		</table>\r\n		 ${getOne2OneChild(relation)}\r\n	</div>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<tr>\r\n							<th>${column.comment}</th>\r\n							<td>${generator.getColumn(column,relation)} </td>\r\n						</tr>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','单列模板',0,'subOneColumn'),('409456328606744577','子表两列模板','pc','subTable','<div ${generator.getSubAttrs(relation)} ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n		<a href=\"###\" class=\"btn btn-primary btn-sm fa fa-plus\" ng-model=\"${generator.getScopePath(relation)}\" ab-sub-add=\"initData.${relation.busObj.key}.${relation.tableKey}\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >添加</a>\r\n	</div>\r\n	<div class=\"ibox-content\" ng-repeat=\"${relation.tableKey} in ${generator.getScopePath(relation)} track by $index\"> ${getOne2ManyChild(relation)}<a class=\"btn btn-danger btn-xs fa fa-delete pull-right\" ng-click=\"ArrayTool.del($index,${generator.getScopePath(relation)})\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"> 移除</a>\r\n		<table class=\"form-table\">\r\n		<#assign index=1>\r\n		<#list relation.table.columnsWithOutHidden as column>\r\n			<#if index==1>\r\n			<tr>\r\n			</#if>\r\n				<th>${column.comment}</th>\r\n				<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n			<#if !column_has_next || index==2>\r\n			</tr>\r\n			<#assign index=0>\r\n			</#if> \r\n			<#assign index=index+1>\r\n		</#list>\r\n		</table>\r\n		 ${getOne2OneChild(relation)}\r\n	</div>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==2>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n		 <#if !hasNext && index !=2>\r\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \r\n		</#if>\r\n<#return rtn>\r\n</#function> ','两列模板',0,'subTwoColumn'),('409456328608055297','子表三列模板','pc','subTable','<div ${generator.getSubAttrs(relation)} ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n		<a href=\"###\" class=\"btn btn-primary btn-sm fa fa-plus\" ng-model=\"${generator.getScopePath(relation)}\" ab-sub-add=\"initData.${relation.busObj.key}.${relation.tableKey}\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加</a>\r\n	</div>\r\n	<div class=\"ibox-content\" ng-repeat=\"${relation.tableKey} in ${generator.getScopePath(relation)} track by $index\"> ${getOne2ManyChild(relation)}<a class=\"btn btn-danger btn-xs fa fa-delete pull-right\" ng-click=\"ArrayTool.del($index,${generator.getScopePath(relation)})\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"> 移除</a>\r\n		<table class=\"form-table\">\r\n		<#assign index=1>\r\n		<#list relation.table.columnsWithOutHidden as column>\r\n			<#if index==1>\r\n			<tr>\r\n			</#if>\r\n				<th>${column.comment}</th>\r\n				<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n			<#if !column_has_next || index==3>\r\n			</tr>\r\n			<#assign index=0>\r\n			</#if> \r\n			<#assign index=index+1>\r\n		</#list>\r\n		</table>\r\n		 ${getOne2OneChild(relation)}\r\n	</div>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${generator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==3>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n		 <#if (!hasNext || isSeparator==true) && index !=3>\r\n			<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \r\n		</#if>\r\n<#return rtn>\r\n</#function>','三列模板',0,'subThreeColumn'),('409456328608841729','子表单行模板','pc','subTable','<div ${generator.getSubAttrs(relation)} ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n		<a href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" ng-model=\"${generator.getScopePath(relation)}\" ab-sub-add=\"initData.${relation.busObj.key}.${relation.tableKey}\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加</a>\r\n	</div>\r\n	<div class=\"ibox-content\">\r\n		<table class=\"form-table\">\r\n			<thead>\r\n				<tr>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n					<th>${column.comment}</th>\r\n					</#list>	\r\n					<th>操作</th>\r\n				</tr>\r\n			</thead>\r\n			<tr ng-repeat=\"${relation.tableKey} in ${generator.getScopePath(relation)} track by $index\">\r\n			<#list relation.table.columnsWithOutHidden as column>\r\n				<td>${generator.getColumn(column,relation)} </td>\r\n			</#list>\r\n			<td>${getOne2ManyChild(relation)}\r\n			<a class=\"btn btn-danger btn-sm fa fa-delete\" ng-click=\"ArrayTool.del($index,${generator.getScopePath(relation)})\" ab-edit-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"> </a></td>\r\n			</tr>\r\n		</table>\r\n	</div>\r\n</div>\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${generator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<tr>\r\n							<th>${column.comment}</th>\r\n							<td>${generator.getColumn(column,relation)} </td>\r\n						</tr>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" ng-model=\"${relation.parent.tableKey}\" ab-sub-detail=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','单行模板，暂时不支持一对一',0,'subOneline'),('409456328609628161','vue单列模板','pc_vue','main','<!--脚本将会混入表单自定义表单控件-->\r\n<script>\r\n	window.custFormComponentMixin ={\r\n			data: function () {\r\n		    	return {\"test\":\"helloWorld\"};\r\n		  	},\r\n			created:function(){\r\n				console.log(\"混入对象的钩子被调用\");\r\n			},methods:{\r\n				testaaa:function(){alert(1)}\r\n			}\r\n	}\r\n</script>\r\n\r\n<table class=\"form-table\">\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n	<tr>								\r\n		<th>${column.comment}</th>\r\n		<td>${vueGenerator.getColumn(column,relation)}</td>\r\n	</tr>\r\n	</#list>\r\n</table>\r\n${getOne2OneChild(relation)}\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<tr>\r\n							<th>${column.comment}</th>\r\n							<td>${vueGenerator.getColumn(column,relation)} </td>\r\n						</tr>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" ab-show-permission=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','单列模板',0,'vueMainOneColumn'),('409456328610414593','vue两列模板','pc_vue','main','<!--脚本将会混入表单自定义表单控件-->\r\n<script>\r\n    window.custFormComponentMixin ={\r\n        data: function () {\r\n            return {\"test\":\"helloWorld\"};\r\n        },\r\n        created:function(){\r\n            console.log(\"混入对象的钩子被调用\");\r\n        },methods:{\r\n            testaaa:function(){alert(1)}\r\n        }\r\n    }\r\n</script>\r\n<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n	<#if index==1>\r\n	<tr>\r\n	</#if>								\r\n		<th>${column.comment}</th>\r\n		<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>								\r\n	<#if field.isSeparator==true || !column_has_next || index==2>\r\n	</tr>\r\n	<#assign index=0>\r\n	</#if>\r\n	<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n${getOne2OneChild(relation)}\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==2>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if !hasNext && index !=2>\r\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','两列模板',0,'vueMainTwoColumn'),('409456328612249601','vue三列模板','pc_vue','main','<!--脚本将会混入表单自定义表单控件-->\r\n<script>\r\n    window.custFormComponentMixin ={\r\n        data: function () {\r\n            return {\"test\":\"helloWorld\"};\r\n        },\r\n        created:function(){\r\n            console.log(\"混入对象的钩子被调用\");\r\n        },methods:{\r\n            testaaa:function(){alert(1)}\r\n        }\r\n    }\r\n</script>\r\n<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n		<#if index==1>\r\n		<tr>\r\n		</#if>\r\n			<th>${column.comment}</th>\r\n			<td ${getColspan(index,column_has_next)}> ${vueGenerator.getColumn(column,relation)} </td>\r\n		<#if !column_has_next || index==3>\r\n		</tr>\r\n		<#assign index=0>\r\n		</#if> \r\n		<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n ${getOne2OneChild(relation)}\r\n \r\n \r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==3>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if !hasNext && index !=3>\r\n		<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','三列模板',0,'vueMainThreeColumn'),('409456328613298177','vue四列模板','pc_vue','main','<!--脚本将会混入表单自定义表单控件-->\r\n<script>\r\n    window.custFormComponentMixin ={\r\n        data: function () {\r\n            return {\"test\":\"helloWorld\"};\r\n        },\r\n        created:function(){\r\n            console.log(\"混入对象的钩子被调用\");\r\n        },methods:{\r\n            testaaa:function(){alert(1)}\r\n        }\r\n    }\r\n</script>\r\n<table class=\"form-table\">\r\n	<#assign index=1>\r\n	<#list relation.table.columnsWithOutHidden as column>\r\n		<#if index==1>\r\n		<tr>\r\n		</#if>\r\n			<th>${column.comment}</th>\r\n			<td ${getColspan(index,column_has_next)}> ${vueGenerator.getColumn(column,relation)} </td>\r\n		<#if !column_has_next || index==4>\r\n		</tr>\r\n		<#assign index=0>\r\n		</#if> \r\n		<#assign index=index+1>\r\n	</#list>\r\n</table>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==4>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n	\r\n	 <#if (!hasNext || isSeparator==true) && index !=4>\r\n		<#assign rtn=\"colspan=\'\"+((4-index)*2+1)+\"\'\"> \r\n	</#if>\r\n	\r\n	<#return rtn>\r\n</#function>','四列模板',0,'vueMainFourColumn'),('409456328614346753','vue子表单列模板','pc_vue','subTable','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div ${vueGenerator.getDivVIf(relation)}>\r\n		<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n		 	<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\r\n		</div>\r\n		<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\r\n	 	<ab-sub-del href=\"javascript:void(0);\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:index=\"index\" class=\"btn btn-danger btn-xs fa fa-delete pull-right\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>	\r\n			<table class=\"form-table\">\r\n			<#list relation.table.columnsWithOutHidden as column>\r\n				<tr>\r\n					<th>${column.comment}</th>\r\n					<td>${vueGenerator.getColumn(column,relation)} </td>\r\n				</tr>\r\n			</#list>\r\n			</table>\r\n			 ${getOne2OneChild(relation)}\r\n		</ab-sub-scope>\r\n	</div>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<tr>\r\n							<th>${column.comment}</th>\r\n							<td>${vueGenerator.getColumn(column,relation)} </td>\r\n						</tr>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\">\r\n		<#list relationList as relation>\r\n		<ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" pkey=\"${relation.parent.tableKey}\" v-model=\"${vueGenerator.getScopePath(relation.parent)}[index]\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','单列模板',0,'vueSubOneColumn'),('409456328615919617','vue子表两列模板','pc_vue','subTable','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div ${vueGenerator.getDivVIf(relation)}>\r\n		<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n			<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\r\n		</div>\r\n		<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\r\n		<ab-sub-del href=\"javascript:void(0);\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:index=\"index\" class=\"btn btn-danger btn-xs fa fa-delete pull-right\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\r\n			<table class=\"form-table\">\r\n			<#assign index=1>\r\n			<#list relation.table.columnsWithOutHidden as column>\r\n				<#if index==1>\r\n				<tr>\r\n				</#if>\r\n					<th>${column.comment}</th>\r\n					<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n				<#if !column_has_next || index==2>\r\n				</tr>\r\n				<#assign index=0>\r\n				</#if> \r\n				<#assign index=index+1>\r\n			</#list>\r\n			</table>\r\n			 ${getOne2OneChild(relation)}\r\n		</ab-sub-scope>\r\n	</div>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==2>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail pkey=\"${relation.parent.tableKey}\" v-bind:sub-temp-data.sync=\"subTempData\" href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}[index]\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n		 <#if !hasNext && index !=2>\r\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \r\n		</#if>\r\n<#return rtn>\r\n</#function> ','两列模板',0,'vueSubTwoColumn'),('409456328616968193','vue子表三列模板','pc_vue','subTable','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<div ${vueGenerator.getDivVIf(relation)}>\r\n		<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\r\n			<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\r\n		</div>\r\n		<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\r\n		<ab-sub-del href=\"javascript:void(0);\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:index=\"index\" class=\"btn btn-danger btn-xs fa fa-delete pull-right\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\r\n			<table class=\"form-table\">\r\n			<#assign index=1>\r\n			<#list relation.table.columnsWithOutHidden as column>\r\n				<#if index==1>\r\n				<tr>\r\n				</#if>\r\n					<th>${column.comment}</th>\r\n					<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n				<#if !column_has_next || index==3>\r\n				</tr>\r\n				<#assign index=0>\r\n				</#if> \r\n				<#assign index=index+1>\r\n			</#list>\r\n			</table>\r\n			 ${getOne2OneChild(relation)}\r\n		</ab-sub-scope>\r\n	</div>\r\n</div>\r\n	\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${vueGenerator.getSubAttrs(relation)} >\r\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${vueGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==3>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation>\r\n		<ab-sub-detail pkey=\"${relation.parent.tableKey}\" v-bind:sub-temp-data.sync=\"subTempData\" href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath(relation.parent)}[index]\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n		 <#if (!hasNext || isSeparator==true) && index !=3>\r\n			<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \r\n		</#if>\r\n<#return rtn>\r\n</#function>','三列模板',0,'vueSubThreeColumn'),('409456328618803201','vue子表单行模板','pc_vue','subTable','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath_old(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<div class=\"ibox-content\">\n		<table class=\"form-table\">\n			<thead>\n				<tr>\n					<#list relation.table.columnsWithOutHidden as column>\n					<th>${column.comment}</th>\n					</#list>	\n					<th>操作</th>\n				</tr>\n			</thead>\n			<tr v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath_old(relation)}\">\n			<#list relation.table.columnsWithOutHidden as column>\n				<td>${vueGenerator.getColumn(column,relation)} </td>\n			</#list>\n				<td>${getOne2ManyChild(relation)}\n				<ab-sub-del href=\"javascript:void(0);\" v-model=\"${vueGenerator.getScopePath_old(relation)}\" v-bind:index=\"index\" class=\"btn btn-danger btn-sm fa fa-delete\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"></ab-sub-del>\n				</td>\n			</tr>\n		</table>\n	</div>\n</div>\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<div ${vueGenerator.getSubAttrs(relation)} >\n				<div class=\"block-title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<tr>\n							<th>${column.comment}</th>\n							<td>${vueGenerator.getColumn(column,relation)} </td>\n						</tr>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</div>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<div class=\"pull-left\"><#list relationList as relation>\n		<ab-sub-detail href=\"javascript:void(0)\" class=\"btn btn-link btn-sm fa fa-detail\" v-model=\"${vueGenerator.getScopePath_old(relation.parent)}[index]\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</div>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','单行模板，暂时不支持一对一',0,'vueSubOneline'),('409456328620113921','iview单列模板(Table)','pc_iview','main','<script>\n	window.custFormComponentMixin ={\n			data: function () {\n		    	return {\"test\":\"helloWorld\"};\n		  	},\n			created:function(){\n				console.log(\"脚本将会混入自定义表单组件中...\");\n			},methods:{\n				testaaa:function(){alert(1)}\n			}\n	}\n</script>\n\n<table class=\"form-table\">\n	<#list relation.table.columnsWithOutHidden as column>\n	<tr>								\n		<th>${column.comment}</th>\n		<td>${iviewGenerator.getColumn(column,relation)}</td>\n	</tr>\n	</#list>\n</table>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation>\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<tr>\n							<th>${column.comment}</th>\n							<td>${iviewGenerator.getColumn(column,relation)} </td>\n						</tr>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation>\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		<#if relationList?? && (relationList?size > 0) >\n			<#list relationList as relation>\n			<ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n			</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','单列模板',0,'iviewMainOneColumn'),('409456328620900353','iview两列模板(Table)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<table class=\"form-table\">\n	<#assign index=1>\n	<#list relation.table.columnsWithOutHidden as column>\n	<#if index==1>\n	<tr>\n	</#if>								\n		<th>${column.comment}</th>\n		<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>								\n	<#if field.isSeparator==true || !column_has_next || index==2>\n	</tr>\n	<#assign index=0>\n	</#if>\n	<#assign index=index+1>\n	</#list>\n</table>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#assign index=1>\n					<#list relation.table.columnsWithOutHidden as column>\n						<#if index==1>\n						<tr>\n						</#if>\n							<th>${column.comment}</th>\n							<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\n						<#if !column_has_next || index==2>\n						</tr>\n						<#assign index=0>\n						</#if> \n						<#assign index=index+1>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if !hasNext && index !=2>\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','两列模板',0,'iviewMainTwoColumn'),('409456328621686785','iview三列模板(Table)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<table class=\"form-table\">\n	<#assign index=1>\n	<#list relation.table.columnsWithOutHidden as column>\n		<#if index==1>\n		<tr>\n		</#if>\n			<th>${column.comment}</th>\n			<td ${getColspan(index,column_has_next)}> ${iviewGenerator.getColumn(column,relation)} </td>\n		<#if !column_has_next || index==3>\n		</tr>\n		<#assign index=0>\n		</#if> \n		<#assign index=index+1>\n	</#list>\n</table>\n ${getOne2OneChild(relation)}\n \n \n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#assign index=1>\n					<#list relation.table.columnsWithOutHidden as column>\n						<#if index==1>\n						<tr>\n						</#if>\n							<th>${column.comment}</th>\n							<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\n						<#if !column_has_next || index==3>\n						</tr>\n						<#assign index=0>\n						</#if> \n						<#assign index=index+1>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if !hasNext && index !=3>\n		<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','三列模板',0,'iviewMainThreeColumn'),('409456328622997505','iview四列模板(Table)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<table class=\"form-table\">\n	<#assign index=1>\n	<#list relation.table.columnsWithOutHidden as column>\n		<#if index==1>\n		<tr>\n		</#if>\n			<th style=\"width: 100px;\">${column.comment}</th>\n			<td ${getColspan(index,column_has_next)}> ${iviewGenerator.getColumn(column,relation)} </td>\n		<#if !column_has_next || index==4>\n		</tr>\n		<#assign index=0>\n		</#if> \n		<#assign index=index+1>\n	</#list>\n</table>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#assign index=1>\n					<#list relation.table.columnsWithOutHidden as column>\n						<#if index==1>\n						<tr>\n						</#if>\n							<th style=\"width: 100px;\">${column.comment}</th>\n							<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\n						<#if !column_has_next || index==4>\n						</tr>\n						<#assign index=0>\n						</#if> \n						<#assign index=index+1>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n		<ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if (!hasNext || isSeparator==true) && index !=4>\n		<#assign rtn=\"colspan=\'\"+((4-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','四列模板',0,'iviewMainFourColumn'),('409456328624308225','iview两列模板(ROW)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<div class=\"ivu-row\">\n	<#list relation.table.columnsWithOutHidden as column>\n	<div class=\"ivu-col ivu-col-span-12 ivu-form-item\">\n        <label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n        <div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(column,relation)}</div>\n    </div>\n	</#list>\n</div>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-12 ivu-form-item\">\n                    		<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n                    		<div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if !hasNext && index !=2>\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','两列模板',0,'iviewRowMainTwoColumn'),('409456328625356801','iview三列模板(ROW)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<div class=\"ivu-row\">\n	<#list relation.table.columnsWithOutHidden as column>\n	<div class=\"ivu-col ivu-col-span-8 ivu-form-item\">\n        <label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n        <div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(column,relation)}</div>\n    </div>\n	</#list>\n</div>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-8 ivu-form-item\">\n                    		<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n                    		<div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if !hasNext && index !=2>\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','三列模板',0,'iviewRowMainThreeColumn'),('409456328626143233','iview单列模板(ROW)','pc_iview','main','<script>\n    window.custFormComponentMixin ={\n        data: function () {\n            return {\"test\":\"helloWorld\"};\n        },\n        created:function(){\n            console.log(\"脚本将会混入自定义表单组件中...\");\n        },methods:{\n            testaaa:function(){alert(1)}\n        }\n    }\n</script>\n<div class=\"ivu-row\">\n	<#list relation.table.columnsWithOutHidden as column>\n	<div class=\"ivu-col ivu-col-span-24 ivu-form-item\">\n        <label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n        <div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\"> ${iviewGenerator.getColumn(column,relation)} </div>\n    </div>\n	</#list>\n</div>\n${getOne2OneChild(relation)}\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-24 ivu-form-item\">\n                    		<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n                    		<div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n	\n	 <#if !hasNext && index !=2>\n		<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n	</#if>\n	\n	<#return rtn>\n</#function>','单列模板',0,'iviewRowMainOneColumn'),('409456328627191809','iview子表单列模板(Table)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if> ><span class=\"title\">${relation.tableComment}</span>\n	 	<ab-sub-add class=\"ivu-btn ivu-btn-primary\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\n 	<ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<table class=\"form-table\">\n		<#list relation.table.columnsWithOutHidden as column>\n			<tr>\n				<th>${column.comment}</th>\n				<td>${iviewGenerator.getColumn(column,relation)} </td>\n			</tr>\n		</#list>\n		</table>\n		 ${getOne2OneChild(relation)}\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div  slot=\"title\"> <span class=\"title\">${relation.tableComment}</span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<tr>\n							<th>${column.comment}</th>\n							<td>${iviewGenerator.getColumn(column,relation)} </td>\n						</tr>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n			<ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','单列模板',0,'iviewSubOneColumn'),('409456328628240385','iview子表两列模板(Table)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n\r\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if>><span class=\"title\">${relation.tableComment}</span>\r\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\r\n	</div>\r\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\r\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\r\n		<table class=\"form-table\">\r\n		<#assign index=1>\r\n		<#list relation.table.columnsWithOutHidden as column>\r\n			<#if index==1>\r\n			<tr>\r\n			</#if>\r\n				<th>${column.comment}</th>\r\n				<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\r\n			<#if !column_has_next || index==2>\r\n			</tr>\r\n			<#assign index=0>\r\n			</#if> \r\n			<#assign index=index+1>\r\n		</#list>\r\n		</table>\r\n		 ${getOne2OneChild(relation)}\r\n	</ab-sub-scope>\r\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\r\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				<table class=\"form-table\">\r\n					<#assign index=1>\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<#if index==1>\r\n						<tr>\r\n						</#if>\r\n							<th>${column.comment}</th>\r\n							<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\r\n						<#if !column_has_next || index==2>\r\n						</tr>\r\n						<#assign index=0>\r\n						</#if> \r\n						<#assign index=index+1>\r\n					</#list>\r\n				</table>\r\n				${getOne2OneChild(relation)}\r\n			</Card>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<#list relationList as relation>\r\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\r\n		</#list>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getColspan index,hasNext>\r\n	<#assign rtn=\"\">\r\n		 <#if !hasNext && index !=2>\r\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \r\n		</#if>\r\n<#return rtn>\r\n</#function>','两列模板',0,'iviewSubTwoColumn'),('409456328630075393','iview子表三列模板(Table)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if>><span class=\"title\">${relation.tableComment}</span>\n        <ab-sub-add class=\"ivu-btn ivu-btn-primary\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<table class=\"form-table\">\n		<#assign index=1>\n		<#list relation.table.columnsWithOutHidden as column>\n			<#if index==1>\n			<tr>\n			</#if>\n				<th>${column.comment}</th>\n				<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\n			<#if !column_has_next || index==3>\n			</tr>\n			<#assign index=0>\n			</#if> \n			<#assign index=index+1>\n		</#list>\n		</table>\n		 ${getOne2OneChild(relation)}\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#assign index=1>\n					<#list relation.table.columnsWithOutHidden as column>\n						<#if index==1>\n						<tr>\n						</#if>\n							<th>${column.comment}</th>\n							<td ${getColspan(index,column_has_next)}>${iviewGenerator.getColumn(column,relation)}</td>\n						<#if !column_has_next || index==3>\n						</tr>\n						<#assign index=0>\n						</#if> \n						<#assign index=index+1>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n			<ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n		 <#if (!hasNext || isSeparator==true) && index !=3>\n			<#assign rtn=\"colspan=\'\"+((3-index)*2+1)+\"\'\"> \n		</#if>\n<#return rtn>\n</#function>','三列模板',0,'iviewSubThreeColumn'),('409456328631123969','iview子表单行模板(Table)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if> ><span class=\"title\">${relation.tableComment}</span>\n        <ab-sub-add class=\"ivu-btn ivu-btn-primary\" v-model=\"${iviewGenerator.getScopePath_old(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<div>\n		<table class=\"form-table\">\n			<thead>\n				<tr>\n					<#list relation.table.columnsWithOutHidden as column>\n					<th>${column.comment}</th>\n					</#list>	\n					<th>操作</th>\n				</tr>\n			</thead>\n			<tr v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath_old(relation)}\">\n			<#list relation.table.columnsWithOutHidden as column>\n				<td>${iviewGenerator.getColumn(column,relation)} </td>\n			</#list>\n				<td> <button-group>${getOne2ManyChild(relation)}\n                    	<ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath_old(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n					</button-group>\n				</td>\n			</tr>\n		</table>\n	</div>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n				<table class=\"form-table\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<tr>\n							<th>${column.comment}</th>\n							<td>${iviewGenerator.getColumn(column,relation)} </td>\n						</tr>\n					</#list>\n				</table>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath_old(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','单行模板，暂时不支持一对一',0,'iviewSubOneline'),('409456328631910401','iview子表单列模板(ROW)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if> ><span class=\"title\">${relation.tableComment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<div class=\"ivu-row\">\n		<#list relation.table.columnsWithOutHidden as column>\n			<div class=\"ivu-col ivu-col-span-24 ivu-form-item\">\n				<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n				<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n			</div>\n		</#list>\n		</div>\n		 ${getOne2OneChild(relation)}\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n                <div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-24 ivu-form-item\">\n							<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${column.comment}</label>\n							<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n		 <#if !hasNext && index !=2>\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n		</#if>\n<#return rtn>\n</#function> ','单列模板',0,'iviewRowSubOneColumn'),('409456328632958977','iview子表两列模板(ROW)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if>><span class=\"title\">${relation.tableComment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<div class=\"ivu-row\">\n		<#list relation.table.columnsWithOutHidden as column>\n			<div class=\"ivu-col ivu-col-span-12 ivu-form-item\">\n				<label class=\"ivu-form-item-label\" style=\"width: 80px;\">${column.comment}</label>\n				<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n			</div>\n		</#list>\n		</div>\n		 ${getOne2OneChild(relation)}\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n                <div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-12 ivu-form-item\">\n							<label class=\"ivu-form-item-label\" style=\"width: 80px;\">${column.comment}</label>\n							<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n		 <#if !hasNext && index !=2>\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n		</#if>\n<#return rtn>\n</#function> ','两列模板',0,'iviewRowSubTwoColumn'),('409456328634793985','iview子表三列模板(ROW)','pc_iview','subTable','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"800\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if>> <span class=\"title\">${relation.tableComment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\"> ${getOne2ManyChild(relation)}\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<div class=\"ivu-row\">\n		<#list relation.table.columnsWithOutHidden as column>\n			<div class=\"ivu-col ivu-col-span-8 ivu-form-item\">\n				<label class=\"ivu-form-item-label\" style=\"width: 80px;\">${column.comment}</label>\n				<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n			</div>\n		</#list>\n		</div>\n		 ${getOne2OneChild(relation)}\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2OneChild relation> \n	<#assign relationList = relation.getChildren(\'oneToOne\')>\n	<#assign rtn>\n		<#list relationList as relation>\n			<Card ${iviewGenerator.getSubAttrs(relation)} >\n				<div slot=\"title\"> <span class=\"title\">${relation.tableComment} </span>\n					${getOne2ManyChild(relation)}\n				</div>\n                <div class=\"ivu-row\">\n					<#list relation.table.columnsWithOutHidden as column>\n						<div class=\"ivu-col ivu-col-span-8 ivu-form-item\">\n							<label class=\"ivu-form-item-label\" style=\"width: 80px;\">${column.comment}</label>\n							<div class=\"ivu-form-item-content\" style=\"margin-left: 80px;\">${iviewGenerator.getColumn(column,relation)}</div>\n						</div>\n					</#list>\n				</div>\n				${getOne2OneChild(relation)}\n			</Card>\n		</#list>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n<#function getColspan index,hasNext>\n	<#assign rtn=\"\">\n		 <#if !hasNext && index !=2>\n			<#assign rtn=\"colspan=\'\"+((2-index)*2+1)+\"\'\"> \n		</#if>\n<#return rtn>\n</#function> ','三列模板',0,'iviewRowSubThreeColumn'),('409456328635580417','mobile主表模板','mobile','main','<script>\r\n	<!--脚本将会混入表单自定义表单控件-->\r\n	window.custFormComponentMixin ={\r\n			data: function () {\r\n		    	return {\"test\":\"helloWorld\"};\r\n		  	},\r\n			created:function(){\r\n				console.log(\"混入对象的钩子被调用\");\r\n			},methods:{\r\n				testaaa:function(){alert(1)}\r\n			}\r\n	}\r\n</script>\r\n<div class=\"weui-cells weui-cells_form\">\r\n<#list relation.table.columnsWithOutHidden as column>\r\n	<div class=\"weui-cell\" v-ab-permission:show=\"${mobileGenerator.getPermissionPath(column,relation)}\">\r\n        <div class=\"weui-cell__hd\"><label class=\"weui-label\">${column.comment}</label></div>\r\n        <div class=\"weui-cell__bd\">${mobileGenerator.getColumn(column,relation)}</div>\r\n	</div>\r\n</#list>\r\n</div>\r\n${getOne2OneChild(relation)}\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${mobileGenerator.getSubAttrs(relation)} >\r\n				<div class=\"weui-cells__title\"> ${relation.tableComment}\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				\r\n				<div class=\"weui-cells weui-cells_form\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<div class=\"weui-cell\" v-ab-permission:show=\"${mobileGenerator.getPermissionPath(column,relation)}\">\r\n					        <div class=\"weui-cell__hd\"><label class=\"weui-label\">${column.comment}</label></div>\r\n					        <div class=\"weui-cell__bd\">${mobileGenerator.getColumn(column,relation)}</div>\r\n					    </div>\r\n					</#list>\r\n				</div>\r\n				\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n		<div class=\"pull-left\"><#list relationList as relation><a href=\"#\"  v-on:click=\"showSubTable(${relation.parent.tableKey},\'${relation.tableKey}\')\" class=\"fa fa-list-alt weui-btn weui-btn_mini weui-btn_primary\"  v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>\r\n		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','mobile主表模板',0,'mobileMainTemplate'),('409456328636628993','mobile子表模板','mobile','subTable','<div ${mobileGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\r\n	<#if mobileGenerator.isThreeChildren(relation)><popup v-model=\"subTableDialog.${relation.tableKey}\" position=\"bottom\" height=\"80%\"> </#if>\r\n	<div class=\"weui-cells__title\" ><span class=\"title\">${relation.tableComment}</span>\r\n		<ab-sub-add href=\"javascript:;\" v-model=\"${mobileGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" class=\"fa fa-plus weui-btn weui-btn_mini weui-btn_primary\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"></ab-sub-add> \r\n	</div>\r\n	<div class=\"weui-cells weui-cells_form\" v-for=\"(${relation.tableKey},index) in ${mobileGenerator.getScopePath(relation)}\">\r\n		<div class=\"weui-cells__title\">\r\n		 	${getOne2ManyChild(relation)}\r\n		 	<a href=\"javascript:;\" v-sub-del=\"[${mobileGenerator.getScopePath(relation)},index]\" class=\"fa fa-trash weui-btn weui-btn_mini weui-btn_warn pull-right\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\"></a> \r\n		 </div>\r\n		<#list relation.table.columnsWithOutHidden as column>\r\n			<div class=\"weui-cell\" v-ab-permission:show=\"${mobileGenerator.getPermissionPath(column,relation)}\">\r\n		        <div class=\"weui-cell__hd\"><label class=\"weui-label\">${column.comment}</label></div>\r\n				<div class=\"weui-cell__bd\">${mobileGenerator.getColumn(column,relation)}</div>\r\n	    	</div>\r\n		</#list>\r\n		 ${getOne2OneChild(relation)}\r\n	</div>\r\n	<#if mobileGenerator.isThreeChildren(relation) ></popup></#if>\r\n</div>\r\n\r\n<#function getOne2OneChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToOne\')>\r\n	<#assign rtn>\r\n		<#list relationList as relation>\r\n			<div ${mobileGenerator.getSubAttrs(relation)} >\r\n				<div class=\"weui-cells__title\"> ${relation.tableComment}\r\n					${getOne2ManyChild(relation)}\r\n				</div>\r\n				\r\n				<div class=\"weui-cells weui-cells_form\">\r\n					<#list relation.table.columnsWithOutHidden as column>\r\n						<div class=\"weui-cell\" v-ab-permission:show=\"${mobileGenerator.getPermissionPath(column,relation)}\">\r\n					        <div class=\"weui-cell__hd\"><label class=\"weui-label\">${column.comment}</label></div>\r\n					        <div class=\"weui-cell__bd\">${mobileGenerator.getColumn(column,relation)}</div>\r\n					    </div>\r\n					</#list>\r\n				</div>\r\n				\r\n				${getOne2OneChild(relation)}\r\n			</div>\r\n		</#list>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>\r\n\r\n<#function getOne2ManyChild relation> \r\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\r\n	<#assign rtn>\r\n		 <#if relationList?? && (relationList?size > 0) >\r\n			<div class=\"pull-left\"><#list relationList as relation><a href=\"#\"  v-on:click=\"showSubTable(${relation.parent.tableKey},\'${relation.tableKey}\')\" class=\"fa fa-list-alt weui-btn weui-btn_mini weui-btn_primary\"  v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">${relation.tableComment}详情</a>		</#list>\r\n		</div>\r\n		</#if>\r\n	</#assign>\r\n	<#return rtn>\r\n</#function>','mobile子表模板',0,'mobileSubTemplate'),('409456328637677569','iview布局设计-主表模板','pc_iview','mainFormOverallArrangement','<#if group.hasTitle()>\n<Card ${iviewGenerator.getGroupTableName(group)}>\n<div slot=\"title\"> \n	<span class=\"title\">${group.comment} ${One2OneChildsOne2ManyRelations(group)}</span>\n</div>\n</#if>\n<div class=\"ivu-row\">\n	<#list group.columnList as groupColumn>\n	<div class=\"ivu-col ivu-col-span-${24/groupColumn.row} ivu-form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n        <label class=\"ivu-form-item-label\" style=\"width: 100px;\">${groupColumn.comment}</label>\n        <div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\"> ${iviewGenerator.getColumn(group,groupColumn)} </div>\n    </div>\n	</#list>\n</div>\n<#if group.hasTitle()></Card></#if>\n\n<#function One2OneChildsOne2ManyRelations group> \n	<#assign relationList = group.getOne2OneChildsOne2ManyRelations()>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n ','当业务对象配置过 布局设计后、会使用该模板-主表',0,'iviewFormOverallArrangementMainTemplate'),('409456328638464001','iview布局设计-单行子表模板','pc_iview','subTableFormOverallArrangement','<<#if iviewGenerator.isMultilayer(relation)>Modal width=\"80%\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if> ><span class=\"title\">${relation.tableComment}</span>\n        <ab-sub-add class=\"ivu-btn ivu-btn-primary\" v-model=\"${iviewGenerator.getScopePath_old(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<div>\n		<table class=\"form-table\">\n			<thead>\n				<tr>\n					<#list group.columnList as groupColumn>\n					<th v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">${groupColumn.comment}</th>\n					</#list>	\n					<th>操作</th>\n				</tr>\n			</thead>\n			<tr v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath_old(relation)}\">\n			<#list group.columnList as groupColumn>\n				<td v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">${iviewGenerator.getColumn(group,groupColumn)}</td>\n			</#list>\n				<td> <button-group>${getOne2ManyChild(relation)}\n                    	<ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath_old(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n					</button-group>\n				</td>\n			</tr>\n		</table>\n	</div>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath_old(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','当业务对象配置过 布局设计后、会使用该模板-子表',0,'iviewFormOverallArrangementSubOneline'),('409456328640299009','iview布局设计-子表模板','pc_iview','subTableFormOverallArrangement','<<#if iviewGenerator.isMultilayer(relation)>Modal ${iviewGenerator.getDivVIf(relation)} width=\"80%\"<#else>Card</#if> ${iviewGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div <#if iviewGenerator.isMultilayer(relation)>slot=\"header\"<#else>slot=\"title\"</#if> ><span class=\"title\">${group.comment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${iviewGenerator.getScopePath(relation)}\" <#if iviewGenerator.isMultilayer(relation)> class=\"ivu-form ivu-form-label-right\" </#if> > \n		${getOne2ManyChild(relation)}\n        <ab-sub-del  class=\"ivu-btn ivu-btn-error\" v-model=\"${iviewGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		<div class=\"ivu-row\">\n		<#list group.columnList as groupColumn>\n			<div class=\"ivu-col ivu-col-span-${24/groupColumn.row} ivu-form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n				<label class=\"ivu-form-item-label\" style=\"width: 100px;\">${groupColumn.comment}</label>\n				<div class=\"ivu-form-item-content\" style=\"margin-left: 100px;\">${iviewGenerator.getColumn(group,groupColumn)}</div>\n			</div>\n		</#list>\n		</div>\n	</ab-sub-scope>\n</<#if iviewGenerator.isMultilayer(relation)>Modal<#else>Card</#if>>\n\n<#function getOne2ManyChild relation>\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"ivu-btn ivu-btn-default\"  v-model=\"${iviewGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" table-key=\"${relation.getBusObj().getKey()}_${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n','当业务对象配置过 布局设计后、会使用该模板-子表',0,'iviewFormOverallArrangementSubTemplate'),('409456328641609729','vue布局设计-主表模板','pc_vue','mainFormOverallArrangement','<#if group.hasTitle()>\n<div class=\"ibox-title\">${group.comment} </div>\n</#if>\n<div class=\"panel-body\">\n ${One2OneChildsOne2ManyRelations(group)}\n	<#list group.columnList as groupColumn>\n	<div class=\"col-xs-${12/groupColumn.row} form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n        <label class=\"form-item-label\">${groupColumn.comment}</label>\n        <div class=\"form-item-content\"> ${vueGenerator.getColumn(group,groupColumn)} </div>\n    </div>\n	</#list>\n</div>\n\n<#function One2OneChildsOne2ManyRelations group> \n	<#assign relationList = group.getOne2OneChildsOne2ManyRelations()>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		 <div class=\"col-xs-12\">\n		<#list relationList as relation>\n            <ab-sub-detail class=\"btn btn-link btn-sm fa fa-detail\"  v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\"  v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</div>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n ','当业务对象配置过 布局设计后、会使用该模板-主表',0,'vueFormOverallArrangementMain'),('409456328642920449','vue布局设计-单行子表模板','pc_vue','subTableFormOverallArrangement','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div class=\"ibox-title\"><span class=\"title\">${relation.tableComment}</span>\n        <ab-sub-add class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath_old(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n		<table class=\"form-table\">\n			<thead>\n				<tr>\n					<#list group.columnList as groupColumn>\n					<th v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">${groupColumn.comment}</th>\n					</#list>	\n					<th>操作</th>\n				</tr>\n			</thead>\n			<tr v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath_old(relation)}\">\n			<#list group.columnList as groupColumn>\n				<td v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">${vueGenerator.getColumn(group,groupColumn)}</td>\n			</#list>\n				<td>${getOne2ManyChild(relation)}\n                    	<ab-sub-del  class=\"btn btn-danger btn-sm fa fa-delete\" v-model=\"${vueGenerator.getScopePath_old(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n				</td>\n			</tr>\n		</table>\n</div>\n\n<#function getOne2ManyChild relation> \n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		<#list relationList as relation>\n            <ab-sub-detail class=\"btn btn-link btn-sm fa fa-detail\"  v-model=\"${vueGenerator.getScopePath_old(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>','当业务对象配置过 布局设计后、会使用该模板-子表',0,'vueFormOverallArrangementSubOneline'),('409456328643706881','vue布局设计-子表模板','pc_vue','subTableFormOverallArrangement','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div ${vueGenerator.getDivVIf(relation)}>\n	<div class=\"ibox-title\"><span class=\"title\">${group.comment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath(relation)}\"> \n		<div class=\"col-xs-12 panel-heading\">\n			${getOne2ManyChild(relation)}\n			<ab-sub-del  class=\"btn btn-danger btn-sm fa fa-delete\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		</div>\n		<div class=\"panel-body\">\n		<#list group.columnList as groupColumn>\n			<div class=\"col-xs-${12/groupColumn.row} form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n				<label class=\"form-item-label\">${groupColumn.comment}</label>\n				<div class=\"form-item-content\">${vueGenerator.getColumn(group,groupColumn)}</div>\n			</div>\n		</#list>\n		</div>\n	</ab-sub-scope>\n	</div>\n</div>\n\n<#function getOne2ManyChild relation>\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		 <div class=\"pull-left\">\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"btn btn-primary btn-sm fa fa-detail\"  v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\"  dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</div>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n','当业务对象配置过 布局设计后、会使用该模板-子表',0,'vueFormOverallArrangementSub'),('409456328644755457','vue布局设计-Panel样式模板','pc_vue','mainFormOverallArrangement','<#if group.hasTitle()>\n<div class=\"panel panel-default\">\n<div class=\"panel-heading\">${group.comment} </div>\n</#if>\n<div class=\"panel-body\">\n ${One2OneChildsOne2ManyRelations(group)}\n	<#list group.columnList as groupColumn>\n	<div class=\"col-xs-${12/groupColumn.row} form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n        <label class=\"form-item-label\">${groupColumn.comment}</label>\n        <div class=\"form-item-content\"> ${vueGenerator.getColumn(group,groupColumn)} </div>\n    </div>\n	</#list>\n</div>\n<#if group.hasTitle()>\n</div>\n</#if>\n<#function One2OneChildsOne2ManyRelations group> \n	<#assign relationList = group.getOne2OneChildsOne2ManyRelations()>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		 <div class=\"col-xs-12\">\n		<#list relationList as relation>\n            <ab-sub-detail class=\"btn btn-link btn-sm fa fa-detail\"  v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\" dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\"  v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</div>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n\n ','当业务对象配置过 布局设计后、会使用该模板-主表',0,'vueFormOverallArrangementPanelMain'),('409456328645804033','vue布局设计-Panel样式模板','pc_vue','subTableFormOverallArrangement','<div ${vueGenerator.getSubAttrs(relation)} v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >\n	<div ${vueGenerator.getDivVIf(relation)} class=\"panel panel-default\">\n	<div class=\"panel-heading\"><span class=\"title\">${group.comment}</span>\n		<ab-sub-add href=\"javascript:void(0)\" class=\"btn btn-primary btn-sm fa fa-plus\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:init-data=\"initData.${relation.busObj.key}.${relation.tableKey}\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">添加 </ab-sub-add>\n	</div>\n	<ab-sub-scope v-slot=\"{permission:permission,tablePermission:tablePermission}\" :permissiona=\"permission\" :table-permissiona=\"tablePermission\" v-for=\"(${relation.tableKey},index) in ${vueGenerator.getScopePath(relation)}\"> \n		<div class=\"col-xs-12 panel-heading\">\n			${getOne2ManyChild(relation)}\n			<ab-sub-del  class=\"btn btn-danger btn-sm fa fa-delete\" v-model=\"${vueGenerator.getScopePath(relation)}\" v-bind:index=\"index\" v-ab-permission:edit=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\">移除</ab-sub-del>\n		</div>\n		<div class=\"panel-body\">\n		<#list group.columnList as groupColumn>\n			<div class=\"col-xs-${12/groupColumn.row} form-item\" v-ab-permission:show=\"permission.${relation.busObj.key}.${groupColumn.tableKey}.${groupColumn.key}\">\n				<label class=\"form-item-label\">${groupColumn.comment}</label>\n				<div class=\"form-item-content\">${vueGenerator.getColumn(group,groupColumn)}</div>\n			</div>\n		</#list>\n		</div>\n	</ab-sub-scope>\n	</div>\n</div>\n\n<#function getOne2ManyChild relation>\n	<#assign relationList = relation.getChildren(\'oneToMany\')>\n	<#assign rtn>\n		 <#if relationList?? && (relationList?size > 0) >\n		 <div class=\"pull-left\">\n		<#list relationList as relation>\n            <ab-sub-detail v-bind:sub-temp-data.sync=\"subTempData\" pkey=\"${relation.parent.tableKey}\" class=\"btn btn-primary btn-sm fa fa-detail\"  v-model=\"${vueGenerator.getScopePath(relation.parent)}<#if relation.parent.type ==\'oneToMany\'>[index]</#if>\"  dialog-id=\"${relation.getBusObj().getKey()}-${relation.tableKey}\" v-ab-permission:show=\"tablePermission.${relation.busObj.key}.${relation.tableKey}\" >${relation.tableComment}详情</ab-sub-detail>\n		</#list>\n		</div>\n		</#if>\n	</#assign>\n	<#return rtn>\n</#function>\n','当业务对象配置过 布局设计后、会使用该模板-子表',0,'vueFormOverallArrangementPanelSub');
/*!40000 ALTER TABLE `form_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_group`
--

DROP TABLE IF EXISTS `org_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_group` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) NOT NULL COMMENT '名字',
  `parent_id_` varchar(64) DEFAULT NULL COMMENT '父ID',
  `sn_` int(11) DEFAULT '100' COMMENT '排序',
  `code_` varchar(64) NOT NULL,
  `type_` varchar(64) DEFAULT NULL COMMENT '类型：0集团，1公司，3部门',
  `desc_` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `path_` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `parent_id_` (`parent_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_group`
--

LOCK TABLES `org_group` WRITE;
/*!40000 ALTER TABLE `org_group` DISABLE KEYS */;
INSERT INTO `org_group` VALUES ('1','敏捷工作流程','0',1,'htrj','0',NULL,NULL,NULL,'2018-12-30 20:57:27','1',NULL),('20000000280001','科技部','20000003450003',3,'kjb','3',NULL,NULL,NULL,'2018-12-30 20:57:43','1',NULL),('20000000280002','销售部','20000003450003',2,'xsb','3',NULL,NULL,NULL,'2018-12-30 20:57:34','1',NULL),('20000003450003','深圳分公司','1',NULL,'711','1',NULL,NULL,NULL,'2018-12-30 20:57:17','1',NULL);
/*!40000 ALTER TABLE `org_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_relation`
--

DROP TABLE IF EXISTS `org_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_relation` (
  `id_` varchar(64) NOT NULL COMMENT 'ID',
  `group_id_` varchar(64) DEFAULT NULL COMMENT '组ID',
  `user_id_` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `is_master_` int(11) DEFAULT '0' COMMENT '0:默认组织，1：从组织',
  `role_id_` varchar(64) DEFAULT NULL COMMENT '角色ID',
  `status_` int(11) DEFAULT '1' COMMENT '状态：1启用，2禁用',
  `type_` varchar(64) DEFAULT NULL COMMENT '类型：groupUser,groupRole,userRole,groupUserRole',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id_`),
  KEY `FK_reference_21` (`user_id_`) USING BTREE,
  KEY `FK_reference_22` (`group_id_`) USING BTREE,
  KEY `FK_reference_23` (`role_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_relation`
--

LOCK TABLES `org_relation` WRITE;
/*!40000 ALTER TABLE `org_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `org_relation_view`
--

DROP TABLE IF EXISTS `org_relation_view`;
/*!50001 DROP VIEW IF EXISTS `org_relation_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `org_relation_view` AS SELECT 
 1 AS `groupName`,
 1 AS `userName`,
 1 AS `roleName`,
 1 AS `postName`,
 1 AS `postId`,
 1 AS `id_`,
 1 AS `group_id_`,
 1 AS `user_id_`,
 1 AS `is_master_`,
 1 AS `role_id_`,
 1 AS `status_`,
 1 AS `type_`,
 1 AS `create_time_`,
 1 AS `create_by_`,
 1 AS `update_time_`,
 1 AS `update_by_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `org_role`
--

DROP TABLE IF EXISTS `org_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_role` (
  `id_` varchar(64) NOT NULL,
  `name_` varchar(64) NOT NULL COMMENT '角色名称',
  `alias_` varchar(64) NOT NULL COMMENT '别名',
  `enabled_` int(11) NOT NULL DEFAULT '1' COMMENT '0：禁用，1：启用',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `type_id_` varchar(64) DEFAULT NULL COMMENT '分类ID',
  `type_name_` varchar(64) DEFAULT NULL COMMENT '分类名字',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_role`
--

LOCK TABLES `org_role` WRITE;
/*!40000 ALTER TABLE `org_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id_` varchar(64) NOT NULL,
  `fullname_` varchar(255) NOT NULL COMMENT '姓名',
  `account_` varchar(255) NOT NULL COMMENT '账号',
  `password_` varchar(64) NOT NULL COMMENT '密码',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `mobile_` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `weixin_` varchar(64) DEFAULT NULL COMMENT '微信号',
  `address_` varchar(512) DEFAULT NULL COMMENT '地址',
  `photo_` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_` varchar(10) DEFAULT NULL COMMENT '性别：男，女，未知',
  `from_` varchar(64) DEFAULT NULL COMMENT '来源',
  `status_` int(11) NOT NULL DEFAULT '1' COMMENT '0:禁用，1正常',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by_` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id_`),
  KEY `account` (`account_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
INSERT INTO `org_user` VALUES ('1','系统管理员','admin','a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=','for_office@qq.com','11111111','test','test',NULL,'未知','system',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authorization`
--

DROP TABLE IF EXISTS `sys_authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authorization` (
  `rights_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `rights_object_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '授权对象表分区用',
  `rights_target_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '授权目标ID',
  `rights_type_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '权限类型',
  `rights_identity_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '授权标识',
  `rights_identity_name_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标识名字',
  `rights_permission_code_` varchar(125) COLLATE utf8_bin NOT NULL COMMENT '授权code=identity+type',
  `rights_create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `rights_create_by_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  PRIMARY KEY (`rights_id_`),
  KEY `idx_permission_code_` (`rights_permission_code_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通用资源授权配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorization`
--

LOCK TABLES `sys_authorization` WRITE;
/*!40000 ALTER TABLE `sys_authorization` DISABLE KEYS */;
INSERT INTO `sys_authorization` VALUES ('10000054820143','WORKBENCH','10000053631203','all','user','所有人','user-all','2018-04-09 16:10:47','1'),('10000054820144','WORKBENCH','10000053631202','all','user','所有人','user-all','2018-04-09 16:10:58','1'),('10000054820146','WORKBENCH','10000051360122','all','user','所有人','user-all','2018-04-09 16:11:35','1'),('10000054820147','WORKBENCH','10000049030124','all','user','所有人','user-all','2018-04-09 16:11:41','1'),('10000054820148','WORKBENCH','10000047970167','all','user','所有人','user-all','2018-04-09 16:11:47','1'),('10000055210122','WORKBENCH','10000053631205','all','user','所有人','user-all','2018-04-09 17:30:50','1'),('10000055980295','WORKBENCH','10000053631201','all','user','所有人','user-all','2018-04-10 14:40:54','1');
/*!40000 ALTER TABLE `sys_authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_dict`
--

DROP TABLE IF EXISTS `sys_data_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_data_dict` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `parent_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '上级id',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'key',
  `name_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'name',
  `dict_key_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '字典key',
  `type_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分组id',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `dict_type_` varchar(10) COLLATE utf8_bin NOT NULL COMMENT 'dict/node字典项',
  `delete_flag_` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否删除',
  `create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_dict`
--

LOCK TABLES `sys_data_dict` WRITE;
/*!40000 ALTER TABLE `sys_data_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_data_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_source`
--

DROP TABLE IF EXISTS `sys_data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_data_source` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名称',
  `desc_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源的描述',
  `db_type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库类型',
  `class_path_` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源全路径',
  `attributes_json_` text COLLATE utf8_bin COMMENT '属性配置',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_source`
--

LOCK TABLES `sys_data_source` WRITE;
/*!40000 ALTER TABLE `sys_data_source` DISABLE KEYS */;
INSERT INTO `sys_data_source` VALUES ('1','dataSourceDefault','本地数据源','本地数据源','mysql',NULL,NULL);
/*!40000 ALTER TABLE `sys_data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_source_def`
--

DROP TABLE IF EXISTS `sys_data_source_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_data_source_def` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名称',
  `class_path_` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源全路径',
  `attributes_json_` text COLLATE utf8_bin COMMENT '属性配置',
  PRIMARY KEY (`id_`),
  KEY `class_path_unique` (`class_path_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据源模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_source_def`
--

LOCK TABLES `sys_data_source_def` WRITE;
/*!40000 ALTER TABLE `sys_data_source_def` DISABLE KEYS */;
INSERT INTO `sys_data_source_def` VALUES ('1','DruidDataSource数据源','com.alibaba.druid.pool.DruidDataSource','[{\"comment\":\"url\",\"name\":\"url\",\"required\":true,\"type\":\"java.lang.String\"},{\"comment\":\"username\",\"name\":\"username\",\"required\":true,\"type\":\"java.lang.String\"},{\"comment\":\"password\",\"name\":\"password\",\"required\":true,\"type\":\"java.lang.String\"},{\"comment\":\"initialSize\",\"defaultValue\":\"1\",\"name\":\"initialSize\",\"required\":true,\"type\":\"int\"},{\"comment\":\"minIdle\",\"defaultValue\":\"10\",\"name\":\"minIdle\",\"required\":true,\"type\":\"int\"},{\"comment\":\"maxActive\",\"defaultValue\":\"10\",\"name\":\"maxActive\",\"required\":true,\"type\":\"int\"},{\"comment\":\"maxWait\",\"defaultValue\":\"6000\",\"name\":\"maxWait\",\"required\":true,\"type\":\"long\"},{\"comment\":\"timeBetweenEvictionRunsMillis\",\"defaultValue\":\"6000\",\"name\":\"timeBetweenEvictionRunsMillis\",\"required\":true,\"type\":\"long\"},{\"comment\":\"minEvictableIdleTimeMillis\",\"defaultValue\":\"30000\",\"name\":\"minEvictableIdleTimeMillis\",\"required\":true,\"type\":\"long\"},{\"comment\":\"连接失败后是否不再尝试\",\"defaultValue\":\"true\",\"name\":\"breakAfterAcquireFailure\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"校验sql\",\"defaultValue\":\"\",\"name\":\"validationQuery\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"testWhileIdle\",\"defaultValue\":\"true\",\"name\":\"testWhileIdle\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"testOnBorrow\",\"defaultValue\":\"false\",\"name\":\"testOnBorrow\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"testOnReturn\",\"defaultValue\":\"false\",\"name\":\"testOnReturn\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"poolPreparedStatements\",\"defaultValue\":\"true\",\"name\":\"poolPreparedStatements\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"maxPoolPreparedStatementPerConnectionSize\",\"defaultValue\":\"20\",\"name\":\"maxPoolPreparedStatementPerConnectionSize\",\"required\":true,\"type\":\"int\"},{\"comment\":\"filters\",\"defaultValue\":\"stat\",\"name\":\"filters\",\"required\":true,\"type\":\"java.lang.String\"},{\"comment\":\"removeAbandoned\",\"defaultValue\":\"true\",\"name\":\"removeAbandoned\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"removeAbandonedTimeout\",\"defaultValue\":\"2880\",\"name\":\"removeAbandonedTimeout\",\"required\":true,\"type\":\"int\"},{\"comment\":\"logAbandoned\",\"defaultValue\":\"true\",\"name\":\"logAbandoned\",\"required\":true,\"type\":\"boolean\"},{\"comment\":\"enable\",\"name\":\"enable\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"logDifferentThread\",\"name\":\"logDifferentThread\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"useGlobalDataSourceStat\",\"name\":\"useGlobalDataSourceStat\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"reStatEnable\",\"name\":\"reStatEnable\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"name\",\"name\":\"name\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"logWriter\",\"name\":\"logWriter\",\"required\":false,\"type\":\"java.io.PrintWriter\"},{\"comment\":\"loginTimeout\",\"name\":\"loginTimeout\",\"required\":false,\"type\":\"int\"},{\"comment\":\"maxIdle\",\"name\":\"maxIdle\",\"required\":false,\"type\":\"int\"},{\"comment\":\"failFast\",\"name\":\"failFast\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"dbType\",\"name\":\"dbType\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"queryTimeout\",\"name\":\"queryTimeout\",\"required\":false,\"type\":\"int\"},{\"comment\":\"proxyFilters\",\"name\":\"proxyFilters\",\"required\":false,\"type\":\"java.util.List\"},{\"comment\":\"oracle\",\"name\":\"oracle\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"useUnfairLock\",\"name\":\"useUnfairLock\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"timeBetweenLogStatsMillis\",\"name\":\"timeBetweenLogStatsMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"clearFiltersEnable\",\"name\":\"clearFiltersEnable\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"notFullTimeoutRetryCount\",\"name\":\"notFullTimeoutRetryCount\",\"required\":false,\"type\":\"int\"},{\"comment\":\"maxWaitThreadCount\",\"name\":\"maxWaitThreadCount\",\"required\":false,\"type\":\"int\"},{\"comment\":\"phyTimeoutMillis\",\"name\":\"phyTimeoutMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"maxEvictableIdleTimeMillis\",\"name\":\"maxEvictableIdleTimeMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"driverClassName\",\"name\":\"driverClassName\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"transactionQueryTimeout\",\"name\":\"transactionQueryTimeout\",\"required\":false,\"type\":\"int\"},{\"comment\":\"exceptionSorterClassName\",\"name\":\"exceptionSorterClassName\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"defaultAutoCommit\",\"name\":\"defaultAutoCommit\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"defaultReadOnly\",\"name\":\"defaultReadOnly\",\"required\":false,\"type\":\"java.lang.Boolean\"},{\"comment\":\"defaultTransactionIsolation\",\"name\":\"defaultTransactionIsolation\",\"required\":false,\"type\":\"java.lang.Integer\"},{\"comment\":\"statLoggerClassName\",\"name\":\"statLoggerClassName\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"connectionProperties\",\"name\":\"connectionProperties\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"transactionThresholdMillis\",\"name\":\"transactionThresholdMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"useOracleImplicitCache\",\"name\":\"useOracleImplicitCache\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"useLocalSessionState\",\"name\":\"useLocalSessionState\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"dupCloseLogEnable\",\"name\":\"dupCloseLogEnable\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"connectionErrorRetryAttempts\",\"name\":\"connectionErrorRetryAttempts\",\"required\":false,\"type\":\"int\"},{\"comment\":\"sharePreparedStatements\",\"name\":\"sharePreparedStatements\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"timeBetweenConnectErrorMillis\",\"name\":\"timeBetweenConnectErrorMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"maxOpenPreparedStatements\",\"name\":\"maxOpenPreparedStatements\",\"required\":false,\"type\":\"int\"},{\"comment\":\"removeAbandonedTimeoutMillis\",\"name\":\"removeAbandonedTimeoutMillis\",\"required\":false,\"type\":\"long\"},{\"comment\":\"validationQueryTimeout\",\"name\":\"validationQueryTimeout\",\"required\":false,\"type\":\"int\"},{\"comment\":\"defaultCatalog\",\"name\":\"defaultCatalog\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"passwordCallbackClassName\",\"name\":\"passwordCallbackClassName\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"exceptionSorter\",\"name\":\"exceptionSorter\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"asyncCloseConnectionEnable\",\"name\":\"asyncCloseConnectionEnable\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"maxCreateTaskCount\",\"name\":\"maxCreateTaskCount\",\"required\":false,\"type\":\"int\"},{\"comment\":\"validConnectionCheckerClassName\",\"name\":\"validConnectionCheckerClassName\",\"required\":false,\"type\":\"java.lang.String\"},{\"comment\":\"accessToUnderlyingConnectionAllowed\",\"name\":\"accessToUnderlyingConnectionAllowed\",\"required\":false,\"type\":\"boolean\"},{\"comment\":\"numTestsPerEvictionRun\",\"name\":\"numTestsPerEvictionRun\",\"required\":false,\"type\":\"int\"}]');
/*!40000 ALTER TABLE `sys_data_source_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '附件名',
  `uploader_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '上传器',
  `path_` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人ID',
  `update_time_` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人ID',
  `version_` int(11) DEFAULT NULL COMMENT '版本号',
  `delete_` tinyint(4) DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log_err`
--

DROP TABLE IF EXISTS `sys_log_err`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log_err` (
  `id_` varchar(50) NOT NULL COMMENT '主键',
  `account_` varchar(20) DEFAULT NULL COMMENT '帐号',
  `ip_` varchar(20) DEFAULT NULL COMMENT 'IP来源',
  `ip_address_` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `status_` varchar(64) DEFAULT NULL COMMENT '状态：unchecked，checked，fixed',
  `url_` varchar(1500) DEFAULT NULL COMMENT '错误URL',
  `content_` text COMMENT '出错信息',
  `request_param_` text COMMENT '请求参数',
  `create_time_` datetime DEFAULT NULL COMMENT '出错时间',
  `stack_trace_` longtext COMMENT '出错异常堆栈',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log_err`
--

LOCK TABLES `sys_log_err` WRITE;
/*!40000 ALTER TABLE `sys_log_err` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log_err` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_properties`
--

DROP TABLE IF EXISTS `sys_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_properties` (
  `id_` varchar(64) NOT NULL COMMENT 'ID',
  `name_` varchar(64) DEFAULT NULL COMMENT '属性名',
  `alias_` varchar(64) DEFAULT NULL COMMENT '别名',
  `group_` varchar(64) DEFAULT NULL COMMENT '分组',
  `value_` varchar(500) DEFAULT NULL COMMENT '值',
  `encrypt_` int(11) DEFAULT NULL COMMENT '是否加密',
  `update_by_` varchar(64) DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `create_by_` varchar(64) DEFAULT NULL,
  `create_time_` datetime DEFAULT NULL,
  `description_` varchar(500) DEFAULT NULL,
  `environment_` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_properties`
--

LOCK TABLES `sys_properties` WRITE;
/*!40000 ALTER TABLE `sys_properties` DISABLE KEYS */;
INSERT INTO `sys_properties` VALUES ('405118036023705601','s.k','s.k','系统参数','4be760472d0af535a9897b26eca0d7086189e7823617842980412ce08a66ed40',0,'1','2019-05-14 12:46:12',NULL,'2018-12-21 22:31:04','','DEV'),('6','系统管理员','admin.account','系统参数','admin',0,'1','2018-12-30 22:09:52',NULL,NULL,'系统管理员','DEV');
/*!40000 ALTER TABLE `sys_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_res_role`
--

DROP TABLE IF EXISTS `sys_res_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_res_role` (
  `ID_` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键',
  `SYSTEM_ID_` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '系统ID',
  `res_id_` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源ID',
  `role_id_` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色资源分配';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_res_role`
--

LOCK TABLES `sys_res_role` WRITE;
/*!40000 ALTER TABLE `sys_res_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_res_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource` (
  `ID_` varchar(64) NOT NULL COMMENT '主键',
  `system_id_` varchar(64) DEFAULT NULL COMMENT '子系统ID',
  `alias_` varchar(64) DEFAULT NULL COMMENT '别名',
  `name_` varchar(64) DEFAULT NULL COMMENT '名字',
  `url_` varchar(120) DEFAULT NULL COMMENT '请求地址',
  `enable_` int(11) DEFAULT NULL COMMENT '显示到菜单(1,显示,0 ,不显示)',
  `opened_` int(11) DEFAULT NULL COMMENT '是否默认打开',
  `icon_` varchar(50) DEFAULT NULL COMMENT '图标',
  `type_` varchar(50) DEFAULT NULL COMMENT 'menu，button，link',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `parent_id_` varchar(50) DEFAULT NULL COMMENT '父节点ID',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` VALUES ('1','1','personOffice','个人办公','',1,1,'slideshare','menu',1,'0',NULL),('1000000071000','1','taskList','任务列表','bpm/task/taskList.html',1,1,'','menu',1,'10000000710005','2016-11-16 20:04:26'),('10000000710005','1','newFlow','流程管理',NULL,1,1,'','menu',1,'0','2016-11-16 19:57:50'),('10000000710006','1','list','流程列表','bpm/definition/definitionList.html',1,1,'','menu',1,'10000000710005','2016-11-16 20:04:26'),('10000001480006','1','sysres','资源管理','sys/sysResource/sysResourceList.html',1,1,'','menu',1,'44','2017-03-16 23:52:15'),('10000001640004','1','formCustDialogList','自定义对话框','form/formCustDialog/formCustDialogList.html',1,1,'','menu',2,'56','2017-04-05 23:38:15'),('10000001640007','1','combinDialog','组合对话框','/form/combinateDialog/combinateDialogList',0,1,'','menu',2,'56','2017-04-05 23:39:58'),('10000034500201','1','gjjjr','国家节假日','sys/holidayConf/holidayConfList.html',1,1,'','menu',1,'44','2018-01-18 19:26:18'),('10000045331201','1','rcb','我的日程','sys/schedule/scheduleDisplay.html',1,1,'','menu',6,'1','2018-01-31 15:10:48'),('10000047101201','1','rcgl','日程管理','sys/schedule/scheduleList.html',1,1,'','menu',6,'1','2018-02-02 10:56:44'),('10000052971201','1','gztgl','工作台管理','sys/workbenchPanel/workbenchPanelList.html',1,1,'','menu',2,'44','2018-02-28 14:52:46'),('11','1','myDraft','我的草稿','bpm/my/draftList.html',1,1,'','menu',1,'7',NULL),('18','1','orgManager','用户组织','',1,1,'users','menu',1,'0',NULL),('19','1','userManager','用户管理','org/user/userList.html',1,1,'','menu',1,'18',NULL),('2','1','flowEvent','事项办理','',1,1,'','menu',1,'1',NULL),('20','1','orgMgr','组织管理','org/group/groupList.html',1,1,'','menu',1,'18',NULL),('20000001570004','1','sysDataSourceDefList','系统数据源模板','sys/sysDataSourceDef/sysDataSourceDefList.html',1,1,'','menu',1,'44','2018-02-27 15:50:44'),('20000002880001','1','sysTreeList','系统树','sys/sysTree/sysTreeList.html',1,1,'','menu',3,'56','2018-03-19 14:51:32'),('20000002980001','1','copeTask','我的抄送',NULL,0,1,'','menu',1,'2','2018-03-25 19:07:18'),('20000003070153','1','processInstanceList','流程实例','bpm/instance/instanceList.html',1,1,'','menu',1,'10000000710005','2018-03-18 17:01:06'),('20000010520001','1','myTodo','待办事项','bpm/my/todoTaskList.html',1,1,'','menu',1,'2',NULL),('21','1','roleMgr','角色管理','org/role/roleList.html',1,1,'','menu',1,'18',NULL),('23','1','flowManager','表单管理','',1,1,'','menu',1,'0',NULL),('25','1','boManager','业务对象','',1,1,'fa-database','menu',1,'23',NULL),('26','1','businessTableList','业务实体','bus/businessTable/businessTableList.html',1,1,'','menu',1,'25',NULL),('27','1','businessObjectList','业务对象','bus/buinessObject/businessObjectList.html',1,1,'','menu',1,'25',NULL),('28','1','formDefManager','表单定义','',1,1,'fa-th-list','menu',1,'23',NULL),('30','1','boForm','业务表单','form/formDef/formDefList.html?formType=pc_iview',0,1,'','menu',1,'28',NULL),('31','1','mobileForm','手机表单','form/formDef/formDefList.html?formType=mobile',1,1,'','menu',1,'28',NULL),('32','1','formTemplate','表单模版','form/formTemplate/formTemplateList.html',1,1,'','menu',1,'28',NULL),('33','1','vueForm','vue表单','form/formDef/formDefList.html?formType=pc_vue',1,1,'','menu',0,'28',NULL),('4','1','myHandledEvent','办理历史','bpm/my/approveList.html',1,1,'','menu',1,'2',NULL),('403205519290925057','1','errLog','异常日志','sys/sysLogErr/sysLogErrList.html',1,1,'','menu',5,'56',NULL),('404802617380700161','3','11111','111',NULL,1,1,'','menu',1,'0',NULL),('404818977800323073','1','icon','字体图标','sys/icon/iconSelector.html',1,1,'','menu',9,'56',NULL),('405244952846008321','1','userManager:add','添加','/org/user/save',1,1,'','button',1,'19',NULL),('405244965276614657','1','userManager:edit','编辑','/org/user/save',1,1,'','button',1,'19',NULL),('405245052357181441','1','userManager:del','删除','/org/user/remove',1,1,'','button',1,'19','2018-12-27 13:06:33'),('405313955925590017','1','userManager:search','搜索','/org/user/listJson',1,1,'','button',1,'19','2018-12-30 14:07:19'),('406714104337661953','1','userAgencyLogList','代理记录','bpmplugin/userAgencyConfig/userAgencyLogList.html',1,1,'','menu',6,'7',NULL),('406714125032357889','1','userAgencyConfig','流程代理','bpmplugin/userAgencyConfig/tabs.html',1,1,'','menu',5,'7',NULL),('406719341437911041','1','instanceList','流程实例-部门','bpm/instance/instanceList_org.html',1,1,'','menu',6,'10000000710005',NULL),('406902948342530049','2','userOrg','用户组织','',1,1,'','menu',1,'0',NULL),('406902978254209025','2','userManager','用户管理','org/userList',1,1,'','menu',1,'406902948342530049',NULL),('406902988961480705','2','orgManager','组织管理','org/groupList',1,1,'','menu',1,'406902948342530049',NULL),('406903009770733569','2','roleManager','角色管理','/org/roleList',1,1,'','menu',1,'406902948342530049',NULL),('406903052897091585','2','userOffice','个人办公',NULL,1,1,'','menu',1,'0',NULL),('406903063443144705','2','mattersHandling','事项办理',NULL,1,1,'','menu',1,'406903052897091585',NULL),('406903071843287041','2','todoTaskList','待办事项','/bpm/my/todoTaskList',1,1,'','menu',1,'406903063443144705',NULL),('406903080497709057','2','approveHistoryList','办理历史','/bpm/my/approveList',1,1,'','menu',1,'406903063443144705',NULL),('407371267579052033','2','mattersApply','事项申请',NULL,1,1,'','menu',2,'406903052897091585',NULL),('407371280996368385','2','myDraft','我的草稿','/bpm/my/draftList',1,1,'','menu',2,'407371267579052033',NULL),('407371284953432065','2','startFlow','发起申请','bpm/my/definitionList',1,1,'','menu',1,'407371267579052033',NULL),('407371291024424961','2','applyHistory','申请历史','/bpm/my/applyTaskList',1,1,'','menu',3,'407371267579052033',NULL),('43','1','sysSetting','系统配置','',1,1,'cogs','menu',1,'0',NULL),('44','1','systemMgr','系统设置','',1,1,'','menu',1,'43',NULL),('46','1','dicManager','数据字典','sys/dataDict/dataDictList.html',1,1,'','menu',1,'44',NULL),('49','1','syspropertyMgr','系统属性管理','sys/sysProperties/sysPropertiesList.html',1,1,'','menu',1,'44',NULL),('50','1','sysDataSourceList','系统数据源','sys/sysDataSource/sysDataSourceList.html',1,1,'','menu',1,'44',NULL),('54','1','subSystemMgr','子系统管理','/base/base/subsystem/subsystemList',0,1,'','menu',1,'44',NULL),('56','1','flowAssist','开发辅助','',1,1,'','menu',1,'43',NULL),('60','1','serialNoMgr','流水号','sys/serialNo/serialNoList.html',1,1,'','menu',1,'56',NULL),('61','1','scriptMgr','常用脚本','sys/script/scriptList.html',1,1,'','menu',1,'56',NULL),('7','1','myStartEvent','事项申请','',1,1,'','menu',1,'1',NULL),('8','1','myStartFlow','发起申请','bpm/my/definitionList.html',1,1,'','menu',1,'7',NULL),('9','1','myRequest','申请历史','bpm/my/applyTaskList.html',1,1,'','menu',1,'7',NULL);
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '脚本名称',
  `script_` text COLLATE utf8_bin COMMENT '脚本',
  `category_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '脚本分类',
  `memo_` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='常用脚本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_script`
--

LOCK TABLES `sys_script` WRITE;
/*!40000 ALTER TABLE `sys_script` DISABLE KEYS */;
INSERT INTO `sys_script` VALUES ('10000000000001','获取流水号','sysScript.getNextSerialNo(\"流水号Alias\");','系统内置','获取流水号'),('10000000000002','获取当前用户信息','sysScript.getCurrentUser().getFullname()','系统内置','获取用户的某一个属性'),('20000000570001','获取当前组织ID','import com.dstz.sys.util.ContextUtil;\n\nreturn ContextUtil.getCurrentGroupId();','系统内置','通过引入静态方法来调用系统脚本，这样不需要实现Iscript脚本 。');
/*!40000 ALTER TABLE `sys_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_serialno`
--

DROP TABLE IF EXISTS `sys_serialno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_serialno` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `name_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `alias_` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `regulation_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '规则',
  `gen_type_` smallint(6) DEFAULT NULL COMMENT '生成类型',
  `no_length_` int(11) DEFAULT NULL COMMENT '流水号长度',
  `cur_date_` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '当前日期',
  `init_value_` int(11) DEFAULT NULL COMMENT '初始值',
  `cur_value_` int(11) DEFAULT NULL COMMENT '当前值',
  `step_` smallint(6) DEFAULT NULL COMMENT '步长',
  PRIMARY KEY (`id_`),
  KEY `idx_uni_alias_val` (`alias_`,`cur_value_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流水号生成';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_serialno`
--

LOCK TABLES `sys_serialno` WRITE;
/*!40000 ALTER TABLE `sys_serialno` DISABLE KEYS */;
INSERT INTO `sys_serialno` VALUES ('10000001620002','每天使用一组流水号','dayNo','{yyyy}{MM}{DD}{NO}',1,5,'20180710',1,1,1);
/*!40000 ALTER TABLE `sys_serialno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_subsystem`
--

DROP TABLE IF EXISTS `sys_subsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_subsystem` (
  `id_` varchar(64) NOT NULL COMMENT '主键',
  `name_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '系统名称',
  `alias_` varchar(64) DEFAULT NULL COMMENT '系统别名',
  `url_` varchar(500) DEFAULT NULL COMMENT '子系统地址，空则为当前系统',
  `open_type_` varchar(64) DEFAULT NULL COMMENT '打开方式',
  `enabled_` int(11) DEFAULT NULL COMMENT '是否可用 1 可用，0 ，不可用',
  `create_time_` datetime DEFAULT NULL COMMENT '创建时间',
  `is_default_` int(11) DEFAULT NULL COMMENT '是否默认 1 可用，0 ，不可用',
  `desc_` varchar(500) DEFAULT NULL,
  `config_` varchar(2000) DEFAULT NULL,
  `create_by_` varchar(64) DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `update_by_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子系统定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_subsystem`
--

LOCK TABLES `sys_subsystem` WRITE;
/*!40000 ALTER TABLE `sys_subsystem` DISABLE KEYS */;
INSERT INTO `sys_subsystem` VALUES ('1','业务流程设计开发平台','agilebpm',NULL,NULL,1,NULL,1,'主系统','用于系统特殊配置',NULL,NULL,NULL),('2','门户平台','eip','http://localhost:8081/#/','_blank',1,NULL,0,'子系统','用于系统特殊配置',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_subsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tree`
--

DROP TABLE IF EXISTS `sys_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_tree` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `name_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `system_` tinyint(4) DEFAULT NULL COMMENT '是否系统内置树',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `key_unique_` (`key_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统树';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tree`
--

LOCK TABLES `sys_tree` WRITE;
/*!40000 ALTER TABLE `sys_tree` DISABLE KEYS */;
INSERT INTO `sys_tree` VALUES ('20000002810002','ywbfl','业务表分类','业务表分类的树',1),('20000002900001','ywdxfl','业务对象分类','业务对象分类树',1),('20000002960002','bdfl','表单分类','表单分类',1),('20000007060001','dict','数据字典分类','数据字典',1),('20000008980001','flow','流程分类',NULL,1);
/*!40000 ALTER TABLE `sys_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tree_node`
--

DROP TABLE IF EXISTS `sys_tree_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_tree_node` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `key_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `name_` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `desc_` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `tree_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属树id',
  `parent_id_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父ID',
  `path_` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '路径 eg:pppid.ppid.pid',
  `sn_` tinyint(4) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id_`),
  UNIQUE KEY `tree_id_key_unique_` (`key_`,`tree_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统树节点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tree_node`
--

LOCK TABLES `sys_tree_node` WRITE;
/*!40000 ALTER TABLE `sys_tree_node` DISABLE KEYS */;
INSERT INTO `sys_tree_node` VALUES ('20000002810003','mrfl','默认分类',NULL,'20000002810002','0','20000002810003.',1),('20000002900002','ywdxmrfl','业务对象默认分类',NULL,'20000002900001','0','20000002900002.',3),('20000002960003','mrfl','默认分类',NULL,'20000002960002','0','20000002960003.',4),('20000007060004','xtpz','系统配置',NULL,'20000007060001','0','20000007060004.',6),('20000007060005','khxg','客户相关',NULL,'20000007060001','0','20000007060005.',7),('20000008980003','bg','办公',NULL,'20000008980001','0','20000008980003.',7),('20000008980004','ywlc','业务流程',NULL,'20000008980001','0','20000008980004.',8);
/*!40000 ALTER TABLE `sys_tree_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_workbench_layout`
--

DROP TABLE IF EXISTS `sys_workbench_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_workbench_layout` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `panel_id_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '面板id',
  `cust_width_` int(10) DEFAULT NULL COMMENT '自定义宽',
  `cust_height_` int(10) DEFAULT NULL COMMENT '自定义高',
  `sn_` int(10) DEFAULT NULL COMMENT '排序',
  `user_id_` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id_`),
  KEY `idx_panel_id_` (`panel_id_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作台布局';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_workbench_layout`
--

LOCK TABLES `sys_workbench_layout` WRITE;
/*!40000 ALTER TABLE `sys_workbench_layout` DISABLE KEYS */;
INSERT INTO `sys_workbench_layout` VALUES ('20000004690007','10000053631203',14,183,0,'default_layout','2018-04-21 02:46:40'),('20000004690008','10000053631202',21,182,1,'default_layout','2018-04-21 02:46:40'),('20000004690009','10000053631201',24,184,2,'default_layout','2018-04-21 02:46:40'),('20000004690010','10000049030124',44,450,3,'default_layout','2018-04-21 02:46:40'),('20000004690011','10000051360122',50,446,4,'default_layout','2018-04-21 02:46:40'),('20000004690012','10000047970167',75,504,5,'default_layout','2018-04-21 02:46:40');
/*!40000 ALTER TABLE `sys_workbench_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_workbench_panel`
--

DROP TABLE IF EXISTS `sys_workbench_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_workbench_panel` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `alias_` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标识',
  `name_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '名字',
  `type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `desc_` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `data_type_` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '数据类型',
  `data_source_` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据来源',
  `auto_refresh_` int(10) DEFAULT '0' COMMENT '自动刷新',
  `width_` int(10) DEFAULT NULL COMMENT '宽',
  `height_` int(10) DEFAULT NULL COMMENT '高',
  `display_content_` text COLLATE utf8_bin COMMENT '展示内容',
  `more_url_` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '更多链接',
  `create_time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `update_time_` datetime DEFAULT NULL,
  `update_by_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `delete_flag_` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_`),
  KEY `idx_alias_` (`alias_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作台面板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_workbench_panel`
--

LOCK TABLES `sys_workbench_panel` WRITE;
/*!40000 ALTER TABLE `sys_workbench_panel` DISABLE KEYS */;
INSERT INTO `sys_workbench_panel` VALUES ('10000047970167','myCalendar','我的日程','iframe','我的日程','iframe','/sys/schedule/scheduleDisplay.html',NULL,75,504,NULL,'/sys/schedule/scheduleDisplay.html','2018-03-29 16:37:03',NULL,'2018-03-29 17:33:10',NULL,NULL),('10000049030124','list','我的待办','basic','测试','interface','bpmTaskManager.getTodoList',NULL,75,300,'<div class=\"row\">\n	<div class=\"col-sm-7 m-b-xs\">\n		<div data-toggle=\"buttons\" class=\"btn-group\">\n			<label class=\"btn btn-sm btn-default active\"> <input type=\"radio\" name=\"param.isTodo\" value=\"1\">待办</label>\n			<label class=\"btn btn-sm btn-default\"> <input type=\"radio\" name=\"param.isTodo\" value=\"2\">已办</label>\n		</div>\n	</div>\n	<div class=\"col-sm-5\">\n		<div class=\"form-inline\">\n			<input type=\"text\" placeholder=\"搜索关键字\" class=\"input-sm form-control\" ng-model=\"param.subject_\" > \n			<button type=\"button\" ng-click=\"loadPanelData()\" class=\"btn btn-sm btn-primary fa-search\"></button>\n		</div>\n	</div>\n</div>\n <div class=\"table-responsive\">\n	<table class=\"table table-striped\">\n		<thead>\n			<tr>\n				<th>任务名称</th>\n				<th>任务标题</th>\n				<th>创建时间</th>\n			</tr>\n		</thead>\n		<tbody>\n			<tr ng-repeat=\"task in list\">\n				<td>{{task.name}}</td>\n				<td><a ng-click=\"openFullWindow(\'/bpm/task/taskComplete.html?taskId=\'+this.task.id)\" >{{task.subject}}</a> </td>\n				<td>{{task.createTime}}</td>\n			</tr>\n		</tbody>\n	</table>\n</div>','/bpm/my/todoTaskList.html','2018-03-30 18:05:43',NULL,'2018-04-02 17:18:17',NULL,NULL),('10000051360122','productSales','产品销售情况','echarts','产品年度销售情况','interface','workbenchPanelManager.getTestData',NULL,50,300,'{\n	\"title\": {\n		\"text\": \"产品销售情况\"\n	},\n	\"legend\": {},\n	\"tooltip\": {},\n	\"toolbox\": {\n		\"show\": true,\n		\"feature\": {\n			\"magicType\": {\n				\"show\": true,\n				\"type\": [\"line\", \"bar\", \"stack\", \"tiled\"]\n			},\n			\"restore\": {\n				\"show\": true\n			},\n			\"saveAsImage\": {\n				\"show\": true\n			}\n		}\n	},\n	\"dataset\": {\n		\"source\": []\n	},\n	\"xAxis\": {\n		\"type\": \"category\"\n	},\n	\"yAxis\": {},\n	\"series\": []\n}',NULL,'2018-04-04 10:38:05',NULL,'2018-04-04 10:38:05',NULL,NULL),('10000052180122','getPieData','销售份额','echarts',NULL,'interface','workbenchPanelManager.getPieData',NULL,75,500,'{\n	\"title\": {\n		\"text\": \"产品销售情况\"\n	},\n	\"legend\": {},\n	\"tooltip\": {},\n	\"dataset\": {\n		\"source\": []\n	},\n	\"series\": [{\n		\"type\": \"pie\"\n	}]\n}',NULL,'2018-04-04 11:45:02',NULL,'2018-04-04 14:09:13',NULL,NULL),('10000053631201','userInfo','用户信息','basic','用户信息展示','interface','loginContext.getCurrentUser',60,25,150,'<h4 class=\"no-margins\">{{userInfo.fullname}}</h4>\n<div class=\" pull-right  text-info\">{{userInfo.account}} <i class=\"fa-user-circle-o\"></i>\n</div>\n <small>{{userInfo.email}}</small>','/org/user/userInfoEdit','2018-03-08 09:50:19',NULL,'2018-03-29 16:08:54',NULL,NULL),('10000053631202','roleInfo','角色信息','basic','用户信息展示','interface','loginContext.getCurrentUser',60,25,150,'<p class=\"text-info\">{{roleInfo.email}}</p>\n<p class=\"text-info\">{{roleInfo.weixin}}</p>\n<p class=\"text-info\">{{roleInfo.mobile}}</p>','1','2018-03-12 11:26:16',NULL,'2018-03-29 16:20:53',NULL,NULL),('10000053631203','org','当前组织','basic','用户信息展示','interface','loginContext.getCurrentGroup',NULL,25,150,'<h4 class=\"no-margins\">{{org.name}}</h4>\n<div class=\" pull-right  text-info\">{{org.code}} <i class=\"fa fa-address-card\"></i>\n</div>',NULL,'2018-03-12 11:26:21',NULL,'2018-03-29 16:13:54',NULL,NULL),('10000053631205','order','当天订单量','basic','订单量描述','interface','loginContext.getCurrentUser',NULL,25,159,'<h1 class=\"no-margins\">23,000</h1>\n<div class=\" pull-right  text-info\">20% <i class=\"fa fa-level-up\"></i>\n</div>\n <small>新订单</small>','/bims/applyOrderList/pendingV2_biz','2018-03-12 11:26:28',NULL,'2018-03-30 09:47:02',NULL,NULL);
/*!40000 ALTER TABLE `sys_workbench_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_workbench_panel_templ`
--

DROP TABLE IF EXISTS `sys_workbench_panel_templ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_workbench_panel_templ` (
  `id_` varchar(64) COLLATE utf8_bin NOT NULL,
  `key_` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模板key',
  `name_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `desc_` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '模板描述',
  `html_` text COLLATE utf8_bin COMMENT '模板内容',
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作台面板模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_workbench_panel_templ`
--

LOCK TABLES `sys_workbench_panel_templ` WRITE;
/*!40000 ALTER TABLE `sys_workbench_panel_templ` DISABLE KEYS */;
INSERT INTO `sys_workbench_panel_templ` VALUES ('1','basic','基础模板','适用基本信息展示，或者列表数据','<ul class=\"list-group\">\r\n  <li class=\"list-group-item\">{{data-alias.account}}</li>\r\n  <li class=\"list-group-item\">{{data-alias.fullname}}</li>\r\n  <li class=\"list-group-item\">{{data-alias.mobile}}</li>\r\n  <li class=\"list-group-item\">{{data-alias.orgName}}</li>\r\n  <li class=\"list-group-item\">{{data-alias.roleNames}}</li>\r\n</ul>'),('3','echarts','柱状图折线图模板','','{\r\n	\"title\": {\r\n		\"text\": \"产品销售情况\"\r\n	},\r\n	\"legend\": {},\r\n	\"tooltip\": {},\r\n	\"toolbox\": {\r\n		\"show\": true,\r\n		\"feature\": {\r\n			\"magicType\": {\r\n				\"show\": true,\r\n				\"type\": [\"line\", \"bar\", \"stack\", \"tiled\"]\r\n			},\r\n			\"restore\": {\r\n				\"show\": true\r\n			},\r\n			\"saveAsImage\": {\r\n				\"show\": true\r\n			}\r\n		}\r\n	},\r\n	\"dataset\": {\r\n		\"source\": []\r\n	},\r\n	\"xAxis\": {\r\n		\"type\": \"category\"\r\n	},\r\n	\"yAxis\": {},\r\n	\"series\": []\r\n}'),('4','basic','列表模板','列表数据的模板案例，支持检索','<div class=\"row\">\r\n	<div class=\"col-sm-7 m-b-xs\">\r\n		<div data-toggle=\"buttons\" class=\"btn-group\">\r\n			<label class=\"btn btn-sm btn-default active\"> <input type=\"radio\" name=\"param.Q_user_SL\" value=\"1\">待办</label>\r\n			<label class=\"btn btn-sm btn-default\"> <input type=\"radio\" name=\"param.Q_user_SL\" value=\"2\">已办</label>\r\n		</div>\r\n	</div>\r\n	<div class=\"col-sm-5\">\r\n		<div class=\"input-group\">\r\n			<input type=\"text\" placeholder=\"搜索订单关键字\" class=\"input-sm form-control\" ng-model=\"param.subject_\" > \r\n			<span class=\"input-group-btn\"> <button type=\"button\" ng-click=\"loadPanelData()\" class=\"btn btn-sm btn-primary\">搜索</button> </span>\r\n		</div>\r\n	</div>\r\n</div>\r\n <div class=\"table-responsive\">\r\n	<table class=\"table table-striped\">\r\n		<thead>\r\n			<tr>\r\n				<th>订单编号</th>\r\n				<th>待办事项</th>\r\n				<th>业务品种</th>\r\n				<th>客户姓名</th>\r\n				<th>创建时间</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n			<tr ng-repeat=\"task in list\">\r\n				<td>{{task.apply_no}}</td>\r\n				<td><a ng-click=\"openFullWindow(\'/flow/task/taskApprove?id=\'+this.task.ID_)\" >{{task.NAME_}}</a> </td>\r\n				<td>{{task.PROC_DEF_NAME_}}</td>\r\n				<td>{{task.seller_name}}</td>\r\n				<td>{{task.create_time}} </td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>'),('5','echarts','饼图模板','饼状图案例模板','{\r\n	\"title\": {\r\n		\"text\": \"产品销售情况\"\r\n	},\r\n	\"legend\": {},\r\n	\"tooltip\": {},\r\n	\"dataset\": {\r\n		\"source\": []\r\n	},\r\n	\"series\": [{\r\n		\"type\": \"pie\"\r\n	}]\r\n}');
/*!40000 ALTER TABLE `sys_workbench_panel_templ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `org_relation_view`
--

/*!50001 DROP VIEW IF EXISTS `org_relation_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `org_relation_view` AS select `tgroup`.`name_` AS `groupName`,`tuser`.`fullname_` AS `userName`,`role`.`name_` AS `roleName`,concat(`tgroup`.`name_`,'-',`role`.`name_`) AS `postName`,concat(`tgroup`.`id_`,'-',`role`.`id_`) AS `postId`,`relation`.`id_` AS `id_`,`relation`.`group_id_` AS `group_id_`,`relation`.`user_id_` AS `user_id_`,`relation`.`is_master_` AS `is_master_`,`relation`.`role_id_` AS `role_id_`,`relation`.`status_` AS `status_`,`relation`.`type_` AS `type_`,`relation`.`create_time_` AS `create_time_`,`relation`.`create_by_` AS `create_by_`,`relation`.`update_time_` AS `update_time_`,`relation`.`update_by_` AS `update_by_` from (((`org_relation` `relation` left join `org_user` `tuser` on((`relation`.`user_id_` = `tuser`.`id_`))) left join `org_group` `tgroup` on((`relation`.`group_id_` = `tgroup`.`id_`))) left join `org_role` `role` on((`relation`.`role_id_` = `role`.`id_`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-02  3:02:04
