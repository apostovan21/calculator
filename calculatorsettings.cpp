#include "calculatorsettings.h"

#include <iostream>

calculatorSettings::calculatorSettings()
{
    translator1 = new QTranslator(this);
    translator2 = new QTranslator(this);
}

QString calculatorSettings::getEmptyString() {
 return "";
}

void calculatorSettings::selectLanguage(QString language)
{
 if(language == QString("French"))
 {
    translator1->load(":/main_fr.qm");
    QCoreApplication::installTranslator(translator1);
 }

 if(language == QString("Romanian"))
 {
    translator2->load(":/main_ro.qm");
    QCoreApplication::installTranslator(translator2);
 }

 if(language == QString("English"))
 {
    QCoreApplication::removeTranslator(translator1);
    QCoreApplication::removeTranslator(translator2);
 }

 emit languageChanged();
}
