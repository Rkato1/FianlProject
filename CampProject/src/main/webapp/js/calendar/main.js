var draggedEventIsAllDay;
		var activeInactiveWeekends = true;
		var calendar = $('#calendar').fullCalendar({
			 events: [],
			 locale                    : 'ko',    
			 timezone                  : "local", 
			 nextDayThreshold          : "09:00:00",
			 allDaySlot                : true,
			 displayEventTime          : true,
			 displayEventEnd           : true,
			 firstDay                  : 0, //월요일이 먼저 오게 하려면 1
			 weekNumbers               : false,
			 selectable                : true,
			 weekNumberCalculation     : "ISO",
			 eventLimit                : true,
			 views                     : { month : { eventLimit : 12 }},
			 eventLimitClick           : 'week', //popover
			 navLinks                  : true,
			 defaultDate               : moment('2021-01'), //실제 사용시 현재 날짜로 수정
			 timeFormat                : 'HH:mm',
			 defaultTimedEventDuration : '01:00:00',
			 editable                  : false,
			 minTime                   : '00:00:00',
			 maxTime                   : '24:00:00',
			 slotLabelFormat           : 'HH:mm',
			 weekends                  : true,
			 nowIndicator              : true,
			 dayPopoverFormat          : 'MM/DD dddd',
			 longPressDelay            : 0,
			 eventLongPressDelay       : 0,
			 selectLongPressDelay      : 0,
			 header                    : {
				 left   : 'today, prevYear, nextYear, viewWeekends',
                 center : 'prev, title, next',
                 right  : 'month, agendaWeek, agendaDay, listWeek'
			 },
			 
			 views                     : {
                 month : {
                   columnFormat : 'dddd'
                 },
                 agendaWeek : {
                   columnFormat : 'M/D ddd',
                   titleFormat  : 'YYYY년 M월 D일',
                   eventLimit   : false
                 },
                 agendaDay : {
                   columnFormat : 'dddd',
                   eventLimit   : false
                 },
                 listWeek : {
                   columnFormat : ''
                 }
    			 },
    		customButtons             : {
    			viewWeekends : {
    				text  : '주말',
                    click : function () {
                      activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                      $('#calendar').fullCalendar('option', { 
                        weekends: activeInactiveWeekends
                      });
                    }
    			}
    		}
		});