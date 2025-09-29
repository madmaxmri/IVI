cmake_minimum_required(VERSION 3.16)

project(HMI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Location Positioning VirtualKeyboard Multimedia)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)


qt_standard_project_setup(REQUIRES 6.9.1)

set(QT_QML_GENERATE_QMLTYPES TRUE)

qt_add_executable(appHMI
    main.cpp
    PlayerController.h PlayerController.cpp
)

set_source_files_properties(
    Requester.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)


qt_add_qml_module(appHMI
    URI HMI
    VERSION 1.0

    QML_FILES
        Main.qml
        Buttons/TabButton.qml
        Screens/CabinScreen.qml
        Screens/CallScreen.qml
        Screens/HomeScreen.qml
        Screens/MusicScreen.qml
        Screens/NavigationScreen.qml
        Screens/SettingsScreen.qml
        Screens/VehicleScreen.qml
        Components/DateTimeTile.qml
        Components/ClimateTile.qml
        Components/BatteryTile.qml
        Components/PowerControl.qml
        Buttons/PrefsButton.qml
        Components/LiveLocationModel.qml
        Components/LiveWeatherModel.qml
        Components/Requester.qml
        Components/MapTile.qml
        Components/KeyBoardTile.qml
        Components/AirControl.qml
        Components/SeatTile.qml
        Components/CabinTempControl.qml
        Components/NotificationTile.qml
        Components/SummaryTile.qml
        Components/MusicTile.qml
        Buttons/ImageButton.qml
        AudioComponent/AudioInfoBox.qml
        AudioComponent/PlaylistPanel.qml
        AudioComponent/SearchField.qml
        AudioComponent/SearchPanel.qml
        Components/CameraView.qml
        Components/AdasFeatureList.qml
        Components/FeatureButton.qml
        CallComponent/CallHistory.qml
        CallComponent/Contacts.qml
        Components/PhoneTile.qml



    RESOURCES
        assets/backgrounds/22001.jpg
        assets/backgrounds/3433369.jpg
        assets/backgrounds/abstract-dark-background-with-flowing-colouful-waves.jpg
        assets/backgrounds/blue-wavy-background.jpg
        assets/icons/address-book.png
        assets/icons/cabinDarkTheme.png
        assets/icons/cabinLightTheme.png
        assets/icons/clock-nine.png
        assets/icons/compassDarkTheme.png
        assets/icons/compassLightTheme.png
        assets/icons/grid.png
        assets/icons/home.png
        assets/icons/homeDarkTheme.png
        assets/icons/homeLightTheme.png
        assets/icons/marker.png
        assets/icons/music-alt.png
        assets/icons/musicDarkTheme.png
        assets/icons/musicLightTheme.png
        assets/icons/paper-plane.png
        assets/icons/phone-call.png
        assets/icons/phoneDarkTheme.png
        assets/icons/phoneLightTheme.png
        assets/icons/review.png
        assets/icons/settings.png
        assets/icons/settingsDarkTheme.png
        assets/icons/settingsLightTheme.png
        assets/icons/star.png
        assets/icons/steering-wheel.png
        assets/icons/vehicleDarkTheme.png
        assets/icons/vehicleLightTheme.png
        assets/icons/wind.png
        assets/icons/homeScreenIcons/bio-leaves.png
        assets/icons/homeScreenIcons/motorcycle-helmet.png
        assets/icons/homeScreenIcons/EcoCharge.png
        assets/icons/homeScreenIcons/NormalCharge.png
        assets/icons/homeScreenIcons/SportsCharge.png
        assets/icons/homeScreenIcons/Ecobattery.png
        assets/icons/homeScreenIcons/Normalbattery.png
        assets/icons/homeScreenIcons/Sportbattery.png
        assets/images/image0.jpg
        assets/images/image1.jpg
        assets/images/image2.jpg
        assets/images/image3.jpg
        assets/images/image45.jpg
        assets/images/image48.jpg
        assets/images/image51.jpg
        assets/images/image53.jpg
        assets/images/image55.jpg
        assets/images/image56.jpg
        assets/images/image57.jpg
        assets/images/image61.jpg
        assets/images/image63.jpg
        assets/images/image65.jpg
        assets/images/image66.jpg
        assets/images/image67.jpg
        assets/images/image71.jpg
        assets/images/image73.jpg
        assets/images/image75.jpg
        assets/images/image77.jpg
        assets/images/image80.jpg
        assets/images/image81.jpg
        assets/images/image82.jpg
        assets/images/image85.jpg
        assets/images/image86.jpg
        assets/images/image95.jpg
        assets/images/image96.jpg
        assets/images/image99.jpg
        assets/weather/clouds-moon.png
        assets/weather/icon0.png
        assets/weather/icon1.png
        assets/weather/icon2.png
        assets/weather/icon3.png
        assets/weather/icon45.png
        assets/weather/icon48.png
        assets/weather/icon51.png
        assets/weather/icon53.png
        assets/weather/icon55.png
        assets/weather/icon56.png
        assets/weather/icon57.png
        assets/weather/icon61.png
        assets/weather/icon63.png
        assets/weather/icon65.png
        assets/weather/icon66.png
        assets/weather/icon67.png
        assets/weather/icon73.png
        assets/weather/icon75.png
        assets/weather/icon77.png
        assets/weather/icon80.png
        assets/weather/icon81.png
        assets/weather/icon82.png
        assets/weather/icon85.png
        assets/weather/icon86.png
        assets/weather/icon95.png
        assets/weather/icon96.png
        assets/weather/icon99.png
        assets/icons/briefcase.png
        assets/icons/plus.png
        assets/icons/homeScreenIcons/power.png
        assets/icons/fan.png
        assets/icons/airDown.png
        assets/icons/airUp.png
        assets/icons/airUpDown.png
        assets/icons/heater.png
        assets/icons/ventilation.png
        assets/icons/toys.png
        assets/icons/heatSeat.png
        assets/icons/clean-car.png
        assets/icons/homeScreenIcons/angle-left.png
        assets/icons/homeScreenIcons/angle-right.png
        assets/icons/battery-exclamation.png
        assets/icons/brake-warning.png
        assets/icons/engine.png
        assets/icons/tire-pressure-warn.png
        assets/icons/tire-pressure-warning.png
        assets/icons/circle-bolt.png
        assets/icons/circle-d.png
        assets/icons/circle-microphone.png
        assets/icons/circle-n.png
        assets/icons/circle-r.png
        assets/icons/dot-circle.png
        assets/icons/parking-circle.png
        assets/backgrounds/car2.png
        assets/backgrounds/car1.png
        assets/icons/previous.png
        assets/icons/next.png
        assets/icons/bluetooth-circle.png
        assets/icons/play.png
        assets/icons/circle-ellipsis-vertical.png
        assets/icons/circle-trash.png assets/icons/pause.png
        assets/icons/search.png
        assets/icons/cross-circle.png
        assets/icons/add.png
        assets/camera/BackupCameraPicture.png


        assets/audioImage/cowboyInLA.jpg
        assets/audioImage/dilNu.jpg
        assets/audioImage/overdrive.jpg
        assets/audioImage/spaceBound.jpg
        assets/audioImage/whatLoversDo.jpg
        assets/audioImage/withYou.jpg

        assets/audio/cowboy_in_LA.mp3
        assets/audio/Dil_Nu.mp3
        assets/audio/Overdrive.mp3
        assets/audio/Space_Bound.mp3
        assets/audio/What_Lovers_Do.mp3
        assets/audio/With_You.mp3


    SOURCES
        AudioSearchModel.h
        AudioSearchModel.cpp
        AudioInfo.h
        AudioInfo.cpp
        contactmodel.h
        contactmodel.cpp
        historymodel.h
        historymodel.cpp
        RESOURCES assets/font/fontawesome.otf
        QML_FILES SettingsComponent/About.qml
        QML_FILES SettingsComponent/Profile.qml
        RESOURCES assets/icons/G-cherokee-logo.png
        RESOURCES assets/icons/separator.png assets/icons/seprator.png assets/icons/smallSeparator.png
        RESOURCES assets/icons/Adhaar.png assets/icons/driving.png assets/icons/pencard.png
        QML_FILES SettingsComponent/Display.qml
        QML_FILES Buttons/PrefsSlider.qml
        RESOURCES assets/icons/comment.png
        QML_FILES Buttons/PrefsSwitch.qml
        RESOURCES assets/icons/brightness-low.png
        RESOURCES assets/icons/HorizontalSeparator.png
        QML_FILES SettingsComponent/Bluetooth.qml
        QML_FILES SettingsComponent/Sound.qml
        QML_FILES SettingsComponent/SystemUpdate.qml
        QML_FILES SettingsComponent/SystemNotification.qml
        RESOURCES
        QML_FILES Buttons/InfoPopup.qml
        QML_FILES SettingsComponent/MyTrips.qml
        RESOURCES assets/icons/caret-down.png
        RESOURCES assets/icons/car-battery.png assets/icons/carIcon.png
        QML_FILES Buttons/RoundRectangle.qml
        QML_FILES Buttons/PrefsTimeLine.qml
        QML_FILES Buttons/ListItemDelegate.qml
        QML_FILES SettingsComponent/MainPage.qml
        RESOURCES
        RESOURCES assets/icons/Adhaar.png assets/icons/driving.png assets/icons/pencard.png
        RESOURCES assets/icons/jeep.png
        RESOURCES assets/icons/jeep.png
        QML_FILES Buttons/IconButton.qml
        RESOURCES assets/icons/car-battery.png assets/icons/car-battery-glow.png assets/icons/circle-phone.png assets/icons/circle-phone-hangup.png assets/icons/headlight.png assets/icons/headlightGlow.png assets/icons/leftIn.png assets/icons/leftInGlow.png assets/icons/rightIn.png assets/icons/rightInGlow.png assets/icons/seatbelt.png assets/icons/seatbeltGlow.png assets/icons/signal-alt.png assets/icons/signal-alt-1.png assets/icons/signal-alt-2.png assets/icons/tire-pressure.png assets/icons/tire-pressure-glow.png
        QML_FILES AdasComponents/ParkingAssistance.qml
        QML_FILES AdasComponents/LaneChange.qml
        QML_FILES AdasComponents/BlindSpotDetection.qml
        QML_FILES AdasComponents/CruiseControl.qml
        QML_FILES AdasComponents/EmergencyBreakingSystem.qml
        QML_FILES AdasComponents/DriveTerrainSystem.qml
        RESOURCES assets/icons/break.png assets/icons/change.png assets/icons/four-wheel-drive-on-mountain.png assets/icons/mirror.png
        RESOURCES assets/icons/speedometer.png

)



# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHMI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHMI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHMI
    PRIVATE Qt6::Core Qt6::Quick Qt6::Location Qt6::Positioning Qt6::VirtualKeyboard Qt6::Multimedia
)
target_link_libraries(appHMI PRIVATE Qt6::Core)
target_link_libraries(appHMI PRIVATE Qt6::Core)


include(GNUInstallDirs)
install(TARGETS appHMI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
