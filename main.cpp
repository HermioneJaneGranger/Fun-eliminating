#include <QGuiApplication>
#include <VPApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <iostream>

#include "gamescene.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<Block>("gameSceneMessage",1,0,"GameSceneBlock");
    qmlRegisterType<GameScene>("gameSceneMessage",1,0,"GameSceneMessage");
    VPApplication vplay;


//    app.setOrganizationDomain("net.vplay.demos.FunEliminating")
//        app.setApplicationVersion("1.1");


    // QQmlApplicationEngine is the preferred way to start qml projects since Qt 5.2
    // if you have older projects using Qt App wizards from previous QtCreator versions than 3.1, please change them to QQmlApplicationEngine
    QQmlApplicationEngine engine;

    GameScene gameScene(5);
    gameScene.control(0,0);
//    std::cout << gameScene.blocks(0)->type() << std::endl;
//    std::cout << gameScene.blocks(1)->type() << std::endl;
//    gameScene.swap(0,0,0,1);
//    std::cout << gameScene.blocks(0)->type() << std::endl;
//    std::cout << gameScene.blocks(1)->type() << std::endl;

//    engine.rootContext()->setContextProperty("gameSceneMessage",&gameScene);
//    vplay.initialize(&engine);

//    // use this during development
//    // for PUBLISHING, use the entry point below
//    vplay.setMainQmlFileName(QStringLiteral("qml/Main.qml"));

//    // use this instead of the above call to avoid deployment of the qml files and compile them into the binary with qt's resource system qrc
//    // this is the preferred deployment option for publishing games to the app stores, because then your qml files and js files are protected
//    // to avoid deployment of your qml files and images, also comment the DEPLOYMENTFOLDERS command in the .pro file
//    // also see the .pro file for more details
//    //  vplay.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));



//    engine.load(QUrl(vplay.mainQmlFileName()));

//    return app.exec();
}
