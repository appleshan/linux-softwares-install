#!/bin/bash
file /sbin/init
mkdir -p /usr/local/java
cp -r jdk-8u102-linux-x64.tar.gz /usr/local/java
cd /usr/local/java
tar -xvzf jdk-8u102-linux-x64.tar.gz
ls -a


## Paste this shit out in the file
echo "
JAVA_HOME=/usr/local/java/jdk1.8.0_102
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
JRE_HOME=/usr/local/java/jdk1.8.0_102/jre
PATH=$PATH:$HOME/bin:$JRE_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
" >> /etc/profile
### end of shit



update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_102/jre/bin/java" 1

update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_102/bin/javac" 1

update-alternatives --install "/usr/bin/jmc" "jmc" "/usr/local/java/jdk1.8.0_102/bin/jmc" 1

update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_102/bin/javaws" 1

update-alternatives --set java /usr/local/java/jdk1.8.0_102/jre/bin/java

update-alternatives --set javac /usr/local/java/jdk1.8.0_102/bin/javac

update-alternatives --set jmc /usr/local/java/jdk1.8.0_102/bin/jmc

update-alternatives --set javaws /usr/local/java/jdk1.8.0_102/bin/javaws

./etc/profile

java -version

javac -version

rm /usr/local/java/jdk-8u102-linux-x64.gz
