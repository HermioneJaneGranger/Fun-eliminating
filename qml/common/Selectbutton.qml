import QtQuick 2.0

Item{
    id:functionButton
    property string imageSource
    width: 30
    height: width
    signal selectButtonClicked

    Image {
        id: name
        source: imageSource
        anchors.fill: parent
        MouseArea {
          anchors.fill: parent
          onClicked: selectButtonClicked()
        }
    }
}
