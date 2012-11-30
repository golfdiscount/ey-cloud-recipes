#
# Cookbook Name:: collectd
# Recipe:: default
#

collectd do
  if node[:name] == 'rake'
    load :warning => 5, :failure => 8
  else
    load :warning => 4, :failure => 8
  end
  db_space ['1.3GB', '500MB']
  data_space [3000000000, 1500000000]
  root_space :warning => '1245MB', :failure => '500MB'
  mnt_space :warning => 400000, :failure => 200000
end