#!/bin/bash

#!/bin/bash

# Regular Colors
# These are the basic colors for text in the terminal
Black='\033[0;30m'       # Black
Red='\033[0;31m'         # Red
Green='\033[0;32m'       # Green
Yellow='\033[0;33m'      # Yellow
Blue='\033[0;34m'        # Blue
Purple='\033[0;35m'      # Purple
Cyan='\033[0;36m'        # Cyan
White='\033[0;37m'       # White

# Bold Colors
# These are the bold versions of the basic colors
BBlack='\033[1;30m'      # Bold Black
BRed='\033[1;31m'        # Bold Red
BGreen='\033[1;32m'      # Bold Green
BYellow='\033[1;33m'     # Bold Yellow
BBlue='\033[1;34m'       # Bold Blue
BPurple='\033[1;35m'     # Bold Purple
BCyan='\033[1;36m'       # Bold Cyan
BWhite='\033[1;37m'      # Bold White

# Underline Colors
# These are the colors for underlined text
UBlack='\033[4;30m'      # Underline Black
URed='\033[4;31m'        # Underline Red
UGreen='\033[4;32m'      # Underline Green
UYellow='\033[4;33m'     # Underline Yellow
UBlue='\033[4;34m'       # Underline Blue
UPurple='\033[4;35m'     # Underline Purple
UCyan='\033[4;36m'       # Underline Cyan
UWhite='\033[4;37m'      # Underline White

# Background Colors
# These are the colors for the background of the terminal
On_Black='\033[40m'      # Background Black
On_Red='\033[41m'        # Background Red
On_Green='\033[42m'      # Background Green
On_Yellow='\033[43m'     # Background Yellow
On_Blue='\033[44m'       # Background Blue
On_Purple='\033[45m'     # Background Purple
On_Cyan='\033[46m'       # Background Cyan
On_White='\033[47m'      # Background White

# High Intensity Colors
# These are the brighter versions of the regular colors
IBlack='\033[0;90m'      # High Intensity Black
IRed='\033[0;91m'        # High Intensity Red
IGreen='\033[0;92m'      # High Intensity Green
IYellow='\033[0;93m'     # High Intensity Yellow
IBlue='\033[0;94m'       # High Intensity Blue
IPurple='\033[0;95m'     # High Intensity Purple
ICyan='\033[0;96m'       # High Intensity Cyan
IWhite='\033[0;97m'      # High Intensity White

# Bold High Intensity Colors
# These are both bold and bright versions of the colors
BIBlack='\033[1;90m'     # Bold High Intensity Black
BIRed='\033[1;91m'       # Bold High Intensity Red
BIGreen='\033[1;92m'     # Bold High Intensity Green
BIYellow='\033[1;93m'    # Bold High Intensity Yellow
BIBlue='\033[1;94m'      # Bold High Intensity Blue
BIPurple='\033[1;95m'    # Bold High Intensity Purple
BICyan='\033[1;96m'      # Bold High Intensity Cyan
BIWhite='\033[1;97m'     # Bold High Intensity White

# High Intensity Background Colors
# These are bright backgrounds for terminal output
On_IBlack='\033[0;100m'  # High Intensity Background Black
On_IRed='\033[0;101m'    # High Intensity Background Red
On_IGreen='\033[0;102m'  # High Intensity Background Green
On_IYellow='\033[0;103m' # High Intensity Background Yellow
On_IBlue='\033[0;104m'   # High Intensity Background Blue
On_IPurple='\033[0;105m' # High Intensity Background Purple
On_ICyan='\033[0;106m'   # High Intensity Background Cyan
On_IWhite='\033[0;107m'  # High Intensity Background White

# Reset the terminal color back to normal
RESET='\033[0m'  # Reset color to default


# Fonction pour afficher des sections
function section {
    echo -e "${BBlue}$1${RESET}"
}

function example {
    echo -e "    ${BGreen}$1${RESET}"
}

function note {
    echo -e "    ${BYellow}$1${RESET}"
}

# Section MAN
section "man <command>:"
echo "Go to the man (manual) page of a command to find more information."
example "man man"
example "man ls"
example "man echo"
echo

# Section ECHO
section "echo \"Text\":"
echo "Display text in the terminal."
example "echo \"Hello, World!\"           # Display 'Hello, World!'"
example "echo \"text\" >> outfile.txt    # Append text to a file"
example "echo \"\$(ls)\"                  # Output the result of the 'ls' command"
echo

# Section LS
section "ls: List files and directories in the current directory"
echo "Common options:"
example "ls simple list of files and directories in current directories. "
example "ls -m	Lists directory contents separated by a comma."
example "ls -Q	Displays directory contents enclosed by quotation marks."
example "ls -l	Displays files in a long-list format."
example "ls -lh	Display file size in a human-readable format."
example "ls -g	Omits group ownership column."
example "ls -F	Adds a forward slash to directories."
example "ls -i	Display inode number of files and directories."
example "ls -a	Display all files including hidden files."
example "ls *.	Filters files according to the file extension."
example "ls -la	Displays all files and directories in long list format."
example "ls -R	Display files and directories recursively."
example "ls -r	Sort Files in reverse."
example "ls -X	Sort files alphabetically by file extension."
example "ls -tl	Display files according to file creation date and time."
    
note "'ls -l' shows file permissions too (r: read, w: write, x: execute)."
note "Use 'ls <File>' or 'ls <Directory>' for specific targets."
note   "ls - l <File> or <Directory> shows only the -l info of specific file or directory."
echo

# Section CD
section "cd:"
echo "Change the current directory."
example "cd /path/to/directory"
example "cd ~/Documents"
echo

# Section CHMOD
section "chmod: Change file or directory permissions"
echo "Permissions define who can read, write, or execute a file/directory."
echo "Basics:"
example "chmod [options] [permissions] [file or directory]"

echo "Permission types:"
example "u : user (owner)"
example "g : group"
example "o : others"
example "a : all (u, g, o)"
example "+ : add permission"
example "- : remove permission"
example "= : set specific permissions"
example "r : read"
example "w : write"
example "x : execute"

echo "Examples:"
example "chmod -r file.txt       # Remove read permission."
example "chmod u+r file.txt      # Add read permission for the user."
example "chmod g-w file.txt      # Remove write permission for the group."
example "chmod a+x script.sh     # Add execute permission for everyone."

echo "Options:"
example "-R : Recursively apply changes to all files and subdirectories."
note "Example: chmod -R 755 /path/to/directory"
example "--reference=<file> : Use another file's permissions as a reference."
note "Example: chmod --reference=example.txt newfile.txt"

echo "Additional Notes:"
note "Use 'ls -l' to view file permissions."
note "'r', 'w', 'x' in 'ls -l' output correspond to read, write, and execute."
note "'-' indicates no permission."

echo "Example:"
example "ls -l file.txt"
note "-rw-r--r--  1 user group 1024 Nov 27 14:00 file.txt"
note "User: read, write | Group: read | Others: read"
echo

# Section mkdir
section "mkdir:"
echo "Create new directories."
example "mkdir <directory_name>      # Create a single directory."
example "mkdir dir1 dir2 dir3        # Create multiple directories."
example "mkdir -p dir1/dir2/dir3     # Create nested directories (parent directories if needed)."
note "Use 'ls' to verify the creation of directories."
echo



# Section rmdir
# Section rmdir
section "rmdir:"
echo "Remove empty directories."
example "rmdir <directory_name>      # Remove a single empty directory."
example "rmdir dir1 dir2 dir3        # Remove multiple empty directories."
example "rmdir -v dir1               # Verbosely remove an empty directory and display a message."
note "Directories must be empty to be removed with 'rmdir'."
note "If a directory is not empty, use 'rm -r <directory_name>' to remove it recursively."
example "rm -r dir1                   # Remove a non-empty directory."
note "For non-empty directories, 'rmdir' will fail and show an error message."
echo


# Section mv
section "mv:"
echo "Move or rename files and directories."
example "mv <source> <destination>   # Move a file or directory."
example "mv file.txt /path/to/dir/   # Move a file to a directory."
example "mv oldname.txt newname.txt # Rename a file."
example "mv dir1 /new/path/dir1      # Move a directory."
note "Overwrites the destination file without prompt by default. Use 'mv -i' to confirm."
echo

# Section apt
section "apt:"
echo "A command-line tool to manage packages on Debian-based systems."
example "sudo apt update             # Update the list of available packages."
example "sudo apt upgrade            # Upgrade installed packages to the latest versions."
example "sudo apt install <package>  # Install a package."
example "sudo apt remove <package>   # Remove a package."
note "Run 'sudo apt update' before installing or upgrading packages."
note "Use 'apt search <keyword>' to find packages."
echo

# Section install
section "install:"
echo "Copy files and set attributes, or install software packages (context-dependent)."
example "install file.txt /path/to/dir/      # Copy a file to a directory."
example "install -m 644 file.txt /path/     # Copy a file and set permissions."
note "In the context of package managers (e.g., apt, yum), 'install' is used to add software."
example "sudo apt install <package_name>    # Install software using apt."
example "sudo yum install <package_name>    # Install software using yum."
note "Ensure you have superuser privileges for system-level installations."
echo

# Section nano
section "nano:"
echo "A simple text editor for the terminal."
example "nano <filename>        # Open a file for editing."
example "nano newfile.txt      # Create a new file (if it doesn't exist)."
example "nano -w file.txt      # Open a file without wrapping long lines."
note "Use CTRL + X to exit, CTRL + O to save, and CTRL + K to cut text."
note "To search for text, use CTRL + W, and to paste text, use CTRL + U."
echo

# Section rm
section "rm:"
echo "Remove files or directories."
example "rm <file>                # Remove a single file."
example "rm file1.txt file2.txt   # Remove multiple files."
example "rm -i <file>              # Prompt before every removal (interactive mode)."
example "rm -r <directory>         # Recursively remove a directory and its contents."
note "Use 'rm -rf' to forcefully remove non-empty directories (be careful!)."
example "rm -rf dir1              # Remove a directory and all its contents without confirmation."
note "Be very careful with 'rm -rf', as it permanently deletes files and directories."
echo

# Section su
section "su:"
echo "Switch user or execute commands as another user."
example "su <username>           # Switch to another user (you'll need the password)."
example "su root                 # Switch to the root user."
example "su -                    # Switch to the root user with a login shell (loads environment)."
note "'su' is commonly used for administrative tasks, but be cautious while using root privileges."
note "You can also run a single command as another user: su -c 'command' <username>."
echo
