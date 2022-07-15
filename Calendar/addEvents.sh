
echo "Enter day in format (e.g. Tue Jul 12) : "
read userInput

startTime=" 00:00:00 2022"
endTime=" 23:00:00 2022"

startDate=$userInput$startTime
endDate=$userInput$endTime
updatedDate=`date +"%a %b %d %H:%M:%S %Y"`

# Data -

eventNames=("Complete your Project" "Take a bath" "Take a nap" "Clean up your desk" "Feed your dog")
eventCategories=("Default" "Birthday")
eventPlaces=("Work Desk" "Bathroom" "Bedroom" "Workplace" "Home")
eventDescriptions=("An example description for the event" "Another desc for instace")

for i in ${!eventNames[@]}; do

	if [ ! -f "${eventNames[$i]}" ]; then
		touch "${eventNames[$i]}"
	fi
	
	currentCategory=${eventCategories[$i%2]}
	currentDescription=${eventDescriptions[$i%2]}

	addattr -t string Event:Status Notified "${eventNames[$i]}"
	addattr -t mime BEOS:Type application/x-calendar-event "${eventNames[$i]}"
	addattr -t string Event:Name "${eventNames[$i]}" "${eventNames[$i]}"
	addattr -t string Calendar:ID 7c6b695a-2cff-452e-bab0-426c74d485f5 "${eventNames[$i]}"
	addattr -t string Event:Category "${currentCategory}" "${eventNames[$i]}"
	addattr -t string Event:Place "${eventPlaces[$i]}" "${eventNames[$i]}"
	addattr -t time Event:Updated "$updatedDate" "${eventNames[$i]}"
	addattr -t time Event:Start "$startDate" "${eventNames[$i]}"
	addattr -t time Event:End "$endDate" "${eventNames[$i]}"
	addattr -t string Event:Description "${currentDescription}"  "${eventNames[$i]}"
done

echo Events\ Created\ Successfully!
