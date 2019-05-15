

template '/the/file' do
  source 'aix/file.erb' if node['platform'] == 'aix'
  source 'redhat/file.erb' if node['platform'] == 'redhat'
end