#!/usr/bin/python3

import MySQLdb

# First thing to do, is to make a connection
# to the database we want to use
# Not that that the parameter for the password is 'passwd' and not 'password'

db = MySQLdb.connect(host="localhost", user="user", passwd="pass", db="users")

# Create a cursor for the select
cur = db.cursor()

# execute an sql query
cur.execute("create table song (id int unsigned primary key auto_increment, title text not null)")

cur.execute("drop table song")

# close the cursor
cur.close()

# close the connection
db.close()
