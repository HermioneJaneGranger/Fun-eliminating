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
        Grid
        {
            id:grid
            anchors.fill: parent
            rows: 12
            Repeater {
                id: square
                model:96
                Image {
                    id:image
                    property GameSceneBlock block: gameSceneMessage.blocks(index)

                    property int type: image.block.type
                    source: {
                        if(type === 0) {
                            return "../../assets/1.png"
                        }
                        else if(type === 1) {
                            return "../../assets/2.png"
                        }
                        else if(type === 2) {
                            return "../../assets/3.png"
                        }
                        else if(type === 3) {
                            return "../../assets/4.png"
                        }
                        else if(type === 4) {
                            return "../../assets/5.png"
                        }

                    }
                }
            }
        }
    }
}
