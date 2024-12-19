

GREEN='\033[0;32m'  # Green
RED='\033[0;31m'    # Red
NC='\033[0m'        # No Color (reset to default)
YELLOW="\e[0;33m"

# check if the user provide 3 arguments 

if [[ $# -ne 3 ]]; then

echo -e "${YELLOW}porteye.sh <targetip> <startingport> <endingport>${NC}"
exit 1

fi

# user press Ctrl+C the script will stop

function handle_interrupt() {

 # print the discovered open ports before exiting
if [[ ${#result_array[@]} -ne 0 ]]; then
echo ""
echo -e "${YELLOW} Discoverd Open Ports ${NC}\n"
i=1
while((i<$count))
do

echo -e "$GREEN${result_array[$i]}$NC"

((i++))

done

fi

    echo -e "\n"
    echo -e "${RED}\nKeyboard interrupt (Ctrl+C) detected. Exiting the script...${NC}"
    exit 1
}

# Trap SIGINT (Ctrl+C)
trap handle_interrupt SIGINT


display_banner() {
clear
echo -e "${GREEN}"
cat << "EOF" 
  
  _____           _   ______           
 |  __ \         | | |  ____|          
 | |__) |__  _ __| |_| |__  _   _  ___ 
 |  ___/ _ \| '__| __|  __|| | | |/ _ \
 | |  | (_) | |  | |_| |___| |_| |  __/
 |_|   \___/|_|   \__|______\__, |\___|
                             __/ |     
                            |___/

                    Developer: Sreeraj

EOF
echo -e "${NC}${YELLOW}* Copyright © Sreeraj, 2024${NC}"
echo -e "${YELLOW}* GitHub: https://github.com/s-r-e-e-r-aj${NC}"
 echo -e "\n"
}

scanner() {

result_array=();
count=1

ipaddress=$1
startingport=$2
endingport=$3

for((port=startingport;port<=endingport;port++))
do

timeout 2  bash -c "echo > /dev/tcp/$ipaddress/$port" &> /dev/null

if [ $? -eq 0 ]; then

echo -e  "$GREEN $port is open at host $ipaddress$NC"
result_array[$count]="$port is open at host $ipaddress" 
((count++))
else

echo -e "$RED $port is closed at host $ipaddress$NC"

fi


done

echo ""

# print the discovered open ports
if [[ ${#result_array[@]} -ne 0 ]]; then

echo -e "${YELLOW}Discovered Open Ports ${NC}\n"

i=1
while((i<$count))
do

echo -e "$GREEN${result_array[$i]}$NC"

((i++))

done

fi

}

display_banner
scanner $1 $2 $3
