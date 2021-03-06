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

cookbook_file 'giovannidelvalle.txt' do
  path '/root/giovannidelvalle.txt'
  action :create_if_missing
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

cookbook_file 'chrismendoza.txt' do
  path '/root/chrismendoza.txt'
  action :create_if_missing
end

cookbook_file 'herbjackson.txt' do
  path '/root/herbjackson.txt'
  action :create_if_missing
end

cookbook_file 'herbjackson.txt' do
  path '/root/herbjackson.txt'
  action :create_if_missing
end

cookbook_file 'seandonmooy.txt' do
  path '/root/seandonmooy.txt'
  action :create_if_missing
end

cookbook_file 'mattkettlewell.txt' do
  path '/root/mattkettlewell.txt'
  action :create_if_missing
end

cookbook_file 'joshrichards.txt' do
  path '/root/joshrichards.txt'
  action :create_if_missing
end

cookbook_file 'jensjorritsma.txt' do
  path '/root/jensjorritsma.txt'
  action :create_if_missing
end

cookbook_file 'mcadoo.txt' do
  path '/root/mcadoo.txt'
  action :create_if_missing
end

cookbook_file 'sheppy.txt' do
  path '/root/sheppy.txt'
  action :create_if_missing
end

file '/root/jimrosser.txt' do
  content 'Jim was Here!!!'
  action :create
end

cookbook_file 'racker_wolfa.txt' do
  path '/root/racker_wolfa.txt'
  action :create_if_missing
  mode 0640
  owner 'nobody'
  group 'www-data'
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
  action :create
end

ruby_block 'append_chrism' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/chrismendoza.txt') { |line| f.syswrite(line) }
    end
  end
end

ruby_block 'append_herbj' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/herbjackson.txt') { |line| f.syswrite(line) }
    end
  end
end

cookbook_file 'jwarden.txt' do
  path '/root/jwarden.txt'
  action :create_if_missing
end

ruby_block 'append_jwarden' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/jwarden.txt') { |line| f.syswrite(line) }
    end
  end
end

ruby_block 'append_joshr' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/joshrichards.txt') { |line| f.syswrite(line) }
    end
  end
end

ruby_block 'append_jjorritsma' do
  block do
    file = Chef::Util::FileEdit.new('/var/www/html/index.html')
    file.insert_line_if_no_match('/Jens Jorritsma/', 'Jens Jorritsma')
    file.write_file
  end
end

ruby_block 'append_mcadoo' do
  block do
    open('/var/www/html/index.html', 'a') do |f|
      IO.foreach('/root/mcadoo.txt') { |line| f.syswrite(line) }
    end
  end
end

ruby_block 'append_jim' do
  block do
    file = Chef::Util::FileEdit.new('/var/www/html/index.html')
    file.insert_line_if_no_match(/Jim Rosser/, 'Jim Rosser')
    file.write_file
  end
end
