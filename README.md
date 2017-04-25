# RailsBox

```
 ██▀███   ▄▄▄       ██▓ ██▓      ██████  ▄▄▄▄    ▒█████  ▒██   ██▒
▓██ ▒ ██▒▒████▄    ▓██▒▓██▒    ▒██    ▒ ▓█████▄ ▒██▒  ██▒▒▒ █ █ ▒░
▓██ ░▄█ ▒▒██  ▀█▄  ▒██▒▒██░    ░ ▓██▄   ▒██▒ ▄██▒██░  ██▒░░  █   ░
▒██▀▀█▄  ░██▄▄▄▄██ ░██░▒██░      ▒   ██▒▒██░█▀  ▒██   ██░ ░ █ █ ▒ 
░██▓ ▒██▒ ▓█   ▓██▒░██░░██████▒▒██████▒▒░▓█  ▀█▓░ ████▓▒░▒██▒ ▒██▒
░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░▓  ░ ▒░▓  ░▒ ▒▓▒ ▒ ░░▒▓███▀▒░ ▒░▒░▒░ ▒▒ ░ ░▓ ░
  ░▒ ░ ▒░  ▒   ▒▒ ░ ▒ ░░ ░ ▒  ░░ ░▒  ░ ░▒░▒   ░   ░ ▒ ▒░ ░░   ░▒ ░
  ░░   ░   ░   ▒    ▒ ░  ░ ░   ░  ░  ░   ░    ░ ░ ░ ░ ▒   ░    ░  
   ░           ░  ░ ░      ░  ░      ░   ░          ░ ░   ░    ░  
                                  ░     By Luiz Gama / 2016 - 2017
```

## Requirements

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (latest)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html) (latest)
3. Install [Chef Development Kit](https://downloads.chef.io/chef-dk/) (latest)
4. Install vagrant plugin `vagrant-berskshelf`:
    ```bash
    vagrant plugin install vagrant-berkshelf
    ```
5. [IGNORE THIS STEP] Another useful plugins I use, just to document:
	```bash
    vagrant plugin install vagrant-librarian-chef-nochef
	vagrant plugin install vagrant-omnibus
	vagrant plugin install vagrant-share
	vagrant plugin install vagrant-vbguest
    ```
6. Clone this repository:
	```bash
    git clone https://github.com/luizgamabh/railsbox.git
    ```
7. Voilà:
	```bash
    vagrant up
    ```
