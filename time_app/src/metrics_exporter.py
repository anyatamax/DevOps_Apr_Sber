from prometheus_client import start_http_server, Gauge
import requests
import time

REQUEST_COUNT = Gauge('request_count', 'Количество запросов к эндпоинту /time')

def fetch_statistics():
    while True:
        response = requests.get("http://app-service/statistics")
        request_count = int(response.text) 
        REQUEST_COUNT.set(request_count)
        time.sleep(30)

if __name__ == '__main__':
    start_http_server(8000)
    fetch_statistics()