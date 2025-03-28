import json
import requests


url = "https://config.zscaler.com/api/zscaler.net/cenr/json"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()  # Parse JSON response
    print(data)
else:
    print(f"Failed to fetch data. Status code: {response.status_code}")

# Write formatted JSON
with open("zscaler_ip_range.json", "w") as file:
    json.dump(data, file, indent=2)
