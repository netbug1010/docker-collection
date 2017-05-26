# Create a self-signed certificate/keys for Nginx
cd config/
openssl genrsa -des3 -out server.key 2048
openssl req -new -key server.key -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 3650 -in server.csr -signkey server.key -out server.crt
rm -rf server.csr
rm -rf server.key.org

# Create jenkins user and and grant full access to the data folder
echo "jenkins:x:1000:1000:Docker User:/opt/docker/jenkins/data:/sbin/nologin" > /etc/passwd
echo "jenkins:x:1000:" > /etc/group
mkdir data
chown -R jenkins: data
