import QtQuick 2.15
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "../Buttons"

Rectangle {
    id: root

    color: "#662b2323"
    Layout.preferredWidth: 560
    Layout.preferredHeight: 110
    radius: 15

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width * 0.85
        spacing: 15
        IconButton {
            id: leftIndicator
            roundIcon: true
            iconWidth: 40
            iconHeight: 40
            checkable: true
            setIcon: leftIndicator.checked ? "../assets/icons/leftInGlow.png" : "../assets/icons/leftIn.png"
            SequentialAnimation {
                running: leftIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
            }
            onCheckedChanged: {
                if(!checked) {
                    leftIndicator.iconSource.opacity = 1
                }
            }
        }

        IconButton{
            roundIcon: true
            iconWidth: 50
            iconHeight: 50
            checkable: true
            setIcon: checked ? "../assets/icons/headlightGlow.png" : "../assets/icons/headlight.png"
        }

        IconButton{
            id: seatbelt
            roundIcon: true
            iconWidth: 30
            iconHeight: 30
            checkable: true
            setIcon: checked ? "../assets/icons/seatbeltGlow.png" : "../assets/icons/seatbelt.png"
            SequentialAnimation {
                running: seatbelt.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: seatbelt.roundIcon ? seatbelt.roundIconSource : seatbelt.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: seatbelt.roundIcon ? seatbelt.roundIconSource : seatbelt.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
            }
            onCheckedChanged: {
                if(!checked) {
                    seatbelt.iconSource.opacity = 1
                }
            }
        }

        IconButton{
            id: carbattery
            roundIcon: true
            iconWidth: 30
            iconHeight: 30
            checkable: true
            setIcon: checked ? "../assets/icons/car-battery-glow.png" : "../assets/icons/car-battery.png"
            SequentialAnimation {
                running: carbattery.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: carbattery.roundIcon ? carbattery.roundIconSource : carbattery.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: carbattery.roundIcon ? carbattery.roundIconSource : carbattery.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
            }
            onCheckedChanged: {
                if(!checked) {
                   carbattery.iconSource.opacity = 1
                }
            }
        }

        IconButton{
            id: tirepressure
            roundIcon: true
            iconWidth: 30
            iconHeight: 30
            checkable: true
            setIcon: checked ? "../assets/icons/tire-pressure-glow.png" : "../assets/icons/tire-pressure.png"
            SequentialAnimation {
                running: tirepressure.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: tirepressure.roundIcon ? tirepressure.roundIconSource : tirepressure.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: tirepressure.roundIcon ? tirepressure.roundIconSource : tirepressure.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
            }
            onCheckedChanged: {
                if(!checked) {
                   tirepressure.iconSource.opacity = 1
                }
            }
        }

        IconButton{
            id: rightIndicator
            roundIcon: true
            iconWidth: 40
            iconHeight: 40
            checkable: true
            setIcon: checked ? "../assets/icons/rightInGlow.png" : "../assets/icons/rightIn.png"
            SequentialAnimation{
                running: rightIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
            }
            onCheckedChanged: {
                if(!checked) {
                    rightIndicator.iconSource.opacity = 1
                }
            }
        }
    }


}
