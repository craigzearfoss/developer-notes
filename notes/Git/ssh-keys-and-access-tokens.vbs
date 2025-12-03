Generating ssh key
-------------------
1. Open Git Bash
2. ssh-keygen -t ed25519 -C "craigzearfoss@yahoo.com"
3. Open PowerShell an admin.
	# start the ssh-agent in the background
	Get-Service -Name ssh-agent | Set-Service -StartupType Manual
	Start-Service ssh-agent
4. Open cmd terminal wihtout elevated permissions.
	ssh-add c:/Users/craig/.ssh/id_ed25519
	
Adding ssh key to GitHub
------------------------
1. 
	clip < /Users/craig/.ssh/id_ed25519.pub
	# Copies the contents of the id_ed25519.pub file to your clipboard
2. On github.com:
	Settings => Access SSH and GPG keys
	Click on "New SSH key" button.
		Enter title.
		Paste in the Key.
		Click on "Add SSH key" button.
3. Enter the code from the Google Authenticator app and click the "Verify" button.

Creating a personal access token (classic)
------------------------------------------
1. Verify your email address.
2. Settings => Developer settings
3. Personal access tokens => Tokens (classic)
	- "Generate new token" => Generate new token (classic)
	- Enter Note and select expiration date
	- Select scopes. Recommend at least:
		- repo
		- write
		- delete
		- project
	- Click on "Generate token" button.
	- Copy the generated token.
4. In a command terminal.
	git config --global credential.helper '!f() { sleep 1; echo "username=git token=<TOKEN>"; }; f'

Creating a new repo
-------------------