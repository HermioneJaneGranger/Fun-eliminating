import QtQuick 2.0
import "../common"

SceneBase {
    id: gamepasscene
    anchors.centerIn: parent.Center
    signal playAgain
    signal exitTheLevel
    Image {
        id: background
        anchors.horizontalCenterOffset: 0
        source: "../../assets/gamePass/bj.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 70
    }

    Text {
        id: lose
        text: "You  Lose"
        font.pixelSize: 35
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 103
    }
    Text {
        id: text
        text: "Score:  "
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 70
        anchors.top: parent.top
        anchors.topMargin: 165
    }
    Text {
        id: text1
        text: "Not complete"
        font.pixelSize: 25
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 215
    }
    Image {
        id: an1
        source: "../../assets/gamePass/an.png"
        anchors.left: parent.left
        anchors.leftMargin: 47
        anchors.top: parent.top
        anchors.topMargin: 280
        width: parent.width / 3.5
        height: parent.height / 8
        Text {
            id: xyg
            text: "Again"
            font.pixelSize: 25
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14.5
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                playAgain()
                console.log("play this level again")
            }
        }
    }
    Image {
        id: an2
        source: "../../assets/gamePass/an.png"
        anchors.left: parent.left
        anchors.leftMargin: 180
        anchors.top: parent.top
        anchors.topMargin: 280
        width: parent.width / 3.5
        height: parent.height / 8
        Text {
            id: bwl
            text: "Quit"
            font.pixelSize: 25
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14.5
        }
        MouseArea{
            onClicked:
            {
                exitTheLevel()
                console.log("level this level")
            }

        }
    }
}
