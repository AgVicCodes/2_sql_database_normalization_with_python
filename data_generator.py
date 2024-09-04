from datetime import datetime as dd, timedelta as td
from faker import Faker
import pandas as pd
import random

seed = random.randint(5100, 5500)

fake = Faker()

fake.seed_instance(seed)

arr = []

column_names = ["sales_id", "name", "email", "age", "address", "country", "phone", "product", "price", "quantity", "status", "order_date", "delivery_date"]

price = {
            "Iphone 12": 250, 
            "Iphone 12 mini": 225, 
            "Iphone 12 pro": 320, 
            "Iphone 12 pro max": 520, 
            "Iphone 13": 430, 
            "Iphone 13 pro": 540, 
            "Iphone 14": 870, 
            "Iphone 14 pro": 1050, 
            "Iphone 14 pro max": 1300, 
            "Iphone 15": 1150, 
            "Iphone 15 plus": 1280, 
            "Iphone 15 pro": 1400, 
            "Iphone 15 pro max": 1570, 
            "Lenovo PC": 750, 
            "PS4": 275, 
            "PS5": 400, 
            "Samsung S21": 285, 
            "Samsung S21+": 350, 
            "Samsung S22": 335, 
            "Samsung S22 Ultra": 480, 
            "Samsung S23 Ultra": 950,
            "Samsung S23+": 670, 
            "Samsung S24": 880, 
            "Samsung S24 Ultra": 1200,
            "Samsung S24+": 975 
        }

def get_price(product):
    return price[product]



for _ in range(1000):

    sales_id = random.randint(110000, 145000)
    user_name = fake.name()
    user_age = random.randint(20, 80)
    user_email = f"{user_name.lower().replace(" ", "") + str(user_age + random.randint(0, 10))}@{random.choice(["gmail", "yahoo", "outlook", "hotmail"])}.com"
    address = fake.address()
    country = fake.country()
    user_phone = f"{fake.country_calling_code()}{random.randint(700000000, 799999999)}"
    product_name = random.choice(["Lenovo PC", "PS4", "PS5", 
                                    "Iphone 15", "Iphone 15 plus", 
                                    "Iphone 12", "Iphone 12 mini", 
                                    "Iphone 12 pro", "Iphone 12 pro max", 
                                    "Iphone 14 pro", "Iphone 14 pro max", 
                                    "Iphone 15 pro", "Iphone 15 pro max", 
                                    "Iphone 13", "Iphone 13 pro", "Iphone 14", 
                                    "Samsung S21", "Samsung S21+", "Samsung S22", 
                                    "Samsung S24", "Samsung S24+", "Samsung S24 Ultra",
                                    "Samsung S22 Ultra", "Samsung S23+", "Samsung S23 Ultra"]) 
    price = get_price(product_name)
    quantity = random.randint(1, 3)
    status = random.choice(["Pending", "Delivered", "Cancelled"])
    payment_method = random.choice(["Cash", "Credit card", "PayPal", "Bank Transfer"])
    order_date = fake.date_between(dd(2022, 1, 1), dd.now())
    delivery_date = order_date + td(random.choice([1, 2, 3, 4]))

    arr.append([sales_id, user_name, user_email, user_age, address, country, user_phone, product_name, price, quantity, status, str(order_date), str(delivery_date)])
    

df = pd.DataFrame(arr, columns = column_names)

# pd.set_option("display.max_rows", None)

# print("\n", seed)