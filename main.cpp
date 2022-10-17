#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QQmlContext>
#include "calculatorlogic.h"
#include "calculatorsettings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QTranslator translator;
    translator.load(":/main_en.qm"); // what to put here?
    app.installTranslator(&translator);

    qmlRegisterType<CalculatorLogic>( "CalculatorLogic", 1, 0, "CalculatorLogic" );
    qmlRegisterType<calculatorSettings>( "CalculatorSettings", 1, 0, "CalculatorSettings" );

    //calculatorSettings settings;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //engine.rootContext()->setContextProperty("settings",(QObject*)&settings);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

//#include "main.moc"
