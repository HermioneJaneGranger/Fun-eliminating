import QtQuick 2.0
import "../common"

SceneBase {
    id: gamepasscene
    anchors.centerIn: parent.Center

    Image {
        id: background
        source: "../../assets/gamepass/bj.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
