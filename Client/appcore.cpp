
#include "appcore.h"

AppCore::AppCore()
{
    SetCurDate();
    connect(this, &AppCore::DateChanged, this, [this](){qDebug() << this->d_SelectedDate;});

    i_Type = Week;
}

int AppCore::day()
{
    return d_SelectedDate.day();
}

void AppCore::setDay(const int& d)
{
    d_SelectedDate.setDate(d_SelectedDate.year(), d_SelectedDate.month(), d);
}

int AppCore::month()
{
    return d_SelectedDate.month();
    emit DateChanged();
}

void AppCore::setMonth(const int& m)
{
    d_SelectedDate.setDate(d_SelectedDate.year(), m, d_SelectedDate.day());
    emit DateChanged();
}

int AppCore::year()
{
    return d_SelectedDate.year();
}

void AppCore::setYear(const int& y)
{
    d_SelectedDate.setDate(y, d_SelectedDate.month(), d_SelectedDate.day());
    emit DateChanged();
}

int AppCore::type()
{
    return i_Type;
}
void AppCore::setType(const int& t)
{
    qDebug() << t;
    i_Type = t;
}


/*
Type AppCore::types()
{
    return
}
*/


void AppCore::dateNext()
{
    int day = d_SelectedDate.day();
    int month = d_SelectedDate.month();
    int year = d_SelectedDate.year();

    switch (i_Type)
    {
    case Week: day += 6;
    case Day:
    {
        day += 1;

        if (day <= CalendarCtrl::GetNumbersOfDays(month, year))
        {
            d_SelectedDate.setDate(year, month, day);
            emit DateChanged();
            break;
        }

        day -= CalendarCtrl::GetNumbersOfDays(month, year);
    }
    case Month:
    {
        month += 1;
        if (month <= DECEMBER)
        {
            d_SelectedDate.setDate(year, month, day);
            emit DateChanged();
            break;
        }

        month = JANUARY;
    }
    {
        d_SelectedDate.setDate(year + 1, month, day);
        emit DateChanged();
    }
    }
}

void AppCore::datePrev()
{
    int day = d_SelectedDate.day();
    int month = d_SelectedDate.month();
    int year = d_SelectedDate.year();

    switch (i_Type)
    {
    case Week: day -= 6;
    case Day:
    {
        day -= 1;
        if (day > 1)
        {
            d_SelectedDate.setDate(year, month, day);
            emit DateChanged();
            break;
        }

        day += CalendarCtrl::GetNumbersOfDays(month == JANUARY ? DECEMBER : month - 1, year);
    }
    case Month:
    {
        month -= 1;
        if (month >= JANUARY)
        {
            d_SelectedDate.setDate(year, month, day);
            emit DateChanged();
            break;
        }

        month = DECEMBER;
        d_SelectedDate.setDate(year - 1, month, day);
        emit DateChanged();
    }
    }
}

QString AppCore::getMonthByName(int month)
{
    return CalendarCtrl::GetMonthName(month);
}

void  AppCore::SetCurDate()
{
    this->d_SelectedDate = QDate::currentDate();
    emit DateChanged();
}
