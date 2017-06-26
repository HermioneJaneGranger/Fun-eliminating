//SelectLevelScene
import QtQuick 2.0
import "../common"

SceneBase {
    id: selectLevelScene
    anchors.centerIn: parent.Center

    signal levelsClicked
    property int levelChoose: 1
    signal achivementSceneClicked
    signal shopSceneClicked
    signal moreSceneClicked
    signal bagSceneClicked

    Image {
        id: selectLevelSceneImage1
        source: "../../assets/selectLevel/scene1.png"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -1057
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        MouseArea {
            id: dragArea
            anchors.rightMargin: 0
            anchors.bottomMargin: 235
            anchors.leftMargin: 0
            anchors.topMargin: -235
            anchors.fill: parent
            drag.target: parent
            drag.maximumY: -50
            drag.minimumY: -1050

            Image {
                id: levels0
                x: 168
                y: 1677
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 1
                        levelsClicked()
                    }
                }
            }
            Image {
                id: levels1
                source: "../../assets/selectLevel/level.png"
                x: 79
                y: 1553
                width: 58
                height: 47
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 2
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels2
                x: 199
                y: 1457
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 3
                        levelsClicked()
                    }
                }
            }
            Image {
                id: levels3
                x: 107
                y: 1273
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 4
                        levelsClicked()
                    }
                }
            }
            Image {
                id: levels4
                x: 223
                y: 1148
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 5
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels5
                x: 149
                y: 786
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 6
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels6
                x: 118
                y: 636
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 7
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels7
                x: 60
                y: 388
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 8
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels8
                x: 79
                y: 986
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 9
                        levelsClicked()
                    }
                }
            }

            Image {
                id: levels9
                x: 134
                y: 506
                width: 58
                height: 47
                source: "../../assets/selectLevel/level.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        levelChoose = 10
                        levelsClicked()
                    }
                }
            }
            Repeater {
            }
        }
    }
    Row {
        x: 435
        y: 484
        anchors.rightMargin: 15
        anchors.bottomMargin: 0
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: 10
        Selectbutton {
            imageSource: "../../assets/selectLevel/jiangbei.png"
            onSelectButtonClicked: achivementSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/selectLevel/shop.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            //imageSource: "../../assets/selectLevel/bag.png"
            onSelectButtonClicked: bagSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/selectLevel/more.png"
            onSelectButtonClicked: moreSceneClicked()
        }
    }
    Column {
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 30
        x: 0
        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
        Rectangle {
            x: -2
            opacity: 0.9
            color: "white"
            width: 36
            height: 30
            radius: 25
        }
    }

    Column {
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 30
        x: 0
        Selectbutton {
            imageSource: "../../assets/amazing/tx.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/amazing/coin.png"
            onSelectButtonClicked: shopSceneClicked()
        }
        Selectbutton {
            imageSource: "../../assets/amazing/zs.png"
            onSelectButtonClicked: shopSceneClicked()
        }
    }
}
