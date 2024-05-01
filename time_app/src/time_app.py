from flask import Flask
import requests
import datetime

app = Flask(__name__)
counter = 0

# @app.route('/time', methods=['GET'])
# def get_time():
#     global counter
#     counter += 1
#     return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

@app.route('/time', methods=['GET'])
def get_time():
    global counter
    counter += 1
    response = requests.get('http://worldtimeapi.org/api/timezone/Europe/Moscow')
    if response.status_code == 200:
        return response.json()['datetime']
    else:
        return "Не удалось получить время: response != 200"

@app.route('/statistics', methods=['GET'])
def get_statistics():
    global counter
    return str(counter)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)