import QtQuick 2.0

Image {
    id: imag
    property int type

    source: {
        if (type === 1) {
            return "../../assets/selectLevel/dj1.png"
        } else if (type === 2) {
            return "../../assets/selectLevel/dj2.png"
        } else if (type === 3) {
            return "../../assets/selectLevel/dj3.png"
        }
    }
}
