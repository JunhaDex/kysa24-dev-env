# Fill-up with correct author and group_id
INSERT INTO service.post (author, image, message, group_id)
VALUES (2, null, 'Hello world!', 6);
INSERT INTO service.post (author, image, message, group_id)
VALUES (2, null, '1️⃣2️⃣3️⃣', 6);
INSERT INTO service.post (author, image, message, group_id)
VALUES (2, null, '푸- 바-', 6);

# Post comments
INSERT INTO service.post_comment (author, post_id, message)
VALUES (3, 1, '한글 @#$+ 😃');
INSERT INTO service.post_comment (author, post_id, message)
VALUES (3, 2, '👍👍👍');

# Post likes
INSERT INTO service.post_like (author, post_id)
VALUES (3, 1);
INSERT INTO service.post_like (author, post_id)
VALUES (3, 2);
