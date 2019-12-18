#!bin/ksh
#####################################################################################
##
##      FILE            : ssl_expire_date.sh
##      PURPOSE         : Generate certificate expire date in days
##======================================================================================

#sampe input to get certificate expiration date and number of days remaining from  Valid from: Thu Apr 21 10:27:39 EDT 2016 until: Sat May 11 13:29:46 EDT 2019
#function to convert date into _num_of_days..
date_into_days()
{
e_date=$1
#echo -e "function calling"
date_in_sec=`date -d ${e_date} +"%s"`
#echo  $date_in_sec
curr=`echo  $(date +%s)`
diff=`expr $date_in_sec - $curr`
#echo $diff
RemainingDays=`expr $diff / 34560`
echo -e "ssl certificate wiil expire in $RemainingDays days"
}
#we will store output of keytool -list -v -keystore sample_keystore.jks  into file cacerts.txt
#v_date="Valid from: Thu Apr 21 10:27:39 EDT 2016 until: Sat May 11 13:29:46 EDT 2019"
SCRIPTS_HOME=/home/oracle/AA_Scripts/Anil/keystores
cd $SCRIPTS_HOME
v_date=`cat cacerts.txt | grep -i 'Valid from'`
echo $v_date
#purging v_x to get details about expiration date
#sed   's/.*$until//' valid_date
expire_date=`echo $v_date | awk '{print $11,$12,$15}'`
#echo -e "expire_date is $expire_date"

for_date=`date -d "${expire_date}" +"%Y-%m-%d"`
#echo -e " formatted expired  date is $for_date"
date_into_days $for_date
#echo $v_date


-------------------------------------------------------------------------------------------------------------
sample output: sh ssl_expire_alert.sh
 
ssl certificate wiil expire in 1016 days




 

