/* A Gant version of the Publish-Github script
 * https://github.com/dawsonsystems/grails-gwt/blob/master/scripts/PublishGithub.groovy
 */


import org.apache.commons.io.FileUtils
includeTargets << grailsScript("_GrailsInit")
includeTargets << grailsScript("_GrailsDocs")

target(main: "Generates documentation and makes it available on gh-pages branch.") {
    remoteUrl = "http://github.com/Dream-Manager/Dream-Manager-Application"
	
	def docsDir = grailsSettings.docsOutputDir
	def tmpDocsDir = new File("${basedir}/docs-temp")
	
	// Remove any existing docs
	ant.delete(dir: docsDir.absolutePath)
	
	// Generate new ones
	docs()
	
	// Rename the generated folder to a temporary one
	docsDir.renameTo(tmpDocsDir)
	
	// Change to gh-pages branch
	executeGit("checkout gh-pages")
	
	// Copy docs to root folder
	FileUtils.copyDirectory(tmpDocsDir, "${basedir}")
	
	// Remove temporary copy
	ant.delete(dir: tmpDocsDir.absolutePath)
	
	// Touch all docs
	executeGit("add * -f")
	
	// Commit to gh-pages
	executeGit(["commit", "-m", "Auto-publication of docs.", "-a"])
	
	// Push to repo
	executeGit("push")
	
	// Change to master branch
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
