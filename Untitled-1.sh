#!/bin/bash

#check status of CONFIG_TYPE

#if status is "environment" convert env file to environment variables. Source file for the vars is contained in the CONFIG_PATH
#check existance of CONFIG_PATH
#export $(grep -v '^#' .env | xargs) - exports variables to environment 
#run the actual app after setting up the port - if it's node specify here the parameter

#if status is "file" convert all environment variables to file. It will rewrite the CONFIG_PATH file with the content of the environment
#env >.env

##need git 
####push from code
####pull from jenkins
##build on jenkins
####
