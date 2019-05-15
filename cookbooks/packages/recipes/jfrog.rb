

#@JFROG_ARTIFACTORY@#													
#=========================
remote_file '/opt/packages/jfrog-artifactory-oss-6.4.0.zip' do
  source 'https://api.bintray.com/content/jfrog/artifactory/jfrog-artifactory-oss-$latest.zip;bt_package=jfrog-artifactory-oss-zip'			
		action :create
		mode '0777'
end


execute '/opt/packages/jfrog-artifactory-oss-6.4.0.zip' do
		command 'unzip /opt/packages/jfrog-artifactory-oss-6.4.0.zip' 
	cwd '/opt/packages'
end
execute 'rm -rf /opt/packages/jfrog-artifactory-oss-6.4.0.zip'