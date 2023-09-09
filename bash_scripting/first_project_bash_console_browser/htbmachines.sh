#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
echo -e "\n\n${redColour}[!] Exiting...${endColour}\n"
tput cnorm && exit 1
}

# Ctrl+C
trap ctrl_c INT

# Variables globales
main_url="https://htbmachines.github.io/bundle.js"

function helpPannel(){
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} Usage:${endColour}"
    echo -e "\t${purpleColour}u)${endColour}${grayColour} Download or update files${endColour}"
    echo -e "\t${purpleColour}m)${endColour}${grayColour} Search by a machine name${endColour}"
    echo -e "\t${purpleColour}i)${endColour}${grayColour} Search by an IP address${endColour}"
    echo -e "\t${purpleColour}o)${endColour}${grayColour} Search by OS${endColour}"
    echo -e "\t${purpleColour}d)${endColour}${grayColour} Search by difficulty${endColour}"
    echo -e "\t${purpleColour}s)${endColour}${grayColour} Search by skills${endColour}"
    echo -e "\t${purpleColour}y)${endColour}${grayColour} Obtain the youtube link for the solution of the HTB box${endColour}"
    echo -e "\t${purpleColour}h)${endColour}${grayColour} Show this help pannel${endColour}\n"
}

function updateFiles(){
    if [ ! -f bundle.js ]; then
        tput civis
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Downloading files...${endColour}"
        curl -s $main_url > bundle.js
        js-beautify bundle.js | sponge bundle.js
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} All files have been downloaded${endColour}"
        tput cnorm
    else
        tput civis
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Cheking if there are available updates...${endColour}"
        sleep 2
        curl -s $main_url > bundle_temp.js
        js-beautify bundle_temp.js | sponge bundle_temp.js
        md5_temp_value=$(md5sum bundle_temp.js | awk '{print $1}')
        md5_original_value=$(md5sum bundle.js | awk '{print $1}')

            if [ "$md5_temp_value" == "$md5_original_value" ]; then
                echo -e "\n${yellowColour}[+]${endColour}${grayColour} There are no updates available${endColour}"
                rm bundle_temp.js
            else
                echo -e "\n${yellowColour}[+]${endColour}${grayColour} There are updates available${endColour}"
                sleep 1

                rm bundle.js && mv bundle_temp.js bundle.js

                echo -e "\n${yellowColour}[+]${endColour}${grayColour} All files have been updated${endColour}"
            fi

            tput cnorm
    fi
}

function searchMachine(){
    machineName="$1"

    machineName_checker="$(cat bundle.js | awk "/name: \"$machineName\"/ ,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | whi>
        var=$(echo -e "${purpleColour}[+]${endColour} ${blueColour}$line\c${endColour}\c" | cut -d ":" -f 1 | tr -d ':')
        echo -e "$var\c"
        echo -e "${blueColour}  ${endColour}\c"
        echo -e "${grayColour}$line${endColour}\n" | cut -d " " -f 2
    done)"

    if [ "$machineName_checker" ]; then

        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Listing properties of the HTB box${endColour}${blueColour} $machineName${endColour}${grayColour}:${e>

        cat bundle.js | awk "/name: \"$machineName\"/ ,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | while read -r line; do
            var=$(echo -e "${purpleColour}[+]${endColour} ${blueColour}$line\c${endColour}\c" | cut -d ":" -f 1 | tr -d ':')
            echo -e "$var\c"
            echo -e "${blueColour}  ${endColour}\c"
            echo -e "${grayColour}$line${endColour}\n" | cut -d " " -f 2
        done
    else
        echo -e "\n${redColour}[!] The HTB box submited doesn't exist${endColour}\n"
    fi
}

function searchIP(){
    ipAddress="$1"

    machineName="$(cat bundle.js | grep "ip: \"$ipAddress\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"

    if [ "$machineName" ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} The HTB box associated with this IP address${endColour}${blueColour} ($ipAddress)${endColour}${grayC>
    else
        echo -e "\n${redColour}[!] This IP address submited doesn't exist${endColour}\n"
    fi
}

function getYoutubeLink(){

    machineName="$1"

    youtubeLink="$(cat bundle.js | awk "/name: \"$machineName\"/ ,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep youtub>

    if [ $youtubeLink ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} The resolution for this HTB machine is at the following link:${endColour}${blueColour} $youtubeLink$>
    else
        echo -e "\n${redColour}[!] The HTB machine submited doesn't exist${endColour}\n"
    fi
}

function getMachinesDifficulty(){
    difficulty="$1"

    results_check="$(cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

    if [ "$results_check" ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Showing machines with the selected difficulty -${endColour}${blueColour} $difficulty${endColour}${gr>
        cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
    else
        echo -e "\n${redColour} [!] The difficulty submited doesn't exist${endColour}\n"
    fi
}

function getOSMachines(){
    os="$1"

    os_check="$(cat bundle.js | grep "so: \"$os\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

    if [ "$os_check" ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Showing machines filtered by the OS${endColour}${blueColour} $os${endColour}${grayColour}:${endColou>
        cat bundle.js | grep "so: \"$os\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
    else
        echo -e "\n${redColour} [!] The OS submited doesn't exist${endColour}\n"
    fi
}

function getOSDifficultyMachines(){
    difficulty="$1"
    os="$2"

    osdifficulty_check="$(cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$difficulty\"" -B5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr ->

    if [ "$osdifficulty_check" ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Showing machines filtered by the OS${endColour}${blueColour} $os${endColour}${grayColour} and diffic>
        cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$difficulty\"" -B5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
    else
        echo -e "\n${redColour}[!] The OS submited or the difficulty doesn't exist${endColour}\n"
    fi
}

function getSkill(){
    skill="$1"

    skill_check="$(cat bundle.js | grep "skills: " -B 6 | grep "$skill" -i -B 6 | grep "name: " | awk 'NF {print $NF}' | tr -d '"' | tr -d ',' | column)"

    if [ "$skill" ]; then
        echo -e "\n${yellowColour}[+]${endColour}${grayColour} Listing machines that use this specific skill${endColour}${blueColour} $skill${endColour}${grayColou>
        cat bundle.js | grep "skills: " -B 6 | grep "$skill" -i -B 6 | grep "name: " | awk 'NF {print $NF}' | tr -d '"' | tr -d ',' | column
    else
        echo -e "\n${redColour}[!] No machines use the specified skill${endColour}\n"
    fi
}

# Indicadores
declare -i parameter_counter=0

# Chivatos
declare -i chivato_difficulty=0
declare -i chivato_os=0

while getopts "m:ui:y:d:o:s:h" arg; do
    case $arg in
        m) machineName="$OPTARG"; let parameter_counter+=1;;
        u) let parameter_counter+=2;;
        i) ipAddress="$OPTARG"; let parameter_counter+=3;;
        y) machineName="$OPTARG"; let parameter_counter+=4;;
        d) difficulty="$OPTARG"; chivato_difficulty=1; let parameter_counter+=5;;
        o) os="$OPTARG"; chivato_os=1; let parameter_counter+=6;;
        s) skill="$OPTARG"; let parameter_counter+=7;;
        h) ;;
    esac
done

if [ $parameter_counter -eq 1 ]; then
    searchMachine $machineName
elif [ $parameter_counter -eq 2 ]; then
    updateFiles
elif [ $parameter_counter -eq 3 ]; then
    searchIP $ipAddress
elif [ $parameter_counter -eq 4 ]; then
    getYoutubeLink $machineName
elif [ $parameter_counter -eq 5 ]; then
    getMachinesDifficulty $difficulty
elif [ $parameter_counter -eq 6 ]; then
    getOSMachines $os
elif [ $chivato_difficulty -eq 1 ] && [ $chivato_os -eq 1 ]; then
    getOSDifficultyMachines $difficulty $os
elif [ $parameter_counter -eq 7 ]; then
    getSkill "$skill"
else
    helpPannel
fi
