#!bin/bash
bash ../ansible/roles/deploy/files/counter < input.txt > output.txt &
#Storing PID of child process
PID=$!
sleep 0.5
echo "PID of child process: $PID"
echo "Killing Process...!!"
kill -15 $PID
echo "Comparing current output with the known output using diff command."
printf "\033[01;36mEXPECTED OUTPUT:\n\033[00m"
cat expected_output.txt
printf "\033[01;36mCURRENT OUTPUT:\n\033[00m"
cat output.txt
diff output.txt expected_output.txt
if [ $? -eq 0 ]
then
  printf "\033[01;32mTEST CASE PASSED.\n\033[00m"
else
  printf "\033[01;31mTEST CASE FAILED.\n\033[00m"
fi
