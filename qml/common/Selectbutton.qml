import QtQuick 2.0

Item{
    id:functionButton
    property string imageSource
    width: 30
    height: width
//    property alias text: buttonText.text
    signal selectButtonClicked

    Image {
        id: name
        source: imageSource
        anchors.fill: parent
        MouseArea {
          anchors.fill: parent
//          hoverEnabled: true
          onClicked: selectButtonClicked()
//          onPressed: button.opacity = 0.5
//          onReleased: button.opacity = 1
        }
    }
}
