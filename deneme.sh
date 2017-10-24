#!\bin\bash

echo "bir ip adresi giriniz:"
read $ipaddress
echo "netmask"
read $netmask
echo  "gateway"
read $gateway

ifconfig enp0s3 $ipaddress netmask $netmask up
ip route add default via $gateway

ifconfig -a

apt-get update
dpkg-query -l apache2

echo "kurulum yapmak ister misiniz?(E\H)"
read yanit
if [ $yanit = "E" ]
    then
      apt-get install apache2
    else
      apache2 --version
fi

tail -n 5 /var/log/apache2/error.log >> /home/root/logapache
a=`grep -c "normal" /home/root/logapache`

if [ $a -ne 0 ]
   then 
      echo "basarili"
   else
      echo "basarisiz"
fi
