#!/bin/bash

tput reset

ssh-keygen -m PEM -t rsa -b 4096 -C "caprover" -f ./deploy -q -N ""

echo "Your Github public key was generated and saved in the clipboard. Visit your Github project page and open the Deploy Keys section. CTRL-V (paste) your public key as a new deploy key called \"Caprover\"."
cat ./deploy.pub | clip

read -n 1 -r -s -p $'** Press any key for the next step **\n'
clear

echo "Now in another browser tab, visit Caprover to create a new App. In your app settings, set the port to 8080. Add any domains FIRST then enable HTTPS only on those domains. Enable websocket support as well, then click, Save & Update.\n\n"
echo "Now visit the Deployment tab and scroll to \"Method 3\" section. I have copied the project remote URL to clipboard so you can use CTRL-V to paste this into the Repository URL.\n\n"
echo "In Caprover, create your new App. Set port to 8080 and add any domain names you wish and then enable HTTPS. Save and update.\n\n"
git config --get remote.origin.url | clip

read -n 1 -r -s -p $'** Press any key to continue\n'
clear

echo "Set yoru branch to \"main\". Next, i've already copied the private deploy key to your clipboard. Paste this key into the Deploy Key tab and hit Save & Update. This will generate a new webhook URL."
cat ./deploy.pub | clip

unlink deploy
unlink deploy.pub

read -n 1 -r -s -p $'** Click the Webhook URL and press any key to continue to the next step\n'

echo "Go back to your Gitlab project and find the Webhook section. CTRL-V this as your new webhook where it says, \"Payload URL\".\n"

read -n 1 -r -s -p $'Press any key to exit\n'

clear
echo "You can now run your project locally using docker-compose up, make changes and commmit them locally. When you push your commit history, your project will automatically be deployed to caprover as a fresh build. ";

unlink setup.sh

exit
