IntelliJ Community Edition 2016.3.5
=====

The package contains IntelliJ 2016.3.5 Community Edition IDE for Windows. 
Install this package using SEU-as-code with the following dependency:
```groovy
dependencies {
		software 'com.jetbrains:intellij-community:2016.3.5:win'
}
```

IntelliJ IDEA Community Edition for Windows platform is (currently) only available as .exe download.
The .exe installer is extracted using 7zip  and then repacked by the SEU package as .jar
All work is done in special folder: C:\\tmpGradleSEU, because depending on the location of your SEU package folder, extracting the .exe installer could reach windows maximum allowed path length of max 260 chars.
  
---
###Requirements:
7z.exe must be installed and on your PATH
---