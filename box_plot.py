# Program created by me for high school students to enable them to check answers to tasks related to box plots as part of a statistics course.

import numpy as np
import matplotlib.pyplot as plt

# Calculate quartiles, interquartile range and outliers. 
def calculate_quartiles(data):
    Q1 = np.percentile(data, 25)
    Q2 = np.percentile(data, 50)
    Q3 = np.percentile(data, 75)
    IQR = Q3 - Q1
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    outliers = [x for x in data if x < lower_bound or x > upper_bound]
    return Q1, Q2, Q3, outliers

# Program will ask an user to put numbers which are going to be analysed. The user can use space, comma, or semicolon to separate numbers. 
def main():
    data_str = input("Enter all numbers for analysis, separated by space, comma, or semicolon: ")
    data_str = data_str.replace(',', ' ')  # Replace commas with spaces
    data_str = data_str.replace(';', ' ')  # Replace semicolons with spaces
    data = data_str.split()
    data = [float(x) for x in data]

    # Calculating the number of data points
    n = len(data)
    if n == 0:
        print("No data entered.")
        return
    
    # Calculating statistics
    min_val = min(data)
    max_val = max(data)
    Q1, Q2, Q3, outliers = calculate_quartiles(data)
    mean_val = np.mean(data)
    mode_val = float(max(set(data), key=data.count))
    
    # Displaying statistics
    print("Number of data points:", n)
    print("Min:", min_val)
    print("Q1 (25th percentile):", Q1)
    print("Q2 (median, 50th percentile):", Q2)
    print("Q3 (75th percentile):", Q3)
    print("Max:", max_val)
    print("Outliers:", outliers)
    print("Mean:", mean_val)
    print("Mode:", mode_val)
    print("Median:", Q2)

    # Creating x-axis values
                                                                
                                                                    # Taki był kod z chatu
                                                                    # max_x = max_val + 3
                                                                    #x_values = [min_val - 3] + data 
                                                                    
    x_values = [min_val - 3] + data + [max_val + 3]
    
    # Drawing a horizontal box plot
    plt.figure(figsize=(10, 6))
    bp = plt.boxplot(data, vert=False, showmeans=False)
    plt.title('Horizontal Box Plot of Data')
    plt.xlabel('Values')
    plt.ylabel('')  # Hide the Y axis label
    plt.xticks([int(x) for x in np.arange(min_val - 3, max_val + 3)])    #  plt.xticks([int(x) for x in np.arange(min_val - 3, max_x + 1)])                                                            
    plt.yticks([])  # Hide Y axis ticks
    
    # Adding information about mean
    plt.axvline(x=mean_val, color='red', linestyle='--', label='Mean')
    
    # Setting x-axis limits
    plt.xlim(min_val - 3,  max_val + 3)            ## plt.xlim(min_val - 3, max_x)
    
    # Adding box plot elements
    for element in ['boxes', 'whiskers', 'fliers', 'caps']:
        plt.setp(bp[element], color='black', linewidth=1.5)
    
    plt.legend()
    
    plt.show()

if __name__ == "__main__":
    main()


# Krzysztof Buczyński



Powered by 
Podaj wszystkie liczby do analizy, oddzielone spacją, przecinkiem lub średnikiem:  52, 57, 57, 58, 63, 66, 66, 67, 67, 68, 69, 70, 70, 70, 70, 72, 73, 75, 75, 76, 76, 78, 79, 89
 
Liczba danych: 24
Min: 52.0
Q1 (25th percentile): 66.0
Q2 (median, 50th percentile): 70.0
Q3 (75th percentile): 75.0
Max: 89.0
Outliers: [52.0, 89.0]
Średnia arytmetyczna: 69.29166666666667
Moda: 70.0
Mediana: 70.0
https://python-code-aws.trinket.io/python-generated/cejji4wi/trinket_plot.png