#------------------------------------------------
# JENKINS.war file deploy in to tomcat_webapps		
remote_file '/opt/packages/tomcat_8.5/webapps/jenkins.war' do
  source 'https://updates.jenkins-ci.org/download/war/2.150/jenkins.war'
	action :create
#  mode '0777'
end


# JENKINS Backup

template '/home/ec2-user/' do
		source 'E:\jenkins backup\backup_20181106_1505.zip' 
end