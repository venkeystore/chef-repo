
#--------------------------------------------
#APACHE_HTTPD install the package and then start the service
#----------------------------------------------------------------
#    Coding a Chef cookbook for multiple platforms  <<<<<<<<<<---------------------------- READ THIS
#  --------------------------------------------------------------
 package 'apache2' do 
	case node['platform']
		when 'centos', 'redhat', 'fedora', 'suse'
			package_name 'httpd'
		when 'debian', 'ubuntu'
			package_name 'apache2'
	end
		action :remove
end


package 'apache2' do
	case node['platform']
		when 'centos', 'redhat', 'fedora', 'suse'
			package_name 'httpd'
		when 'debian', 'ubuntu'
			package_name 'apache2'
		when 'arch'
			package_name 'apache'
	end
		action :install
end

#--------------------------------------------
case node['platform']
	when 'centos', 'redhat'
	# Red Hat settings (httpd)
		service_name = 'httpd'
		service_action = [:start, :enable]
	when 'ubuntu'
  # Ubuntu settings
		service_name = 'apache2'
		service_action = [:start, :enable]
end













# Install package if Red Hat
package 'ntp' do
  only_if { node['platform'] == 'redhat' }
end









# ---------------------------------------------------------------------------------------------------------------------------------------
# Platform specific settings
case node['platform']
when 'redhat'

    # RHEL 7 settings: chrony
    package_name = 'httpd'
    service_name = 'httpd'
    config_source = '.erb'
    config_path = '/etc/httpd/conf/httpd.conf'
    service_action = [:start, :enable]
  end
  
when 'ubuntu'

    # RHEL 7 settings: chrony
    package_name = 'apache2'
    service_name = 'apache2'
    config_source = '.erb'
    config_path = '/etc/httpd/conf/httpd.conf'
    service_action = [:start, :enable]
  end
 
when 'redhat'



# Install package if Red Hat
package package_name do
  only_if { node['platform'] == 'redhat' }
end

# NTP configuration file: same path on both if using ntpd on Red Hat
template config_path do
  owner 'root'
  group node['root_group'] # may ohai keep us forever sane
  mode '0644'
  source config_source # rely on source being in platform directory of templates
  notifies :restart, "service[#{service_name}]"
end

# Setup service: different name and actions per platform here
# Red Hat is easy, we can just do :start, :enable
# AIX is a little more messy.  We can do :start, but enable is handled via inittab
service service_name do
  action service_action
end

# AIX ONLY: enable xntpd via inittab
# We could certainly use a better custom provider here, as in the AIX community cookbook
#   but for the sake of simplicity:
execute 'add xntpd to inittab on aix' do
  command 'mkitab ntpd:2:wait:/usr/bin/startsrc -x xntpd > /dev/null 2>&1'
  not_if 'lsitab ntpd'
end
#---------------------------------------------------------------------------------------------------------------------------------------
