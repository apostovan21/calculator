#ifndef CALCULATORSETTINGS_H
#define CALCULATORSETTINGS_H

#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QObject>
#include <QString>
#include <QTranslator>
#include <iostream>


class calculatorSettings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    calculatorSettings();

    QString getEmptyString();
    Q_INVOKABLE void selectLanguage(QString language);

signals:
 void languageChanged();

private:
 QTranslator* translator1;
 QTranslator* translator2;
};

#endif // CALCULATORSETTINGS_H
