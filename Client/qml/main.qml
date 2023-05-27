import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls 2.2
import QtQuick.Controls.Material
import QtQuick.Controls.Universal
import QtCharts
import Qt.labs.qmlmodels
import QtQuick.Dialogs

ApplicationWindow {
    visible: true
    title: qsTr("SchGen")

    minimumHeight: 600
    minimumWidth: 800

    height: 600
    width: 800

    ///////////////////////////////////////////////////////////////
    menuBar: MenuBar {
        //height:20
        Menu {
            title: '&File'
            Action {
                text: '&Sign...'
            }
            Action {
                text: '&New...'
            }
            Action {
                text: '&Open...'
            }
            Action {
                text: '&Save'
            }
            Action {
                text: 'Save &As...'
            }
            MenuSeparator {
            }
            Action {
                text: '&Quit'
            }
        }
        Menu {
            title: '&Edit'
            Action {
                text: 'Cu&t'
            }
            Action {
                text: '&Copy'
            }
            Action {
                text: '&Paste'
            }
        }
        Menu {
            title: '&Help'
            Action {
                text: '&About'
            }
        }
    }

    ///////////////////////////////////////////////////////////////
    header: ToolBar {

        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }

        RowLayout {
            anchors.fill: parent

            Image {
                id: name
                //source: "qrc:/images/time-96.png"
            }

            ToolButton {
                text: qsTr("Today")
            }

            ToolButton {
                icon.source: "qrc:/images/back-48.png"
            }

            ToolButton {
                icon.source: "qrc:/images/forward-48.png"
            }

            Label {
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                text: qsTr("May 2023")
            }

            Label {
                Layout.fillWidth: true
            }

            ToolButton {
                icon.source: "qrc:/images/help-64.png"
            }

            ToolButton {
                icon.source: "qrc:/images/settings-64.png"
            }

            ToolButton {
                text: qsTr("week")

                onClicked: menu.open()
                Menu {
                    id: menu
                    y: parent.height
                    MenuItem {
                        text: 'day'
                    }
                    MenuItem {
                        text: 'week'
                    }
                    MenuItem {
                        text: 'month'
                    }
                }
            }

            Label {
                width: 15
            }
        }
    }

    ///////////////////////////////////////////////////////////////
    Rectangle {
        border.width: 1
        anchors.fill: parent
        anchors.leftMargin: -1
        anchors.rightMargin: -1
        anchors.bottomMargin: -1

        Row {

            anchors.fill: parent

            Rectangle {
                id: lists
                border.width: 1
                width: 200
                height: parent.height

                ColumnLayout {

                    anchors.left: parent.left
                    anchors.right: parent.right

                    spacing: 5

                    Rectangle {
                        id: createButton
                        radius: 30
                        border.width: 1

                        Layout.margins: 15

                        height: 40
                        width: 150

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent

                            hoverEnabled: true

                            //anchors.width: parent.width
                            /*Image {
                                id: plus
                                anchors.top: createButton.top
                                anchors.left: createButton.left
                                anchors.right: createLabel.right
                                anchors.bottom: createButton.bottom

                                source: "qrc:/images/plus-24.png"
                            }

                            Label {
                                width: 15
                            }*/
                            Label {
                                id: createLabel

                                anchors.fill: parent

                                text: qsTr("Create")
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 5

                        Rectangle {
                            Layout.topMargin: 15
                            Layout.leftMargin: 15

                            height: 20
                            width: 150
                            Label {
                                text: "Group"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "950504"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "950503"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "950502"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "950501"
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 5

                        Rectangle {
                            Layout.topMargin: 15
                            Layout.leftMargin: 15

                            height: 20
                            width: 150
                            Label {
                                text: "Teachers"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Teacher"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Teacher1"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Teacher2"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Teacher3"
                            }
                        }
                    }

                    ColumnLayout {
                        spacing: 5

                        Rectangle {
                            Layout.topMargin: 15
                            Layout.leftMargin: 15

                            height: 20
                            width: 150
                            Label {
                                text: "Classrooms"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Classroom"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Classroom1"
                            }
                        }
                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Classroom2"
                            }
                        }

                        Rectangle {
                            Layout.leftMargin: 25

                            height: 20
                            width: 150
                            Label {
                                text: "Classroom3"
                            }
                        }
                    }
                }
            }

            Loader {
                id: loader
                anchors.fill: parent
                anchors.leftMargin: lists.width
                anchors.topMargin: 1

                source: "qrc:/qml/week.qml"
                function loadFragment(page_source) {
                    loader.source = page_source;
                }
            }
        }
    }
}
