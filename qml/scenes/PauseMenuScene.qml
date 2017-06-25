//PauseMenuScene
import QtQuick 2.0
import VPlay 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import "../common"

SceneBase{
    property bool playerNotMUted: true
    property real volumn
    signal continueClicked
    signal goHomeClicked
    signal exitClicked

    Image {
        id: windowBg
        anchors.centerIn: parent
        source: "../../assets/commonWindow/bj.png"
        width: parent.width/4*3
        height: width
        Image {
            id: windowClose
            fillMode: Image.Stretch
            source: "../../assets/commonWindow/window-close.png"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.topMargin: 10
            anchors.top: parent.top
            MouseArea{
                anchors.fill: parent
                id: windowCloseMouseArea
                onClicked: continueClicked()
            }
        }
        Image{
            id: continueButton
            width: parent.width/3
            height: parent.height/8
            anchors.horizontalCenterOffset: 1
            anchors.topMargin: windowBg.width/11
            anchors.top: windowBg.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../assets/commonWindow/button.png"
            Text {
                id: continueText
                text: qsTr("Continue")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: continueClicked()
            }
        }
        Image{
            id: goHomeButton
            width: parent.width/3
            height: parent.height/8
            anchors.top: continueButton.bottom
            anchors.topMargin: 5
            source: "../../assets/commonWindow/button.png"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: goHomeText
                text: qsTr("Home")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: goHomeClicked()
            }
        }
        Image{
            id: exitButton
            width: parent.width/3
            height: parent.height/8
            anchors.top: goHomeButton.bottom
            anchors.topMargin: 5
            source: "../../assets/commonWindow/button.png"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: exitText
                text: qsTr("Exit")
                font.family: "Kim's GirlType"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: exitClicked()
            }
        }
        RowLayout{
            id:rowLayout
            anchors.top: exitButton.bottom
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: parent.width/6
            spacing: parent.width/12
            Image {
                id: bgvolumnButton
                source: !playerNotMUted ? "../../assets/pauseMenu/audio-volume-muted.png" : "../../assets/pauseMenu/audio-volume-medium.png"
                MouseArea{
                    id: volumnMouseArea
                    anchors.fill: parent
                    onClicked:
                    {
                        playerNotMUted = !playerNotMUted
                        parent.source= !playerNotMUted ? "../../assets/pauseMenu/audio-volume-muted.png" : "../../assets/pauseMenu/audio-volume-medium.png"
                        if(playerNotMUted)
                            volumnSlider.value = volumn
                        else
                            volumnSlider.value = 0.0
                    }
                }
            }
            Slider {
                id: volumnSlider
                from:0
                to: 1
                stepSize: 0.01
                value: 0.15
                focus: true
                implicitWidth: windowBg.width/2
                onValueChanged:
                {
                    if(value!=0.0)
                    {
                        bgvolumnButton.source="../../assets/pauseMenu/audio-volume-medium.png"
                        volumn = value
                        playerNotMUted = true
                    }
                    else
                    {
                        bgvolumnButton.source="../../assets/pauseMenu/audio-volume-muted.png"
                        playerNotMUted = false
                    }
                }
            }
        }
        Image{
            id: goHomeIcon
            width: parent.width/5
            height: width
            anchors.top: rowLayout.bottom
            anchors.topMargin: 5
            source: "../../assets/pauseMenu/go-home.png"
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea{
                anchors.fill: parent
                onClicked: goHomeClicked()
            }
        }
    }
}
