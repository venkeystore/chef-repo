#
# Cookbook:: packages
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#--------------------------------------------

execute 'hostnamectl set-hostname devops' do
		command 'hostnamectl set-hostname devops'
	cwd '/opt'
end
package 'wget'
package 'unzip' 
package 'nano'
package 'tree'
execute 'rm -rf /opt/packages'

directory '/opt/packages' do
 action :create
 end
