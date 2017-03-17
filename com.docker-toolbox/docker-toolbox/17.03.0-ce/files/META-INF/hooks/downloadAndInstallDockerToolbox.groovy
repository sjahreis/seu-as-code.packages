// Docker-Toolbox is rather large and not very cooperative to be shipped in the default SEU way as jar.
// also there is currently no .zip version, only an installer.exe

def dockerToolboxVersion="DockerToolbox-17.03.0-ce"
def dockerToolboxInstallPath="${seuLayout.software}/${dockerToolboxVersion}"
def installerPath= "${seuLayout.temp}/${dockerToolboxVersion}.exe"
def dlUrl = "https://github.com/docker/toolbox/releases/download/v17.03.0-ce/${dockerToolboxVersion}.exe"

def installerFile = new File(installerPath)
println("downloading ${installerPath} (~210Mb) from ${dlUrl} please be patient..")
if ( installerFile.exists() && installerFile.size() >0) {
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
//Documentation for docker toolbock installer http://www.jrsoftware.org/ishelp/index.php?topic=setupcmdline
//DockerToolbox-1.11.2.exe /SILENT
//DockerToolbox-1.11.2.exe /SILENT /COMPONENTS=docker,dockermachine,dockercompose

"${installerPath} /SILENT /DIR=${dockerToolboxInstallPath}".execute(env, null).waitForProcessOutput(System.out, System.err)
println("done installing")