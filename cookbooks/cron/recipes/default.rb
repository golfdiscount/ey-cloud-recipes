#
# Cookbook Name:: cron
# Recipe:: default
#

if node[:name] == 'rake'
  cron "Rewards Marketing" do
    #0 16 */7 * *
    minute  "0"
    hour    '16'
    day     '*/7'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake marketing:send_loyalty"
  end

  cron "Strands Recommender" do
    #0 3 */1 * *
    minute  "0"
    hour    '3'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake marketing:upload_feed_files"
  end

  cron "Daily Catch All" do
    #0 2 */1 * *
    minute  "0"
    hour    '2'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake golfdiscount:dod"
  end

  cron "Mercent Product Feed" do
    #0 3 */1 * *
    minute  "0"
    hour    '3'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake mercent:product_feed"
  end

  cron "SLI Product Feed" do
    #0 3 */1 * *
    minute  "0"
    hour    '5'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake golfdiscount:sli_upload"
  end

  cron "Mercent Inventory Feed" do
    #0 */2 * * *
    minute  "0"
    hour    '*/2'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake mercent:inventory_feed"
  end

  cron "Buysight Upload" do
    #0 4 */1 * *
    minute  "0"
    hour    '4'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake golfdiscount:buysight_upload"
  end

  cron "Mercent Process Orders" do
    #0 */1 * * *
    minute  "0"
    hour    '*/1'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake mercent:process_orders"
  end

  cron "MyBuys Upload" do
    #0 1 */1 * *
    minute  "0"
    hour    '1'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake mybuys:upload_all"
  end

  cron "Read Amazon Order CA" do
    #*/30 * * * *
    minute  "*/30"
    hour    '*'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:read_amazon_order_ca"
  end

  cron "Write Amazon Order Ack" do
    #0 */1 * * *
    minute  "0"
    hour    '*/1'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_order_ack"
  end

  cron "Write Amazon Order Charge" do
    #0 22 */1 * *
    minute  "0"
    hour    '22'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_order_fulfillments"
  end

  cron "Write Amazon Feeds daily CA" do
    #0 10 */1 * *
    minute  "0"
    hour    '10'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_amazon_ca_feeds"
  end

  cron "Write Amazon Feeds nightly CA" do
    #0 1 */1 * *
    minute  "0"
    hour    '1'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_amazon_ca_feeds"
  end

  cron "Write Amazon Product Feed daily CA" do
    #0 9 */1 * *
    minute  "0"
    hour    '9'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_product_ca_feed"
  end

  cron "Write Amazon Product Feed nightly CA" do
    #0 0 */1 * *
    minute  "0"
    hour    '0'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:send_product_ca_feed"
  end

  cron "Read Amazon Processing Reports" do
    #4 */2 * * *
    minute  "4"
    hour    '*/2'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production rake amazon:read_processing_reports"
  end

end
