# this command will run through the specified vim plugin in .vim/bundle and 
# convert the line endings so that they will work on Windows.

# if no arg is supplied, it will ask if you want to run it on all bundles,
# or you can supply one interactively

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

BUNDLE_DIR="$HOME/.vim/bundle/"

if [[ $# -eq 0 ]] ; then

    printf "Do you want to fix the entire ~/.vim/bundle directory (${GREEN}y${NC}/${RED}n${NC})? "
    old_stty_cfg=$(stty -g)
    stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
    if echo "$answer" | grep -iq "^y" ; then
        # yes, fix all bundles
        find ~/.vim/bundle/ -type f -exec dos2unix '{}' \;
    else
        # no, see what bundle they want to fix
        printf "\n\r\n\rBundles installed:\n\r\t"
        printf "${PURPLE}"
        ls ~/.vim/bundle
        printf "${NC}"
        printf "\n\rEnter a bundle directory name to fix: "
        read input_dir
        if [ -d ~/.vim/bundle/$input_dir ]; then
            # intput bundle exists, fix it 
            find ~/.vim/bundle/$input_dir/ -type f -exec dos2unix '{}' \;
            exit 0
        else
            printf "${RED}error: bundle $input_dir does not exist${NC}\n\r"
            exit 1
        fi
    fi

elif [ "$1" = "-a" ] ; then
    # -a flag fixes all the bundles
    find ~/.vim/bundle/ -type f -exec dos2unix '{}' \;

elif [ -d ~/.vim/bundle/$1 ] ; then
    # fix the bundle supplied as argument
    find ~/.vim/bundle/$1/ -type f -exec dos2unix '{}' \;
else
    printf "${RED}error: bundle $1 does not exist${NC}\n\r"
fi

