import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import CalculatorLogic 1.0

Window
{
    id: myWindow
    visible: true
    width: 480
    height: myWindow.isDec ? 750 : 840
    title: qsTr("Calculator")

    property bool isDec: true

    CalculatorLogic
    {
        id: logic
    }

    Item
    {
        width: myWindow.width
        height: myWindow.height

        Rectangle
        {
            id: rootRect
            x: 20; y: 20
            color: "grey"
            width: myWindow.width - x * 2
            height: myWindow.height - y * 2

            focus: true

            Rectangle
            {
                id: diplay
                x: 10; y: 10
                color: "#f5f5f5"
                width: rootRect.width - x * 2
                height: 130

                Text
                {
                    id: displayText
                    x: 5; y: 5
                    width: diplay.width - x * 2
                    height: diplay.height - y * 2
                    font.pixelSize: 36
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignBottom
                    font.family: "Cascadia Code"
                    text: ""
                }
            }

            Keys.onReleased:
            {
                if ( event.key === Qt.Key_Enter || event.text === "=")
                {
                     displayText.text = logic.onEnterEqualInput();
                }
                else if ( event.key === Qt.Key_Delete  )
                {
                     displayText.text = logic.onCleanInput();
                }
                else
                {
                    displayText.text = logic.onKeyboardInput(event.text);
                }
            }


            Rectangle
            {
                id: settingsArea
                x: 10; y: diplay.height + 20

                width: rootRect.width - x * 2
                height: 40

                color: "#f5f5f5"

                ButtonGroup
                {
                    id: settingsRadioBtnGroup
                    onClicked:
                    {
                        logic.setCalcType(dec.checked ? CalculatorLogic.Dec : CalculatorLogic.Hex)
                        myWindow.isDec = dec.checked
                    }
                }


                Row {
                    spacing: 5
                    Label {
                        x: 10; y: 10
                        height: settingsArea.height - 20
                        width: settingsArea.width / 2
                        text: qsTr("Choose the base:")
                        font.pixelSize: 16
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignTop
                        color: "black"
                    }

                    RadioButton {
                        id: dec
                        checked: true
                        text: qsTr("DEC")
                        ButtonGroup.group: settingsRadioBtnGroup
                    }

                    RadioButton {
                        id: hex
                        text: qsTr("HEX")
                        ButtonGroup.group: settingsRadioBtnGroup
                    }
                }
            }

            // ------------------------------------ //

            Rectangle
            {
                id: keysArea
                x: 10
                y: diplay.height + settingsArea.height + 40
                color: "#c0c0c0"
                width: rootRect.width - x * 2
                height: myWindow.isDec ? 450 : 540
                clip: true

                property int nrKeysOnColumn: myWindow.isDec ? 5 : 6
                property int nrKeysOnRow: 4

                property int keyWidth: keysArea.width / keysArea.nrKeysOnRow
                property int keyHeight: keysArea.height / keysArea.nrKeysOnColumn

                // ---- ONLY FOR HEXA ---------- //

                ListModel {
                    id: hexaKeysModel
                    ListElement { key: "A"; }
                    ListElement { key: "B"; }
                    ListElement { key: "C"; }
                    ListElement { key: "D"; }
                    ListElement { key: "E"; }
                    ListElement { key: "F"; }
                }

                ListModel {
                    id: digitKeysModel
                    ListElement { key: "7"; }
                    ListElement { key: "8"; }
                    ListElement { key: "9"; }
                    ListElement { key: "4"; }
                    ListElement { key: "5"; }
                    ListElement { key: "6"; }
                    ListElement { key: "1"; }
                    ListElement { key: "2"; }
                    ListElement { key: "3"; }
                    ListElement { key: ""; }
                    ListElement { key: "0"; }
                    ListElement { key: ""; }
                }

                ListModel {
                    id: operatorKeysModel
                    ListElement { key: "/"; }
                    ListElement { key: "*"; }
                    ListElement { key: "-"; }
                    ListElement { key: "+"; }
                }

                Grid
                {
                    x: 0; y: 0
                    rows: 2; columns: 3;

                    Repeater
                    {
                        model: hexaKeysModel
                        CalculatorKey
                        {
                             CalculatorKeyText
                             {
                                   text: modelData
                             }
                             property color keyBaseColor: "white"
                             property color keyColorOnPress: "#dcdcdc"

                             CalculatorKeyMouse
                             {
                                   onClicked:
                                   {
                                       displayText.text = logic.onLetterInput(modelData);
                                   }
                             }
                         }
                    }
                    visible: myWindow.isDec ? false : true
                 }

                // DIGITS

                Grid
                {
                    x: 0 * keysArea.keyWidth; y: (myWindow.isDec ? 1 : 2) * keysArea.keyHeight
                    rows: 4; columns: 3;

                    Repeater
                    {
                        model: digitKeysModel
                        CalculatorKey
                        {
                             CalculatorKeyText
                             {
                                   text: modelData
                             }
                             property color keyBaseColor: "white"
                             property color keyColorOnPress: "#dcdcdc"

                             CalculatorKeyMouse
                             {
                                   onClicked:
                                   {
                                       displayText.text = logic.onDigitInput(modelData);
                                   }
                             }
                         }
                    }
                 }


                // OPERATORS

                Column
                {
                    x: 3 * keysArea.keyWidth
                    y: (myWindow.isDec ? 0 : 1) * keysArea.keyHeight
                    spacing: 0
                    Repeater
                    {
                        model:operatorKeysModel
                        delegate: CalculatorKey
                        {
                            property color keyBaseColor: "lightBlue"
                            property color keyColorOnPress: "#00ced1"
                            color: keyBaseColor
                            CalculatorKeyText
                            {
                                text: modelData
                            }
                            CalculatorKeyMouse
                            {
                                onClicked:
                                {
                                    displayText.text = logic.onOperationInput(modelData);
                                }
                            }
                        }
                    }
                }

                // SPECIAL KEYS

                CalculatorKey
                {
                    x: 0 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    property color keyBaseColor: "#d8bfd8"
                    property color keyColorOnPress: "#ff69b4"
                    color: keyBaseColor
                    CalculatorKeyText
                    {
                        text: "C"
                    }
                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text = logic.onCleanInput();
                        }
                    }
                }

                CalculatorKey
                {
                    x: 2 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    CalculatorKeyText
                    {
                        text: "."
                    }
                    property color keyBaseColor: "white"
                    property color keyColorOnPress: "#dcdcdc"

                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text = logic.onDotInput();
                        }
                    }

                    enabled: myWindow.isDec
                }


                CalculatorKey
                {
                    x: 3 * keysArea.keyWidth
                    y: (myWindow.isDec ? 4 : 5) * keysArea.keyHeight
                    property color keyBaseColor: "#d8bfd8"
                    property color keyColorOnPress: "#ff69b4"
                    color: keyBaseColor
                    CalculatorKeyText
                    {
                        text: "="
                    }
                    CalculatorKeyMouse
                    {
                        onClicked:
                        {
                            displayText.text = logic.onEnterEqualInput();
                        }
                    }
                }
            }


            // --------------------------------------------------- //

            // FOOTER

            Rectangle
            {
                id: info
                x: 10
                y: rootRect.height - height - 10
                color: "#f5f5f5"
                width: rootRect.width - x * 2
                height: 30

                Text
                {
                    width: info.width
                    height: info.height

                    text: "Calculator made by Andreea P. for training purposes"
                    font.pixelSize: 14
                    font.italic: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                // support for translations
                // qt linguist
                // button -> dropdown list (combo) -> o lista cu limbi, si in functie de ce limba se alege se trimite semnal, si se implementeaza internationalizarea

            }

            // ------------ //
        }
    }
}
