import sys, os, argparse, json

# Setup argparse
parser = argparse.ArgumentParser(description="This python script returns sub directories to a given directory path in an Alfred-friendly JSON object.")
parser.add_argument("-p", "--path", help="Paths to the directory")
args = parser.parse_args()

alfredItemsObject = []
# Custom projects, outside of normal directory
for projectPath in ["~/env", "~/env-local", "~/var/Underwriter/athena/athena.code-workspace"]:
    head, tail = os.path.split(projectPath)
    alfredItemsObject.append({
        "uid": projectPath,
        "type": "file",
        "title": tail,
        "subtitle": projectPath,
        "arg": projectPath,
        "autocomplete": tail,
        "icon": {
            "type": "fileicon",
            "path": projectPath
        }
    })

# Script
if args.path or os.environ['PROJECT_FOLDER']:
    path = args.path or os.environ['PROJECT_FOLDER']
    
    for directory, subDirectories, subFiles in os.walk(os.path.expanduser(path)):
        for subDirectory in subDirectories:
            directoryName = subDirectory
            pathToDirectory = directory
            fullPathToSubDirectory = directory + "/" + subDirectory

            alfredItemsObject.append({
                "uid": pathToDirectory,
                "type": "file",
                "title": directoryName,
                "subtitle": fullPathToSubDirectory,
                "arg": fullPathToSubDirectory,
                "autocomplete": pathToDirectory,
                "icon": {
                    "type": "fileicon",
                    "path": fullPathToSubDirectory
                }
            })
        
        # Stop os.walk() after the first directory
        # https://stackoverflow.com/questions/43618746/os-walk-stop-looking-on-subdirectories-after-first-finding
        subDirectories[:] = []

        sys.stdout.write(json.dumps({ "items": alfredItemsObject }))
else:
    sys.stdout.write(json.dumps({ "items": [] }))
    
