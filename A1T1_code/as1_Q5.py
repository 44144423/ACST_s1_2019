month = input("Input the month ")
day = int(input("Input the day: "))

if month in ( 'March', 'April', 'May', 'June'):
    output = 'TURE'
else:
    output = 'FALSE'

if (month == 'March') and (day > 19):
	output = 'TURE'
elif (month == 'June') and (day < 20):
	output = 'TURE'

print("output is", output)
 
