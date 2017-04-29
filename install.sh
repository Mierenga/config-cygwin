# download the bundle in VIM_BUNDLES and make sure the line endings are compatible with windows

VIM_BUNDLES="Raimondi/delimitMate;scrooloose/nerdtree;majutsushi/tagbar;flazz/vim-colorschemes;"


PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# note: git clone destination arg cannot use ~ dir, using . instead

echo $VIM_BUNDLES | while IFS='/' read -d';' i j;
do 
    if [ ! -d ./.vim/bundle/$j ]; then
        printf ${PURPLE}
        echo "Installing $i/$j"
        printf ${NC}
        echo "git clone https://github.com/$i/$j.git ./.vim/bundle"
        git clone https://github.com/$i/$j.git ./.vim/bundle/$j
        ~/.vimfix.sh $j
    else
        PURPLE='\033[0;35m'
        printf ${PURPLE}
        echo Skipping: ./.vim/bundle/$j already exists
        printf ${NC}
        sleep 0.2
    fi
done
