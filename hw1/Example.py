import random
import json
import ClassDescription as taxi
Yandex = taxi.App('Yandex')
from datetime import date, time

# completion for Yandex

# for Rates

yandex_eco = taxi.Rates(Yandex, 'econom', 80)
yandex_business = taxi.Rates(Yandex, 'business', 150,)
yandex_delivery = taxi.Rates(Yandex, 'delivery', 120)
yandex_rates = [yandex_eco, yandex_delivery, yandex_business]
yandex_trips = []

yandex_drivers = []
yandex_clients = []
names = ['Liam', 'Olivia', 'Noah', 'Emma', 'Oliver', 'Ava', 'Elijah', 'Charlotte', 'William', 'Sophia', 'James', 'Amelia', 'Benjamin', 'Isabella', 'Lucas', 'Mia', 'Henry', 'Evelyn', 'Alexander', 'Harper']

saturn = taxi.Taxipark(Yandex, 'Saturn')
cars_numbers = ['U 052 B T', 'Y 053 D T', 'Z 052 S V', 'S 587 Z Q', 'Q 364 D A', 'A 390 H J', 'J 364 W S', "S 364 S S",
                "J 076 U I", "O 322 G G"]
rate = 5.0
exp = 8

for i in range(5):
    driver = taxi.Driver(Yandex, random.choice(names), rate, f'{exp} years', cars_numbers.pop(0), saturn)
    yandex_drivers.append(driver)
    exp -= 1
    rate -= 0.1


premium = True
for name in range(5):
    client = taxi.Client(Yandex, random.choice(names), rate, premium)
    yandex_clients.append(client)
    premium = -premium
    rate -= 0.1


for name in range(10):
    random_month = random.randint(1, 12)
    random_day = random.randint(1, 28)
    random_hour = random.randint(0, 23)
    random_min = random.randint(0, 59)
    dist = random.randint(0, 13)
    trip = taxi.Trip(Yandex, random.choice(yandex_clients), random.choice(yandex_drivers),
                     random.choice(yandex_rates), str(date(2021, random_month, random_day)),
                     str(time(random_hour, random_min)), dist)
    yandex_trips.append(trip)

example_client = taxi.Client(Yandex, 'Grisha', 5, True)
yandex_clients.append(example_client)
for i in range(5):
    dist = random.randint(0, 13)
    ex_trip = taxi.Trip(Yandex, example_client, random.choice(yandex_drivers), random.choice(yandex_rates), '2021-03-28',
                        str(time(random_hour, random_min)), dist)
    yandex_trips.append(ex_trip)
# for dict
d_data = {}

d_data['App'] = []
d_data['Drivers'] = []
d_data['Clients'] = []
d_data['Rates'] = []
d_data['Trips'] = []
d_data['Taxipark'] = [{'name': saturn.name, 'autopark_id': saturn.autopark_id, 'cars_numbers': saturn.cars_numbers,
                       'drivers_list': saturn.drivers_list}]

d_data['App'].append({'name': Yandex.name, 'clients_number': Yandex.clients_number, 'clients_id': Yandex.clients_id,
                      'trips_numbers': Yandex.trips_numbers, 'trips_id': Yandex.trips_id, 'drivers_number': Yandex.drivers_number,
    'autoparks_numbers':Yandex.autoparks_numbers, 'drivers_id': Yandex.drivers_id, 'cars_numbers': Yandex.cars_numbers,
    'autoparks_id': Yandex.autoparks_id})

for i in range(len(yandex_rates)):
    d_data['Rates'].append({'name': yandex_rates[i].name, 'min_price': yandex_rates[i].min_price
    })

for e in yandex_drivers:
    d_data['Drivers'].append({'name': e.name, "driver_id": e.driver_id, "autopark_id": e.autopark_id,
                              "rating": e.rating, "car_number": e.car_number, "experience": e.experience})

for e in yandex_clients:
    d_data['Clients'].append({'name': e.name, "client_id": e.client_id, "rating": e.rating, "premium": e.premium})

for e in yandex_trips:
    d_data['Trips'].append({'client_id': e.client_id, "driver_id": e.driver_id, "rate": e.my_rates,
    'date': e.date, 'time': e.time, 'trip_id': e.trip_id, 'coef': e.coef, 'distance': e.distance})


with open('Yandex-Taxi.txt', 'w') as file:
    json.dump(d_data, file)

print(1)