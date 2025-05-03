{pkgs, ...}:
pkgs.writeShellScriptBin "deploy-website" ''
  rsync -avz --delete ~/website/* VPS:~/website/
  ssh VPS "sudo rm -r /var/www/html/*"
  ssh VPS "sudo cp -r ~/website/ /var/www/html/"
''
