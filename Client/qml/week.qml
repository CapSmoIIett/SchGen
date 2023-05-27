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
            anchors.top: navigationButtons.bottom

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

        VerticalHeaderView {
            id: verticalHeader
            syncView: table
            anchors.left: parent.left
            anchors.top: table.top

            delegate: Rectangle {
                width: 550
                border.width: 1

                Text {
                     anchors.centerIn: parent
                    elide: Text.ElideRight
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

            anchors.leftMargin: verticalHeader.width
            anchors.topMargin: horizontalHeader.height


            columnWidthProvider: function (column) {
                return table.width / 7//table.model.columnCount();
            }

            onWidthChanged: table.forceLayout()

            model: week

            delegate: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                border.width: 1

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 2
                    color: display ? Material.color(Material.Purple) : "#FFFFFF"
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
