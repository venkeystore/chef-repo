

bash 'env_test' do
  code <<-EOF
	echo $DOCKER
EOF
  environment ({ 'DOCKER' => '/home/ec2-user' })
end
