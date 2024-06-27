INSERT INTO service.chat_room (id, ref, members, created_at, updated_at)
VALUES (1, '16a9f327-38d1-4832-b109-dd32f85fd0ee', '[
  1,
  2
]', '2024-06-27 22:40:19', '2024-06-27 22:40:19');

INSERT INTO service.chat_room_view (id, user_id, room_id, title, is_block, last_read, created_at, updated_at)
VALUES (2, 10001, 1, '준수닉', 0, 0, '2024-06-27 22:41:10', '2024-06-27 22:41:10');
INSERT INTO service.chat_room_view (id, user_id, room_id, title, is_block, last_read, created_at, updated_at)
VALUES (3, 10002, 1, '뉴진스민지', 0, 0, '2024-06-27 22:41:10', '2024-06-27 22:41:10');

INSERT INTO service.chat (id, room_id, sender, message, encoded, created_at, updated_at)
VALUES (2, 1, 10001, '안녕하세요 반가워요!', 0, '2024-06-27 22:43:53', '2024-06-27 22:43:53');
INSERT INTO service.chat (id, room_id, sender, message, encoded, created_at, updated_at)
VALUES (3, 1, 10002, '네 반가워요! 친하게 지내요!', 0, '2024-06-27 22:43:53', '2024-06-27 22:43:53');
