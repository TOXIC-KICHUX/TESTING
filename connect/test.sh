pause() {
    read -n1 -r -p "Press any key to start process..." key
apt-get update
apt-get upgrade
}

getinfo() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        else 
            distro="invalid"
        fi
    fi
}

envinfo(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

   INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        SUDO=""
    else
        SUDO="sudo"
    fi
}

install_packages(){
    
    packages=(git curl ffmpeg figlet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
    else
        echo "Amarok-MD could not install dependencies,exiting process."
        exit
    fi
}
clear
pause
clear
$SUDO sudo apt -y remove nodejs
curl -fsSl https://deb.nodesource.com/setup_lts.x | $SUDO bash - && $SUDO apt -y install nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | $SUDO apt-key add - 
echo "deb https://dl.yarnpkg.com/debian/ stable main" | $SUDO tee /etc/apt/sources.list.d/yarn.list
$SUDO apt -y update && $SUDO apt -y install yarn
getinfo
envinfo
install_packages
clear
figlet Amarok-MD
echo "Cloning Amarok-MD git repo..."
read -p "Enter Your github username: " amarok
git clone https://github.com/"${amarok}"/AMAROK-MD
cd Amarok-MD
clear
echo "Installing required packages,it will take time..."
pauseagain() {
echo -e "\e[4;34mMake sure you have filled vars in \e[1;32mconfig.env\e[0m"
    read -n1 -r -p "Press any key to continue..." key
}
pauseagain
clear
yarn install --network-concurrency 1
clear
echo "Installed packages.."
echo "Starting Bot Server..."
clear
npm i -g pm2 && pm2 start index.js && pm2 save && pm2 logs
clear
