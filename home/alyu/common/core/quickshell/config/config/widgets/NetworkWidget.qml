import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: network
    property int quality
    property string name
    property list<string> icons: [
        "󰤯",
        "󰤟",
        "󰤢",
        "󰤥",
        "󰤨"
    ]
    property string no_connection: "󰤭"

    text: {
        var output = network.no_connection
        if (name != "") {
            var icon_id = Math.floor((quality*icons.length)/100)
            output = icon_id >= icons.length ? icons[icons.length-1] : icons[icon_id]
            if (mouse.hovered) {
                output = output + "  " + name
            }
        }
        return output
    }

    Process {
        id: nmcliProc
        command: ["sh", "-c", "nmcli device wifi rescan | nmcli -t -f IN-USE,SSID,SIGNAL device wifi list | grep '^*'"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                data = data.split(":")
                name = data[1]
                quality = data[2]
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            nmcliProc.running = true
        }
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    }
}
