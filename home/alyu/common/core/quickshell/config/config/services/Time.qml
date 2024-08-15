pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property var date: new Date()
    property string time: date.getHours() + 
        ":" + date.getMinutes().toString().padStart(2, "0") + 
        " - " + date.getDate() + 
        "/" + (date.getMonth() + 1).toString().padStart(2, "0") + 
        "/" + date.getFullYear()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: date = new Date()
    }
}
