-- Script generated by PLEX version 2.4.0 - more infos here: https://github.com/ogobrecht/plex
-- Performance Hacks by Connor McDonald: https://connor-mcdonald.com/2019/05/17/hacking-together-faster-inserts/
-- For strange line end replacements a big thank to SQL*Plus: https://support.oracle.com/epmos/faces/DocumentDisplay?id=2377701.1 (SQL Failed With ORA-1756 In Sqlplus But Works In SQL Developer)
prompt - insert    200 rows into DRS_ACTOR
set define off feedback off sqlblanklines on
alter session set cursor_sharing = force;
alter session set nls_numeric_characters = '.,';
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
alter session set nls_timestamp_format = 'yyyy-mm-dd hh24:mi:ssxff';
alter session set nls_timestamp_tz_format = 'yyyy-mm-dd hh24:mi:ssxff tzr';
begin
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (1,'PENELOPE','GUINESS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (2,'NICK','WAHLBERG','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (3,'ED','CHASE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (4,'JENNIFER','DAVIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (5,'JOHNNY','LOLLOBRIGIDA','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (6,'BETTE','NICHOLSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (7,'GRACE','MOSTEL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (8,'MATTHEW','JOHANSSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (9,'JOE','SWANK','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (10,'CHRISTIAN','GABLE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (11,'ZERO','CAGE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (12,'KARL','BERRY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (13,'UMA','WOOD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (14,'VIVIEN','BERGEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (15,'CUBA','OLIVIER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (16,'FRED','COSTNER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (17,'HELEN','VOIGHT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (18,'DAN','TORN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (19,'BOB','FAWCETT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (20,'LUCILLE','TRACY','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (21,'KIRSTEN','PALTROW','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (22,'ELVIS','MARX','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (23,'SANDRA','KILMER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (24,'CAMERON','STREEP','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (25,'KEVIN','BLOOM','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (26,'RIP','CRAWFORD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (27,'JULIA','MCQUEEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (28,'WOODY','HOFFMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (29,'ALEC','WAYNE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (30,'SANDRA','PECK','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (31,'SISSY','SOBIESKI','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (32,'TIM','HACKMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (33,'MILLA','PECK','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (34,'AUDREY','OLIVIER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (35,'JUDY','DEAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (36,'BURT','DUKAKIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (37,'VAL','BOLGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (38,'TOM','MCKELLEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (39,'GOLDIE','BRODY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (40,'JOHNNY','CAGE','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (41,'JODIE','DEGENERES','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (42,'TOM','MIRANDA','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (43,'KIRK','JOVOVICH','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (44,'NICK','STALLONE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (45,'REESE','KILMER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (46,'PARKER','GOLDBERG','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (47,'JULIA','BARRYMORE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (48,'FRANCES','DAY-LEWIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (49,'ANNE','CRONYN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (50,'NATALIE','HOPKINS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (51,'GARY','PHOENIX','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (52,'CARMEN','HUNT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (53,'MENA','TEMPLE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (54,'PENELOPE','PINKETT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (55,'FAY','KILMER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (56,'DAN','HARRIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (57,'JUDE','CRUISE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (58,'CHRISTIAN','AKROYD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (59,'DUSTIN','TAUTOU','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (60,'HENRY','BERRY','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (61,'CHRISTIAN','NEESON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (62,'JAYNE','NEESON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (63,'CAMERON','WRAY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (64,'RAY','JOHANSSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (65,'ANGELA','HUDSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (66,'MARY','TANDY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (67,'JESSICA','BAILEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (68,'RIP','WINSLET','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (69,'KENNETH','PALTROW','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (70,'MICHELLE','MCCONAUGHEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (71,'ADAM','GRANT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (72,'SEAN','WILLIAMS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (73,'GARY','PENN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (74,'MILLA','KEITEL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (75,'BURT','POSEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (76,'ANGELINA','ASTAIRE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (77,'CARY','MCCONAUGHEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (78,'GROUCHO','SINATRA','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (79,'MAE','HOFFMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (80,'RALPH','CRUZ','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (81,'SCARLETT','DAMON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (82,'WOODY','JOLIE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (83,'BEN','WILLIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (84,'JAMES','PITT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (85,'MINNIE','ZELLWEGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (86,'GREG','CHAPLIN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (87,'SPENCER','PECK','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (88,'KENNETH','PESCI','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (89,'CHARLIZE','DENCH','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (90,'SEAN','GUINESS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (91,'CHRISTOPHER','BERRY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (92,'KIRSTEN','AKROYD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (93,'ELLEN','PRESLEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (94,'KENNETH','TORN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (95,'DARYL','WAHLBERG','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (96,'GENE','WILLIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (97,'MEG','HAWKE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (98,'CHRIS','BRIDGES','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (99,'JIM','MOSTEL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (100,'SPENCER','DEPP','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (101,'SUSAN','DAVIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (102,'WALTER','TORN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (103,'MATTHEW','LEIGH','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (104,'PENELOPE','CRONYN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (105,'SIDNEY','CROWE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (106,'GROUCHO','DUNST','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (107,'GINA','DEGENERES','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (108,'WARREN','NOLTE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (109,'SYLVESTER','DERN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (110,'SUSAN','DAVIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (111,'CAMERON','ZELLWEGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (112,'RUSSELL','BACALL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (113,'MORGAN','HOPKINS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (114,'MORGAN','MCDORMAND','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (115,'HARRISON','BALE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (116,'DAN','STREEP','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (117,'RENEE','TRACY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (118,'CUBA','ALLEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (119,'WARREN','JACKMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (120,'PENELOPE','MONROE','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (121,'LIZA','BERGMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (122,'SALMA','NOLTE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (123,'JULIANNE','DENCH','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (124,'SCARLETT','BENING','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (125,'ALBERT','NOLTE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (126,'FRANCES','TOMEI','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (127,'KEVIN','GARLAND','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (128,'CATE','MCQUEEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (129,'DARYL','CRAWFORD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (130,'GRETA','KEITEL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (131,'JANE','JACKMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (132,'ADAM','HOPPER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (133,'RICHARD','PENN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (134,'GENE','HOPKINS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (135,'RITA','REYNOLDS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (136,'ED','MANSFIELD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (137,'MORGAN','WILLIAMS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (138,'LUCILLE','DEE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (139,'EWAN','GOODING','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (140,'WHOOPI','HURT','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (141,'CATE','HARRIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (142,'JADA','RYDER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (143,'RIVER','DEAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (144,'ANGELA','WITHERSPOON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (145,'KIM','ALLEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (146,'ALBERT','JOHANSSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (147,'FAY','WINSLET','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (148,'EMILY','DEE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (149,'RUSSELL','TEMPLE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (150,'JAYNE','NOLTE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (151,'GEOFFREY','HESTON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (152,'BEN','HARRIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (153,'MINNIE','KILMER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (154,'MERYL','GIBSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (155,'IAN','TANDY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (156,'FAY','WOOD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (157,'GRETA','MALDEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (158,'VIVIEN','BASINGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (159,'LAURA','BRODY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (160,'CHRIS','DEPP','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (161,'HARVEY','HOPE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (162,'OPRAH','KILMER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (163,'CHRISTOPHER','WEST','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (164,'HUMPHREY','WILLIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (165,'AL','GARLAND','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (166,'NICK','DEGENERES','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (167,'LAURENCE','BULLOCK','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (168,'WILL','WILSON','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (169,'KENNETH','HOFFMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (170,'MENA','HOPPER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (171,'OLYMPIA','PFEIFFER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (172,'GROUCHO','WILLIAMS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (173,'ALAN','DREYFUSS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (174,'MICHAEL','BENING','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (175,'WILLIAM','HACKMAN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (176,'JON','CHASE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (177,'GENE','MCKELLEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (178,'LISA','MONROE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (179,'ED','GUINESS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (180,'JEFF','SILVERSTONE','2006-02-15 04:34:33')
select * from dual;
insert all
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (181,'MATTHEW','CARREY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (182,'DEBBIE','AKROYD','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (183,'RUSSELL','CLOSE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (184,'HUMPHREY','GARLAND','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (185,'MICHAEL','BOLGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (186,'JULIA','ZELLWEGER','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (187,'RENEE','BALL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (188,'ROCK','DUKAKIS','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (189,'CUBA','BIRCH','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (190,'AUDREY','BAILEY','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (191,'GREGORY','GOODING','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (192,'JOHN','SUVARI','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (193,'BURT','TEMPLE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (194,'MERYL','ALLEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (195,'JAYNE','SILVERSTONE','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (196,'BELA','WALKEN','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (197,'REESE','WEST','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (198,'MARY','KEITEL','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (199,'JULIA','FAWCETT','2006-02-15 04:34:33')
into DRS_ACTOR(ACTOR_ID,FIRST_NAME,LAST_NAME,LAST_UPDATE) values (200,'THORA','TEMPLE','2006-02-15 04:34:33')
select * from dual;
end;
/
commit;
alter session set cursor_sharing = exact;

