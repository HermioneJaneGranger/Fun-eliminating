import QtQuick 2.0
import "../common"

SceneBase {
    id: settings
    anchors.centerIn: parent.Center
    Image {
        id: background
        anchors.horizontalCenterOffset: 0
        source: "../../assets/amazing/h.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 20
    }
    Text {
        id: settingtitle
        text: "Store"
        color: "white"
        font.pixelSize: 32
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
    }
    Image {
        id: name
        source: "../../assets/amazing/tx.png"
        width: parent.width / 6
        height: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: 56
        anchors.top: parent.top
        anchors.topMargin: 121

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: name.clicked()
            onPressed: name.opacity = 0.5
            onReleased: name.opacity = 1
        }
    }
    Image {
        id: name1
        source: "../../assets/amazing/coin.png"
        width: parent.width / 6
        height: parent.height / 9
        anchors.left: parent.left
        anchors.leftMargin: 139
        anchors.top: parent.top
        anchors.topMargin: 121
        //        visible: false
    }
    Image {
        id: name2
        source: "../../assets/amazing/zs.png"
        width: parent.width / 6
        height: parent.height / 9
        anchors.left: parent.left
        anchors.leftMargin: 214
        anchors.top: parent.top
        anchors.topMargin: 121
        //        visible: false
    }

    Image {
        id: name3
        source: "../../assets/amazing/tx1.png"
        width: parent.width / 5
        height: parent.height / 8
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.top: parent.top
        anchors.topMargin: 190
    }
    Image {
        id: name4
        source: "../../assets/amazing/tx2.png"
        width: parent.width / 5
        height: parent.height / 8
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.top: parent.top
        anchors.topMargin: 275
        //        visible: false
    }
    Text {
        id: coinnumber
        text: "Coinnumber"
        color: "white"
        font.pixelSize: 14
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: 60
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
    }
    Text {
        id: zuanshinumber
        text: "Zuanshinumber"
        color: "white"
        font.pixelSize: 14
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: 160
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
    }
}
