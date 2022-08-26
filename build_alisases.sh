#!/bin/bash

ios-build () {
    
    PackagesAdded="$(movePackagesArchive)"

    echo $PackagesPlaced

    if [ ! $PackagesPlaced ]
    then 
        echo 'Packages not found.. please try again'
        return
    else
        echo 'packages added'
    fi

    fwm
    ls
    rm -rf node_modules
    cd ios
    rm -rf Pods Podfile.lock
    cd ..
    yarn add react-native@0.63.2
    # echo "copying"
    # pwd
    # cp -R ${fuelwisePath}/utils/packagesArchive/* ./node_modules/

    # react-native link
    # cd ios
    # pod install
    # cd ..
}


movePackagesArchive () {
    # TODO: These are the checks that need to be done
    # 1. Check if the folder is already unzipped in the utils folder
    # 2. Check if the file is in the Downloads folder
    # 3. Move it to the utils folder if not there
    # 4. Unzip package

    PackagesPlaced=False
    
    #this file should be equal level to the project folder in files structure
    if [  ! -d ${fuelwisePath}/utils/packagesArchive ]
    then
        echo 'not found in fw utils'

        if ! test -f ${fuelwisePath}/utils/packagesArchive.zip 
        then 
            echo 'no zip in utils'
        else
            echo 'found in fw util path and unzipping now'
            unzip -d ${fuelwisePath}/utils/packagesArchive ${fuelwisePath}/utils/packagesArchive.zip
            PackagesPlaced=True
        fi

        if ! test -f ~/Downloads/packagesArchive.zip
        then 
            echo 'no zip in downloads'
        else
            echo 'found in downloads, moving and unzipping now'

            mv ~/Downloads/packagesArchive.zip ${fuelwisePath}/utils
            unzip -d ${fuelwisePath}/utils/packagesArchive ${fuelwisePath}/utils/packagesArchive.zip
            PackagesPlaced=True
        fi
    else
        echo 'Packages archive already in utils folder'
        PackagesPlaced=True
        # return
    fi

    if [[ $PackagesPlaced == True ]] 
    then
        echo 'Packages Added Successfuly' 
    else
        echo 'The packages archive file not found'
        echo False
    fi
    # return the result of whether the packages were added or not
    $PackagesPlaced
}
