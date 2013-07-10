#
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
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake marketing:send_loyalty"
  end

  cron "Abandoned Cart Follow-up" do
    #0 16 */7 * *
    minute  "0"
    hour    '0'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake marketing:order_follow_up"
  end

  cron "Google Trusted Merchant Feeds" do
    #0 16 */7 * *
    minute  "30"
    hour    '0'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake golfdiscount:google_trusted_feeds"
  end

  cron "Strands Recommender" do
    #0 3 */1 * *
    minute  "0"
    hour    '1'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake marketing:upload_feed_files"
  end

  cron "Daily Catch All" do
    #0 2 */1 * *
    minute  "0"
    hour    '2'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake golfdiscount:dod"
  end

  cron "Mercent Product Feed" do
    #0 3 */1 * *
    minute  "0"
    hour    '3'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake mercent:product_feed"
  end

  cron "Mercent Inventory Feed" do
    #0 */2 * * *
    minute  "*/30"
    hour    '*'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake mercent:inventory_feed"
  end

  cron "Buysight Upload" do
    #0 4 */1 * *
    minute  "0"
    hour    '4'
    day     '*/1'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake golfdiscount:buysight_upload"
  end

  cron "Mercent Process Orders" do
    #0 */1 * * *
    minute  "0"
    hour    '*/1'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake mercent:process_orders"
  end

  cron "Verify Automated Task Log" do
    #0 */1 * * *
    minute  "0"
    hour    '*/1'
    day     '*'
    month   '*'
    weekday '*'
    user 'deploy'
    command "cd /data/GolfDiscount/current && RAILS_ENV=production bundle exec rake epicor:verify_log"
  end

end
