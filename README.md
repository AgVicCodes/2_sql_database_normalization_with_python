# SQL Database Normalization with Python

## Introduction
This project focuses on demonstrating SQL database normalization techniques, up to the third normal form (3NF), using Python. The goal is to organize a database efficiently to reduce redundancy and improve data integrity. It includes automated data generation for a sales transaction dataset, utilizing the **Faker** Python library. Faker is employed to create realistic fake sales transactions, simulating customer, product, and order data.

Additionally, an automation pipeline is set up in the `.github/workflows` directory using GitHub Actions. This pipeline automates the process of generating data and updating the database with each new commit, ensuring fresh data is consistently available for normalization scripts.

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Contributors](#contributors)
- [License](#license)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/AgVicCodes/2_sql_database_normalization_with_python.git
2. Install the dependencies:
   ```bash
   pip install -r requirements.txt
## Usage
1. Generate sample data using data_generator.py.
2. Load data into the database with load_to_sql.py.
3. Run the SQL normalization scripts like normalisation.sql.
## Features
- Data generation and loading scripts.
- SQL scripts for normalization up to 3NF.
- Sample database schema and data included.
## Dependencies
- Python
- SQL
## Contributors
This project is maintained by AgVicCodes.

## License
This project is licensed under the MIT License.
