/* 초기 직책 데이터 */
INSERT INTO `antpeople`.`role`(`role_id`,`role`) VALUES(100, '관리자');
INSERT INTO `antpeople`.`role`(`role_id`,`role`) VALUES(101, '사장');
INSERT INTO `antpeople`.`role`(`role_id`,`role`) VALUES(102, '직원');


/* 초기 지점 데이터 */
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(100,'관리자');
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(101,'둔산점');
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(102,'월평점');
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(103,'관저점');
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(104,'갈마점');
INSERT INTO `antpeople`.`store`(`store_id`,`store`) VALUES(105,'탄방점');


/* 초기 직원 데이터 */
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('rhksflwk111@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','Antpeople 관리자',100,100);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('tkwkd111@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 사장',101,101);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('tkwkd222@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 사장',102,101);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('tkwkd333@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 사장',103,101);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs101@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 직원1',101,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs102@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 직원2',101,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs103@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 직원3',101,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs104@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 직원4',101,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs105@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','둔산지점 직원5',101,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs201@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 직원1',102,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs202@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 직원2',102,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs203@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 직원3',102,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs204@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 직원4',102,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs205@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','월평지점 직원5',102,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs301@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 직원1',103,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs302@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 직원2',103,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs303@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 직원3',103,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs304@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 직원4',103,102);
INSERT INTO `antpeople`.`user`(`email`,`password`,`name`,`store_id`,`role_id`)
VALUES('wlrdnjs305@gmail.com','$2a$10$WsLb8C2rbmGyloyg9wtI1OEvRXx2WjMJ0IR0SmQxxiAgxy0YIe3wK','관저지점 직원5',103,102);


/* 초기 공지사항 데이터 */


INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('저는 새로 발령받은 둔산지점 사장 입니다.','만나서 반갑습니다. 다들 열심히 해봅시다.',2);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('저는 새로 발령받은 월평지점 사장 입니다.','만나서 반갑습니다. 다들 열심히 해봅시다.',3);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('저는 새로 발령받은 관저지점 사장 입니다.','만나서 반갑습니다. 다들 열심히 해봅시다.',4);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 둔산지점 사장 입니다.','지난주 다들 너무 고생 많으셨습니다.',2);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 월평지점 사장 입니다.','지난주 다들 너무 고생 많으셨습니다.',3);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 관저지점 사장 입니다.','지난주 다들 너무 고생 많으셨습니다.',4);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 둔산지점 사장 입니다. 다름이 아니라...','지난주에 불미스러운 사건이 있어서 사과글을 쓰려고 합니다. 지난주 목요일에 있었던 ... ',2);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 월평지점 사장 입니다. 다름이 아니라...','지난주에 불미스러운 사건이 있어서 사과글을 쓰려고 합니다. 지난주 금요일에 있었던 ... ',2);
INSERT INTO `antpeople`.`notice`(`title`,`description`,`user_id`)
VALUES('안녕하세요. 관저지점 사장 입니다. 다름이 아니라...','지난주에 불미스러운 사건이 있어서 사과글을 쓰려고 합니다. 지난주 주말에 있었던 ... ',2);

/* 초기 게시글 데이터 */

INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 둔산지점에 입사한 직원1 입니다.','잘 부탁드립니다.',5);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 둔산지점에 입사한 직원2 입니다.','잘 부탁드립니다.',6);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 둔산지점에 입사한 직원3 입니다.','잘 부탁드립니다.',7);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 둔산지점에 입사한 직원4 입니다.','잘 부탁드립니다.',8);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 둔산지점에 입사한 직원5 입니다.','잘 부탁드립니다.',9);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 월평지점에 입사한 직원1 입니다.','잘 부탁드립니다.',10);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 월평지점에 입사한 직원2 입니다.','잘 부탁드립니다.',11);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 월평지점에 입사한 직원3 입니다.','잘 부탁드립니다.',12);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 월평지점에 입사한 직원4 입니다.','잘 부탁드립니다.',13);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 월평지점에 입사한 직원5 입니다.','잘 부탁드립니다.',14);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 관저지점에 입사한 직원1 입니다.','잘 부탁드립니다.',15);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 관저지점에 입사한 직원2 입니다.','잘 부탁드립니다.',16);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 관저지점에 입사한 직원3 입니다.','잘 부탁드립니다.',17);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 관저지점에 입사한 직원4 입니다.','잘 부탁드립니다.',18);
INSERT INTO `antpeople`.`bbs`(`title`,`description`,`user_id`)
VALUES('안녕하세요 새로 관저지점에 입사한 직원5 입니다.','잘 부탁드립니다.',19);

/* 초기 일정 데이터 */

INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070710001907071400','10:00~14:00', '190707', '190707', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070716001907072200','16:00~22:00', '190707', '190707', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070810001907081400','10:00~14:00', '190708', '190708', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070816001907082200','16:00~22:00', '190708', '190708', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070910001907091400','10:00~14:00', '190709', '190709', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19070916001907092200','16:00~22:00', '190709', '190709', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19071010001907101400','10:00~14:00', '190710', '190710', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19071016001907102200','16:00~22:00', '190710', '190710', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080710001907071400','10:00~14:00', '190807', '190807', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080716001908072200','16:00~22:00', '190807', '190807', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080810001908081400','10:00~14:00', '190808', '190808', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080816001908082200','16:00~22:00', '190808', '190808', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080910001908091400','10:00~14:00', '190809', '190809', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19080916001908092200','16:00~22:00', '190809', '190809', '1600', '2200', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19081010001908101400','10:00~14:00', '190810', '190810', '1000', '1400', '3', '0', '2');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('2_19081016001908102200','16:00~22:00', '190810', '190810', '1600', '2200', '3', '0', '2');

INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071710001907171400','10:00~14:00', '190717', '190717', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071716001907172200','16:00~22:00', '190717', '190717', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071810001907181400','10:00~14:00', '190718', '190718', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071816001907182200','16:00~22:00', '190718', '190718', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071910001907191400','10:00~14:00', '190719', '190719', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19071916001907192200','16:00~22:00', '190719', '190719', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19072010001907201400','10:00~14:00', '190720', '190720', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19072016001907202200','16:00~22:00', '190720', '190720', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081710001907171400','10:00~14:00', '190817', '190817', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081716001908172200','16:00~22:00', '190817', '190817', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081810001908181400','10:00~14:00', '190818', '190818', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081816001908182200','16:00~22:00', '190818', '190818', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081910001908191400','10:00~14:00', '190819', '190819', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19081916001908192200','16:00~22:00', '190819', '190819', '1600', '2200', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19082010001908201400','10:00~14:00', '190820', '190820', '1000', '1400', '3', '0', '3');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('3_19082016001908202200','16:00~22:00', '190820', '190820', '1600', '2200', '3', '0', '3');

INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071310001907131400','10:00~14:00', '190713', '190713', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071316001907132200','16:00~22:00', '190713', '190713', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071410001907141400','10:00~14:00', '190714', '190714', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071416001907142200','16:00~22:00', '190714', '190714', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071510001907151400','10:00~14:00', '190715', '190715', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071516001907152200','16:00~22:00', '190715', '190715', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071610001907161400','10:00~14:00', '190716', '190716', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19071616001907162200','16:00~22:00', '190716', '190716', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081310001907131400','10:00~14:00', '190813', '190813', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081316001908132200','16:00~22:00', '190813', '190813', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081410001908141400','10:00~14:00', '190814', '190814', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081416001908142200','16:00~22:00', '190814', '190814', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081510001908151400','10:00~14:00', '190815', '190815', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081516001908152200','16:00~22:00', '190815', '190815', '1600', '2200', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081610001908161400','10:00~14:00', '190816', '190816', '1000', '1400', '3', '0', '4');
INSERT INTO `antpeople`.`schedule`(`sche_unique`,`title`,`start_date`,`end_date`,`start_time`,`end_time`,`manpower`,`peoplecount`,`user_id`)
VALUES('4_19081616001908162200','16:00~22:00', '190816', '190816', '1600', '2200', '3', '0', '4');

/*근무 승인 여부 데이터*/

INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(2,'1907',true);
INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(2,'1908',true);
INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(3,'1907',true);
INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(3,'1908',true);
INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(4,'1907',true);
INSERT INTO `antpeople`.`month_plan`(`user_id`,`month`,`state`)
VALUES(4,'1908',true);



