#
# Cookbook Name:: collectd
# Recipe:: default
#

collectd do
  load :warning => 8, :failure => 12
  db_space ['1.3GB', '500MB']
  data_space [3000000000, 1500000000]
  root_space :warning => '1245MB', :failure => '500MB'
  mnt_space :warning => 400000, :failure => 200000
end