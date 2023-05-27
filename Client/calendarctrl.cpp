
#include "calendarctrl.h"

const QVector<QString> CalendarCtrl::v_LabelTimeline = {
    "12 PM", "1 AM", "2 AM", "3 AM", "4 AM", "5 AM",
    "6 AM", "7 AM", "8 AM", "9 AM", "10 AM", "11 AM",
    "12 PM", "1 PM", "2 PM", "3 PM", "4 PM", "5 PM",
    "6 PM", "7 PM", "8 PM", "9 PM", "10 PM", "11 PM"
};

const QVector<QString> CalendarCtrl::v_LabelWeekShort
{
    "MN", "TU", "WE", "TH", "FR", "SA", "SU"
};

const QVector<QString> CalendarCtrl::v_Months = {
    "January", "February", "March",
    "April", "May", "June",
    "July", "August", "September",
    "October", "November", "December"
};

CalendarCtrl::CalendarCtrl()
{

}

const QVector<QString> CalendarCtrl::GetLabelTimeLine()
{
    return v_LabelTimeline;
}

const QVector<QString> CalendarCtrl::GetLabelWeekShort()
{
    return v_LabelWeekShort;
}

int CalendarCtrl::GetNumbersOfDays (int monthNumber, int year)
{
    if (monthNumber == JANUARY)
        return (31);

    if (monthNumber == FEBRUARY)
    {
        // If the year is leap then February has
        // 29 days
        if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
            return (29);
        else
            return (28);
    }

    if (monthNumber == MARCH)
        return (31);

    if (monthNumber == APRIL)
        return (30);

    if (monthNumber == MAY)
        return (31);

    if (monthNumber == JUNE)
        return (30);

    if (monthNumber == JULY)
        return (31);

    if (monthNumber == AUGUST)
        return (31);

    if (monthNumber == SEPTEMBER)
        return (30);

    if (monthNumber == OCTOBER)
        return (31);

    if (monthNumber == NOVEMBER)
        return (30);

    if (monthNumber == DECEMBER)
        return (31);

    return 0;
}

int CalendarCtrl::GetDayOfWeekByDate (int day, int month, int  year)
{
    static int t[] = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };

    year -= month < 3;

    int dayNumber = ( year + year/4 - year/100 + year/400 + t[month-1] + day) % 7;

    // we start from mondey
    if (dayNumber == 0)
        return SUNDAY;

    return dayNumber - 1;
}

QString CalendarCtrl::GetMonthName (int monthNumber)
{
    return v_Months[monthNumber - 1];
}

