def insert(cursor, data):
        try:
                cursor.execute(f'''
                       INSERT INTO ip_addr(ip, country, city, ISP) 
                       VALUES
                        ('{data['ip']}', '{data['country']}', '{data['city']}', '{data['isp']}')''')
                count = cursor.rowcount
                print(count, "Record inserted successfully")
 
        except (Exception) as error:
                print("Failed to insert record", error)