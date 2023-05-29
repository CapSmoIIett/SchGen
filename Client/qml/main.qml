import QtQuick
import QtQuick.Window 2.2
import QtQuick.Layouts
import QtQuick.Controls 2.2
import QtQuick.Controls.Material
import QtQuick.Controls.Universal
import QtCharts
import Qt.labs.qmlmodels
import QtQuick.Dialogs

ApplicationWindow {
    visible: true

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

                onClicked: {
                    app.datePrev();
                }
            }

            ToolButton {
                icon.source: "qrc:/images/forward-48.png"

                onClicked: {
                    app.dateNext();
                }
            }

            Label {
                id: dateLabel
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                text: app.year + " " + app.getMonthByName(app.month)
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
                id: calendarSelector
                text: qsTr("week")

                onClicked: menu.open()
                Menu {
                    id: menu
                    y: parent.height
                    MenuItem {
                        text: 'day'
                        onTriggered: {
                            calendarSelector.text = qsTr("day");
                            loader.loadFragment("qrc:/qml/day.qml");
                            app.type = 0;//app.Day
                        }
                    }
                    MenuItem {
                        text: 'week'
                        onTriggered: {
                            calendarSelector.text = qsTr("week");
                            loader.loadFragment("qrc:/qml/week.qml");
                            app.type = 1;//app.Week
                        }
                    }
                    MenuItem {
                        text: 'month'
                        onTriggered: {
                            calendarSelector.text = qsTr("month");
                            loader.loadFragment("qrc:/qml/month.qml");
                            app.type = 2;//app.Month
                        }
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

        RroleValue: trueow {

            anchors.fill: parent

            Rectangle {
                id: lists
                border.width: 1
                width: 200
                height: parent.height

                ScrollView {
                    anchors.fill: parent
                    ColumnLayout {
                        id: dataList

                        signal resize

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

                                onClicked: {
                                    creatingWindow.visible = true;
                                }
                            }
                        }

                        ///////////////////////////////////////////////////////////////
                        ListView {
                            id: list
                            anchors.top: layout.bottom
                            model: groups
                            implicitHeight: parent.height
                            focus: true

                            header: Rectangle {
                                id: layout

                                height: 20
                                width: 150
                                Rectangle {
                                    anchors.fill: parent
                                    anchors.leftMargin: 15

                                    Label {
                                        text: "Group"
                                    }
                                }
                            }

                            footer: Rectangle {
                                anchors.top: list.bottom
                                Layout.leftMargin: 25

                                height: 20
                                width: 150

                                Rectangle {

                                    anchors.fill: parent
                                    anchors.leftMargin: 25

                                    TextInput {
                                        id: groupLine
                                        text: "+ add"

                                        onFocusChanged: function (scope) {
                                            if (scope)
                                                groupLine.text = "";
                                            else
                                                groupLine.text = "+ add";
                                        }

                                        onAccepted: {
                                            groups.addData(groupLine.text);
                                            groupLine.text = "+ add";
                                        }
                                    }
                                }
                            }

                            delegate: Rectangle {

                                height: 20
                                width: 150

                                Rectangle {

                                    anchors.fill: parent

                                    MouseArea {
                                        anchors.fill: parent
                                        //anchors.width: main.width
                                        acceptedButtons: Qt.LeftButton | Qt.RightButton

                                        hoverEnabled: true

                                        anchors.leftMargin: 25

                                        Label {
                                            text: model.display
                                        }

                                        onClicked: {
                                            if (mouse.button === Qt.RightButton) {
                                                console.log(index);
                                                menuGroup.curRow = index;
                                                menuGroup.popup();
                                            } else if (mouse.button === Qt.LeftButton) {
                                            }
                                        }
                                    }
                                }

                                Menu {
                                    id: menuGroup
                                    y: openMenuButton.height

                                    property int curRow

                                    MenuItem {
                                        text: 'remove'

                                        onClicked: {
                                            //app.removeUserRequest(menuGroup.curRow)
                                            //list.remove(menuGroup.curRow);
                                            groups.removeData(menuGroup.curRow);
                                        }
                                    }
                                }
                            }
                        }

                        /*Repeater {
                                id: listGroups
                                model: groups
                                delegate: Rectangle {
                                    Layout.leftMargin: 25

                                    height: 20
                                    width: 150
                                    Label {
                                        text: model.display
                                    }
                                }
                            }*/
                    }

                    /*
                        ColumnLayout {
                            id: columnTeachers
                            anchors.top: columnGroup.bottom
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
                            id: columnClassrooms
                            anchors.top: columnTeachers.bottom
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
                        */
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

    Connections {
        target: app
        onDateChanged: {
            console.log("hi");
        }
    }

    Window {
        id: creatingWindow
        visible: false

        minimumHeight: 500
        minimumWidth: 500

        x: (Screen.width - loginWindow.width) / 2
        y: (Screen.height - loginWindow.height) / 2

        TabBar {
            id: bar
            width: parent.width
            TabButton {
                text: qsTr("Class")
            }
            TabButton {
                text: qsTr("Schedule")
            }
        }

        StackLayout {
            width: parent.width
            currentIndex: bar.currentIndex
            Item {
                id: classTab

                GridLayout {
                    rows: 6
                    columns: 2

                    anchors.topMargin: bar.height
                    flow: GridLayout.TopToBottom

                    //title: "Generate Schedule"
                    anchors.fill: parent

                    Label {
                        text: "Name:"
                    }
                    Label {
                        text: "Teacher:"
                    }
                    Label {
                        text: "Group:"
                    }
                    Label {
                        text: "Classroom:"
                    }
                    Label {
                        text: "Date:"
                    }
                    Label {
                        text: "Time:"
                    }

                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1

                        TextInput {
                            anchors.fill: parent
                            text: "name"
                        }
                    }

                    ComboBox {
                        anchors.margins: 15
                        width: 100
                        height: 20

                        model: {
                            "Teacher";
                        }

                        onEditTextChanged: save.enabled = true
                    }
                    ComboBox {
                        anchors.margins: 15
                        width: 100
                        height: 20

                        model: {
                            "Group";
                        }

                        onEditTextChanged: save.enabled = true
                    }
                    ComboBox {
                        anchors.margins: 15
                        width: 100
                        height: 20

                        model: {
                            "Classroom";
                        }

                        onEditTextChanged: save.enabled = true
                    }
                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1
                        Row {
                            Label {
                                text: "year:"
                            }
                            TextInput {
                                text: "year"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "month:"
                            }
                            TextInput {
                                text: "month"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "day:"
                            }
                            TextInput {
                                text: "day"
                            }
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1
                        Row {
                            TextInput {
                                text: "12"
                            }
                            Label {
                                text: ":"
                            }
                            TextInput {
                                text: "00"
                            }
                        }
                    }
                }
            }
            Item {
                id: scheduleTab

                GridLayout {
                    rows: 6
                    columns: 2

                    anchors.topMargin: bar.height
                    flow: GridLayout.TopToBottom

                    //title: "Generate Schedule"
                    anchors.fill: parent

                    Label {
                        text: "Name:"
                    }
                    Label {
                        text: "Teacher:"
                    }
                    Label {
                        text: "Group:"
                    }
                    Label {
                        text: "Classrooms:"
                    }
                    Label {
                        text: "Begin date:"
                    }
                    Label {
                        text: "End date:"
                    }

                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1

                        TextInput {
                            anchors.fill: parent
                            text: "name"
                        }
                    }

                    ComboBox {
                        anchors.margins: 15
                        width: 100
                        height: 20

                        model: {
                            "Teacher";
                        }

                        onEditTextChanged: save.enabled = true
                    }
                    ComboBox {
                        anchors.margins: 15
                        width: 100
                        height: 20

                        model: {
                            "Group";
                        }

                        onEditTextChanged: save.enabled = true
                    }
                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1

                        TextInput {
                            anchors.fill: parent
                            text: "Classroom"
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1
                        Row {
                            Label {
                                text: "year:"
                            }
                            TextInput {
                                text: "year"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "month:"
                            }
                            TextInput {
                                text: "month"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "day:"
                            }
                            TextInput {
                                text: "day"
                            }
                        }
                    }
                    Rectangle {
                        width: 200
                        height: 20
                        border.width: 1
                        Row {
                            Label {
                                text: "year:"
                            }
                            TextInput {
                                text: "year"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "month:"
                            }
                            TextInput {
                                text: "month"
                            }
                            Label {
                                width: 5
                            }
                            Label {
                                text: "day:"
                            }
                            TextInput {
                                text: "day"
                            }
                        }
                    }
                }
            }
        }
    }
}
