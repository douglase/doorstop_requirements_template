print('generating graphviz diagram with graphviz for python')
from graphviz import Digraph
import yaml

import doorstop
import textwrap
tree=doorstop.core.build()

dot = Digraph(comment='The Requirements', format='png')
dot.body.extend([ 'rankdir=LR','size="200,50"']) #,

use_short_names=True

for document in  tree.documents:
    for item in document.items:

        if use_short_names:
                content=item.uid.value+"\n"+str(item.data["short name"])
        else:
            content=item.uid.value+"\n"+textwrap.fill(item.text,35)
        dot.node(item.uid.value,content)#item.text)
        for link in item.links:
            dot.edge(link.value,item.uid.value)#, constraint='false')


dot.render()#save("dot.svg")

print('graphviz rendered')
