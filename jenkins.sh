sudo yum update -y
sudo yum install -y wget
sudo yum install git unzip -y
echo "=================================="
echo "installing java 8"
echo "=================================="
sudo yum install java-1.8.0-openjdk -y
java -v
echo "=================================="
echo "installing terraform"
echo "=================================="
sudo wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
sudo unzip terraform_0.11.8_linux_amd64.zip 
sudo cp terraform /usr/local/bin
sudo chmod +x /usr/local/bin
terraform --version
echo "=================================="
echo "installing jenkins"
echo "=================================="
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
echo "=================================="
echo "aws credentials"
echo "=================================="
mkdir .aws
touch .aws/{credentials,config}
echo -e "[default]\naws_access_key_id=\naws_secret_access_key=" >>/home/ec2-user/.aws/credentials
echo -e "[default]\nregion=us-east-1\noutput=json" >>/home/ec2-user/.aws/config

echo "=================================="
echo "jenkins secret key"
echo "=================================="
sudo cat /var/lib/jenkins/secrets/initialAdminPassword