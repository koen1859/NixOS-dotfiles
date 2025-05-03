{pkgs, ...}:
pkgs.writeShellScriptBin "deploy-website" ''
  ssh VPS "cd ~/website && git pull github main"
  ssh VPS "sudo rsync -a --delete ~/website/ /var/www/html/"
''
