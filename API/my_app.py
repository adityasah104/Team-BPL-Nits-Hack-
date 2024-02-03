from flask import Flask, request, jsonify
import joblib
from bs4 import BeautifulSoup
import requests

app = Flask(__name__)

model = joblib.load('dark_pattern_model.joblib')

def predict_dark_pattern(text):
    prediction = model.predict([text])
    return "Dark Pattern" if prediction[0] == 1 else "Not Dark Pattern"

@app.route('/predict', methods=['POST'])
def predict():
    json_input = request.json
    if 'url' not in json_input:
        return jsonify({'error': 'No URL provided.'}), 400
    url = json_input['url']
    text, error = get_text_from_url(url)
    if error:
        return jsonify({'error': error}), 500
    prediction = predict_dark_pattern(text)
    return jsonify({'prediction': prediction})

def get_text_from_url(url):
    headers = {'User-Agent': 'Mozilla/5.0'}
    try:
        response = requests.get(url, headers=headers, timeout=10)
        if response.status_code != 200:
            return None, f"Error fetching the webpage: Status code {response.status_code}"
        soup = BeautifulSoup(response.text, 'html.parser')
        text = soup.get_text(separator=' ')
        return text, None
    except requests.Timeout as e:
        return None, f"The request timed out: {e}"
    except requests.RequestException as e:
        return None, f"An error occurred: {e}"

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8080)