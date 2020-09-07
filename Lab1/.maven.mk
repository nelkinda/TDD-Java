BUILD:=./mvnw

.PHONY: all
## Builds and verifies the project.
all: build

.PHONY: pipeline
## Runs the same thing as the pipeline.
pipeline:
	$(BUILD) $(BUILDFLAGS) checkUpdates build
	#$(BUILD) $(BUILDFLAGS) checkUpdates build pitest

.PHONY: build
## Builds and verifies the project.
build: $(BUILD)
	$(BUILD) -B -q verify

.PHONY: clean
clean:: $(BUILD)
	$(BUILD) $(BUILDFLAGS) $@

.PHONY: checkUpdates
## Checks for dependency updates.
checkUpdates: $(BUILD)
	$(BUILD) $(BUILDFLAGS) versions:display-dependency-updates

.PHONY: wrapper
## Generates the wrapper.
wrapper: $(BUILD)
$(BUILD):
	mvn -q -N io.takari:maven:0.7.7:wrapper


.PHONY: sonard
## Starts a local SonarQube server using Docker.
# If a Docker container sonarqube exists, it will (re)start it.
# If it doesn't exist, it will download the sonarqube docker image, configure the plugins, and start a container with the same name.
sonard:
	$(MAKE) -C sonarqube/

.PHONY: sonarqube
## Runs the SonarQube analysis.
# Requires the project to be built and the SonarQube server to be running.
sonarqube:
	$(BUILD) $(BUILDFLAGS) $@

-include .makehelp/include/makehelp/Help.mk

ifeq (help, $(filter help,$(MAKECMDGOALS)))
.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git .makehelp
endif

-include User.mk
-include ../User.mk
-include ~/User.mk
