import requests

url = "https://example.com"

response = requests.get(url)

print("+------------------------+")
print(response.status_code)
print("+------------------------+")
print(response.headers)
print("+------------------------+")
print(response.text)
print("+------------------------+")
