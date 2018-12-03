# Ansible Script 

This is a simple ansible playbook which copies a shell script as a path executable and enable syslog for it.
## Prerequisites
- Make sure to install ansible on the Ansible controller machine.
- Make sure you are able to ssh to all slave nodes fine before continuing further.

## Installation
- Install Ansible.
    ```sh
    $ sudo yum install ansible
    ```
- Checkout this example using following command
    ```
    $ git clone https://github.com/Shardy153/ansible-shell-example.git
    $ cd ansible-shell-example
    ```
## Configuration
- Now make the following changes:
  - Update hosts file and define.
  - Modify groups_vars/all variables file and define destination path where shell script will be copied.
  
## Run
- Run below command:
    ```sh
    $ ansible-playbook -i hosts main.yml
    ```
- Logs will be displayed on the controller machine and we can even run the above command with high verbosity to check detailed logs which is done using -v option
    ```sh
    $ ansible-playbook -i hosts main.yml -v
    ```
    Note: You can increase or decrease verbosity level by increasing or decreasing the ‘v’

## Few Important notes
- The script which is being deployed performs the following tasks:
	- Wait for input from stdin.
	- Split the text around whitespaces into tokens.
	- Each token is trimmed for non-ASCII (Also, only 0-9a-z characters should be retained).
	- Each token is converted to lower space
	- The function will takes one arg “n”. All the tokens that are less than n characters.
	- Remaining tokens will be saved to a disk.
	- Once done, the code prints the latest updated word count on the screen.
	- The profram will run until user hits Ctrl-C, or the process is sent a SIGHUP, SIGTERM or SIGKILL.
	- When any of the above mentioned signals is received, program will terminate.    
- This repository also contains the test case of shell script which is being deployed.
- The test case directory contains a test shell script, a text file which contains the input and a text file which contains expected out.
