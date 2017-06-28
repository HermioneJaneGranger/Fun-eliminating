//GameScene
import QtQuick 2.0
import "../common"


SceneBase {
    id:gameScene

    property bool mouseEnable
    signal pauseClicked
    property int levelNumber
    property int remainingSteps: 20

    anchors.centerIn: parent.Center

    Image {
        id: background
        source: "../../assets/gaming/background.png"
        anchors.fill: parent
        Image {
            opacity: 0.8
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
        Item {
            height: 40
            width: 48
            MenuButton {
                opacity: 0.5
                color: "white"
            }

            Image{
                id:tool_block
                source: "../../assets/tool/tool_block.png"

            }

        }
        Item {
            height: 40
            width: 48
            MenuButton {
                opacity: 0.5
                color: "white"
            }
            Image{
                id:tool_line_x
                source: "../../assets/tool/tool_line_x.png"

            }
        }
        Item {
            height: 40
            width: 48
            MenuButton {
                opacity: 0.5
                color: "white"
            }
            Image{
                id:tool_line_y
                source: "../../assets/tool/tool_line_y.png"

            }
        }
        Item {
            height: 40
            width: 48
            MenuButton {
                opacity: 0.5
                color: "white"
            }
            Image{
                id:tool_area
                source: "../../assets/tool/tool_area.png"

            }
        }
    }
    Row{
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 10
        Image{
            id:tool_step
            opacity: 0.8
            source: "../../assets/tool/tool_step.png"

        }
        Image{
            id:tool_condition
            opacity: 0.8
            source: "../../assets/tool/tool_condition.png"
        }
    }


    Item {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        height: 384
        width:256
        property bool initLoad: true
        Rectangle{
            anchors.fill: parent

            border.color: "black"
            border.width: 1
            color: "white"
            opacity: 0.5
        }
        Loader{
            id:loader
        }
        Loader{
            id:text_loader
        }
        Loader{
            id:remainStep_loader
        }
        Loader{

        }

        Connections{
            target: selectLevelScene
            onLevelsClicked:{
//                initLoad: true
                gameSceneMessage.refresh(5)
                loader.sourceComponent = null
                loader.sourceComponent = com
                text_loader.sourceComponent = null;
                text_loader.sourceComponent = text;
                remainStep_loader.sourceComponent = null
                remainStep_loader.sourceComponent = remainingStep
            }
        }

        Component {
            id: com
            LevelBase{
                initGame: true
                id:games
                mouseEnabled: mouseEnable
                width: 32*8
                height: 32*12
                onReduceStep: {
                    remainingSteps--
                }

                onRefreshGrid: {
                    initGame = false
                    loader.sourceComponent = null
                    loader.sourceComponent = com
                    text_loader.sourceComponent = null;
                    text_loader.sourceComponent = text;
                    remainStep_loader.sourceComponent = null
                    remainStep_loader.sourceComponent = remainingStep
                }
            }

        }
        Component{
            id:text
            Text {
                x:-15
                y:390
                property int score: gameSceneMessage.score

                text: "score: " + score
                color: "white"
                font.pixelSize: 17
            }
        }
        Component{
            id:remainingStep
            Text {
                x:180
                y:-50
                text:qsTr("Step:") + "\n" + " " + remainingSteps
                color: "white"
                font.pixelSize: 17
            }
        }
//        Component{

//        }
    }

}
