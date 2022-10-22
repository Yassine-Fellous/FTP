i=$(cat Shell_Userlist.csv | wc -l)
let i=i+1
for h in $(eval echo "{2..$i..1}");
	do	
	test[$h]=$(sed -n "$h p" Shell_Userlist.csv)
		for k in {1..5..1}
do

                	infos[$k]=$(echo ${test[$h]} | cut -d ',' -f$k)
			infos[$k]=$(echo ${infos[$k]} | cut -d ' ' -f$k)

done
use[$h]=${infos[2]}"-"${infos[3]}
echo ${use[$h]}
a=${infos[5]}
case $a in 
Sudo*)
sudo useradd -m ${infos[2]} -p ${infos[4]}
sudo usermod -aG sudo ${infos[1]}
sudo adduser ${infos[2]} ftp
echo "sudo ok"
;;
*)
sudo useradd -m ${infos[2]} -p ${infos[4]}
sudo adduser ${infos[2]} ftp
echo "user ok"
;;
esac
done
