script_location=$(pwd)


yum install nginx -y
if [$? -eq 0]; then
  echo success
  else
    each failure
fi

systemctl enable nginx
if [$? -eq 0]; then
  echo success
  else
    each failure
fi
systemctl start nginx
if [$? -eq 0]; then
  echo success
  else
    each failure
fi
rm -rf /usr/share/nginx/html/*

if [$? -eq 0]; then
  echo success
  else
    each failure
fi
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
if [$? -eq 0]; then
  echo success
  else
    each failure
fi

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

if [$? -eq 0]; then
  echo success
  else
    each failure
fi

cp ${script_location}/Files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx

if [$? -eq 0]; then
  echo success
  else
    each failure
fi