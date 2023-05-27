#pragma once


#include <QObject>
#include <QVector>

#define JANUARY 	1
#define FEBRUARY	2
#define MARCH		3
#define APRIL		4
#define MAY			5
#define JUNE		6
#define JULY		7
#define AUGUST		8
#define SEPTEMBER	9
#define OCTOBER		10
#define NOVEMBER	11
#define DECEMBER	12

#define MONDAY		0
#define TUESDAY		1
#define WEDNESDAY	2
#define THURSDAY	3
#define FRIDAY		4
#define SATURDAY	5
#define SUNDAY		6


class CalendarCtrl
{
public:
    CalendarCtrl();

    static const QVector<QString> GetLabelTimeLine();
    static const QVector<QString> GetLabelWeekShort();

    static int GetNumbersOfDays (int monthNumber, int year);

    static int GetDayOfWeekByDate (int day, int month, int  year);
    static QString GetMonthName (int monthNumber);

private:
    static const QVector<QString> v_LabelTimeline;
    static const QVector<QString> v_LabelWeekShort;
    const static QVector<QString> v_Months;
};

