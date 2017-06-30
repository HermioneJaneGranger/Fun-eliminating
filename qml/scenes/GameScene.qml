//GameScene
import QtQuick 2.0
import "../common"

SceneBase {
    id: gameScene

    property bool mouseEnable
    signal pauseClicked
    signal gamepass(int star)
    signal gamelose
    signal toolBlock
    signal toolLinex
    signal toolLineY
    signal toolType
    property int levelNumber
    property int remainingSteps: 20
    property bool pass: true

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
                onCommonButtonClicked: {
                    console.log(gameScene.width,gameScene.height + "   gameScene")
                    console.log(loader.width,loader.height + "   gameScene")
                }
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
                onCommonButtonClicked: {
                    console.log("clicked--------------" + pressX + "  " + pressY)
                    console.log("clicked--------------" + releaseX + "  " + releaseY)
                }
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

        Connections {
            target: selectLevelScene
            onLevelsClicked: {
                gameSceneMessage.refresh(levelNumber)
                remainingSteps = 20

                loader.sourceComponent = null
                loader.sourceComponent = com
                text_loader.sourceComponent = null
                text_loader.sourceComponent = compo
            }
        }

        Connections {
            target: gameLose
            onPlayAgain: {
                gameSceneMessage.refresh(levelNumber)
                remainingSteps = 20

                loader.sourceComponent = null
                loader.sourceComponent = com
                text_loader.sourceComponent = null
                text_loader.sourceComponent = compo
            }
        }

        Connections {
            target:gamePass
            onNextLevel: {
                gameSceneMessage.refresh(levelNumber + 1)
                remainingSteps = 20

                loader.sourceComponent = null
                loader.sourceComponent = com
                text_loader.sourceComponent = null
                text_loader.sourceComponent = compo
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
                    }
                    onRefreshGrid: {
                        initGame = false
                        text_loader.sourceComponent = null
                        text_loader.sourceComponent = compo
                    }
                }
                Text {
                    x:180
                    y:-50
                    text:qsTr("Step:") + "\n" + " " + remainingSteps
                    font.bold: true
                    color: "white"
                    font.pixelSize: 17
                }
            }

        }
        Component {
            id:compo
            Item {
                Text {
                    x:-15
                    y:390
                    property int score: gameSceneMessage.score
                    font.bold: true
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
                                        pass = false
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
                    Component.onCompleted: {
                        if(pass) {
                            var sco = gameSceneMessage.score
                            var star
                            if(sco > 0 && sco <= 80)
                                star = 1
                            else if(sco <= 200)
                                star = 2
                            else star = 3
                            console.log("star--------" + star + levelNumber)
                            gameSceneMessage.setPassScore(star,levelNumber)
                            gamepass(star)
                        }
                        else if (remainingSteps == 0) gamelose()
                        else pass = true
                    }
                }
            }
        }
    }
}
