# Encoding: utf-8
#
# Cookbook Name:: apache-site
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
include_recipe 'apt::default'
include_recipe 'apache2::default'
include_recipe 'chef-client::default'

%w(vagrant rack).each do |user|
  node.override['rackspace_user']['users'][user]['enabled'] = true
  node.override['rackspace_user']['users'][user]['sudo'] = true
  node.override['rackspace_user']['users'][user]['sudo_nopasswd'] = true
end

apt_package 'emacs' do
end

cookbook_file 'mattjbarlow.txt' do
  path '/root/mattjbarlow.txt'
end

cookbook_file 'justinseubert.txt' do
  path '/root/justinseubert.txt'
  action :create_if_missing
end

cookbook_file 'mattparker.txt' do
  path '/root/mattparker.txt'
  action :create_if_missing
end

cookbook_file 'johnschwinghammer.txt' do
  path '/root/johnschwinghammer.txt'
  action :create_if_missing
end

cookbook_file 'bobgarza.txt' do
  path '/root/bobgarza.txt'
  action :create_if_missing
end

cookbook_file 'jamescobb.txt' do
  path '/root/jamescobb.txt'
  action :create_if_missing
end

cookbook_file 'jacobdearing.txt' do
  path '/root/jacobdearing.txt'
  action :create_if_missing
end

cookbook_file 'jimmyprescott.txt' do
  path '/root/jimmyprescott.txt'
  action :create_if_missing
end

template '/root/matte.txt' do
  source 'matte.txt'
  mode 0440
  owner 'root'
  group 'root'
end

cookbook_file 'jonclayton.txt' do
  path '/root/jonclayton.txt'
  action :create_if_missing
end

cookbook_file 'chrismendoza.txt' do
  path '/root/chrismendoza.txt'
  action :create_if_missing
end

cookbook_file 'anthony.txt' do
  path '/root/anthony.txt'
  action :create_if_missing
end

cookbook_file 'helmut.txt' do
  path '/root/helmut.txt'
  action :create_if_missing
end

cookbook_file 'ajgeiger.txt' do
  path '/root/ajgeiger.txt'
  action :create_if_missing
end

template '/etc/profile.d/editor.sh' do
  source 'editor.sh.erb'
  mode 0644
  owner 'root'
  group 'root'
end

cookbook_file 'allenoster.txt' do
  path '/root/allenoster.txt'
end

directory '/var/www/html/' do
  owner 'www-data'
  group 'www-data'
  action :create
  recursive true
end

cookbook_file 'index.html' do
  path '/var/www/html/index.html'
end

ruby_block 'append_chrism' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/chrismendoza.txt') { |line| f.syswrite(line) }
    end
  end
end
