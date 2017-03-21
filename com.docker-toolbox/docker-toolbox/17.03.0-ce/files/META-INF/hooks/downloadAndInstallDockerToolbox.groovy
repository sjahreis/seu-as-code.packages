// Docker-Toolbox is rather large and not very cooperative to be shipped in the default SEU way as jar.
// also there is currently no .zip version, only an installer.exe

def dockerToolboxVersion="DockerToolbox-17.03.0-ce"
def dockerToolboxInstallPath="${seuLayout.software}/${dockerToolboxVersion}"
def installerPath= "${seuLayout.temp}/${dockerToolboxVersion}.exe"
def dlUrl = "https://github.com/docker/toolbox/releases/download/v17.03.0-ce/${dockerToolboxVersion}.exe"

def installerFile = new File(installerPath)
println("downloading ${installerPath} (~210Mb) from ${dlUrl} please be patient..")
if ( installerFile.exists() && installerFile.size() > 0) {
    println("Skip download of ${installerPath}. File already exists")
} else {
    def installerFileOutStream=installerFile.newOutputStream();
    installerFileOutStream << new URL(dlUrl).openStream()
    installerFileOutStream.close()
}

println("installing ${installerPath}..")

def env = System.getenv().collect { k, v -> "$k=$v" }
env.add("DOCKER_TOOLBOX_INSTALL_PATH=${dockerToolboxInstallPath}")
env.add("MACHINE_STORAGE_PATH=${seuLayout.home}")
env.add("USERPROFILE=${seuLayout.home}")
env.add("HOME=${seuLayout.home}")
env.add("APPDATA=${seuLayout.home}/AppData/Roaming")

//Documentation for docker toolbock installer 
//http://www.jrsoftware.org/ishelp/index.php?topic=setupcmdline
// https://github.com/docker/toolbox/blob/master/windows/Toolbox.iss
//DockerToolbox-1.11.2.exe /SILENT
//DockerToolbox-1.11.2.exe /SILENT /COMPONENTS="Docker,DockerMachine,DockerCompose"


def components="Docker,DockerMachine,DockerCompose"
if(System.getenv("VBOX_INSTALL_PATH")==null && System.getenv("VBOX_MSI_INSTALL_PATH")==null){
  components=components + ",VirtualBox"
}

//For now run non-silent interactive installer! Docker Toolbox is too dumb to recognize an allready installed Virtualbox and will overwrite - even if a newer version is allready installed.
"${installerPath} /DIR=${dockerToolboxInstallPath} /COMPONENTS=\"${components}\" ".execute(env, null).waitForProcessOutput(System.out, System.err)

//below installer command for future use if some day the docker-toolbox installer can figure out the virtualbox path and version.
//"${installerPath} /SILENT /DIR=${dockerToolboxInstallPath} /COMPONENTS=\"Docker,DockerMachine,DockerCompose\" ".execute(env, null).waitForProcessOutput(System.out, System.err)
println("done installing")