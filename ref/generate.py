#! /usr/local/bin/python3
""" pip3 install markdown Pygments """


import markdown
from pygments.formatters.html import HtmlFormatter

infoLines = open("cheat poster info.txt", 'r').readlines()
title = False
currentItem = None
items = dict()
tabs = ""
content = ""
codeCss = HtmlFormatter().get_style_defs('.codehilite')
extensions=['markdown.extensions.codehilite','markdown.extensions.tables','markdown.extensions.fenced_code']
extension_configs = {
    'markdown.extensions.codehilite': {
        'guess_lang': False
    },
}

for line in infoLines :
    if "===" in line:
        title = not title
        continue
    if title:
        currentItem = line.strip()
    else:
        if currentItem in items:
            items[currentItem] += line
        else:
            items[currentItem] = line


for item in items:
    tabs += '    <button class="tablinks" onclick="openCity(event, \'%s\')">%s</button>\n' % (item, item)
    content += """<div id="%s" class="tabcontent">
%s
</div>
""" % (item, markdown.markdown(items[item], extensions=extensions, extension_configs=extension_configs))


with open("template.html", "rt") as fin:
    with open("www/index.html", "wt") as fout:
        for line in fin:
            line = line.replace('<%tabs%>', tabs)
            line = line.replace('<%content%>', content)
            line = line.replace('<%code-style%>', codeCss)
            fout.write(line)
