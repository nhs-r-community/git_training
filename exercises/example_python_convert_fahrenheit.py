# this will run in python

import pandas as pd
import timeit

print(f"Running script\n")

# start the timer
start_time = timeit.default_timer()

def fahrenheit_to_celsius(temp_value):   
    """
    Takes a temp input in Fahrenheit and computes the Celsius equivalent.

    Args:
        temp: Input a Fahrenheit temperature.
    
    Returns: 
        New converted temperature in Celsius.
    """
    converted_temp = (temp_value - 35) * (5/9)       
    return converted_temp

# example for 100oF
new_temp = fahrenheit_to_celsius(100)

print("\nThese are the results\n")
print(new_temp)

# end the timer
total_time = timeit.default_timer() - start_time

# print duration
print(f"Running time of convert_fahrenheit.py: {int(total_time / 60)} minutes and {round(total_time%60)} seconds.")
