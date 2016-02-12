# User Stories

* As a User <br>
   So that I can see my saved links <br>
   I would like to be able to visit the site and see a list of links.

 * As a User <br>
 So that I can access my bookmarks <br>
 I want to be able to see a list of links and their titles.


 * As a reader <br>
 So that I can access my bookmarks <br>
 I want to be able to see a list of links and their titles in descending chronological order.

* As a User <br>
   So that I can save my favourite links <br>
   I would like to create a profile and be able to add my links.

* As a User <br>
   So that I can categorise my links <br>
   I would like to be able to add tags for my saved links.

* As a User <br>
   So that I can search for my links <br>
   I would like to be able to filter links based on tags.



# Relative merits of Relational Databases vs NoSQL Databases

Relational databases use Structured Query Language, which allows for querying and maintaining the database.
They are easy to use given the information consists of rows and columns which are must easier to understand.
Information can be easily manipulated, making the database much more flexible.  Usage of relational algebra and calculus in the manipulation of relations between the tables ensures there is no ambiguity.  Security settings are also easier to implement by moving sensitive information to a separate relation with its own authorization controls. Data independence is achieved more easily with normalization structure used in a relational database is also more simple than in other more complicated structures.  

NoSQL databases contain mechanisms for storage and retrieval of data in means other than tabular relations.  Other merits include simplicity of design, simpler horizantal scaling to clusters of machines, finer control over availability and data structures used by NoSQL are often viewed as more flexible. Data structures are specified from those used by default in relational databases, making some operations faster in NoSQL.  Although some NoSQL databases compromise consistency they benefit from more availability, partition tolerance and speed.

# CRUD

CRUD refers to Create, Read, Update, Delete. These are the four basic functions of persistent storage.  CRUD is also relevant at the user interface level of many applications.  For example in a calender application, software should allow a user to create or add new entries, read existing entries, update existing entries and delete existing entries.

SQL stands for structured query language it is a special purpose programming language designed for managing data held in a relational database managing system.  SQL examples of CRUD actions are:

## Create

CREATE TABLE _name_
INSERT INTO _table_ VALUE _value_name_

## Read

SELECT column_name,column_name
FROM table_name;

SELECT * FROM table_name;

## Update

UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value;

## Delete

DELETE FROM table_name
WHERE some_column=some_value;
