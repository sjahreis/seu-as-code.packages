
def file= "${seuLayout.temp}/DockerToolbox-17.03.0-ce.exe"
def dlUrl = "https://github.com/docker/toolbox/releases/download/v17.03.0-ce/DockerToolbox-17.03.0-ce.exe"

def installerFile = new File(file)
println("downloading ${file} (~210Mb) from ${dlUrl} please be patient..")
if( installerFile.exists() && installerFile.size() >0){
    println("Skip download of ${file}. File already exists")
}else{
    def installerFileOutStream=installerFile.newObjectOutputStream();
    installerFileOutStream << new URL(dlUrl).openStream()
    installerFileOutStream.close()
}


println("installing ${file}..")

def env = System.getenv().collect { k, v -> "$k=$v" }
env.add("DOCKER_TOOLBOX_INSTALL_PATH=${seuLayout.software}")
env.add("MACHINE_STORAGE_PATH=${seuLayout.home}")
env.add("USERPROFILE=${seuLayout.home}")
env.add("HOME=${seuLayout.home}")
//Documentation http://www.jrsoftware.org/ishelp/index.php?topic=setupcmdline
//DockerToolbox-1.11.2.exe /SILENT
//DockerToolbox-1.11.2.exe /SILENT /COMPONENTS=docker,dockermachine,dockercompose
def proc = "${file} /SILENT ".execute(env,new File(${seuLayout.home}) )
proc.waitForProcessOutput(System.out, System.err)
println("done installing")