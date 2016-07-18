#!/bin/bash
origindir=`pwd`
installerdir=$(dirname ${origindir})
applicationdir=${installerdir}/../application

doPackage()
{
        applicationname=$1
        packagename=$2
        javaversion=$3

        echo ------------------------------------------------
        echo Creating package named ${packagename} for ${applicationname} using ${javaversion}
		echo User is `id`
        echo Origin dir is ${origindir}
        echo Installer dir is ${installerdir}
        echo Application dir is ${applicationdir}
        packagedir=${installerdir}/${packagename}
        echo "Package dir is " ${packagedir}
        mkdir -p ${packagedir}
        cd ${packagedir}

        #
        #Common files
        #
        mkdir -p ${packagedir}/Common
        mkdir -p ${packagedir}/Common/bin
        cp ${installerdir}/Common/bin/RoboxDetector.linux.sh ${packagedir}/Common/bin
        cp -R ${installerdir}/Common/Filaments ${packagedir}/Common
        cp -R ${installerdir}/Common/Heads ${packagedir}/Common
        cp -R ${installerdir}/Common/Language ${packagedir}/Common
        cp -R ${installerdir}/Common/Macros ${packagedir}/Common
        cp -R ${installerdir}/Common/Printers ${packagedir}/Common
        cp -R ${installerdir}/Common/PrintProfiles ${packagedir}/Common

        #
        #App-specific files
        #
        mkdir -p ${packagedir}/${applicationname}
        cp ${origindir}/robox ${packagedir}/${applicationname}
        cp ${origindir}/${applicationname}.configFile.xml ${packagedir}/${applicationname}
        cp ${origindir}/run${applicationname}.sh ${packagedir}/${applicationname}
        cp ${applicationdir}/target/${applicationname}.jar ${packagedir}/${applicationname}
        cp -R ${applicationdir}/target/lib ${packagedir}/${applicationname}
        mkdir -p ${packagedir}/${applicationname}/java
        cp -R /home/wildfly/.jenkins/javaDistros/${javaversion}/* ${packagedir}/${applicationname}/java

        cd ${installerdir}/${packagename}
        zipfilename=${applicationname}${packagename}.zip
        zip -r ${zipfilename} *
        mv ${zipfilename} ${installerdir}

        echo ------------------------------------------------
}

doPackage Root ARM-32bit java-arm-32bit
doPackage Root Windows-x64 java-windows-x64
doPackage Root MacOSX java-osx
doPackage Root Linux-x86 java-linux
doPackage Root Linux-x64 java-linux-x64