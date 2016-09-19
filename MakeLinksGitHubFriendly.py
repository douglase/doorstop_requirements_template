
#python MakeLinksGitHubFriendly.py

import glob
import os

md_files=glob.glob("dist/*.markdown")
for markd_file in md_files:
    with open(markd_file+".out", "wt") as fout:
        with open(markd_file, "rt") as fin:
            for line in fin:
                if "#" in line:
                    split_into_lines=line.split("[")
                    new_line=''
                    for i,s2 in enumerate(split_into_lines):
                    #print(s2)
                        if "#" in s2:
                            split_links=s2.split("#")
                            new_link=split_links[0]+"#1-"+split_links[1].lower().replace('.', '').replace(' ','').replace(")","-) ")#+'-'
                        if i >0:
                            new_line+="  ["+new_link
                        else:
                            new_line = s2
                    #print(new_line)
                    line=new_line
                #else:
                #print(line)
                fout.write(line) 
    fout.close()
    fin.close()
    os.rename(markd_file+".out", markd_file)

