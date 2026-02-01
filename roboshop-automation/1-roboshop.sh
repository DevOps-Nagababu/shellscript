USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell_script/"
LOG_FILE="$LOG_FOLDER/$0.log"

mkdir -p $LOG_FOLDER

VALIDATION(){
    if [ $? -ne 0 ]; then
        echo " Installation ....FAILD"
        exit 1
    else
        echo " Installation ....SUCCESS"
    fi
}

for packages in $@ 
do
    dnf install $packages -y
    VALIDATION S? "Installation $packages"

done