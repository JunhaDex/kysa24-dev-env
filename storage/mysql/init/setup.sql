create database if not exists service;
use service;
create table if not exists admin
(
    id         int unsigned auto_increment
        primary key,
    login_id   varchar(255)                        not null,
    pwd        varchar(255)                        not null comment 'password',
    name       varchar(255)                        not null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    constraint login_id_unique
        unique (login_id)
);
create table if not exists team
(
    id         int unsigned auto_increment
        primary key,
    team_name  varchar(255)                        not null,
    leader     int unsigned                        not null comment 'fk user',
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint team_name_unique
        unique (team_name)
#     team_user_fk leader - after user table
);
create table status_user_act
(
    id          int unsigned auto_increment
        primary key,
    level       int          not null,
    status_name varchar(255) not null,
    status_desc varchar(255) not null,
    constraint status_user_act_unique
        unique (level)
);
create table if not exists user
(
    id          int unsigned auto_increment
        primary key,
    ref         varchar(36)                            not null comment 'uuidv4',
    name        varchar(255)                           not null,
    sex         tinyint unsigned                       not null comment 'iso5218 1:male 2:female',
    age         int unsigned                           not null,
    dob         datetime                               not null,
    nickname    varchar(255)                           not null,
    auth_id     varchar(255)                           not null,
    pwd         varchar(255)                           not null comment 'password',
    team_id     int unsigned                           not null comment 'fk team',
    profile_img varchar(255)                           null comment 'url',
    cover_img   varchar(255)                           null comment 'url',
    introduce   varchar(255) default ''                null,
    geo         varchar(255) default ''                null,
    act_status  int unsigned default '2'               not null comment 'fk status_user_act',
    created_at  timestamp    default CURRENT_TIMESTAMP not null,
    updated_at  datetime     default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint auth_id_unique
        unique (auth_id),
    constraint user_ref_unique
        unique (ref),
    constraint user_user_team_fk
        foreign key (team_id) references team (id)
);
alter table team
    add constraint team_user_fk
        foreign key (leader) references user (id);
create table if not exists user_device
(
    id         int unsigned auto_increment
        primary key,
    user_id    int unsigned                        not null comment 'fk user',
    fcm        varchar(255)                        not null,
    device     varchar(255)                        not null comment 'device name or info',
    last_login datetime                            null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint user_device_fcm_unique
        unique (fcm, user_id),
    constraint user_device_user_fk
        foreign key (user_id) references user (id)
);
create table if not exists user_user_follow
(
    id         int unsigned auto_increment
        primary key,
    user_id    int unsigned                        not null comment 'fk user',
    follower   int unsigned                        not null comment 'fk user',
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint user_user_follow_unique
        unique (user_id, follower),
    constraint user_user_follow_user_fk
        foreign key (user_id) references user (id)
);
create table if not exists `group`
(
    id          int unsigned auto_increment
        primary key,
    ref         varchar(36)                                not null comment 'uuidv4',
    creator     int unsigned                               not null comment 'fk user',
    group_name  varchar(255)                               not null,
    profile_img varchar(255)                               null comment 'url',
    cover_img   varchar(255)                               null comment 'url',
    introduce   varchar(255)     default ''                null,
    is_show     tinyint unsigned default '1'               not null comment '0: hide 1: show',
    created_at  timestamp        default CURRENT_TIMESTAMP not null,
    updated_at  datetime         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint group_ref_unique
        unique (ref),
    constraint group_name_unique
        unique (group_name),
    constraint group_user_fk
        foreign key (creator) references user (id)
);
create table if not exists group_user_follow
(
    id         int unsigned auto_increment
        primary key,
    group_id   int unsigned                               not null comment 'fk group',
    follower   int unsigned                               not null comment 'fk user',
    is_must    tinyint unsigned default '0'               not null comment '1: permanent relation',
    role       varchar(255)     default 'writer'          not null comment 'reader | writer',
    created_at timestamp        default CURRENT_TIMESTAMP not null,
    updated_at datetime         default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint group_user_follow_unique
        unique (group_id, follower),
    constraint group_user_follow_group_fk
        foreign key (group_id) references `group` (id),
    constraint group_user_follow_user_fk
        foreign key (follower) references user (id)
);
create table if not exists post
(
    id         int unsigned auto_increment
        primary key,
    author     int unsigned                        not null comment 'fk user',
    image      varchar(255)                        null,
    message    text                                not null,
    group_id   int unsigned                        not null comment 'fk group',
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint post_group_fk
        foreign key (group_id) references `group` (id),
    constraint post_user_fk
        foreign key (author) references user (id)
);
create table if not exists post_comment
(
    id         int unsigned auto_increment
        primary key,
    author     int unsigned                        not null comment 'fk user',
    post_id    int unsigned                        not null comment 'fk post',
    message    text                                not null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at datetime                            null,
    constraint post_comment_post_fk
        foreign key (post_id) references post (id),
    constraint post_comment_user_fk
        foreign key (author) references user (id)
);
create table if not exists post_like
(
    id         int unsigned auto_increment
        primary key,
    author     int unsigned                        not null comment 'fk user',
    post_id    int unsigned                        not null comment 'fk post',
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    deleted_at datetime                            null,
    constraint post_like_post_fk
        foreign key (post_id) references post (id),
    constraint post_like_user_fk
        foreign key (author) references user (id)
);
create table if not exists chat_room
(
    id         int unsigned auto_increment
        primary key,
    ref        varchar(36)                         not null comment 'uuidv4',
    members    json                                not null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint chat_room_ref_unique
        unique (ref)
);
create table if not exists chat
(
    id         int unsigned auto_increment
        primary key,
    room_id    int unsigned                        not null comment 'fk chat_room',
    sender     int unsigned                        not null comment 'fk user',
    message    text                                not null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint chat_chat_room_fk
        foreign key (room_id) references chat_room (id),
    constraint chat_user_fk
        foreign key (sender) references user (id)
);
create table if not exists noti
(
    id         int unsigned auto_increment
        primary key,
    target     int unsigned                        not null comment 'fk user',
    type       varchar(255)                        not null comment 'chat | group | post',
    message    varchar(255)                        not null,
    read_at    datetime                            null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint noti_user_fk
        foreign key (target) references user (id)
);
create table if not exists user_user_chat_hide
(
    id         int unsigned auto_increment
        primary key,
    user_id    int unsigned                        not null comment 'fk user',
    blocker    int unsigned                        not null comment 'fk user',
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at datetime  default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint user_user_chat_hide_unique
        unique (user_id, blocker),
    constraint user_user_chat_hide_user_fk
        foreign key (user_id) references user (id)
);

INSERT INTO service.status_user_act (level, status_name, status_desc)
VALUES (0, 'block_all', 'block all useer actions');
INSERT INTO service.status_user_act (level, status_name, status_desc)
VALUES (1, 'allow_all', 'allow all user actions');
INSERT INTO service.status_user_act (level, status_name, status_desc)
VALUES (2, 'block_post', 'block user writing all posts');
INSERT INTO service.status_user_act (level, status_name, status_desc)
VALUES (3, 'block_group', 'block user create group');
INSERT INTO service.status_user_act (level, status_name, status_desc)
VALUES (4, 'block_chat', 'block user all chat');
# default admin
INSERT INTO service.admin (login_id, pwd, name)
VALUES ('admin', '$2b$10$s/obbu1GAwvoYeff0jS2.eZ/NAsXwuLJUVgddScVeAPiefnCIiUbq', 'admin');

