from datetime import datetime as dd
from faker import Faker
import pandas as pd
import random

fake = Faker()

# fake = Faker('en_US')

# fake.seed_instance(20)
# Faker.seed(20)

arr = []


for _ in range(3):

    user_id = random.randint(110000, 145000)
    user_name = fake.name()
    user_email = f"{user_name.lower().replace(" ", "")}@{random.choice(["gmail", "yahoo", "outlook", "hotmail"])}.com"
    user_age = random.randint(20, 80)
    address = fake.address()
    user_phone = f"{fake.country_calling_code()}{random.randint(700000000, 799999999)}"
    # state = fake.city()
    product_name = random.choice(["Lenovo PC", "PS4", "PS5", 
                                  "Iphone 12", "Iphone 12 mini", 
                                  "Iphone 12 pro", "Iphone 12 pro max", 
                                  "Iphone 13", "Iphone 13 pro", "Iphone 14", 
                                  "Iphone 14 pro", "Iphone 14 pro max", 
                                  "Iphone 15", "Iphone 15 plus", 
                                  "Iphone 15 pro", "Iphone 15 pro max", 
                                  "Samsung S21", "Samsung S21+", "Samsung S22", 
                                  "Samsung S24", "Samsung S24+", "Samsung S24 Ultra",
                                  "Samsung S22 Ultra", "Samsung S23+", "Samsung S23 Ultra"]) 
    quantity = random.randint(1, 3)
    status = random.choice(["Pending", "Delivered", "Cancelled"])
    payment_method = random.choice(["Cash", "Credit card", "PayPal", "Bank Transfer"])
    fake_date = fake.date_between(dd(2022, 1, 1), dd.now())


    arr.append([user_id, user_name, user_email, user_age, address, user_phone, product_name, quantity, status, str(fake_date)])
    
print(arr)

# from faker import Faker
# fake = Faker()
# names = [fake.first_name() for i in range(500)]
# assert len(set(names)) == len(names)