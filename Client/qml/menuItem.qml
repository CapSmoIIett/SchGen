import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.2
import QtQuick.Controls.Material
import QtQuick.Controls.Universal
import QtCharts
import Qt.labs.qmlmodels
import QtQuick.Dialogs

Rectangle {
    id: menuItem
    Layout.topMargin: 15
    Layout.leftMargin: 15

    impplicitHeight: textLabel.implicitHeight
    width: 150

    Label {
        id: textLabel
        text: "Group"
    }
}
