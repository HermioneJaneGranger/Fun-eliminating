//GameScene
import QtQuick 2.0
import "../common"

SceneBase {
    id:gameScene
    anchors.centerIn: parent.Center
    Image {
        id: background
        source: "../../assets/background.png"
        anchors.fill: parent.fill
    }
    Row {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        MenuButton {
//            Image {
//                anchors.centerIn: parent.Center
//                id: name
//                source:  "../../assets/1.png"
//            }
        }
        MenuButton {

        }
        MenuButton {

        }
        MenuButton {

        }
        MenuButton {

        }
    }
    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "black"
        border.width: 1
        color: "white"
        height: 384
        width:256
//        Grid
//        {
//            anchors.fill: parent
//            columns: 8
//            Repeater {
//                id: square

//                model: 96
//                Block {
////                    row: parent.count % 8
////                    column: parent.count /8
////                    type: Math.floor(Math.random() * 5)
////                    onClicked: console.log(parent.x,parent.y,type)
//                }
//            }
//        }
    }
}
