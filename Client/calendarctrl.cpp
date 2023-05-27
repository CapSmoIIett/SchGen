
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
