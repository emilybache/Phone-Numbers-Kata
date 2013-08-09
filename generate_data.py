"""
Use this script to generate a file of names and phone numbers suitable for load testing the Phone Numbers code kata.
"""

import csv
import os
from random import choice, sample, randrange

phone_number_digits = ["", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
phone_number_partitions = ["", "-", " "]

def random_phonenumber():
    number = "0{0}{1}{2}{3}{4}{5}{6}".format("".join(sample(phone_number_digits, randrange(2,6))), 
                                    "".join(sample(phone_number_partitions, 1)), 
                                    "".join(sample(phone_number_digits, 3)),
                                    "".join(sample(phone_number_partitions, 1)),
                                    "".join(sample(phone_number_digits, 2)),
                                    "".join(sample(phone_number_partitions, 1)),
                                    "".join(sample(phone_number_digits, 2)),
                                    )
    return number


def name_generator(names_file):
    names_source = csv.reader(names_file)
    for row in names_source:
        name = row[randrange(4,6)]
        yield(name)
    

def generate_phonenumbers(outfile, name_source, entry_count=1000):
    writer = csv.writer(outfile)
    writer.writerow(["Name", "Phone Number"])
    for i, name in zip(range(entry_count), name_source):
        number = random_phonenumber()
        writer.writerow([name, number])   

if __name__ == "__main__":
    entry_count = 10000 # edit this to get a bigger file
    with open("phone_data_10000.txt", "w") as f:
        with open("Names.csv", encoding="UTF-8", newline='') as names_file:
            name_source = name_generator(names_file)
            generate_phonenumbers(f, name_source, entry_count)

        