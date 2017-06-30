import VPlay 2.0
import QtQuick 2.0
import "./scenes"
import gameSceneMessage 1.0

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

    property int currentLevel

    SelectLevelScene{
        id: selectLevelScene
        opacity: 1
        onExitClicked: openMessageBoxWithQuitQuestion()
        passNumber: gameSceneMessage.passNumber()

        onLevelsClicked: {
//            currentLevel = selectLevelScene.levelChoose
            gameScene.opacity = 1
            gameScene.mouseEnable = true
            activeScene = gameScene
            gamePass.opacity = 0
            gameLose.opacity = 0
            pauseMenuScene.opacity = 0
            opacity =0
        }
//        onAchivementSceneClicked: {
//        }
//        onShopSceneClicked: {
//        }
//        onBagSceneClicked: {
//        }
//        onMoreSceneClicked: {
//        }

    }

    PauseMenuScene {
        id: pauseMenuScene
        opacity: 0
        onExitClicked: {
            openMessageBoxWithQuitQuestion()
        }
        onGoHomeClicked: {
            opacity = 0
            gameScene.opacity = 0
            gameScene.mouseEnable = false
            selectLevelScene.opacity = 1
            activeScene:selectLevelScene
            gamePass.opacity=0
            gameLose.opacity=0
            selectLevelScene.levelChoose = 1
            passNumber: gameSceneMessage.passNumber()
        }
        onContinueClicked: {
            opacity = 0
            gameScene.opacity = 1
            gameScene.mouseEnable = true
            selectLevelScene.opacity = 0
            activeScene:gameScene
            gamePass.opacity=0
            gameLose.opacity=0
        }
    }

    Connections {
        target: nativeUtils
        onMessageBoxFinished: {
            console.debug("the user confirmed the Ok/Cancel dialog with:",
                          accepted)
            if (accepted)
                Qt.quit()
        }
    }

    function openMessageBoxWithQuitQuestion() {
        gameSceneMessage.readScoreIn()
        nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2)
    }

    GameScene {
        id: gameScene
        mouseEnable: true
        opacity: 0
        levelNumber: selectLevelScene.levelChoose
        onPauseClicked: {
            opacity = 0.1
            pauseMenuScene.opacity = 1
            mouseEnable = false
            activeScene: pauseMenuScene
            selectLevelScene.opacity = 0
            gameLose.opacity=0
            gamePass.opacity=0
        }
        onGamepass: {
            var score = gameSceneMessage.score
            gamePass.star = star
            gamePass.gameScore = score
            gamePass.opacity = 1
            activeScene:gamePass
            mouseEnable = false
            gameScene.mouseEnable = false
            gameScene.opacity = 0.1
            gameLose.opacity=0
            pauseMenuScene.opacity=0
            selectLevelScene.opacity=0
            selectLevelScene.levelChoose = 1
            selectLevelScene.passNumber = gameSceneMessage.passNumber()
        }
        onGamelose: {
            gameLose.opacity = 1
            activeScene:gameLose
            gameScene.mouseEnable = false
            gameScene.opacity = 0.1
            mouseEnable = false
            pauseMenuScene.opacity=0
            selectLevelScene.opacity=0
            gamePass.opacity=0
        }
    }

//    Connections{
//        target:
//    }

    GamePass {
        id:gamePass
        onNextLevel: {
            opacity = 0
            activeScene=gameScene
            gameScene.mouseEnable=true
            gameScene.opacity=1
        }
        onExitTheLevel: {
            selectLevelScene.opacity=1
            activeScene=selectLevelScene
            gameLose.opacity=0
            opacity=0
            gameScene.opacity=0
            pauseMenuScene.opacity=0
        }
    }
    GameLose {
        id:gameLose
        onPlayAgain: {
            opacity = 0
            activeScene=gameScene
            gameScene.mouseEnable=true
            gameScene.opacity=1
        }
        onExitTheLevel: {
            selectLevelScene.opacity=1
            activeScene=selectLevelScene
            gamePass.opacity=0
            opacity=0
            gameScene.opacity=0
            pauseMenuScene.opacity=0
        }
    }

}


