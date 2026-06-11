mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| digitalbookshelf   |
| information_schema |
| mysql              |
| performance_schema |
| studentdb          |
| sys                |
+--------------------+
7 rows in set (0.08 sec)

mysql> create database cinestream;
Query OK, 1 row affected (0.04 sec)

mysql> use cinestream;
Database changed
mysql> create table Movies(
    -> movie_id int PRIMARY KEY AUTO_INCREMENT,
    -> title varchar(100) NOT NULL,
    -> genre varchar(50) NOT NULL,
    -> release_year int,
    -> rental_rate decimal(5,2));
Query OK, 0 rows affected (0.14 sec)

mysql> create table Users(
    -> user_id int PRIMARY KEY AUTO_INCREMENT,
    -> username varchar(50) UNIQUE NOT NULL,
    -> email varchar(100) UNIQUE NOT NULL,
    -> join_date DATE,
    -> status varchar(10));
Query OK, 0 rows affected (0.05 sec)

mysql> create table Watchlog(
    -> log_id int PRIMARY KEY AUTO_INCREMENT,
    -> user_id int,
    -> movie_id int,
    -> watch_date datetime,
    -> duration_minutes int,
    -> foreign key (user_id) references Users(user_id),
    -> foreign key (movie_id) references Movies(movie_id));
Query OK, 0 rows affected (0.08 sec)

mysql> describe cinestream;
ERROR 1146 (42S02): Table 'cinestream.cinestream' doesn't exist
mysql> describe Movies;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| movie_id     | int          | NO   | PRI | NULL    | auto_increment |
| title        | varchar(100) | NO   |     | NULL    |                |
| genre        | varchar(50)  | NO   |     | NULL    |                |
| release_year | int          | YES  |     | NULL    |                |
| rental_rate  | decimal(5,2) | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
5 rows in set (0.06 sec)

mysql> describe Users;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| user_id   | int          | NO   | PRI | NULL    | auto_increment |
| username  | varchar(50)  | NO   | UNI | NULL    |                |
| email     | varchar(100) | NO   | UNI | NULL    |                |
| join_date | date         | YES  |     | NULL    |                |
| status    | varchar(10)  | YES  |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> describe Watchlog;
+------------------+----------+------+-----+---------+----------------+
| Field            | Type     | Null | Key | Default | Extra          |
+------------------+----------+------+-----+---------+----------------+
| log_id           | int      | NO   | PRI | NULL    | auto_increment |
| user_id          | int      | YES  | MUL | NULL    |                |
| movie_id         | int      | YES  | MUL | NULL    |                |
| watch_date       | datetime | YES  |     | NULL    |                |
| duration_minutes | int      | YES  |     | NULL    |                |
+------------------+----------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> insert into Movies values("Inception", "Sci-fi", 2010, 3.99);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into Movies values(1, "Inception", "Sci-fi", 2010, 3.99);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Movies values(2, "Interstellar", "Sci-fi", 2014, 4.99);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Movies values(3, "Avengers Endgame", "Action", 2019, 4.99);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Movies values(4, "Conjuring: Last Rites", Horror", 2013, 3.99);
    "> insert into Movies values(4, "Conjuring: Last Rites", Horror", 2013, 3.99);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '", 2013, 3.99);
insert into Movies values(4, "Conjuring: Last Rites", Horror", 2' at line 1
mysql> insert into Movies values(4, "Conjuring: Last Rites", "Horror", 2013, 3.99);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Movies values(5, "Parasite", "Thriller", 2019, 4.99);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Movies values(6, "Frozen", "Animation", 2013, 2.49);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Movies values(7, "Titanic","Romance",1997,2.99);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Movies values(8, 'Joker','Drama',2019,4.49);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Movies values(9, 'Toy Story','Animation',1995,2.99);
Query OK, 1 row affected (0.00 sec)

mysql> insert into Movies values(10, 'The Dark Knight','Action',2008,3.49);
Query OK, 1 row affected (0.00 sec)

mysql> select * from Movies;
+----------+-----------------------+-----------+--------------+-------------+
| movie_id | title                 | genre     | release_year | rental_rate |
+----------+-----------------------+-----------+--------------+-------------+
|        1 | Inception             | Sci-fi    |         2010 |        3.99 |
|        2 | Interstellar          | Sci-fi    |         2014 |        4.99 |
|        3 | Avengers Endgame      | Action    |         2019 |        4.99 |
|        4 | Conjuring: Last Rites | Horror    |         2013 |        3.99 |
|        5 | Parasite              | Thriller  |         2019 |        4.99 |
|        6 | Frozen                | Animation |         2013 |        2.49 |
|        7 | Titanic               | Romance   |         1997 |        2.99 |
|        8 | Joker                 | Drama     |         2019 |        4.49 |
|        9 | Toy Story             | Animation |         1995 |        2.99 |
|       10 | The Dark Knight       | Action    |         2008 |        3.49 |
+----------+-----------------------+-----------+--------------+-------------+
10 rows in set (0.02 sec)

mysql> insert into Users values(101, "Neel", "neel@gmail.com", 2024-12-02, "Inactive");
ERROR 1292 (22007): Incorrect date value: '2010' for column 'join_date' at row 1
mysql> insert into Users values(101, "Neel", "neel@gmail.com", "2024-12-02", "Inactive");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Users values(102, "Raj", "raj@gmail.com", "2024-08-27", "Active");
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(103, 'Sneha23','sneha@gmail.com','2025-02-10','Active'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> insert into Users values(103, 'Sneha23','sneha@gmail.com','2025-02-10','Active');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Users values(104, "arjun9", 'arjun@gmail.com', '2023-03-09', 'Inactive);
    '> insert into Users values(104, "arjun9", 'arjun@gmail.com', '2023-03-09', 'Inactive);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'arjun@gmail.com', '2023-03-09', 'Inactive)' at line 2
mysql> insert into Users values(104, "arjun9", 'arjun@gmail.com', '2023-03-09', 'Inactive');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(105, "niyati93", 'niyati@gmail.com', '2023-11-07', 'Active');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(106, 'sidd56', 'siddhesh@gmail.com', '2024-12-0'10, 'Active');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '10, 'Active')' at line 1
mysql> insert into Users values(106, 'sidd56', 'siddhesh@gmail.com', '2024-12-0', 'Active');
ERROR 1292 (22007): Incorrect date value: '2024-12-0' for column 'join_date' at row 1
mysql> insert into Users values(106, 'sidd56', 'siddhesh@gmail.com', '2024-12-10', 'Active');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(107, 'sach4in', 'sachin@gmail.com', '2023-05-17', 'Inactive');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(108, 'rahul66', 'rahul@gmail.com', '2024-07-06', 'Active');
Query OK, 1 row affected (0.00 sec)

mysql> insert into Users values(109, 'mayank70', 'mayank@gmail.com', '2025-02-28', 'Inactive');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Users values(110, 'jaranir1', 'nirjara@gmail.com', '2025-10-20', 'Active');
Query OK, 1 row affected (0.04 sec)

mysql> select * from Users;
+---------+----------+--------------------+------------+----------+
| user_id | username | email              | join_date  | status   |
+---------+----------+--------------------+------------+----------+
|     101 | Neel     | neel@gmail.com     | 2024-12-02 | Inactive |
|     102 | Raj      | raj@gmail.com      | 2024-08-27 | Active   |
|     103 | Sneha23  | sneha@gmail.com    | 2025-02-10 | Active   |
|     104 | arjun9   | arjun@gmail.com    | 2023-03-09 | Inactive |
|     105 | niyati93 | niyati@gmail.com   | 2023-11-07 | Active   |
|     106 | sidd56   | siddhesh@gmail.com | 2024-12-10 | Active   |
|     107 | sach4in  | sachin@gmail.com   | 2023-05-17 | Inactive |
|     108 | rahul66  | rahul@gmail.com    | 2024-07-06 | Active   |
|     109 | mayank70 | mayank@gmail.com   | 2025-02-28 | Inactive |
|     110 | jaranir1 | nirjara@gmail.com  | 2025-10-20 | Active   |
+---------+----------+--------------------+------------+----------+
10 rows in set (0.00 sec)

mysql> insert into Watchlog values(211, 1, 101, '2025-05-20 20:00:00', 148);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`cinestream`.`watchlog`, CONSTRAINT `watchlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`))
mysql> insert into Watchlog values(211, 101, 1, '2025-05-20 20:00:00', 148);
Query OK, 1 row affected (0.05 sec)

mysql> insert into Watchlog values(212, 103, 3, '2025-11-13 18:00:00', 222);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(213, 102, 2, '2024-12-25 16:00:00', 324);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(214, 105, 4, '2024-08-19 21:00:00', 155);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(215, 104, 5, '2025-07-09 14:00:00', 215);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(216, 107, 8, '2026-04-29 20:00:00', 116);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(217, 106, 9, '2025-09-02 22:00:00', 272);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(218, 109, 6, '2024-12-15 19:00:00', 198);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(219, 108, 10, '2023-08-23 15:00:00', 341);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Watchlog values(220, 110, 7, '2025-12-08 23:00:00', 284);
Query OK, 1 row affected (0.04 sec)

mysql> select * from Watchlog;
+--------+---------+----------+---------------------+------------------+
| log_id | user_id | movie_id | watch_date          | duration_minutes |
+--------+---------+----------+---------------------+------------------+
|    211 |     101 |        1 | 2025-05-20 20:00:00 |              148 |
|    212 |     103 |        3 | 2025-11-13 18:00:00 |              222 |
|    213 |     102 |        2 | 2024-12-25 16:00:00 |              324 |
|    214 |     105 |        4 | 2024-08-19 21:00:00 |              155 |
|    215 |     104 |        5 | 2025-07-09 14:00:00 |              215 |
|    216 |     107 |        8 | 2026-04-29 20:00:00 |              116 |
|    217 |     106 |        9 | 2025-09-02 22:00:00 |              272 |
|    218 |     109 |        6 | 2024-12-15 19:00:00 |              198 |
|    219 |     108 |       10 | 2023-08-23 15:00:00 |              341 |
|    220 |     110 |        7 | 2025-12-08 23:00:00 |              284 |
+--------+---------+----------+---------------------+------------------+
10 rows in set (0.00 sec)

mysql> update users
    -> set status = "Inactive"
    -> where username = "niyati93";
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from users;
+---------+----------+--------------------+------------+----------+
| user_id | username | email              | join_date  | status   |
+---------+----------+--------------------+------------+----------+
|     101 | Neel     | neel@gmail.com     | 2024-12-02 | Inactive |
|     102 | Raj      | raj@gmail.com      | 2024-08-27 | Active   |
|     103 | Sneha23  | sneha@gmail.com    | 2025-02-10 | Active   |
|     104 | arjun9   | arjun@gmail.com    | 2023-03-09 | Inactive |
|     105 | niyati93 | niyati@gmail.com   | 2023-11-07 | Inactive |
|     106 | sidd56   | siddhesh@gmail.com | 2024-12-10 | Active   |
|     107 | sach4in  | sachin@gmail.com   | 2023-05-17 | Inactive |
|     108 | rahul66  | rahul@gmail.com    | 2024-07-06 | Active   |
|     109 | mayank70 | mayank@gmail.com   | 2025-02-28 | Inactive |
|     110 | jaranir1 | nirjara@gmail.com  | 2025-10-20 | Active   |
+---------+----------+--------------------+------------+----------+
10 rows in set (0.00 sec)

mysql> delete from users
    -> where status = "Inactive"
    -> and user_id not in(
    -> select distinct user_id
    -> from Watchlog;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> delete from users
    -> where status = "Inactive"
    -> and user_id not in(
    -> select distinct user_id
    -> from Watchlog);
Query OK, 0 rows affected (0.06 sec)

mysql> select * from Watchlog;
+--------+---------+----------+---------------------+------------------+
| log_id | user_id | movie_id | watch_date          | duration_minutes |
+--------+---------+----------+---------------------+------------------+
|    211 |     101 |        1 | 2025-05-20 20:00:00 |              148 |
|    212 |     103 |        3 | 2025-11-13 18:00:00 |              222 |
|    213 |     102 |        2 | 2024-12-25 16:00:00 |              324 |
|    214 |     105 |        4 | 2024-08-19 21:00:00 |              155 |
|    215 |     104 |        5 | 2025-07-09 14:00:00 |              215 |
|    216 |     107 |        8 | 2026-04-29 20:00:00 |              116 |
|    217 |     106 |        9 | 2025-09-02 22:00:00 |              272 |
|    218 |     109 |        6 | 2024-12-15 19:00:00 |              198 |
|    219 |     108 |       10 | 2023-08-23 15:00:00 |              341 |
|    220 |     110 |        7 | 2025-12-08 23:00:00 |              284 |
+--------+---------+----------+---------------------+------------------+
10 rows in set (0.00 sec)

mysql> select * from Users;
+---------+----------+--------------------+------------+----------+
| user_id | username | email              | join_date  | status   |
+---------+----------+--------------------+------------+----------+
|     101 | Neel     | neel@gmail.com     | 2024-12-02 | Inactive |
|     102 | Raj      | raj@gmail.com      | 2024-08-27 | Active   |
|     103 | Sneha23  | sneha@gmail.com    | 2025-02-10 | Active   |
|     104 | arjun9   | arjun@gmail.com    | 2023-03-09 | Inactive |
|     105 | niyati93 | niyati@gmail.com   | 2023-11-07 | Inactive |
|     106 | sidd56   | siddhesh@gmail.com | 2024-12-10 | Active   |
|     107 | sach4in  | sachin@gmail.com   | 2023-05-17 | Inactive |
|     108 | rahul66  | rahul@gmail.com    | 2024-07-06 | Active   |
|     109 | mayank70 | mayank@gmail.com   | 2025-02-28 | Inactive |
|     110 | jaranir1 | nirjara@gmail.com  | 2025-10-20 | Active   |
+---------+----------+--------------------+------------+----------+
10 rows in set (0.00 sec)

mysql> DELETE FROM USERS WHERE status = "Inactive"
    -> AND user_id NOT IN(SELECT DISTINCT user_id FROM watchlog);
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT DISTINCT user_id
    -> FROM Watchlog;
+---------+
| user_id |
+---------+
|     101 |
|     102 |
|     103 |
|     104 |
|     105 |
|     106 |
|     107 |
|     108 |
|     109 |
|     110 |
+---------+
10 rows in set (0.04 sec)

mysql> SELECT DISTINCT user_id FROM Watchlog;
+---------+
| user_id |
+---------+
|     101 |
|     102 |
|     103 |
|     104 |
|     105 |
|     106 |
|     107 |
|     108 |
|     109 |
|     110 |
+---------+
10 rows in set (0.00 sec)

mysql> delete from watchlog
    -> where user_id = 101;
Query OK, 1 row affected (0.01 sec)

mysql> delete from watchlog
    -> where user_id = 104;
Query OK, 1 row affected (0.04 sec)

mysql> delete from watchlog
    -> where user_id = 106;
Query OK, 1 row affected (0.01 sec)

mysql> delete from watchlog
    -> where user_id = 109;
Query OK, 1 row affected (0.00 sec)

mysql> select * from Watchlog;
+--------+---------+----------+---------------------+------------------+
| log_id | user_id | movie_id | watch_date          | duration_minutes |
+--------+---------+----------+---------------------+------------------+
|    212 |     103 |        3 | 2025-11-13 18:00:00 |              222 |
|    213 |     102 |        2 | 2024-12-25 16:00:00 |              324 |
|    214 |     105 |        4 | 2024-08-19 21:00:00 |              155 |
|    216 |     107 |        8 | 2026-04-29 20:00:00 |              116 |
|    219 |     108 |       10 | 2023-08-23 15:00:00 |              341 |
|    220 |     110 |        7 | 2025-12-08 23:00:00 |              284 |
+--------+---------+----------+---------------------+------------------+
6 rows in set (0.04 sec)

mysql> DELETE FROM Users
    -> WHERE status = 'Inactive'
    -> AND user_id NOT IN (
    ->     SELECT DISTINCT user_id
    ->     FROM WatchLog
    -> );
Query OK, 3 rows affected (0.01 sec)

mysql> select * from users;
+---------+----------+--------------------+------------+----------+
| user_id | username | email              | join_date  | status   |
+---------+----------+--------------------+------------+----------+
|     102 | Raj      | raj@gmail.com      | 2024-08-27 | Active   |
|     103 | Sneha23  | sneha@gmail.com    | 2025-02-10 | Active   |
|     105 | niyati93 | niyati@gmail.com   | 2023-11-07 | Inactive |
|     106 | sidd56   | siddhesh@gmail.com | 2024-12-10 | Active   |
|     107 | sach4in  | sachin@gmail.com   | 2023-05-17 | Inactive |
|     108 | rahul66  | rahul@gmail.com    | 2024-07-06 | Active   |
|     110 | jaranir1 | nirjara@gmail.com  | 2025-10-20 | Active   |
+---------+----------+--------------------+------------+----------+
7 rows in set (0.00 sec)

mysql> SELECT
    ->     M.genre,
    ->     COUNT(*) AS Total_Watch_Count
    -> FROM Movies M
    -> INNER JOIN WatchLog W
    -> ON M.movie_id = W.movie_id
    -> GROUP BY M.genre
    -> ORDER BY Total_Watch_Count DESC;
+---------+-------------------+
| genre   | Total_Watch_Count |
+---------+-------------------+
| Action  |                 2 |
| Sci-fi  |                 1 |
| Horror  |                 1 |
| Romance |                 1 |
| Drama   |                 1 |
+---------+-------------------+
5 rows in set (0.04 sec)
