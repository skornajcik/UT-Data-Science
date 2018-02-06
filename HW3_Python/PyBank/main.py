import csv
count = 0
dates = []
Rev = []
avg = []
goldchange = 5
loldchange = 1000000000
print("")
print("Financial Analysis")
print("-----------------------------")
#put what ever file you want
with open('budget_data_1.csv', 'r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter = ',')
    next(csv_reader)
  
    for row in csv_reader:
        dates.append(row[0])
        Rev.append(row[1])
        for r in Rev:
            count = int(r) + count 
       
        num_date = len(dates)
        #if row
        #print(row[0])
    print("total months: " + str(num_date))
    print("total revenue: $" + str(count))

for i in range(num_date-1):
    change = int(((int(Rev[i])-int(Rev[i+1]))))
    if change > goldchange:
        goldchange = change
    if change < loldchange:
        loldchange = change
    avg.insert(i, int(abs(change)))
avg_change = sum(avg)/len(avg)
print("average revenue change: $" +str(avg_change))
print("Greatest Increase in Revenue: ($" +str(goldchange)+")")
print("Greatest Decrease in Revenue: ($" +str(loldchange) +")")
print("")
