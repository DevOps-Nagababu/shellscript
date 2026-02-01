USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell_script/"
LOG_FILE="$LOG_FOLDER/$0.log"

mkdir -p $LOG_FOLDER

VALIDATION(){
    if [ $1 -ne 0 ]; then
        echo " $2 ....FAILD" &>> $LOG_FILE
        exit 1
    else
        echo " $2 ....SUCCESS" &>> $LOG_FILE
    fi
}

for packages in $@ 
do
    dnf list installed $packages &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$packages not installed , now installing"
        dnf install $packages -y &>> $LOG_FILE
        VALIDATION $? "$packages Installation "
    else
        echo "$packages are alredy installed"
    fi

done