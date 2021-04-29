#Dockerfile for timstof proteomics data analysis on HPC

FROM ubuntu:18.04

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y openjdk-8-jre
RUN apt install -y curl
RUN apt install zip -y
RUN apt-get install vim -y
RUN apt-get install -y libgomp1

#rclone things
RUN curl https://rclone.org/install.sh | bash

RUN mkdir /root/msfragger/
RUN mkdir /root/analysis/
RUN mkdir /root/analysis/outputfiles
RUN mkdir /root/analysis/timstoffiles

# Define default command.
CMD ["bash"]

#From this point I would manually access the docker to do the following things:
# Download the executable files for Fragpipe/msfragger through rclone
# download the samples files through rclone
#chmod all the executable files in /root/msfragger/ with [chmod 770 -R /root/msfragger/]
#chmod u+x /root/msfragger/tools/philosopher/philosopher 
# cd to the outputfiles directory [cd /root/analysis/outputfiles/]
# run the Shell script: /root/msfragger/FragPipe_docker_Shell.sh
#Once done, upload all results in the outputfiles with Rclone to Gdrive

