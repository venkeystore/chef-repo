#APACHE_MAVEN
remote_file '/opt/packages/apache-maven-3.5.4-bin.tar.gz' do
  source 'http://mirrors.wuchna.com/apachemirror/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz'
	action :create
  mode '0777'
end
execute '/opt/packages/apache-maven-3.5.4-bin.tar.gz' do
    command 'tar xvzf /opt/packages/apache-maven-3.5.4-bin.tar.gz'
	cwd '/opt'
end
file '/opt/packages/apache-maven-3.5.4-bin.tar.gz' do
 action :delete
 end