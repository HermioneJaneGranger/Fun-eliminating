//GameScene
import QtQuick 2.0
import "../common"

SceneBase {
    id: gameScene

    property bool mouseEnable
    signal pauseClicked
    signal gamePass
    signal gameLose
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
            MouseArea {
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

            Image {
                id: tool_block
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
            Image {
                id: tool_line_x
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
            Image {
                id: tool_line_y
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
            Image {
                id: tool_area
                source: "../../assets/tool/tool_area.png"
            }
        }
    }
    Row {
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 10
        Image {
            id: tool_step
            opacity: 0.8
            source: "../../assets/tool/tool_step.png"
        }
        Image {
            id: tool_condition
            opacity: 0.8
            source: "../../assets/tool/tool_condition.png"
        }
    }

    Item {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        height: 384
        width: 256
        property bool initLoad: true
        Rectangle {
            anchors.fill: parent

            border.color: "black"
            border.width: 1
            color: "white"
            opacity: 0.5
        }
        Loader {
            id: loader
        }
        Loader{
            id:text_loader
        }
        Loader{
            id:remainStep_loader
        }
        Loader{

        }

        Connections {
            target: selectLevelScene
            onLevelsClicked: {
                gameSceneMessage.refresh(levelNumber)
                loader.sourceComponent = null
                loader.sourceComponent = com
            }
        }

        Component {
            id: com
            Item{
                LevelBase {
                    initGame: true
                    id: games
                    mouseEnabled: mouseEnable
                    width: 32*8
                    height: 32*12
                    onReduceStep: {
                        remainingSteps--
                        if(remainingSteps == 0 && row.pass == false) gameLose()
                    }
                    onRefreshGrid: {
                        initGame = false
                        loader.sourceComponent = null
                        loader.sourceComponent = com
                    }
                }
                Text {
                    x:180
                    y:-50
                    text:qsTr("Step:") + "\n" + " " + remainingSteps
                    color: "white"
                    font.pixelSize: 17
                }
                Text {
                    x:-15
                    y:390
                    property int score: gameSceneMessage.score

                    text: "score: " + score
                    color: "white"
                    font.pixelSize: 17
                }
//                Item {
//                    x: -20
//                    y:-40
//                    id:tar
                Row {
                    id:row
                    property bool pass: true
                    spacing: 20
                    x: 0
                    y:-45
                    Repeater {
                        model: 3
                        Item {
                            width: 32
                            height:  32
                            Image {
                                property int type: gameSceneMessage.target(index)
                                source: {
                                    if (type === 0) {
                                        return "../../assets/gaming/1.png"
                                    } else if (type === 1) {
                                        return "../../assets/gaming/2.png"
                                    } else if (type === 2) {
                                        return "../../assets/gaming/3.png"
                                    } else if (type === 3) {
                                        return "../../assets/gaming/4.png"
                                    } else if (type === 4) {
                                        return "../../assets/gaming/5.png"
                                    } else
                                        return ""
                                }
                            }
                            Text {
                                property int number: gameSceneMessage.number(index)
                                x: 15
                                y: 15
                                text: {
                                    if (number > 0) {
                                        row.pass = false
                                        return number
                                    }
                                    else {
                                        return 0;
                                    }
                                }
                                font.bold: true
                                color: "white"
                                font.pixelSize: 17
                            }
                        }
                    }
//                    Component.onCompleted: {
//                        if(pass) {
////                            gameSceneMessage.setScore(40 *  )
//                            gamePass()
//                        }
//                    }
                }
            }

        }
    }
}
