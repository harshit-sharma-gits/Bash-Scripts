
echo "Enter day in format (e.g. Tue Jul 12) : "
read userInput

startTime=" 00:00:00 2022"
endTime=" 23:00:00 2022"

startDate=$userInput$startTime
endDate=$userInput$endTime
updatedDate=`date +"%a %b %d %H:%M:%S %Y"`

# echo $startDate
# echo $endDate
# echo $updatedDate

if [ ! -f BashEvent ]; then
	touch BashEvent
fi

addattr -t string Event:Status Notified BashEvent
addattr -t mime BEOS:Type application/x-calendar-event BashEvent
addattr -t string Event:Name Bash\ Event BashEvent
addattr -t string Calendar:ID 7c6b695a-2cff-452e-bab0-426c74d485f5 BashEvent
addattr -t string Event:Category Default BashEvent
addattr -t string Event:Place Remote BashEvent
addattr -t string Event:Description BashEvent
addattr -t time Event:Updated "$updatedDate" BashEvent
addattr -t time Event:Start "$startDate" BashEvent
addattr -t time Event:End "$endDate" BashEvent
addattr -t string Event:Description A\ description\ for\ example  BashEvent

echo Event\ Created\ Successfully!
echo Here\ are\ the\ attributes\ listed

listattr -l BashEvent
