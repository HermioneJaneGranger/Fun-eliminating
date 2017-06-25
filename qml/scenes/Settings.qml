import QtQuick 2.0
import "../common"

SceneBase {
    id: settings
    anchors.centerIn: parent.Center
    Image {
        id: background
        anchors.horizontalCenterOffset: 0
        source: "../../assets/amazing/z.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
    }
    Text {
        id: settingtitle
        text: "Settings"
        color: "white"
        font.pixelSize: 16
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 40
    }
    Text {
        id: idname
        text: "Your   ID"
        color: "white"
        font.pixelSize: 31
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 208
    }
    Text {
        id: xxnumber
        text: "XX   number"
        color: "white"
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 266
    }
    Text {
        id: phonenumber
        text: "Phone  number"
        color: "white"
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 296
    }
    Image {
    }
    Image {
    }
    Text {
        id: gameversion
        text: "game version"
        color: "white"
        font.pixelSize: 20
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
    }
}
