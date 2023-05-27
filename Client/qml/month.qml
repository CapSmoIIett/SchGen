import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

    Rectangle {
        anchors.fill: parent
        anchors.margins: 15

        //color: "red"


        HorizontalHeaderView {
            id: horizontalHeader
            syncView: table
            anchors.left: table.left

            delegate: Rectangle {

                height: 40
                border.width: 1

                Label {
                 anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    text: model.display//modelData//model.headerData()
                }
            }
        }

        TableView {
            id: table
            anchors.fill: parent
            columnSpacing: 1
            rowSpacing: 1
            //clip: true

            anchors.topMargin: horizontalHeader.height


            columnWidthProvider: function (column) {
                return table.width / 7
            }
            rowHeightProvider: function (column) {
                return table.width / model.columnCount()
            }

            onWidthChanged: table.forceLayout()

            model: month

            delegate: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                border.width: 1

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 2
                    border.width: display ? 1 : 0
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        console.log(column);
                        console.log(row);
                    }
                }
            }
        }
    }
