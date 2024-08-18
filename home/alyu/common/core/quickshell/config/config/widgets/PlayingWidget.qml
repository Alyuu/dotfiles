import QtQuick
import Quickshell.Services.Mpris

Text {
    property int tStart: 0
    property int nChar: 15

    text: {
        return "  " + Mpris.players.values[0].trackTitle.substr(tStart, nChar) + "..."
    }

    Timer {
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            if (mouse.hovered) {
                if (tStart + nChar < Mpris.players.values[0].trackTitle.length) {
                    tStart++;
                }
            } else {
                tStart = 0;
            }
        }
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }
}
