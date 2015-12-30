#
# Cookbook Name:: custombox
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package "libxslt-dev" do
  package_name value_for_platform(
    [ "centos", "redhat", "suse", "fedora" ] => { "default" => "libxslt-devel" },
    "gentoo" => { "default" => "dev-libs/libxslt" },
    "default" => "libxslt1-dev"
  )
end

file '/home/vagrant/.gemrc' do
	content 'gem: --no-ri --no-rdoc'
	mode 0644
	owner 'vagrant'
	group 'vagrant'
end

template '/home/vagrant/.bashrc_template' do
	source 'bashrc_template'
	# mode 0755
	# owner 'vagrant'
	# group 'vagrant'
end

template '/etc/motd' do
	source 'motd_template'
end

# execute 'install rails on default rvm ruby' do
# 	command "rvm use default"
# 	command "gem install rails"
# 	user "vagrant"
# 	not_if 'gem list | grep -w "^rails\b"'
# end

execute 'append_to_bashrc' do
	command "cat /home/vagrant/.bashrc_template >> /home/vagrant/.bashrc"
end

execute 'install_dependencies'
	command "sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libgmp3-dev"
end

file '/home/vagrant/.bashrc_template' do
	action :delete
end