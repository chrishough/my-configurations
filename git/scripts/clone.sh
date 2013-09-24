echo "Please feed me the ssh github url address ::"
read git_clone_url
echo "\ngithub url address = $git_clone_url\n"

echo "Please feed me the name of the folder you wish to use locally ::"
read git_clone_name
echo "\nlocal repo folder name = $git_clone_name\n"

# clone the repository and start setting global variables
git clone $git_clone_url $git_clone_name
echo "\n$git_clone_url successfully cloned!\n"
cd $git_clone_name

echo "Now feed my the github commit url! example: https://github.com/(account name)/(repository)/commit/ ::"
read github_commit_url
if [ ${github_commit_url:${#github_commit_url}-1} != "/" ];
then
  github_commit_url=${github_commit_url}'/';
fi
echo "\nlocal remote.github.url = $git_clone_name\n"
git config --add remote.github.url $github_commit_url

# verify default variables
git config --list

# copy commit hook
cp $HOME/.myconfigurations/git/hooks/commit_msg_add_branch_name .git/hooks/commit-msg
cp $HOME/.myconfigurations/git/hooks/post_commit_add_github_commit_note .git/hooks/post-commit
chmod +x .git/hooks/commit-msg
chmod +x .git/hooks/post-commit

