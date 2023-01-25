script_location=$(pwd)
Log=/tmp/roboshop.log

status_check() {
if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi
}


yum install nginx -y &>>${Log}
status_check


systemctl enable nginx &>>${Log}
status_check

systemctl start nginx &>>${Log}
status_check

rm -rf /usr/share/nginx/html/* &>>${Log}

status_check

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${Log}
status_check

cd /usr/share/nginx/html &>>${Log}
unzip /tmp/frontend.zip &>>${Log}

status_check

cp ${script_location}/Files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${Log}
systemctl restart nginx &>>${Log}

status_check