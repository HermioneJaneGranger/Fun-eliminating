import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"

    //    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 640
    screenHeight: 960

    //    PauseMenuScene{
    //        id: pauseMenuScene
    //        opacity: 0
    //        onExitClicked: openMessageBoxWithQuitQuestion()
    //        onGoHomeClicked: {
    //            opacity = 0
    //            gameScene.opacity = 0
    //            gameScene.mouseEnable = false
    //            selectLevelScene.opacity = 1
    //            achievementScene.opacity = 0
    //        }
    //        onContinueClicked: {
    //            opacity = 0
    //            gameScene.opacity = 1
    //            gameScene.mouseEnable = true
    //            selectLevelScene.opacity = 0
    //            achievementScene.opacity = 0
    //        }
    //    }
    //    Connections {
    //        target: nativeUtils
    //        onMessageBoxFinished: {
    //            console.debug("the user confirmed the Ok/Cancel dialog with:", accepted)
    //            if(accepted)
    //                Qt.quit()
    //        }
    //    }
    //    //    SimpleButton {
    //    //           text: "Open V-Play Website"
    //    //           onClicked: nativeUtils.openUrl("https://v-play.net")
    //    //         }
    //    function openMessageBoxWithQuitQuestion() {
    //        nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
    //    }
    SelectLevelScene {
        id: selectLevelScene
        opacity: 1
        //        onLevelsClicked: {
        //            gameScene.opacity = 1
        //            gameScene.mouseEnable = true
        //            selectLevelScene.opacity = 0
        //            activeScene = gameScene
        //            achievementScene.opacity = 0
        //        }
        //        onAchivementSceneClicked: {
        //            achievementScene.opacity = 1
        //            gameScene.opacity = 0
        //            selectLevelScene.opacity = 0
        //            pauseMenuScene.opacity = 0
        //        }
        //        onShopSceneClicked: {
        //        }
        //        onBagSceneClicked: {

        //        }
        //        onMoreSceneClicked: {
        //        }
    }
    //    AchievementScene{
    //        id: achievementScene
    //        //        AchievementView
    //        opacity: 0
    //    }

    //    GamePass {
    //        id: gamepass
    //        opacity:0
    //    }
    //    GameScene{
    //        id: gameScene
    //        opacity: 0
    //        mouseEnable: true
    //        onPauseClicked: {
    //            opacity = 0.1
    //            selectLevelScene.opacity = 0
    //            pauseMenuScene.opacity = 1
    //            pauseMenuScene.z = 1
    //            mouseEnable = false
    //            activeScene: pauseMenuScene
    //            achievementScene.opacity = 0
    //        }
    //    }
    //    Gamepass {
    //        id: gamepass
    //        opacity: 1
    //    }
    //    GameLose {
    //        id: gamelose
    //        opacity: 1
    //    }
    //    PauseMenuScene {
    //        id: pausemenuscene
    //        opacity: 1
    //    }
    //    Gamestart {
    //        id: gamestart
    //        opacity: 1
    //    }
    //    Settings {
    //        id: settings
    //        opacity: 1
    //    }
    //        GameStore {
    //            id: gamestore
    //            opacity: 1
    //        }
}
