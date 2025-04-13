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

echo -e  "${BRed}Welcome to the User command guide!${RESET}"
echo -e  "${BRed}Here is a list of commands and practical examples.${RESET}"

# Section SU
section "su:"
echo "Switch user or execute commands as another user."
example "su <username>           # Switch to another user (you'll need the password)."
example "su root                 # Switch to the root user."
example "su -                    # Switch to the root user with a login shell (loads environment)."
note "'su' is commonly used for administrative tasks, but be cautious while using root privileges."
note "You can also run a single command as another user: su -c 'command' <username>."
echo

# Section WHO
section "who:"
echo "Displays information about users who are currently logged in."
example "who               # Displays details about logged-in users (username, terminal, login time)."
example "who am i          # Shows information about the current user session."
note "The output includes the username, terminal, and login time."
echo
#Section W
section "w:"
echo "To display list of users and their activities"
exemple "w                 # Display list of users and their activites"
# Section PASSWD
section "passwd:"
echo "Change the password of a user."
example "passwd            # Change the current user's password."
example "passwd <username> # Change the password of a specific user (requires root)."
note "To change the password, you'll be prompted to enter the current password and the new one."
note "Use 'sudo' or 'su' for changing other users' passwords."
echo

# Section USERADD
section "useradd:"
echo "Adds a new user to the system."
example "useradd <username>          # Adds a new user with the given username."
example "useradd -m <username>      # Create a home directory for the user."
example "useradd -G <group> <username> # Add user to a specific group."
note "Root privileges are required to create a new user."
note "You can also specify the user's shell with '-s' and their home directory with '-d'."
echo


# Section USERMOD
section "usermod:"
echo "Modify an existing user account."
example "usermod -aG <group> <username>   # Add a user to a group."
example "usermod -L <username>            # Lock a user account."
example "usermod -U <username>            # Unlock a user account."
note "Root privileges are required to modify user accounts."
note "This is useful for changing user groups, locking/unlocking accounts, or changing user details."
echo

# Section USERDEL
section "userdel:"
echo "Deletes a user from the system."
example "userdel <username>              # Delete a user account."
example "userdel -r <username>          # Delete the user and their home directory."
note "Be cautious when deleting users, as this can lead to data loss if not handled carefully."
echo

# Section CHOWN
section "chown:"
echo "Change ownership of files or directories."
example "chown <user>:<group> <file>     # Change ownership of a file to the specified user and group."
example "chown -R <user>:<group> <dir>  # Change ownership recursively for all files in a directory."
note "Root privileges may be required to change ownership of system files."
note "This command is useful when transferring files between users or adjusting permissions."
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
