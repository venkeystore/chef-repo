

# Chef does another great thing with it's template resource file specificity.
# It's nice to be able to just plop stuff down int template/platform/thing.erb and have Chef automagically find it for us. 
# Meaning we don't have to do something like:

template '/etc/file' do
  source 'ubuntu/file.erb' if node['platform'] == 'ubuntu'
  source 'redhat/file.erb' if node['platform'] == 'redhat'
end
