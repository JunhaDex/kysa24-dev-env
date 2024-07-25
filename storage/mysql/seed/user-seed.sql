INSERT INTO service.user (id, ref, name, sex, age, dob, nickname, auth_id, pwd, team_id, profile_img, cover_img,
                          introduce, geo, act_status)
VALUES (10001, '7d79e3ee-c81f-4743-861c-c336bbc780ad', '김민지', 2, 20, '2004-05-07 00:00:00', '뉴진스민지', 'new.minji',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 13, '', '', '', '강원 춘천', 1),
       (10002, '7549143a-82bb-4dea-804a-096337cacf6f', '박준수', 1, 29, '1995-04-17 00:00:00', '준수닉', 'park.jun',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 3, '', '', '', '부산 해운대', 1),
       (10003, 'ec78a521-74f2-4b63-9160-33eda5c03fe1', '김철수', 1, 25, '1999-01-01 00:00:00', '철수닉', 'kim.chul',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 11, '', '', '', '서울 강남', 1),
       (10004, '29786573-95b7-4edc-a9bb-f96036303176', '이영희', 2, 30, '1994-01-01 00:00:00', '영희닉', 'lee.young',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 22, '', '', '', '서울 서초', 1),
       (10005, '6ced39ba-ea6e-4436-9af8-15bf68ce3517', '박준영', 1, 21, '2003-01-01 00:00:00', '준영닉', 'park.juny',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 3, '', '', '', '부산 해운대', 1),
       (10006, '889eb737-68f3-42f9-a351-81d408d200e7', '최은지', 2, 22, '2002-01-01 00:00:00', '은지닉', 'choi.eunji',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 24, '', '', '', '대구 수성', 1),
       (10007, '20b2d7eb-3a82-43d8-814e-f4c302c5892a', '김태현', 1, 24, '2000-01-01 00:00:00', '태현닉', 'kim.tae',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 5, '', '', '', '인천 연수', 1),
       (10008, 'b31c6185-9d35-451e-b5fd-e740d60c2765', '이소연', 2, 25, '1999-01-01 00:00:00', '소연닉', 'lee.soyeon',
        '$2b$10$6ra8OeiwWPaxTeFs2.QNl.czN3KLMOwo3.taLT3IBpA7Ksu6ffndS', 16, '', '', '', '광주 서구', 1);

INSERT INTO service.user_info (user_id, extra_info)
VALUES (10001, '{}'),
       (10002, '{}'),
       (10003, '{}'),
       (10004, '{}'),
       (10005, '{}'),
       (10006, '{}'),
       (10007, '{}'),
       (10008, '{}');

INSERT INTO service.`group` (ref, creator, group_name, profile_img, cover_img, introduce, is_show, priority)
VALUES ('914db4c6-fd60-4887-adb2-59939950e0f1', 10001, '전체공지 그룹', null, null, '전체공지 그룹입니다.', 1, 1),
       ('12f5a04f-9ea5-4e04-b226-0476955750ef', 10001, 'Lost and Found', null, null, 'Find what you have lost!', 0, 0),
       ('20d48681-7901-404c-be30-0e56a2435234', 10002, '서브 그룹', null, null, 'Foo bar', 1, 0);

INSERT INTO service.group_user_follow (id, group_id, follower, is_must, role, created_at, updated_at)
VALUES (1, 1, 10001, 1, 'writer', '2024-07-02 16:09:19', '2024-07-02 16:09:19'),
       (2, 1, 10002, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (3, 1, 10003, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (4, 1, 10004, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (5, 1, 10005, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (6, 1, 10006, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (7, 1, 10007, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (8, 1, 10008, 1, 'reader', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (9, 2, 10001, 1, 'writer', '2024-07-02 16:10:33', '2024-07-02 16:10:33'),
       (10, 3, 10002, 1, 'writer', '2024-07-02 16:11:16', '2024-07-02 16:11:16'),
       (11, 3, 10003, 0, 'writer', '2024-07-02 16:11:16', '2024-07-02 16:11:16');

