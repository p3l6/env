#! /usr/local/bin/python3
""" pip3 install markdown Pygments """
""" mkdir www """

import os
import markdown
from pygments.formatters.html import HtmlFormatter

tabs = ""
content = ""
#https://bitbucket.org/birkenfeld/pygments-main/src/7941677dc77d4f2bf0bbd6140ade85a9454b8b80/pygments/styles/xcode.py?at=default&fileviewer=file-view-default
#http://pygments.org/docs/styles/?highlight=style
codeCss = HtmlFormatter(style='default').get_style_defs('.codehilite')
extensions=['markdown.extensions.codehilite','markdown.extensions.tables','markdown.extensions.fenced_code']
extension_configs = {
    'markdown.extensions.codehilite': {
        'guess_lang': False
    },
}

for file in sorted(os.listdir(".")) :
    if file.endswith('.md'):
        name = file[:-3]
        if name.endswith('.local'):
            name = name[:-6]
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
