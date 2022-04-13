#!/bin/bash
: '
random integers/values from arrays
'

countries=("Canada" "US" "India" "Norway" "France")
products=("Book" "Pen" "Phone" "Laptop" "Cookies")
prices=("10" "5" "50" "48" "2")


for i in {1..1000}
do
        # Generating random values
        index=$(shuf -i 0-4 -n 1)
        quantity=$(shuf -i 1-20 -n 1)
        price=${prices[$index]}

        # Calculating totalCost using the product price * quantity
        let "totalCost = quantity * price"

        # Canada Orders using grep
        echo -e "${products[$index]}\t$quantity\t$price\t$totalCost\t${countries[$RANDOM % 5]}" | grep Canada >> Canada_Orders

        # India Orders using grep
        echo -e "${products[$index]}\t$quantity\t$price\t$totalCost\t${countries[$RANDOM % 5]}" | grep India >> India_Orders

        # Orders over 500
        if [ $totalCost -ge 500 ]
        then
                echo -e "${products[$index]}\t$quantity\t$price\t$totalCost\t${countries[$RANDOM % 5]}" >> Orders_Over_500
        fi

done
