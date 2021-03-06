#
# Cookbook Name:: rds
# Recipe:: default
#
# Configure application servers to use an Amazon RDS database (or any external ActiveRecord-compatible database)
# Note: This recipe does not make any changes to Engine Yard-provisioned databases

if ['solo', 'app_master', 'app', 'util'].include?(node[:instance_role])
  # for each application
  node[:applications].each do |app_name,data|

    ey_cloud_report "RDS" do
      message "RDS - Replacing database.yml for #{app_name}"
    end

    # create new database.yml with attributes
    template "/data/#{app_name}/shared/config/database.yml" do
      owner node[:owner_name]
      group node[:owner_name]
      backup false
      mode 0644
      source 'database.yml.erb'
      variables({
        :environment => node[:environment][:framework_env],
        :adapter => 'mysql',
        :database => 'GolfDiscount',
        :username => 'deploy',
        :password => 'IYH5w4n8Wi',
        :host => 'golfdiscount.cro9mgbvzacc.us-west-1.rds.amazonaws.com'
      })
    end
  end
end