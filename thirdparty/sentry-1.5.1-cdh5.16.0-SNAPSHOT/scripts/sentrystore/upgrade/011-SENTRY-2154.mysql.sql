CREATE TABLE `SENTRY_USER` (
	  `USER_ID` BIGINT  NOT NULL,
	  `USER_NAME` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	  `CREATE_TIME` BIGINT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `SENTRY_USER`
	 ADD CONSTRAINT `SENTRY_USER_PK` PRIMARY KEY (`USER_ID`);

ALTER TABLE `SENTRY_USER`
ADD CONSTRAINT `SENTRY_USER_USER_NAME_UNIQUE` UNIQUE (`USER_NAME`);

-- Table SENTRY_USER_DB_PRIVILEGE_MAP for join relationship
CREATE TABLE `SENTRY_USER_DB_PRIVILEGE_MAP` (
  `USER_ID` BIGINT NOT NULL,
  `DB_PRIVILEGE_ID` BIGINT NOT NULL,
  `GRANTOR_PRINCIPAL` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `SENTRY_USER_DB_PRIVILEGE_MAP`
  ADD CONSTRAINT `SENTRY_USR_DB_PRV_MAP_PK` PRIMARY KEY (`USER_ID`,`DB_PRIVILEGE_ID`);

ALTER TABLE `SENTRY_USER_DB_PRIVILEGE_MAP`
  ADD CONSTRAINT `SEN_USR_DB_PRV_MAP_SN_USR_FK`
  FOREIGN KEY (`USER_ID`) REFERENCES `SENTRY_USER`(`USER_ID`);

ALTER TABLE `SENTRY_USER_DB_PRIVILEGE_MAP`
  ADD CONSTRAINT `SEN_USR_DB_PRV_MAP_DB_PRV_FK`
  FOREIGN KEY (`DB_PRIVILEGE_ID`) REFERENCES `SENTRY_DB_PRIVILEGE`(`DB_PRIVILEGE_ID`);

CREATE INDEX `SEN_USR_DB_PRV_MAP_USR_FK_IDX` ON `SENTRY_USER_DB_PRIVILEGE_MAP` (`USER_ID`);

CREATE INDEX `SEN_USR_DB_PRV_MAP_PRV_FK_IDX` ON `SENTRY_USER_DB_PRIVILEGE_MAP` (`DB_PRIVILEGE_ID`);