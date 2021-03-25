import json

with open('SraAccList.txt') as f:
    lines = f.read().splitlines()

input_list= {"SRAs":lines}
json_object= json.dumps(input_list)

# Writing to SraAccList.json
with open("SraAccList.json", "w") as outfile:
    outfile.write(json_object)
