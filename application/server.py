from fastapi import FastAPI
import requests
import uvicorn
from prometheus_fastapi_instrumentator import Instrumentator

# from db.connection import connect
# from db.createTable import create_table
# from db.select import select
# from db.insert import insert
    
app = FastAPI()

@app.get("/whoami/{ip}")
def get_ip(ip: str):
    return get_location(ip)

def get_location(ip_addr):
    location_data = {}
    # ip_record = select(ip_addr)
    ip_record = []
    if ip_record:
        location_data = {
            "ip": ip_addr,
            "country": ip_record[0][2],
            "city": ip_record[0][3],
            "isp": ip_record[0][4],
            "fetch": "local"
        }
    else:
        response = requests.get(f'http://ip-api.com/json/{ip_addr}').json()
        if response.get("status") == "success":
            location_data = {
                "ip": ip_addr,
                "country": response.get("country"),
                "city": response.get("city"),
                "isp": response.get("isp"),
                "fetch": "remote"

            }
            # connect(insert, location_data)
        else:
            location_data = {
                "error": True,
                "message": "an error occurred, please try again"
            }
    return location_data

if __name__ == '__main__' :
    Instrumentator().instrument(app).expose(app)
    # connect(create_table)

    uvicorn.run(app, host="0.0.0.0", port=3000)
