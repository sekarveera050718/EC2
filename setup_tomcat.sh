## Get tomcat credentials for testuser
tomcat_user=`awk -F "=" 'FNR==1 {print $2}' /home/tomcat/.tomcat_creds.groovy`
tomcat_passwd=`awk -F "=" 'FNR==2 {print $2}' /home/tomcat/.tomcat_creds.groovy`

## Sleep to give ec2 instance time to start up
sleep 30

## Allow access to Tomcat manager for testuser from everywhere, only do this for sandbox environments
ssh -oConnectTimeout=10 -oStrictHostKeyChecking=no bitnami@$1 "\
sudo -u tomcat sed -i 's/allow.*/allow=\"\^\.\*\$\" \/\>/' /opt/bitnami/apache-tomcat/webapps/manager/META-INF/context.xml;\
sudo -u tomcat sed -i 's/allow.*/allow=\"\^\.\*\$\" \/\>/' /opt/bitnami/apache-tomcat/webapps/host-manager/META-INF/context.xml;\
sudo -u tomcat /opt/bitnami/apache-tomcat/bin/shutdown.sh;\
sudo -u tomcat /opt/bitnami/apache-tomcat/bin/startup.sh;\
sudo -u tomcat sed -i 's/<\/tomcat-users>/<user username=${tomcat_user} password=${tomcat_passwd} roles=\"manager-script\"\/><\/tomcat-users>/' /opt/bitnami/apache-tomcat/conf/tomcat-users.xml"

## Sleep to allow tomcat server to start up
sleep 10
