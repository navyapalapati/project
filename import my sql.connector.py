import mysql.connector
from mysql.connector 
try:
    cnx = mysql.connector.connect(user='root',password='password'
    database='customerorders')
)
cursor = cnx.cursor()
except mysql.connector.Error as err:
    if err.errno==errorcode.ER_ACCESS_DENIED_ERROR:
        print("error in username and password") 
       elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("DATABASE does not exist")
            else:
                print(err)
                else:
                    print("database sucessful")

query =("select * dispatch_datetime ")
cursor.execute(query)
results =cursor.fetchall()
print(results)
cnx.close()