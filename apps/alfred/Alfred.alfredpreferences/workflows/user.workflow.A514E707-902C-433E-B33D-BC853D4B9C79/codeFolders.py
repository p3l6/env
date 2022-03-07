import json
import sys
import os

if len(sys.argv) <= 1:
  print("Provide argument: workpace directory")
  exit(2)

workspace_path = os.path.expanduser(sys.argv[1])

folders = [f for f in os.listdir(workspace_path) if os.path.isdir(os.path.join(workspace_path,f))]

def alfred_item(name, path):
  return {
    "uid": path,
    "type": "file",
    "title": name,
    "subtitle": path,
    "arg": path,
    "autocomplete": name,
    "icon": {
      "type": "fileicon",
      "path": path
    }
  }

def find_vscode(path):
  return [f for f in os.listdir(path) if os.path.splitext(f)[1] == '.code-workspace']

items = []

for f in folders:
  path = os.path.join(workspace_path, f)
  items.append(alfred_item(f, path))
  items.extend(alfred_item(w, os.path.join(path,w)) for w in find_vscode(path))

print(json.dumps({"items": items}))
