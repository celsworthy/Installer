cp ~/NetBeansProjects/automaker/target/AutoMaker.jar ~/JarArtifacts
mv ~/JarArtifacts/AutoMaker.jar ~/JarArtifacts/AutoMaker_IN.jar
 ~/Downloads/proguard5.0beta2/bin/proguard.sh @automaker_proguard.config 2> out.txt 
cp ~/JarArtifacts/AutoMaker.jar ~/CELObf/AutoMaker
