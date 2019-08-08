
#export java
export JAVA_HOME="/data/jdk8"
export PATH=$JAVA_HOME/bin:$PATH

#ojdbc7
mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle  -DartifactId=ojdbc7 -Dversion=12.1.0 -Dpackaging=jar
rm ojdbc7.jar

#weblogic
cp oracle_home.tar.gz /data/.
tar -xvzf /data/oracle_home.tar.gz
rm /data/oracle_home.tar.gz
cd /data/Oracle_Home/oracle_common/plugins/maven/com/oracle/maven/oracle-maven-sync/12.2.1
mvn install:install-file -DpomFile=oracle-maven-sync-12.2.1.pom -Dfile=oracle-maven-sync-12.2.1.jar
mvn com.oracle.maven:oracle-maven-sync:push -DoracleHome=/data/Oracle_Home/.
