class my_app():

    # count for entity instances
    clients_number = -1
    drivers_number = -1
    trips_numbers = -1
    cars_numbers = -1
    autoparks_numbers = -1
    rates_numbers = -1

    # lists for their important attributes
    clients_id = []
    drivers_id = []
    trips_id = []
    cars_id = []
    autoparks_id = []
    rates_names = set()


    def __init__(self, name):
        self.name = name


class Client():
    def __init__(self, my_app: my_app, name, rating, avatar, premium):
        my_app.clients_number += 1
        my_app.clients_id.append(my_app.clients_number)
        self.client_id = my_app.clients_id[my_app.clients_number]
        self.name = name
        self.rating = rating  # can be from 1 to 5
        self.avatar = avatar
        self.premium = premium


class Driver():
    def __init__(self, my_app: my_app, name, rating, avatar, experience, cars_number, autopark_id):
        my_app.drivers_number += 1
        my_app.drivers_id.append(my_app.drivers_number)
        self.driver_id = my_app.clients_id[my_app.drivers_number]
        self.name = name
        self.rating = rating
        self.avarat = avatar
        self.experience = experience
        self.cars_numbers = cars_number
        self.autopark_id = autopark_id


class Rates():
    def __init__(self, my_app: my_app, name, min_price, coef, car_list):
        my_app.rates_numbers += 1
        my_app.rates_names.add(name)
        self.name = name
        self.min_price = min_price
        self.coef = coef
        self.car_list = car_list


class Trip():
    def __init__(self, my_app: my_app, my_client: Client, my_driver: Driver, my_rates: Rates, time, distance):
        my_app.trips_numbers += 1
        my_app.trips_id.append(my_app.trips_numbers)
        self.trip_id = my_app.trips_numbers[my_app.trips_numbers]
        self.driver_id = my_driver.driver_id
        self.client_id = my_client.client_id
        self.my_rates = my_rates.name
        self.time = time
        self.distance = distance
        # I dont know really equation of price, is just my things
        self.price = my_rates.coef * my_rates.min_price / my_client.rating


class Autopark(my_app):

