import os
import pandas as pd
# find all csv files
csv_files = []
for file in os.listdir("./"):
    if file.endswith(".csv") and file != 'merged.csv':
        csv_files.append(os.path.join("./", file))

# concatanate all csv files in merged.csv
#with open(r'merged.csv', 'w') as outfile:
#    outfile.write("pc,location,state\n");
#    for fname in inputs:
#        with open(fname, encoding="ascii", errors='ignore') as infile:
#            outfile.write(infile.read())

#
df_append = pd.DataFrame()
# append all files together
merged_csv=pd.concat([pd.read_csv(f) for f in csv_files])
merged_csv.to_csv("./merged.csv",index=False,encoding='ascii')
