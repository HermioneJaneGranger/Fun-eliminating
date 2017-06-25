import VPlay 2.0
import QtQuick 2.0
import "scenes"
GameWindow {
    id: gameWindow

    //    activeScene: scene

    screenWidth: 640
    screenHeight: 960

    PauseMenuScene{
        id: pauseMenuScene
        opacity: 1
        onExitClicked: openMessageBoxWithQuitQuestion()
        onGoHomeClicked: {}
        onContinueClicked: {}
    }
    Connections {
        target: nativeUtils
        onMessageBoxFinished: {
            console.debug("the user confirmed the Ok/Cancel dialog with:", accepted)
            if(accepted)
                Qt.quit()
        }
    }
    //    //    SimpleButton {
    //    //           text: "Open V-Play Website"
    //    //           onClicked: nativeUtils.openUrl("https://v-play.net")
    //    //         }
    function openMessageBoxWithQuitQuestion() {
        nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
    }
}


