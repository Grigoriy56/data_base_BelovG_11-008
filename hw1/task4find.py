import json
with open('Yandex-Taxi.txt', 'r') as file:
    data = json.load(file)

# f_name = input()
# f_data = input('write like: 2021-03-28\n')
f_name = 'Grisha'
f_date = '2021-03-28'

for cl in data['Clients']:
    if cl['name'] == f_name:
        f_id = cl['client_id']
        break

trips = []
for tr in data["Trips"]:
    if tr['client_id'] and tr['date'] == f_date:
        trips.append(tr)
print(trips)