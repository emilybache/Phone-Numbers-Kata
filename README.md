# Phone Numbers Code Kata

This repo contains some sample data you could use to help test your solution to the Phone Numbers code kata. It also contains the python script I used to create the sample data. You can tweak it to create data that suits your needs.

To run the generate_data.py script, you'll need to install [Python 3](http://python.org).

The Names.csv file is from ["Generating Random Names as Test Data"](http://www.markrichman.com/2007/09/26/generating-random-names-as-test-data/), and that page says it is adapted from US census data. I have just converted his file from excel to csv to make it easier to handle.

# Kata description

_A description of this Kata is available in my book ["The Coding Dojo Handbook"](http://leanpub.com/codingdojohandbook). The following description is however taken directly from [http://cyber-dojo.com](http://cyber-dojo.com)_

Given a list of phone numbers, determine if it is 
consistent. In a consistent phone list no number 
is a prefix of another. For example:

- Bob 91 12 54 26
- Alice 97 625 992
- Emergency 911

In this case, it is not possible to call Bob because 
the phone exchange would direct your call to the 
emergency line as soon as you dialled the first three 
digits of Bob's phone number. So this list would not 
be consistent.
