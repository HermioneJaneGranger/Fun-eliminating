//GameScene
import QtQuick 2.0
import "../common"
import gameSceneMessage 1.0

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
//        GameSceneMessage{
//            id:message
//            init: 5
//            property int number: 0
//        }
//        GameSceneMessage{
//            id:message
//        }

        Grid
        {
            id:grid
            anchors.fill: parent
            columns: 8
            property int number: 0
            Repeater {
                id: square
                model: 96
                Image {
                    source: {
                        if(gameSceneMessage.block.type) {
                            grid.number++;
                            return "../../assets/1.png"
                        }
                        else if(gameSceneMessage.block[grid.number].type() === 1) {
                            grid.number++;
                            return "../../assets/2.png"
                        }
                        else if(gameSceneMessage.block[grid.number].type() === 2) {
                            grid.number++;
                            return "../../assets/3.png"
                        }
                        else if(gameSceneMessage.block[grid.number].type() === 3) {
                            grid.number++;
                            return "../../assets/4.png"
                        }
                        else if(gameSceneMessage.scene.block[grid.number].type() === 4) {
                            grid.number++;
                            return "../../assets/5.png"
                        }
                    }
                }
            }
        }
    }
}
