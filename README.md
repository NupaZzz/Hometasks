# IT-Academy DevOps home tasks
## first task is complete
## second task is complete
    Please use ports 8080,8081 in the second subtask.
## third task is complete
    Please use Vagrantfile and other files from the master branch
## docker compose task is complete
    Please change NEXUS_IP to your local IP in /09-docker-compose/jenkins/config.xml
    Maybe someday I will make a script to change the address to a local :P
    
    Windows already uses the HTTP protocol.
    for solve this problem need:
        run cmd as admin
        net stop http
        netsh int ipv4 add excludedportrange protocol=tcp startport=80 numberofports=1
