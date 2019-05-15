#NEXUS INSTALLATION
#==============================================
remote_file '/opt/packages/nexus-2.14.10-01-bundle.zip' do
  source 'https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/oss/nexus-2.14.10-01-bundle.zip'			#https://www.sonatype.com/download-sonatype-trial?submissionGuid=dac2b1e3-7192-4762-ac87-3217d46eefe5
	action :create
  mode '0777'
end
execute '/opt/packages/nexus-2.14.10-01-bundle.zip' do
		command 'unzip /opt/packages/nexus-2.14.10-01-bundle.zip'
	cwd '/opt'
end
execute 'rm -rf /opt/packages/nexus-2.14.10-01-bundle.zip'
template '/opt/packages/nexus-2.14.10-01/conf/nexus.properties' do
		source 'nexus.properties.erb'
end
# execute '/opt/packages/nexus-2.14.10-01/bin/nexus start' do
		# command 'sh /opt/packages/nexus-2.14.10-01/bin/nexus start'
		# cwd '/opt/packages'
# end		