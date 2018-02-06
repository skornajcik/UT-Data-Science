import csv
voter_id = []
can = []
ucan = []
tot_vote = 0 
canvote = []
ucann = []
winner = ''
winnerv = 0
with open('election_data_1.csv','r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter = ',')
    next(csv_reader)
    for r in csv_reader:
        voter_id.append(r[0])
        can.append(r[2])
        #print(r[0])

tot_vote = (len(voter_id))


ucan = set(can)
ucann = list(ucan)
ucanlength = (len(ucann))
votes = [0]*(ucanlength)
avg_votes = [0]*ucanlength
for i in range(tot_vote):
    for j in range(ucanlength):
        if can[i] == ucann[j]:
            votes[j] += 1       
for j in range(ucanlength):
    avg_votes[j] = round(votes[j]/tot_vote * 100)
winnerv = max(votes)
for j in range(ucanlength):
    if votes[j] == winnerv:
        winner = ucann[j]

print(" ")    
print("Election Results")
print("----------------")
print("Total Votes: " + str(tot_vote))
print('-----------------')
for j in range(ucanlength):
    print(ucann[j] + ": " +str(avg_votes[j])+"% ("+ str(votes[j])+")")
print('------------------')
print('Winner: '+ winner)
print('')
     
