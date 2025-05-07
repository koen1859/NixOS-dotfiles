{pkgs, ...}:
pkgs.writeShellScriptBin "deploy-website" ''
  cd ~/website
  git add -A
  git commit -m "Deploy Website"
  git push github main
  ssh VPS "cd ~/website && git pull github main"
  ssh VPS "sudo rsync -a --delete --exclude='.git' ~/website/ /var/www/html/"
''
