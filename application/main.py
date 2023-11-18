from fastapi import FastAPI
import requests

app = FastAPI()

@app.get("/whoami/{ip}")
def get_ip(ip: str):
    return get_location(ip)


def get_location(ip_address):
    response = requests.get(f'http://ip-api.com/json/{ip_address}').json()
    location_data = {}
    if response.get("status") == "success":
        location_data = {
            "ip": ip_address,
            "country": response.get("country"),
            "city": response.get("city"),
            "isp": response.get("isp")
        }
    else:
        location_data = {
            "error": True,
            "message": "an error occurred, please try again"
        }
    return location_data