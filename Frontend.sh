script_location=$(pwd)
Log=/tmp/roboshop.log


yum install nginx -y &>>${Log}
if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi

systemctl enable nginx &>>${Log}
if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi
systemctl start nginx &>>${Log}
if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi
rm -rf /usr/share/nginx/html/* &>>${Log}

if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${Log}
if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi

cd /usr/share/nginx/html &>>${Log}
unzip /tmp/frontend.zip &>>${Log}

if [ $? -eq 0 ]; then
  echo success
  else
    echo failure
fi

cp ${script_location}/Files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${Log}
systemctl restart nginx &>>${Log}

if [ $? -eq 0 ]; then
  echo success
   else
    echo failure
fi