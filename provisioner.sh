#!/bin/bash

JDK_VER="jdk1.8.0_66"
JDK_TBALL="jdk-8u66-linux-x64.tar.gz"
JDK_DLOAD="http://download.oracle.com/otn-pub/java/jdk/8u66-b17/${JDK_TBALL}"

ECLIPSE_TBALL="eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz"
ECLIPSE_DLOAD="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/R/${ECLIPSE_TBALL}&r=1"
ECLIPSE_APP="org.eclipse.equinox.p2.director"
ECLIPSE_REPO="http://download.eclipse.org/releases/mars/"
ECLIPSE_SCALA_SITE="http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site"
ECLIPSE_SCALA_GROUP="org.scala-ide.sdt.feature.feature.group"
ECLIPSE_IVY_SITE="http://www.apache.org/dist/ant/ivyde/updatesite"
ECLIPSE_IVY_GROUP="org.apache.ivyde.feature.feature.group"
ECLIPSE_COLOR_SITE="http://eclipse-color-theme.github.com/update"
ECLIPSE_COLOR_GROUP="com.github.eclipsecolortheme.feature.feature.group"
ECLIPSE_PYDEV_SITE="http://pydev.org/updates"
ECLIPSE_PYDEV_GROUP="org.python.pydev.feature.feature.group"
ECLIPSE_M2E_SITE="http://download.eclipse.org/technology/m2e/releases"
ECLIPSE_M2E_GROUP="org.eclipse.m2e.feature.feature.group"
ECLIPSE_ROBO_SITE="http://sourceforge.net/projects/robotide/files/stable/"
ECLIPSE_ROBO_GROUP="com.nitorcreations.robotframework.eclipseide.feature.feature.group"
ECLIPSE_PUML_SITE="http://plantuml.sourceforge.net/updatesitejuno/"
ECLIPSE_PUML_GROUP="net.sourceforge.plantuml.feature.feature.group"


P4_VER="p4v-2015.2.1315639"
P4_TBALL="p4v.tgz"
P4_DLOAD="http://cdist2.perforce.com/perforce/r15.2/bin.linux26x86_64/p4v.tgz"

PACKER_ZIP="packer_0.8.6_linux_amd64.zip"
PACKER_DLOAD="http://releases.hashicorp.com/packer/0.8.6/${PACKER_ZIP}"

EPEL_RPM="http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"

PIP_SCRIPT="get-pip.py"
PIP_DLOAD="http://bootstrap.pypa.io/${PIP_SCRIPT}"

GATLING_ZIP="gatling-charts-highcharts-bundle-2.1.7-bundle.zip"
GATLING_DLOAD="http://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.1.7/${GATLING_ZIP}"

# Debug on
set -x

# Do everything in /opt/
cd /opt

# Set environment variables
echo "ANDROID_HOME=/home/vagrant/Android/Sdk" > /tmp/vagrant_env.sh
echo "PATH=/usr/local/bin:${PATH}:/opt/${JDK_VER}/bin:/opt/${JDK_VER}/jre/bin:/opt/eclipse:/opt/${P4_VER}/bin:/opt/packer:/opt/gatling-charts-highcharts-bundle-2.1.7/bin:/opt/sbt/bin:/opt/android-studio/bin:/opt/node-v5.10.0-linux-x64/bin:\${ANDROID_HOME}/tools:\${ANDROID_HOME}/platform-tools" >> /tmp/vagrant_env.sh
sudo mv /tmp/vagrant_env.sh /etc/profile.d/vagrant_env.sh
sudo chmod 755 /etc/profile.d/vagrant_env.sh
source /etc/profile.d/vagrant_env.sh

# Prevent ssh sessions from being logged out too quickly
if [[ `grep ServerAliveInterval .ssh/config` ]]; then 
	echo -e "Host *\n  ServerAliveInterval 30" >> /home/vagrant/.ssh/config
fi

# Epel
if [ "x`rpm -qa epel-release`" == "x" ]; then
	sudo rpm -iUvh ${EPEL_RPM}
fi

# Repository for multimedia packages 
if [ "x`rpm -qa nux-dextop-release`" == "x" ]; then
	sudo yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
fi

# Update packages
sudo yum update -y

# Vim	
sudo yum -y install vim-enhanced

# Firefox	
sudo yum -y install firefox	

# MultiXterm
yum -y install expect expectk

# Wireshark
sudo yum -y install wireshark-gnome

# Multimedia tools
sudo yum -y install vlc smplayer ffmpeg HandBrake-{gui,cli}

# Install Apache Server
sudo yum -y install httpd

# Install Apache Mod_WSGI Server
sudo yum -y install mod_wsgi

# Graphviz (needed for Eclipse PlantUML plugin)
sudo yum -y install graphviz

# For android SDK
sudo yum -y install glibc.i686 libstdc++-4.8.5-4.el7.i686

# Install Python 2.7.11
if [ ! -e /usr/local/bin/python2.7 ]; then
	sudo yum -y groupinstall "Development tools"
	sudo yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
	sudo wget --quiet -O /usr/local/src/Python-2.7.11.tgz https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
	sudo bash -c 'cd /usr/local/src; tar -xvzf Python-2.7.11.tgz; cd Python-2.7.11; ./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && make && make altinstall'
	sudo sed -ie 's,PATH=$PATH,PATH=/usr/local/bin:$PATH,' /home/vagrant/.bash_profile
	sudo ln -s /usr/local/bin/python2.7 /usr/local/bin/python
	sudo rm -rf /usr/local/src/Python-2.7.11
	sudo rm /usr/local/src/Python-2.7.11.tgz
fi

# Install PIP on the 2 versions we have
sudo wget --quiet -O /opt/${PIP_SCRIPT} ${PIP_DLOAD}
if [ ! -e /usr/local/bin/pip ]; then 
	sudo /usr/local/bin/python2.7 /opt/${PIP_SCRIPT}; 
fi
if [ ! -e /usr/bin/pip ]; then 
	sudo /usr/bin/python2.7 /opt/${PIP_SCRIPT}; 
fi
sudo rm -f ${PIP_SCRIPT}

# Django virtual Environment
sudo /usr/local/bin/pip install virtualenv

# Ansible
sudo /usr/local/bin/pip install ansible

# Boto
sudo /usr/local/bin/pip install six
sudo /usr/local/bin/pip install boto

# AWSCLI
sudo /usr/local/bin/pip install awscli
sudo /usr/local/bin/pip install --upgrade awscli

# Robot Framework
sudo /usr/local/bin/pip install robotframework
sudo /usr/local/bin/pip install --upgrade robotframework
sudo /usr/local/bin/pip install requests
sudo /usr/local/bin/pip install -U robotframework-requests==0.3.9
sudo /usr/local/bin/pip install robotframework-sshlibrary
sudo /usr/local/bin/pip install robotframework-selenium2library
sudo /usr/local/bin/pip install robotframework-appiumlibrary

# Testlink integration
sudo /usr/local/bin/pip install TestLink-API-Python-client

## RIDE
# This will install RIDE on Python 2.7.5 which comes with Centos
if [ "x`/usr/bin/pip freeze | grep robotframework-ride`" == "x" ]; then 
	sudo yum -y install wxBase  wxGTK wxGTK-media wxGTK-gl
	sudo rpm -i  ftp://fr2.rpmfind.net/linux/epel/7/x86_64/w/wxPython-2.8.12.0-9.el7.x86_64.rpm
	sudo /usr/bin/pip install robotframework-ride
fi

# JDK 8
if [ ! -e /opt/jdk1.8.0_66 ]; then 
	sudo wget --quiet --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" ${JDK_DLOAD}
	sudo tar -zxf ${JDK_TBALL}
	sudo rm -f ${JDK_TBALL}
	sudo alternatives --install /usr/bin/java java /opt/${JDK_VER}/bin/java 2
	echo 2 | alternatives --config java
	sudo alternatives --install /usr/bin/jar jar /opt/${JDK_VER}/bin/jar 2
	sudo alternatives --install /usr/bin/javac javac /opt/${JDK_VER}/bin/javac 2	
	sudo alternatives --set jar /opt/${JDK_VER}/bin/jar
	sudo alternatives --set javac /opt/${JDK_VER}/bin/javac
fi

sudo grep -v JAVA_HOME /etc/environment | grep -v JRE_HOME > /etc/environment.J_HOME
sudo echo "JAVA_HOME=/opt/${JDK_VER}" >> /etc/environment.J_HOME
sudo echo "JRE_HOME=/opt/${JDK_VER}/jre" >> /etc/environment.J_HOME
sudo mv /etc/environment.J_HOME /etc/environment
source /etc/environment

# Eclipse
if [ "x`grep eclipse.buildId=4.5.0.I20150603-2000 /opt/eclipse/configuration/config.ini`" == "x" ]; then
	sudo wget --quiet -O /opt/${ECLIPSE_TBALL} ${ECLIPSE_DLOAD}
	sudo tar -zxf ${ECLIPSE_TBALL}
	sudo rm -f ${ECLIPSE_TBALL}
fi

#Modify Eclipse heap size
sudo sed -e 's/-Xmx1024m/-Xmx2048m/' /opt/eclipse/eclipse.ini > /opt/eclipse/eclipse.ini.tmp && sudo mv /opt/eclipse/eclipse.ini.tmp /opt/eclipse/eclipse.ini

#P4V
#if [ ! -e /opt/p4v-2015.2.1315639/ ]; then
#	sudo wget --quiet -O /opt/${P4_TBALL} ${P4_DLOAD}
#	sudo tar -zxf ${P4_TBALL}
#	sudo rm -f ${P4_TBALL}
#fi

#Packer
#if [ "`/opt/packer/packer.io --version`" != "0.8.6" ]; then
#	sudo wget --quiet -O /opt/${PACKER_ZIP} ${PACKER_DLOAD}
#	sudo unzip -qo ${PACKER_ZIP} -d /opt/packer
#	sudo mv /opt/packer/packer /opt/packer/packer.io
#	sudo rm -rf /opt/${PACKER_ZIP}
#fi

# Scala
#if [ "x`rpm -qa scala`" == "x" ]; then 
#	sudo wget -O /opt/scala-2.12.0-M3.rpm http://downloads.typesafe.com/scala/2.12.0-M3/scala-2.12.0-M3.rpm?_ga=1.145924084.1959198062.1456010742
#	sudo rpm -ivh /opt/scala-2.12.0-M3.rpm
#	sudo rm -f /opt/scala-2.12.0-M3.rpm
#fi

# SBT
#if [ ! -e /opt/sbt ]; then
#	sudo wget -O /opt/sbt-0.13.9.tgz https://dl.bintray.com/sbt/native-packages/sbt/0.13.9/sbt-0.13.9.tgz
#	sudo tar -xvzf /opt/sbt-0.13.9.tgz
#	sudo find /opt/sbt -type f -executable -exec chmod o+x '{}' ';'
#	sudo rm -f /opt/sbt-0.13.9.tgz
#fi

# Activator
#if [ ! -e /opt/activator-1.3.7-minimal ]; then 
#	sudo wget -O /opt/typesafe-activator-1.3.7-minimal.zip https://downloads.typesafe.com/typesafe-activator/1.3.7/typesafe-activator-1.3.7-minimal.zip?_ga=1.35835232.1341830739.1456012564
#	sudo unzip typesafe-activator-1.3.7-minimal.zip
#	sudo find /opt/activator-1.3.7-minimal -type f -executable -exec chmod o+x '{}' ';'
#	sudo rm -f /opt/typesafe-activator-1.3.7-minimal.zip
#fi

# Gatling
if [ ! -e /opt/gatling-charts-highcharts-bundle-2.1.7 ]; then
	sudo wget --quiet -O /opt/${GATLING_ZIP} ${GATLING_DLOAD}
	sudo unzip -qo ${GATLING_ZIP}
	sudo chmod o+x /opt/gatling-charts-highcharts-bundle-2.1.7/bin/*sh
	sudo rm -f ${GATLING_ZIP}
fi

# JMeter
if [ ! -e /opt/apache-jmeter-2.13 ]; then
	sudo wget --quiet -O /opt/apache-jmeter-2.13.tgz http://ftp.wayne.edu/apache//jmeter/binaries/apache-jmeter-2.13.tgz
	sudo tar -xvzf apache-jmeter-2.13.tgz
	sudo ln -s /opt/apache-jmeter-2.13/bin/jmeter /usr/local/bin/jmeter
	sudo rm -f /opt/apache-jmeter-2.13.tgz
fi

# Chrome
if [ "x`rpm -qa google-chrome-stable`" == "x" ]; then
	sudo wget --quiet -O /opt/google-chrome-stable_current_x86_64.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
	sudo yum install -y /opt/google-chrome-stable_current_x86_64.rpm
	sudo rm /opt/google-chrome-stable_current_x86_64.rpm
fi

# Android SDK
if [ "`cat /opt/android-studio/build.txt`" != "AI-143.2739321" ]; then
	sudo wget --quiet -O /opt/android-studio.zip https://dl.google.com/dl/android/studio/ide-zips/2.0.0.20/android-studio-ide-143.2739321-linux.zip
	sudo rm -rf /opt/android-studio
	sudo unzip android-studio.zip
fi
# This removes a file that wasn't cleaned up
if ls /opt/android-studio*.zip 1> /dev/null 2>&1; then
	sudo rm -f /opt/android-studio*.zip
fi

# npm, Appium server
if [ ! -e /opt/node-v5.10.0-linux-x64 ]; then
	sudo wget --quiet -O /opt/node-v5.10.0-linux-x64.tar.gz https://nodejs.org/download/release/v5.10.0/node-v5.10.0-linux-x64.tar.gz
	sudo tar -xvzf /opt/node-v5.10.0-linux-x64.tar.gz
	sudo rm -f /opt/node-v5.10.0-linux-x64.tar.gz
	/opt/node-v5.10.0-linux-x64/bin/npm install -g appium
	sudo /opt/node-v5.10.0-linux-x64/bin/npm install -g appium
	sudo /opt/node-v5.10.0-linux-x64/bin/npm install wd
fi

# Firebug
if [ ! -e /usr/share/mozilla/extensions/\{ec8030f7-c20a-464f-9b0e-13a3a9e97384\}/firebug@software.joehewitt.com.xpi ]; then
	sudo wget -q -O /usr/share/mozilla/extensions/\{ec8030f7-c20a-464f-9b0e-13a3a9e97384\}/firebug@software.joehewitt.com.xpi https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi
fi

# Scala IDE for Eclipse
if ! ls /opt/eclipse/plugins/org.scala-ide.sdt.* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_SCALA_SITE} -installIU ${ECLIPSE_SCALA_GROUP}
fi

# Ivy plugin
if ! ls /opt/eclipse/plugins/org.apache.ivyde.* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_IVY_SITE} -installIU ${ECLIPSE_IVY_GROUP}
fi

# Eclipse Color Theme
if ! ls /opt/eclipse/plugins/com.github.eclipsecolortheme* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_COLOR_SITE} -installIU ${ECLIPSE_COLOR_GROUP}
fi

# PyDev
if ! ls /opt/eclipse/plugins/org.python.pydev* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_PYDEV_SITE} -installIU ${ECLIPSE_PYDEV_GROUP}
fi

# M2E
if ! ls /opt/eclipse/plugins/org.eclipse.m2e.* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_M2E_SITE} -installIU ${ECLIPSE_M2E_GROUP}
fi

# RobotFramework IDE
if ! ls /opt/eclipse/plugins/com.nitorcreations.robotframework.* 1> /dev/null 2>&1; then
	/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_ROBO_SITE} -installIU ${ECLIPSE_ROBO_GROUP}
fi

# PlantUML
/opt/eclipse/eclipse -nosplash -application ${ECLIPSE_APP} -repository ${ECLIPSE_REPO},${ECLIPSE_PUML_SITE} -installIU ${ECLIPSE_PUML_GROUP}

# Cleanup .bashrc since paths are now defined in /etc/profile.d/vagrant_env.sh
if [ -e /home/vagrant/.bashrc ]; then
	grep -v PATH /home/vagrant/.bashrc > /home/vagrant/.bashrc.tmp && mv /home/vagrant/.bashrc.tmp /home/vagrant/.bashrc
fi

# Allow users to access shared folders
if [ "x`groups vagrant | grep vboxsf`" == "x" ]; then 
	sudo usermod -a -G vboxsf vagrant
fi

# Change file ownership under /home/vagrant
sudo chown -R vagrant:vagrant /home/vagrant

# Cleanup
sudo yum -y autoremove

# Debug off
set +x

echo "Provisioning done. Please reboot VM."

exit
