#pragma once


#include <QObject>
#include <qqml.h>

#include <QString>
#include <QDate>

#include "calendarctrl.h"

class AppCore : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int day READ day WRITE setDay NOTIFY DateChanged)
    Q_PROPERTY(int month READ month WRITE setMonth NOTIFY DateChanged)
    Q_PROPERTY(int year READ year WRITE setYear NOTIFY DateChanged)
    Q_PROPERTY(int type READ type WRITE setType NOTIFY TypeChanged)
    //Q_PROPERTY(Type types READ types)

    QML_ELEMENT


public:
    AppCore();

    int day();
    void setDay(const int&);

    int month();
    void setMonth(const int&);

    int year();
    void setYear(const int&);

    int type();
    void setType(const int&);

    Q_INVOKABLE void dateNext();
    Q_INVOKABLE void datePrev();

    Q_INVOKABLE QString getMonthByName(int);
    Q_INVOKABLE void  SetCurDate();

    enum Type {
        Day,
        Week,
        Month
    };


    //Type types();

    Q_ENUM(Type)

signals:
    void DateChanged();
    void TypeChanged();

private:
    QDate d_SelectedDate;
    int i_Type;
};

