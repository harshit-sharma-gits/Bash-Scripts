## Add Events

This script is going to be used by my GSoC Project : [Improving the Calendar Application](https://discuss.haiku-os.org/t/gsoc-22-project-improving-the-calendar-application/12139)

This script's main purpose is to add some events to a specified day in the calendar, so that the Search & Filter Utility can be tested out!

---
### Initial Commit - [0160766](https://github.com/harshit-sharma-gits/Bash-Scripts/commit/0160766e9550ad5c23017c742ed8b8f89567ce37) 

Created a simple script to ask user to specify the `day` on which the event is to be added. Also, currently this only adds one event :

```
Event:Name - Bash Event
Event:Place - Remote
Event:Description - A description for example
Event:Updated - ${updatedDate}
Event:Start - ${startDate}
Event:End - ${endDate}
```

`updatedDate` gets the current date-time value, using this - 

```
updatedDate=`date +"%a %b %d %H:%M:%S %Y"`
```

`startDate` & `endDate` gets their value by the user, appended by `00:00:00` & `23:00:00` respectively, representing Start & End of the Day

```
startTime=" 00:00:00 2022"
endTime=" 23:00:00 2022"

startDate=$userInput$startTime
endDate=$userInput$endTime
```

I don't know how can I generate a seperate `Uuid` for the event, so I used the ID of an exisitng Event, the script works fine for adding one event to a specific day.

I'm planning to use a loop in order to add at least 10 events (maybe less, maybe more) to the day

---
### Improvement - [f7083e7](https://github.com/harshit-sharma-gits/Bash-Scripts/commit/f7083e7c95ea400f8ef7f6fa4656fd0158f3e6b6)

Now the script can be used to add 5 seperate events, at a certain Day!

You can have a look [here](https://drive.google.com/file/d/1zS5SwtuqPAPN3FhN_cuhdFej2EZ9vRyw/view?usp=sharing)

But, I see a problem here, if I run script again, entering some other day, all the events just shifts to that day, removing the previous events
