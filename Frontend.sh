script_location=$(pwd)


yum install nginx -y
echo $?

systemctl enable nginx
systemctl stanrt nginx
rm -rf /usr/share/nginx/html/*

echo $?
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo $?

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo $?

cp ${script_location}/Files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx

echo $?