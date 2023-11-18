def create_table(cursor):
        try:
                sql = '''
                        CREATE TABLE public.ip_addr (
                        ID SERIAL PRIMARY KEY,
                        ip varchar(15) NOT NULL,
                        country varchar(50) NULL,
                        city varchar(50) NULL,
                        isp varchar(70) NULL
                        )'''
                cursor.execute(sql)
                print("Table created successfully")
        except (Exception) as error:
                print("Table failed to create, ", error)