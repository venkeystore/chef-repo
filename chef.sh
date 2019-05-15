#! /bin/bash
# The basic syntax of the case...esac statement is to give an expression to evaluate and to execute  several different statements based on the value of the expression. 
# The interpreter checks each case against the value of the expression until a match is found. If nothing matches, a default condition will be used.
echo -e 'Operator_command :\c'
read op

case $op in 
	#__________________________________________________________
	
		bootstrap) echo Bootstaping the Node			
		# ip address
			echo -e "Enter_IP_ADDREss : \c"
				read Ip
		# User_Name
					echo -e "Enter_User_name : \c"
				read user
		# Node_name
					echo -e "Enter_Node_name : \c"
				read  Node
				echo "============================================================================================================="
					echo "bootstrap command :::::@ 	knife bootstrap "$Ip" --ssh-user "$user" --sudo --identity-file "$PEM/aws.pem" --node-name "$Node""
				echo "=============================================================================================================="
					if [ $Ip ]
   						then
   							 echo 'Ready for bootstraping....'
    							knife bootstrap $Ip --ssh-user $user --sudo --identity-file $PEM/aws.pem --node-name $Node
							#	 knife bootstrap 172.17.0.3 -x venkey -p '12345' -N node5 [For without using pem file]

   						else
    						echo "command_notfound"
					fi ;;
	#__________________________________________________________
		run_list) echo 'Runlist the Node'
		   #
					echo -e "Enter_Node_name : \c"
				read NODE #NODE1 NODE2 NODE3 NODE4
					echo -e "Enter_cookbook_name : \c"
				read book
				echo "==========================================="
				echo "knife node run_list add "$NODE" recipe["$book"]"
				echo "==========================================="
					if [ $NODE ]
  						 then
    						echo 'waiting....'
    							knife node run_list add $NODE recipe[$book]
	
   						else
    					echo "command_notfound"
					fi ;;

		chef_client) echo 'Run_chef-client'

					echo -e "Enter_Node_name : \c"
				read NODE #NODE1 NODE2 NODE3 NODE4
				echo "=========================================================================="
				echo "	knife ssh 'name:'"$NODE''" 'sudo chef-client' --ssh-user ec2-user --identity-file "$PEM"/aws.pem"
				echo "==========================================================================="
					if [ $NODE ]
  						then
   						echo 'waiting....'
    						knife ssh 'name:'$NODE'' 'sudo chef-client' --ssh-user ec2-user --identity-file $PEM/aws.pem
   						else
    					echo "command_notfound"
					fi ;;
					
		upload) echo Uploading cookbook

				echo -e 'Enter_Cookbook_Name :\c'
				read cookbook #cookbook2 cookbook3
				echo ==================================
				echo "knife cookbook upload "$cookbook""
				echo ==================================
					if [ $cookbook ]
						then
							echo 'Ready for Uploading.....'
							echo '...........................'
								knife cookbook upload $cookbook
							echo '..................................'	
#								knife cookbook upload $cookbook2
#							echo '..................................'	
#								knife cookbook upload $cookbook3
#							echo '..................................'	

			
						else
							echo 'Not found $cookbook'
					fi ;;
		*) echo Wrong_choice rerun right Operator_command
esac