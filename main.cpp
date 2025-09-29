#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include "PlayerController.h"
#include "AudioSearchModel.h"
#include "contactmodel.h"
#include "historymodel.h"

#include <QLocale>
#include <QTranslator>
#include <QQmlContext>
#include <QtQml>
#include <QtVirtualKeyboard>
#include <QString>

using namespace Qt::StringLiterals;

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    ContactModel cModel;
    cModel.addContact(Contact("Ankul Maurya", "9854335387"));
    cModel.addContact(Contact("Gagan Sharma", "9031155555"));
    cModel.addContact(Contact("Gopal Kumar", "8899640403"));
    cModel.addContact(Contact("Jaydeep Gope", "9130768450"));
    cModel.addContact(Contact("Manoj Mishra", "7890997999"));
    cModel.addContact(Contact("Nirakar Sahu", "9504895873"));
    cModel.addContact(Contact("Shreya Hegde", "9852896789"));

    HistoryModel hModel;
    hModel.addHistory(History(Contact("Ankul Maurya", "9854335387"), "Fri 13:30"));
    hModel.addHistory(History(Contact("Jaydeep Gope", "9130768450"), "Thu 18:30"));
    hModel.addHistory(History(Contact("Shreya Hegde", "9852896789"), "Thu 06:04"));
    hModel.addHistory(History(Contact("Ankul Maurya", "9854335387"), "Tue 11:00"));
    hModel.addHistory(History(Contact("Nirakar Sahu", "9504895873"), "Mon 12:30"));


    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "infotainment-system_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    PlayerController *playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance("PlayerController", 1, 0, "PlayerController", playerController);

    AudioSearchModel *audioSearchModel = new AudioSearchModel(&app);
    qmlRegisterSingletonInstance("AudioSearchModel", 1, 0, "AudioSearchModel", audioSearchModel);

    const QUrl requesterUrl(QStringLiteral("qrc:/qt/qml/HMI/Components/Requester.qml"));
    qmlRegisterSingletonType(requesterUrl, "HMI", 1, 0, "Requester");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("contactModel", QVariant::fromValue(&cModel));
    engine.rootContext()->setContextProperty("historyModel", QVariant::fromValue(&hModel));
    engine.addImportPath("qrc:/qml");

    const QUrl url(QStringLiteral("qrc:/qt/qml/HMI/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}

