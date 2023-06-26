#echo out owners of listed service accounts by searching through the LDAP
export team="one service account per line"

for member in $team
do
    echo "--------------------- $member ----------------------"
    ldapsearch -LLL -H ldap://<ldap server>:<port> (e.g. 389) -x -b "ou=Applications,o=<appropriate field>" "(cn=$member)" | grep owner: | sed 's/.*uid=//' | sed 's/,ou=.*/;/'
done 