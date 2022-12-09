.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = 'dog' ;

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color= 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING count(smallest) = 1 ;


CREATE TABLE matchmaker AS
  SELECT student1.pet, student1.song, student1.color, student2.color FROM students AS student1, students AS student2 WHERE student1.time < student2. time 
  AND student1.pet = student2.pet AND student1.song = student2.song ;


CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, numbers AS b where a.number = 7 AND b."7" = "True" AND a.time = b.time;


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category; 


CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT item, store FROM lowest_prices WHERE MRSP/rating ;


CREATE TABLE total_bandwidth AS
  SELECT Mbs from stores ;

