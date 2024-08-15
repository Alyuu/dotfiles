import QtQuick
import Quickshell.Services.Pipewire

Text {
    required property PwNode node
    property list<string> icons: [
        "",
        "",
        ""
    ]

    PwObjectTracker {
        objects: [node]
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }

    TapHandler {
        id: tapHandler
        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: node.audio.muted = !node.audio.muted
    }

    text: {
        var icon_id = Math.floor(node.audio.volume*icons.length)
        var output = icon_id >= icons.length ? icons[icons.length-1] : icons[icon_id]
        if (mouse.hovered) {
            output = output + " " + (node.audio.volume*100) + "%"
        }
        if (node.audio.muted) {
            output = ""
        }
        return output
    }
}
