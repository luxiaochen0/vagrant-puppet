#官方源 太慢了
#sudo rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm

#自建yum源
sudo sh -c "cat>/etc/yum.repos.d/puppet6.repo"<<EOF
[puppet6]
name=Puppet 6 Repository el 7 - $basearch
baseurl=http://nas.luxiaochen.com:20082/puppet/puppet6/el/6/\$basearch
gpgkey=http://nas.luxiaochen.com:20082/puppet/RPM-GPG-KEY-puppet
enabled=1
gpgcheck=1
EOF

#安装
sudo yum install puppet -y

#修改hosts
sudo sed -i '$a\192.168.10.11 master' /etc/hosts
sudo sed -i '$a\192.168.10.12 agent' /etc/hosts

#设置puppetserver主机名
sudo /opt/puppetlabs/bin/puppet config set server master

#启动服务
sudo chkconfig puppet on
sudo service puppet start