clear
TARGET=$1
lg="\e[1;32m"
n="\e[0m"
be="\e[0;34m" 

# init() {
#     clear
#     retrn=$(pwd)/'cms.bash'
#     bash $retrn
# }

echo -e "${lg}
  ____               ____       _            _   
 / ___|_ __ ___  ___|  _ \  ___| |_ ___  ___| |_ 
| |   | '_ ' _ \/ __| | | |/ _ \ __/ _ \/ __| __|
| |___| | | | | \__ \ |_| |  __/ ||  __/ (__| |_ 
 \____|_| |_| |_|___/____/ \___|\__\___|\___|\__|

${n}"
                    date
echo -e "${be}                  Artemis ${n}"
echo -e " "
echo "1. print dir"
echo "2. CMS detector"
echo " "
read -p "root@artemis:# " root

if [ $root == 1 ]; then
        wget -qO- $TARGET | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort -u  >> output.txt
    echo "Your dir saved to " *txt
    sleep 0.5
    # init

elif [ $root == 2 ]; then
        printf "\n"
        echo Output : $TARGET
        printf '\nFrom <meta name= : \n\n'
        wget -qO- $TARGET | awk '/meta name/{ gsub(/.generator=\042|\042./,"");print }'
        curl -s $TARGET | egrep -i '(wordpress|joomla|drupal)'
        printf '\nHeader : \n\n'
        curl $TARGET -I 
        printf '\nComment Tag : \n\n'
        curl -s $TARGET | sed ':a;N;$!ba;s/\n//g' | egrep -o '(<\!--[^>]*-->|<\!--[^-]*-->)'
        echo IP Target : 
fi     

    
