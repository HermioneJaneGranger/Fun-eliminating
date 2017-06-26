import VPlay 2.0
import QtQuick 2.0
import "./scenes"
import gameSceneMessage 1.0

GameWindow {
    id: gameWindow

    screenWidth: 640
    screenHeight: 960

    SelectLevelScene {
        id: selectLevelScene
        opacity: 1
        onLevelsClicked: {
            gameScene.mouseEnable = true
            selectLevelScene.opacity = 0
            gameScene.opacity = 1
            activeScene = gameScene
            achievementScene.opacity = 0
        }
        onAchivementSceneClicked: {
            achievementScene.opacity = 1
            gameScene.opacity = 0
            gameScene.mouseEnable = false
            selectLevelScene.opacity = 0
            pauseMenuScene.opacity = 0
        }
        onShopSceneClicked: {

        }
        onBagSceneClicked: {

        }
        onMoreSceneClicked: {

        }
    }
    PauseMenuScene {
        id: pauseMenuScene
        opacity: 0
        onExitClicked: openMessageBoxWithQuitQuestion()
        onGoHomeClicked: {
            opacity = 0
            gameScene.opacity = 0
            gameScene.mouseEnable = false
            selectLevelScene.opacity = 1
            achievementScene.opacity = 0
        }
        onContinueClicked: {
            opacity = 0
            gameScene.opacity = 1
            gameScene.mouseEnable = true
            selectLevelScene.opacity = 0
            achievementScene.opacity = 0
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
    //    SimpleButton {
    //           text: "Open V-Play Website"
    //           onClicked: nativeUtils.openUrl("https://v-play.net")
    //         }
    function openMessageBoxWithQuitQuestion() {
        nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2)
    }

    AchievementScene {
        id: achievementScene
        opacity: 0
    }
    GameScene {
        id: gameScene
        mouseEnable: true
        levelNumber: selectLevelScene.levelChoose
        onPauseClicked: {
            opacity = 0.1
            selectLevelScene.opacity = 0
            pauseMenuScene.opacity = 1
            pauseMenuScene.z = 1
            mouseEnable = false
            activeScene: pauseMenuScene
            achievementScene.opacity = 0
        }
    }
}
