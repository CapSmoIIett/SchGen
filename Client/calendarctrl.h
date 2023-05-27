
#ifndef CALENDARCTRL_H
#define CALENDARCTRL_H


#include <QObject>
#include <QVector>


class CalendarCtrl
{
public:
    CalendarCtrl();

    static const QVector<QString> GetLabelTimeLine();
    static const QVector<QString> GetLabelWeekShort();

private:
    static const QVector<QString> v_LabelTimeline;
    static const QVector<QString> v_LabelWeekShort;
};

#endif // CALENDARCTRL_H
