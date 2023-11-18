import psycopg2

def select(ip):
    try:
        connection = psycopg2.connect(
            database="postgres",
            host="192.168.122.200",
            user="postgres",
            password="TpiWdACB9U",
            port="32070")
        connection.autocommit = True
        cursor = connection.cursor()
        cursor.execute(f"SELECT * from ip_addr WHERE ip = '{ip}'")
        return cursor.fetchall()
    except (Exception, psycopg2.Error) as error:
        print("Error while connecting to PostgreSQL", error)
    finally:
        if connection:
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")

        