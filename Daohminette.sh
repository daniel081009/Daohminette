cat << "EOF"
  _____              _               _            _   _       
 |  __ \            | |             (_)          | | | |      
 | |  | | __ _  ___ | |__  _ __ ___  _ _ __   ___| |_| |_ ___ 
 | |  | |/ _` |/ _ \| '_ \| '_ ` _ \| | '_ \ / _ \ __| __/ _ \
 | |__| | (_| | (_) | | | | | | | | | | | | |  __/ |_| ||  __/
 |_____/ \__,_|\___/|_| |_|_| |_| |_|_|_| |_|\___|\__|\__\___|
EOF
echo "\n\n"

green='\033[0;32m'
red='\033[0;31m'
clear='\033[0m'

ls -l */*
if [ -z `find . -name "*.out" -o -name "main.c"` ];then
   echo "${green}[✔] tmep 파일들이 없네요${clear}"
else
   echo "${red}[✗] temp 파일들을 삭제함${clear}"
   rm */main.c
   rm */*.out 
   echo "${green}[✔] tmep 파일들이 성공적으로 삭제됨!${clear}"
fi 


if [ -z `grep -E -H -n "printf|int main|stdio.h" */*` ];then
   echo "${green}[✔] test코드가 없음!${clear}"
else
   echo "${red}[✗] test코드 지우세요${clear}!"
   grep -E -H -n "printf|int main|stdio.h" */*
fi

gcc */* -Wall -Wextra -Werror 2> log
ec=`cat ./log`
if [[ ${ec} == *"linker"* ]];then
   echo "${green}[✔] 컴파일 에러는 없음!${clear}"
else
   echo "${red}[✗] C 문법 체크 ㄱㄱ${clear}"   
   gcc */* -Wall -Wextra -Werror 
fi

if [ -z `norminette -R CheckForbiddenSourceHeader | grep "Error"` ];then
   echo "${green}[✔] 악독한 도미네이트에서 안전!${clear}"
else
   echo "${red}[✗] 악독한 도미네이트에 걸리셨군요${clear}"   
   norminette -R CheckForbiddenSourceHeader | grep "Error"
fi

echo "\n make by Daoh"