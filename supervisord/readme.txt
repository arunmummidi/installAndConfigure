# install python pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

# install supervisord
pip install supervisord
echo_supervisord_conf >supervisord.conf

# start supervisord
supervisord -c supervisord.conf
