
ls -e; to display acl permissions
chmod +a "permission string" file; to add an acl, example:
chmod -R +a "backupexec allow read,readattr,readextattr,readsecurity,file_inherit,directory_inherit" /dumps
man ls has explanations of the permission strings
