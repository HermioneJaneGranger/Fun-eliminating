import QtQuick 2.0
import "../common"

SceneBase {
    id: gamepasscene
    anchors.centerIn: parent.Center
    Image {
        id: background
        anchors.horizontalCenterOffset: 0
        source: "../../assets/gamepass/bj.png"
        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.leftMargin: 30
//        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 70
    }

    //        Row{
    //            id:stars
    //            spacing: 10
    //            anchors.right: parent
    //            anchors.rightMargin: 40
    //            anchors.top: parent.top
    //            anchors.topMargin: 80
    Text {
        id: lose
        text: "Mission XXX"
        font.pixelSize: 35
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 103
    }
    Text {
        id: text
        text: "Target"
        font.pixelSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 165
    }

    Text {
    }

    Image {
        id: an1
        source: "../../assets/gamepass/an.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 280
        width: parent.width / 3.5
        height: parent.height / 8
        Text {
            id: xyg
            text: "Start"
            font.pixelSize: 25
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14.5
        }
    }

    //        function bool ifthreestars(scores)
    //        {
    //            if (scores != 0 &&2000 >scores > 1200 )
    //                name1.visible = true;
    //            if(scores >= 2000)
    //                name2.visible= true;

    //        }
}
