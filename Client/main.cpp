#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlProperty>

#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "appcore.h"

#include "daymodel.h"
#include "weekmodel.h"
#include "monthmodel.h"
#include "grouplistmodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/SchGen/qml/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    AppCore core;
    engine.rootContext()->setContextProperty("app", &core);

    DayModel day;
    engine.rootContext()->setContextProperty("day", &day);

    WeekModel week;
    engine.rootContext()->setContextProperty("week", &week);

    MonthModel month;
    engine.rootContext()->setContextProperty("month", &month);

    GroupListModel groups;
    engine.rootContext()->setContextProperty("groups", &groups);

    return app.exec();
}
