cd $HOME

cp /vagrant/jdk8.tar.gz .
tar -xvzf jdk8.tar.gz
mv jdk1.8.0_221/ jdk8/

rm jdk8.tar.gz

export JAVA_HOME="/home/felipefda/jdk8"
export PATH=$JAVA_HOME/bin:$PATH

exit

pacman --noconfirm -S maven