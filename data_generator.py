from faker import Faker
import random


fake = Faker()

fake = Faker('en_US')

fake.seed_instance(20)

Faker.seed(20)

name = fake.name()

print(name)