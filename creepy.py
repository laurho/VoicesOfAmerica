import re
import urllib

#parse through desired website
#rerieve all links
#store links to txt file
#use ruby file to load into array and repoen links for parsing
#ruby crawly.rb

tf = file('listy0.txt','wt')
print "Enter FULL URL WITH QUOTATIONS: "
myurl = input("@> ")
for i in re.findall('''href=["'](.[^"']+)["']''', urllib.urlopen(myurl).read(), re.I):
        print i 
        for j in re.findall('''href=["'](.[^"']+)["']''', urllib.urlopen(i).read(), re.I):
                print j
                tf.write(j+'\n')
tf.close()
