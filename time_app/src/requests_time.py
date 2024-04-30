import requests
import time

while True:
    response = requests.get("http://app-service/statistics")
    with open("statistics.txt", "a") as file:
        file.write(response.text + '\n')
    time.sleep(5)

