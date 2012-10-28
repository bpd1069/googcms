mkdir -p /usr/local/googlecl; pushd $_
svn checkout http://googlecl.googlecode.com/svn/trunk/ .
sudo python setup.py install --record=files.txt
google docs list
popd
