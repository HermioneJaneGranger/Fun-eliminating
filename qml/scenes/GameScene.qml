//GameScene
import QtQuick 2.0
import "../common"


SceneBase {
    id:gameScene
    property bool mouseEnable
    property int levelNumber
    signal pauseClicked
    anchors.centerIn: parent.Center
    Image {
        id: background
        source: "../../assets/gaming/background.png"
        anchors.fill: parent
        Image {
            id: pauseButton
            source: "../../assets/gaming/pause.png"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 3
            anchors.rightMargin: 3
            MouseArea{
                anchors.fill: parent
                onClicked: pauseClicked()
            }
        }
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


    Item {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        height: 384
        width:256
        Rectangle{
            anchors.fill: parent
            border.color: "black"
            border.width: 1
            color: "white"
            opacity: 0.5
        }
        Loader{id:loader}

        Connections{
            target: selectLevelScene
            onLevelsClicked:{
                loader.sourceComponent = null
                loader.sourceComponent = com
            }
        }

        Component {
            id: com
            LevelBase {
                mouseEnabled: mouseEnable
            }
        }

    }
}
