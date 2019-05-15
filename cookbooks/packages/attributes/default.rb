# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default["starter_name"] = "Sam Doe"    #  <%= node["starter_name"]%> 
default["JAVA_HOME"] = ""

default["tomcat_port"]= "8080"		    #    <%= node["tomcat_port"]%> 

default["NEXUS_PORT"] = "8081"		#    <%= node["NEXUS_PORT"]%>    	<%= !ENV['CI'] %>


# For further information, see the Chef documentation (https://docs.chef.io/essentials_cookbook_attribute_files.html).

# NEXUS_PATHS
