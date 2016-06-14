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

# Thumbor begin

execute "Install Python dependencies for Thumbor" do
	command 'sudo apt-get install -y python-pip python-dev build-essential'
end

execute "Updates Python PIP" do
	command 'sudo pip install --upgrade pip'
end

execute "Updates virtualenv" do
	command 'sudo pip install --upgrade virtualenv'
end

execute "Add repository for thumbor package dependencies" do
	command 'sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next && sudo apt-get update -y'
end

execute "Install thumbor package dependencies" do
	command 'sudo apt-get install -y ffmpeg libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libgtk2.0-dev python-numpy python-pycurl webp python-opencv'
end

execute "Install thumbor" do
	command 'sudo pip install thumbor'
end

execute "Install things for facedetector" do
	command 'sudo apt-get install -y vim build-essential python-software-properties python-opencv python-numpy python-scipy'
end

execute "Resolve thumbor issue" do
	command 'sudo ln /dev/null /dev/raw1394'
end

execute "Setup thumbor folder" do
	command 'sudo mkdir -p /etc/thumbor'
end

execute "Create thumbor config file" do
	command "sudo sh -c 'thumbor-config > /etc/thumbor/thumbor.conf'"
end

template '/home/vagrant/thumbor_config_script.rb' do
	source 'thumbor_config_script.rb'
end

execute "Configure thumbor" do
	command "sudo ruby /home/vagrant/thumbor_config_script.rb"
end

file '/home/vagrant/thumbor_config_script.rb' do
	action :delete
end

template '/etc/supervisor/thumbor.conf' do
	source 'thumbor.conf'
	owner 'root'
	group 'root'
	mode '0755'
end

execute "Restart supervisor" do
	command "sudo supervisorctl reload && sudo supervisorctl restart all"
end

# Thumbor end

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

execute 'install_dependencies' do
	command "sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libgmp3-dev"
end

file '/home/vagrant/.bashrc_template' do
	action :delete
end