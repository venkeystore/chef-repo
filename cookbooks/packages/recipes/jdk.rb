#--------------------------------------------
#JAVA_DEVOLOPEMENT_KIT {JDK_1.8}
		# Remove exist jdk
execute 'yum remove -y jdk' do
    command 'yum remove -y jdk'
	cwd '/opt/packages/'
end
file 'opt/packages/jdk.sh' do
  action :create
end
template '/opt/packages/jdk.sh' do
  source 'jdk.erb'
 end
 # To download   jdk rpm package
execute '/opt/packages/jdk.sh' do
    command 'sh /opt/packages/jdk.sh'
	cwd '/opt/packages'
end
file '/opt/packages/jdk.sh' do
 action :delete
end
execute '/opt/packages/jdk-8u191-linux-x64.rpm' do
    command 'rpm -ivh /opt/packages/jdk-8u191-linux-x64.rpm'
	cwd '/opt/packages'
end 
file '/opt/packages/jdk-8u191-linux-x64.rpm' do
   action :delete
end

#-------------------------------------------- 
