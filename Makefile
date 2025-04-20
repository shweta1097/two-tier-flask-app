.PHONY build up down clean

#Declaring variables
DOCKER_COMPOSE := docker-compose
OS := $(shell uname)

all: build up down clean #here we have define all the targets in one single target 'all' by running make all we can run all targets together

#Build target
build:
ifeq ($(OS), linux)
	@echo "Build running in $(OS)"
	$(DOCKER_COMPOSE) build
endif

ifeq ($(OS), Windows_NT)
	@echo "Build running in $(OS)"
	#build command for docker in windows should be here
endif


#Start target
up:
ifeq ($(OS), linux)
        @echo "Starting the app in $(OS)"
	$(DOCKER_COMPOSE) up -d
endif

ifeq ($(OS), Windows_NT)
	@echo "Starting the app in $(OS)"
	#windows=start commands for apps in docker should be here 
endif


#Stop target
down:
ifeq ($(OS), linux)
	@echo "Stopping the app in $(OS)"
	$(DOCKER_COMPOSE) down
endif

ifeq ($(OS), Windows_NT)
	@echo "Stopping app in $(OS)"
	#Windows=stop command for apps in docker should be here
endif


#Clean target
clean:
ifeq ($(OS), linux)
	@echo "Cleaning all the resources in $(OS)"
	docker system prune -y
endif

ifeq ($(OS), Windows_NT)
	@echo "Cleaning all the resources in $(OS)"
        #clean command in docker for windows os should be here
endif

#for running the file give command make targetname ex- make build
