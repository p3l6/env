#! /usr/local/bin/python3
""" pip3 install markdown Pygments """

import os
import markdown
from pygments.formatters.html import HtmlFormatter

tabs = ""
content = ""
codeCss = HtmlFormatter().get_style_defs('.codehilite')
extensions=['markdown.extensions.codehilite','markdown.extensions.tables','markdown.extensions.fenced_code']
extension_configs = {
    'markdown.extensions.codehilite': {
        'guess_lang': False
    },
}

for file in os.listdir(".") :
    if ".md" in file:
        name = os.path.splitext(file)[0]
        fileText = open(file, 'rt').read()
        tabs += '    <button class="tablinks" onclick="openCity(event, \'%s\')">%s</button>\n' % (name, name.upper())
        content += """<div id="%s" class="tabcontent">
%s
</div>
""" % (name, markdown.markdown(fileText, extensions=extensions, extension_configs=extension_configs))


with open('template.html', 'rt') as fin:
    with open('www/index.html', 'wt') as fout:
        for line in fin:
            line = line.replace('<%tabs%>', tabs)
            line = line.replace('<%content%>', content)
            line = line.replace('<%code-style%>', codeCss)
            fout.write(line)
