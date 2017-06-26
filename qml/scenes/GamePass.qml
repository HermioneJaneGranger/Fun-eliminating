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
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 30
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
    Image {
        id: name
        source: "../../assets/gamepass/xx.png"
        width: parent.width / 5
        height: parent.height / 8
        anchors.left: parent.left
        anchors.leftMargin: 56
        anchors.top: parent.top
        anchors.topMargin: 100
    }
    Image {
        id: name1
        source: "../../assets/gamepass/xx.png"
        width: parent.width / 5
        height: parent.height / 8
        anchors.left: parent.left
        anchors.leftMargin: 125
        anchors.top: parent.top
        anchors.topMargin: 100
        //        visible: false
    }
    Image {
        id: name2
        source: "../../assets/gamepass/xx.png"
        width: parent.width / 5
        height: parent.height / 8
        anchors.left: parent.left
        anchors.leftMargin: 198
        anchors.top: parent.top
        anchors.topMargin: 100
        //        visible: false
    }
    Text {
        id: text
        text: "Score：" /*+ getscore（）*/
        font.pixelSize: 21
        anchors.left: parent.left
        anchors.leftMargin: 59
        anchors.top: parent.top
        anchors.topMargin: 166
    }
    Text {
        id: text1
        text: "Reward: "
        font.pixelSize: 21
        anchors.left: parent.left
        anchors.leftMargin: 59
        anchors.top: parent.top
        anchors.topMargin: 216

        Image {
            id: tili
            source: "../../assets/gamepass/tx.png"
            width: parent.width / 2.3
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 88
            Text {
                id: jiangli
                text: "1200"
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -17
            }
        }
        Image {
            id: jinbi
            source: "../../assets/gamepass/coin.png"
            width: parent.width / 2.3
            height: parent.height
            anchors.left: parent.left
            anchors.leftMargin: 150
            Text {
                id: jiangli2
                text: "1200"
                font.pixelSize: 13
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -17
            }
        }
    }
    Image {
        id: an1
        source: "../../assets/gamepass/an.png"
        anchors.left: parent.left
        anchors.leftMargin: 47
        anchors.top: parent.top
        anchors.topMargin: 280
        width: parent.width / 3.5
        height: parent.height / 8
        Text {
            id: xyg
            text: "Next"
            font.pixelSize: 25
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 14.5
        }
    }
    Image {
        id: an2
        source: "../../assets/gamepass/an.png"
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
    }
    //        function bool ifthreestars(scores)
    //        {
    //            if (scores != 0 &&2000 >scores > 1200 )
    //                name1.visible = true;
    //            if(scores >= 2000)
    //                name2.visible= true;

    //        }
}
