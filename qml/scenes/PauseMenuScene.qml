//PauseMenuScene
import QtQuick 2.0
import VPlay 2.0
import "../common"


//import "../components"
SceneBase {
    Image {
        id: windowBg
        anchors.centerIn: parent
        source: "../../assets/commonWindow/bj.png"
        width: parent.width
        height: width
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        Image {
            id: windowClose
            source: "../../assets/commonWindow/window-close.png"
            anchors.right: parent.right
            anchors.rightMargin: 3
            anchors.topMargin: 3
            anchors.top: parent.top
        }
        Image {
            id: continueButton
            width: parent.width / 3
            height: parent.height / 8
            anchors.horizontalCenterOffset: 1
            anchors.topMargin: windowBg.width / 11
            anchors.top: windowBg.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../assets/commonWindow/button.png"
            Text {
                id: continueText
                text: qsTr("Continue")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
        }
        Image {
            id: goHomeButton
            width: parent.width / 3
            height: parent.height / 8
            anchors.top: continueButton.bottom
            anchors.topMargin: 5
            source: "../../assets/commonWindow/button.png"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: goHomeText
                text: qsTr("Home")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
        }
        Image {
            id: exitButton
            width: parent.width / 3
            height: parent.height / 8
            anchors.top: goHomeButton.bottom
            anchors.topMargin: 5
            source: "../../assets/commonWindow/button.png"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: exitText
                text: qsTr("Exit")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
        }
    }
}
