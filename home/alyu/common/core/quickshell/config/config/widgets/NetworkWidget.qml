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

    text: no_connection

    function setOutput() {
        if (name == "") {
            network.text = network.no_connection
        } else {
            var icon_id = Math.floor((quality*icons.length)/100)
            network.text = icon_id >= icons.length ? icons[icons.length-1] : icons[icon_id] + "  " + name
        }
    }

    Process {
        id: nmcliProc
        command: ["sh", "-c", "nmcli -t -f IN-USE,SSID,SIGNAL device wifi list | grep '^*'"]
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
            setOutput()
        }
    }
}
