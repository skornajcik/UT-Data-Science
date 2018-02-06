
import csv
voter_id = []
candidate = []
unique_candidate = []
tot_vote = 0 
candidate_vote = []
unique_candidate_list = []
winner = ''
winner_number = 0
#open / extract data from file 
with open('election_data_1.csv','r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter = ',')
    next(csv_reader)
    for row in csv_reader:
        voter_id.append(row[0])
        candidate.append(row[2])
        
#number of votes
tot_vote = (len(voter_id))

#determine unique number of candidate
unique_candidate = set(candidate)
unique_candidate_list = list(unique_candidate)
#fine number of unique candidates
unique_candidate_length = (len(unique_candidate_list))
#create lists with the number of unique names
votes = [0]*(unique_candidate_length)
avg_votes = [0]*unique_candidate_length
#determine the number of votes per candidate
for i in range(tot_vote):
    for j in range(unique_candidate_length):
        if candidate[i] == unique_candidate_list[j]:
            votes[j] += 1       
#average of votes 
for j in range(unique_candidate_length):
    avg_votes[j] = round(votes[j]/tot_vote * 100)
winner_number = max(votes)
#determine who won
for j in range(unique_candidate_length):
    if votes[j] == winner_number:
        winner = unique_candidate_list[j]
#printing 
print(" ")    
print("Election Results")
print("----------------")
print("Total Votes: " + str(tot_vote))
print('-----------------')
for j in range(unique_candidate_length):
    print(unique_candidate_list[j] + ": " +str(avg_votes[j])+"% ("+ str(votes[j])+")")
print('------------------')
print('Winner: '+ winner)
print('')
     
