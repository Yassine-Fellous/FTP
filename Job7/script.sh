
sudo apt-get install proftpd-* openssl

echo "Ajout du group ftp"
sudo groupadd ftp

echo "Ajout de l'utilisateur Merry et Ajout au groupe ftp"
sudo useradd -m Merry && sudo adduser Merry ftp
sudo echo "Merry:kalimac" | sudo chpasswd 

echo "Ajout de l'utilisateur Pippin et Ajout au groupe ftp"
sudo useradd -m Pippin && sudo adduser Pippin ftp
sudo echo "Pippin:secondbreakfast" | sudo chpasswd
 
echo "Génération des clefs de chiffrement"
sudo mkdir /etc/proftpd/ssl
sudo openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

echo "Sauvegarde de l'ancien fichier proftpd.conf "
sudo cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.bak

echo "Remplacement du fichier proftpd.conf"

sudo cp proftpd.conf /etc/proftpd/proftpd.conf
sudo chmod 600 /etc/proftpd/ssl/proftpd.* 

echo "Redémarage du service proftpd"
sudo systemctl restart proftpd.service

echo "Installation terminée"
