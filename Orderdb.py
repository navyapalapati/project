import mysql.connector

try:
    connection = mysql.connector.connect(user='pyeuser',
                                         password='p@@ss!23',
                                         host='127.0.0.1',
                                         database='orderdb')

    sql_select_Query = "Select * from  odmv_orderdetails where Dispatch_datetime <= NOW();"
    cursor = connection.cursor()
    cursor.execute(sql_select_Query)
    # get all records
    records = cursor.fetchall()
    print("Total number of order(s) today: ", cursor.rowcount)

    print("\nPrinting each row")
    for row in records:
        print("cloth_vendorname = ", row[0], )
        print("Cloth_make = ", row[1])
        print("PRICE IN $  = ", row[2])
        print(" Dispatch_datetime  = ", row[3])
        print("Address  = ", row[4])
        print(" City  = ", row[5])
        print(" State  = ", row[6])
        print(" Zipcode  = ", row[7])
        print("Warehouse_name  = ", row[8], "\n")

except mysql.connector.Error as e:
    print("Error reading data from view please contact support", e)
finally:
    if connection.is_connected():
        connection.close()
        cursor.close()
        print("database connection is closed")
