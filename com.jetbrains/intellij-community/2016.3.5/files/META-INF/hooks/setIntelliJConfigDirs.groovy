import groovy.text.GStringTemplateEngine

def binding = [seuHome: seuHome]
def engine = new GStringTemplateEngine()

def asenv = new File("${seuLayout.software}/intellij-community-2016.3.5/bin/idea.properties")
def template = engine.createTemplate(asenv).make(binding)
asenv.write(template.toString())
