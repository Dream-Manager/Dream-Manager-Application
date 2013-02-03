/* A Gant version of the Publish-Github script
 * https://github.com/dawsonsystems/grails-gwt/blob/master/scripts/PublishGithub.groovy
 */


import org.apache.commons.io.FileUtils
includeTargets << grailsScript("_GrailsInit")
includeTargets << grailsScript("_GrailsDocs")

target(main: "Generates documentation and makes it available on gh-pages branch.") {
    remoteUrl = "http://github.com/Dream-Manager/Dream-Manager-Application"
	def docsDir = grailsSettings.docsOutputDir
	ant.delete(dir: docsDir.absolutePath)
	docs()
	def tmpDocsDir = new File("${basedir}/docs-${System.currentTimeMillis()}")
	docsDir.renameTo(tmpDocsDir)
	executeGit("checkout gh-pages")
	FileUtils.copyDirectory(tmpDocsDir, docsDir)
	ant.delete(dir: tmpDocsDir.absolutePath)
	executeGit("add docs -f")
	executeGit(["commit", "-m", "Auto-publication of docs.", "-a"])
	executeGit("push")
	executeGit("checkout master")
}

setDefaultTarget(main)

String executeGit(cmd) {
	cmd = cmd instanceof List ? ["git"] + cmd : "git " + cmd

	def process = cmd.execute()
	def error = new StringBuffer()
	def out = new StringBuffer()
	process.waitForProcessOutput(out, error)
	process.waitFor()

	if (process.exitValue() != 0) {
		println error.toString()
		exit(process.exitValue())
	}

	return out.toString()
}
