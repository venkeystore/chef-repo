# To set Environment variables (write something in bashrc.erb which is located in templates)
 template '/etc/bashrc' do
  source 'bashrc.erb'
end
service 'sshd' do
  action [:restart]
end
#======================================================