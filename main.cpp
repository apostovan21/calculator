#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "calculatorlogic.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

     qmlRegisterType<CalculatorLogic>( "CalculatorLogic", 1, 0, "CalculatorLogic" );

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
