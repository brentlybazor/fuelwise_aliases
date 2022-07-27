ios-build () {
    #!/bin/bash
    
    movePackagesArchive

    fwm
    rm -rf node_modules
    cd ios
    rm -rf Pods Podfile.lock
    cd ..
    yarn add react-native@0.63.2
    echo "copying"
    cp -R ${fuelwisePath}/utils/packagesArchive/* ./node_modules/

    react-native link
    cd ios
    pod install
    cd ..
}


movePackagesArchive () {
    #this file should be equal level to the project folder in files structure
    if [  ! -d ~/Downloads/packagesArchive ]
    then
    mv ~/Downloads/packagesArchive.zip ${fuelwisePath}/utils
    unzip -d ${fuelwisePath}/utils/packagesArchive ${fuelwisePath}/utils/packagesArchive.zip
    fi
}