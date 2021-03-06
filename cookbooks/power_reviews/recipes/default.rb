#
# Cookbook Name:: sphinx
# Recipe:: default
#

# Set your application name here
appname = "GolfDiscount"

# Uncomment the flavor of sphinx you want to use
flavor = "power reviews"
#flavor = "ultrasphinx"

# If you want to have scheduled reindexes in cron, enter the minute
# interval here. This is passed directly to cron via /, so you should
# only use numbers between 1 - 59.
#
# If you don't want scheduled reindexes, just leave this commented.
#
# Uncommenting this line as-is will reindex once every 10 minutes.
cron_interval = 20

#if ['app_master'].include?(node[:instance_role])
if node[:name] == 'rake'

  # be sure to replace "app_name" with the name of your application.
  run_for_app(appname) do |app_name, data|

    ey_cloud_report "Sphinx" do
      message "configuring #{flavor}"
    end


    #execute "#{flavor} config" do
    #GolfDiscount has a manual config
    #command "rake #{flavor}:configure"
    #user node[:owner_name]
    #environment({
    #  'HOME' => "/home/#{node[:owner_name]}",
    #  'RAILS_ENV' => node[:environment][:framework_env]
    #})
    #cwd "/data/#{app_name}/current"
    #end


    execute "#{flavor} index" do
      command "bundle exec rake golfdiscount:import_pr"
      user node[:owner_name]
      environment({
                      'HOME' => "/home/#{node[:owner_name]}",
                      'RAILS_ENV' => node[:environment][:framework_env]
                  })
      cwd "/data/#{app_name}/current"
    end

    ey_cloud_report "finished #{flavor}" do
      message "finished #{flavor}"
    end


    if cron_interval
      cron "powerreview download" do
        action :create
        minute "20"
        hour '2'
        day '*'
        month '*'
        weekday '*'
        command "cd /data/#{app_name}/current && RAILS_ENV=#{node[:environment][:framework_env]} bundle exec rake golfdiscount:import_pr"
        user node[:owner_name]
      end
      cron "powerreview upload" do
        action :create
        minute "5"
        hour '3'
        day '*'
        month '*'
        weekday '*'
        command "cd /data/#{app_name}/current && RAILS_ENV=#{node[:environment][:framework_env]} bundle exec rake golfdiscount:export_powerreviews"
        user node[:owner_name]
      end



    end

  end

end
