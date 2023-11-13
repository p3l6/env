import json
import sys
import os

if len(sys.argv) <= 1:
  print("Provide argument: workpace directory")
  exit(2)

allowFork = allowXcode = allowVscode = False
if len(sys.argv) > 2:
  if sys.argv[2] == "Fork.app": allowFork = True
  elif sys.argv[2] == "Xcode.app": allowXcode = True
  elif sys.argv[2] == "Visual Studio Code.app": allowVscode = True
else:
  allowFork = allowXcode = allowVscode = True


def xcode_item(name, path):
  return {
    "uid": "xc"+path, "type": "file:skipcheck",
    "title": name, "subtitle": path,
    "arg": ["x", path], "autocomplete": name,
    "icon": { "path": "./xcode.tiff" }
  }

def fork_item(name, path):
  return {
    "uid": "git"+path, "type": "file:skipcheck",
    "title": name, "subtitle": path,
    "arg": ["Fork.app", path], "autocomplete": name,
    "icon": { "path": "./fork.tiff" }
  }

def vscode_item(name, path):
  return {
    "uid": "vs"+path, "type": "file:skipcheck",
    "title": name, "subtitle": path,
    "arg": ["Visual Studio Code.app", path], "autocomplete": name,
    "icon": { "path": "./vscode.tiff" }
  }

workspace_path = os.path.expanduser(sys.argv[1])

top_level_folders = [f for f in os.scandir(workspace_path) if f.is_dir()]

items = []

for top_entry in top_level_folders:
  if allowVscode: items.append(vscode_item(top_entry.name, top_entry.path))
  if allowXcode: items.append(xcode_item(top_entry.name, top_entry.path))
  for child_entry in os.scandir(top_entry.path):
    if allowVscode and os.path.splitext(child_entry.name)[1] == '.code-workspace':
      items.append(vscode_item(child_entry.name, child_entry.path))
    elif allowFork and child_entry.name == '.git':
      items.append(fork_item(top_entry.name, top_entry.path))


print(json.dumps({"items": items}))
