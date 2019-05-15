
bash 'Clearing apache_maven folder' do
  user 'root'
  cwd '/opt'
  code <<-EOH
  sudo rm -rf /opt/apache-maven-3.5.4
  EOH
end