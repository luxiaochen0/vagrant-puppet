#官方源 太慢了
#sudo rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm

#自建yum源
sudo sh -c "cat>/etc/yum.repos.d/puppet6.repo"<<EOF
[puppet6]
name=Puppet 6 Repository el 7 - $basearch
baseurl=http://nas.luxiaochen.com:20082/puppet/puppet6/el/7/\$basearch
gpgkey=http://nas.luxiaochen.com:20082/puppet/RPM-GPG-KEY-puppet
enabled=1
gpgcheck=1
EOF

sudo yum install puppetserver -y

sudo sed -i 's/^JAVA_ARGS="-Xms2g -Xmx2g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"$/JAVA_ARGS="-Xms1g -Xmx1g -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"/' /etc/sysconfig/puppetserver

#sudo systemctl enable puppetserver
#sudo systemctl start puppetserver
#sudo reboot