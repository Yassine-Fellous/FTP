echo "proftpd va être supp"
sudo apt-get autoremove --purge proftpd-* && sudo apt-get autoremove --purge openssl
echo "supression faite et c'est à openssl maintenant"
sudo userdel Merry && sudo userdel Pippin
echo "User delete"
sudo groupdel ftp
echo "groupe supprimé"
