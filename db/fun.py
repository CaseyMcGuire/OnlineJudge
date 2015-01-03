#!/usr/bin/python

import sqlite3
conn = sqlite3.connect('development.sqlite3');

c = conn.cursor();
#for i in range(20):
    #c.execute("INSERT INTO problems(name, description) VALUES ('suck it', 'hahahaha')")
#conn.commit()

problems = c.execute("SELECT * FROM problems")
#for row in problems:
	#print 'name: {}, description: {}'.format(row[1], row[2])
#conn.close()
