USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell_script/"
LOG_FILE="$LOG_FOLDER/$0.log"

mkdir -p $LOG_FOLDER

VALIDATION(){
    if [ $1 -ne 0 ]; then
        echo " $2 ....FAILD"
        exit 1
    else
        echo " $2 ....SUCCESS"
    fi
}

for packages in $@ 
do
    dnf install $packages -y
    VALIDATION $? "Installation $packages"

done