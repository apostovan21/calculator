import QtQuick 2.0

MouseArea
{
    anchors.fill: parent
    onPressed:
    {
        parent.color = parent.keyColorOnPress
    }
    onReleased:
    {
        parent.color = parent.keyBaseColor
    }
}
