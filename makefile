build: 
	cd ~/
	apt-get update -y
	apt-get upgrade -y
	apt-get install -y build-essential
	echo "run make node, nginx, gethub"

nginx:
	apt-get install -y nginx 
	sudo ufw allow 'Nginx HTTP'
	systemctl status nginx
	sudo apt-get install curl
	curl -4 icanhazip.com
	#eventually route ^ this to the terminal, a logfile and open a browser window to check
	cd /var/www/html


node:
	mkdir ~/.node-setup
	cd ~/.node-setup
	apt-get update -y
	apt-get upgrade -y
	curl -sL https://deb.nodesource.com/setup_6.x | bash -
	apt-get install nodejs -y
	#this script will update permissions and allow npm global install without sudo
	wget -O- https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | sh
	source ~/.bashrc
	npm update -g
	npm i -g browserify grunt grunt-cli gulp cordova forever watchify bower express n
	npm i create-react-app --global
	n lts
	n stable
	n 8.0.0
	npm install standard --global
	#npm install -g @angular/cli
	#npm install branch-diff --g buillobal
	npm install nodemon --global
	npm install -g grunt-init
	#npm install now --global
	npm install jshint --global
	npm install pug-cli --global
	npm install npm --global
	npm config set init.author.name "bryanVodden"
	npm config set init.author.email bryanvodden@gmail.com
	npm config set init.author.url http://bvodden.com
	npm config set init.license MIT
	npm config set init.version 0.0.1
	#add a node test server here and start it up in forever
	#mkdir ~/projects/testnode
	#cd ~/projects/testnode
	#git clone https://github.com/bvodden/testnode.git
	#npm install
	#forever start index.js 80
	#forever list
	napm completion >> ~/.bashrc
	source ~/.bashrc
	npm install -g npm
	npm rebuild




getgit:
	apt-get update
	apt-get install git -y
	git config --global user.name "Bryan Vodden"
	git config --global user.email "bryanvodden@gmail.com"
	git config --list
	echo "type gethub to complete installation."

gethub:
	mkdir ~/hub
	wget -qO- https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-linux-amd64-2.3.0-pre10.tgz | tar xvz -C ~/hub --strip-components=1
	cd ~/hub/bin
	cp hub /usr/local/bin
	alias git=hub
	hub

gitlocal:
	#Create git user account
	sudo adduser --shell $(which git-shell) --gecos 'git version control' --disabled-password git

	#Add git user to the appropriate groups
	sudo usermod -a -G www-data git
	sudo usermod -a -G developers git

	#Setup authorized_keys file for access
	sudo mkdir -p /home/git/.ssh
	sudo touch /home/git/.ssh/authorized_keys
	sudo chmod 600 /home/git/.ssh/authorized_keys
	sudo chmod 700 /home/git/.ssh

	#Copy the git-shell-commands to get limited shell access
	sudo cp -r /usr/share/doc/git/contrib/git-shell-commands /home/git/
	sudo chmod 750 /home/git/git-shell-commands/*

	#Fix permissions
	sudo chown -R git:git /home/git/

getgists:
	#NOT CURRENT OR CORRECT OR COMPLETE IN ANY WAY. DO NOT USE 
	mkdir ~/dev/gists
	cd ~/dev/gists
	mkdir server
	mkdir server/node
	mkdir app/browserify
	mkdir html
	mkdir js
	mkdir css 
	sudo gem install gist -v 4.6.1
	sudo cp /var/lib/gems/2.3.0/gems/gist-4.6.1/bin/gist /usr/bin/gist



addusers:
	#adduser git
	adduser dev
	adduser web

	usermod -aG sudo dev


firewall:
	ufw allow OpenSSH
	ufw enable
	ufw status
	service ssh status

getssh:
	apt-get update
	sudo apt install openssh-client
	sudo apt install openssh-server
	sudo systemctl restart sshd.service

getsshkey:
	ssh-keygen -t rsa 4096 -C "formerastronaut@gmail.com"
	#ssh-copy-id 
	#chmod 600 .ssh/authorized_keys
	echo "run make addsshkey"

addsshkey:
	#eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa
	nano ~/.ssh/id_rsa

customizebash:
	#figure out how to add my own styles to the bash configuration files (user) from makefile


.PHONY: build node nginx getgit gethub addusers firewall getssh getsshkey customizebash addsshkey