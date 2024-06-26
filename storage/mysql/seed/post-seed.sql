# Fill-up with correct author and group_id
INSERT INTO service.post (author, image, message, group_id)
VALUES (1, null, 'Hello world!', 1);
INSERT INTO service.post (author, image, message, group_id)
VALUES (2, null, '1️⃣2️⃣3️⃣', 1);
INSERT INTO service.post (author, image, message, group_id)
VALUES (3, null, '푸- 바-', 2);

# Post comments
INSERT INTO service.post_comment (author, post_id, message)
VALUES (1, 1, '한글 @#$+ 😃');
INSERT INTO service.post_comment (author, post_id, message)
VALUES (1, 2, '👍👍👍');

# Post likes
INSERT INTO service.post_like (author, post_id)
VALUES (2, 1);
INSERT INTO service.post_like (author, post_id)
VALUES (3, 2);
