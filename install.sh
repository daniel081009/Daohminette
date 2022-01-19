
cp ./Daohminette.sh ~/Documents
if [[ `cat ~/.zshrc` == *"daohminette"* ]];then
   echo "${green}[✔] 이미 설치가 되어 있습니다${clear}"
else
    echo alias daohminette="~/Documents/Daohminette.sh" >> ~/.zshrc
    echo "${green}[✔] 설치 성공!${clear}"
fi