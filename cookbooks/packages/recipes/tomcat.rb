#--------------------------------------------
#APACHE_TOMCAT

remote_file '/opt/packages/apache-tomcat-8.5.34.zip' do
  source 'http://mirrors.wuchna.com/apachemirror/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.zip'
	action :create
  mode '0777'
end

execute '/opt/packages/apache-tomcat-8.5.34.zip' do
    command 'unzip /opt/packages/apache-tomcat-8.5.34.zip'
	cwd '/opt/packages'
end

file '/opt/packages/apache-tomcat-8.5.34.zip' do
 action :delete
end

execute 'mv /opt/packages/apache-tomcat-8.5.34 /opt/packages/tomcat_8.5'do
		command 'mv /opt/packages/apache-tomcat-8.5.34 /opt/packages/tomcat_8.5'
		cwd '/opt/packages'
end

 execute '/opt/packages/tomcat_8.5' do
		command 'chmod 777 /opt/packages/tomcat_8.5/bin/*'
	cwd '/opt/packages'
end  

template '/opt/packages/tomcat_8.5/conf/server.xml' do
	source 'tomcat_server.xml.erb'
end
template '/opt/packages/tomcat_8.5/conf/tomcat-users.xml' do
	source 'tomcat_users.xml.erb'
end
 execute '/opt/packages/tomcat_8.5/bin/shutdown.sh'
 execute '/opt/packages/tomcat_8.5/bin/startup.sh'
