from faker import Faker

fake = Faker()

fake = Faker('en_US')

fake.seed_instance(20)

Faker.seed(20)

name = fake.name()

print(name)

# pip list

# pip freeze > requirements.txt

#  env/Scripts/activate.bat

# source .venv/bin/activate

# venv/Scripts/activate

# pip install virtualenv

# python (virtualenv -m venv myvenv)

# source activate 

# deactivate