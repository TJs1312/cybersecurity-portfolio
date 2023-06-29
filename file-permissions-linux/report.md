# File permissions in Linux

### Project description

The research team at my organization needs to update the file permissions for certain files and
directories within the *projects* directory. The permissions do not currently reflect the level of
authorization that should be given. Checking and updating these permissions will help keep
their system secure. To complete this task, I performed the following tasks:

### Check file and directory details

![Linux 1st screenshot](https://drive.google.com/uc?export=view&id=1KdZ1_OlhIqSMvmY7ExFcwepapm0GU8Vz)

First of all, we switch to the projects directory with the command *cd projects*
Next, to displays all the permissions, we used the command *ls -la*
*-la*  argument allows us to check permissions of all files and directories and also to include hidden files.

### Describe the permissions string

For a directory with full permissions for the **user**, **group** and **other** this string would be: *drwxrwxrwx*.
The first character, *d* stands for directory. Alternatively, *-* stands for a file.
We then go for 9 characters , each group of 3 stands for the different owners, in order : user/group/other.
In all of this group, *r* stands for read permissions, *w* stands for write permissions and *x* stands for execute permissions.
If we take the file **project_k.txt** as an example, the permissions displayed means that both user, group and other have read and write permissions.

### Change directory permissions

![Linux 2nd screenshot](https://drive.google.com/uc?export=view&id=1mFo_kwBCHS-49bERLI2gB1kNsFp8owQt)

The organization doesn’t want the owner **other** to have any kind of permissions on any file. This has been modified using the chmod command on **project_k.txt** , **project_r.txt** and **project_t.txt** files.

### Change file permissions on a hidden file

![Linux 3rd screenshot](https://drive.google.com/uc?export=view&id=1AcghYOVHa7-Eyt3xRKNMS6a3nhCHFT44)

The research team has archived **.project_x.txt**, which is why it’s a hidden file. This file should not have write permissions for anyone, but the user and group should be able to read the file.
This has been modified using the *chmod* command in order to retire writing permissions for both user and group owner, then to add read permissions for the group owner.

### Change directory permissions

![Linux 4th screenshot](https://drive.google.com/uc?export=view&id=1y_zC2rXYWfHC9IJUsPmWeFx7FaUkKV2x)

The files and directories in the projects directory belong to the **researcher2** user. Only **researcher2** should be allowed to access the **drafts** directory and its contents.
This has been modified using the *chmod* command in order to retire the execute permissions of the group owner.

### Summary

Permissions for directory projects have been checked. The owner **group** has lost all his permissions over the different directories and files. The hidden file **.project_x.txt** permissions have been updated following the organization requirements. Finally, the **drafts** directory permissions have been updated so only the user **researcher2** is allowed to read, write and execute it. All has been made with several uses of the *chmod* command.
