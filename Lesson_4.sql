create database vk;
use vk;

create table users(
 id int unsigned not null auto_increment primary key,
 first_name varchar(150) not null,
 last_name varchar(150) not null,
 email varchar(150) not null unique,
 phone varchar(30) not null unique,
 created_at datetime default current_timestamp,
 updated_at datetime default current_timestamp on update current_timestamp
);
create table profiles(
 user_id int unsigned not null  PRIMARY key,
 gender char(1) not null,
 city varchar(150) not null,
 country varchar(150) not null,
 created_at datetime default current_timestamp,
 updated_at datetime default current_timestamp on update current_timestamp
);
create table messages (
 id int unsigned not null auto_increment primary key,
 from_user_id int unsigned not null,
 to_user_id int unsigned not null,
 body text not null,
 is_important boolean,
 isdelivered boolean,
 created_at datetime default now() 

);
create table friendship (
user_id int unsigned not null,
friend_id int unsigned not null,
friendship_status_id int unsigned not null,
confirmed_at datetime,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp,
primary key (user_id,friend_id)
);
create table friendship_statuses (
id int unsigned not null auto_increment primary key,
name varchar(150) not null unique,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);
create table communities (
id int unsigned not null auto_increment primary key,
name varchar(150) not null unique,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);
create table communities_users (
community_id int unsigned not null,
user_id int unsigned not null,
created_at datetime default current_timestamp,
primary key (community_id, user_id)
);
create table media (
id int unsigned not null auto_increment primary key,
user_id int unsigned not null,
filename varchar(225) not null,
size int not null,
metadata JSON,
media_type_id int unsigned not null,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);
create table media_types (
id int unsigned not null auto_increment primary key,
name varchar(255) not null unique,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);

show tables;
select * from communities_users limit 10;
update profiles set updated_at = now() where updated_at < created_at;
desc profiles;
 create temporary table country (name Char(10));
insert into country Values ("China"), ("EUROPE"),("USA");
select name from country order by rand() limit 1;
update profiles  set country = (select name from country order by rand() limit 1);

desc media;
select floor(1 + rand() * 100);
update media  set user_id = floor(1 + rand() * 100);
insert into media (filename) values ()

-- http://dropbox.com//vk/filname.ext
update media set filename = concat(
' http://dropbox.com//vk/',
filename,
'.',
(select name from extension order by rand() limit 1))
;
create temporary table extension (name varchar(6));
insert into extension values
('mpeg'),
('mp3'),
('avi'),
('png'),
('jpeg');
select * from extension;

update  media set size = floor(100 + rand()*10000);
 
-- {"owner":"First Last"}
select  first_name, last_name from users where id = 7;

update media set metadata = concat(
'{"owner":"',
(select concat(first_name,'', last_name) from users where users.id = media.user_id ),
'"}'
); 
alter table media modify column metadata JSON;

select * from media_types;

delete  from media_types;
insert  into friendship_statuses (name) values
('requested'),
('confirmed'),
('rejected')
;

truncate friendship_statuses ;

update communities_users set user_id = Floor(1 + rand()* 100),
community_id = Floor(1 + rand()* 30);

delete from communities_users where id > 30;
alter table profiles modify column gender enum('f','m');
desc profiles ;





