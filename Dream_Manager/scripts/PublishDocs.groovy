/* A Gant version of the Publish-Github script
 * https://github.com/dawsonsystems/grails-gwt/blob/master/scripts/PublishGithub.groovy
 */


import org.apache.commons.io.FileUtils
includeTargets << grailsScript("_GrailsInit")
includeTargets << grailsScript("_GrailsDocs")

target(main: "Generates documentation and makes it available on gh-pages branch.") {
    remoteUrl = "http://github.com/Dream-Manager/Dream-Manager-Application"
	
	/*
	// Get current branch name
	def output = executeGit("branch")
	def m = output =~ /\*\s+(\S+)/
	def branch = ""
	if (m) {
		branch = m[0][1]
		println "Current branch: ${branch}"
	}
	else {
		logError("Unable to find out current branch. Output from 'git branch' was:\n\n  ${output}".toString())
		exit(1)
	}
	*/
	
	def docsDir = grailsSettings.docsOutputDir
	def tmpDocsDir = new File("${basedir}/docs-temp")
	
	// Remove any existing docs
	ant.delete(dir: docsDir.absolutePath)
	
	// Generate new ones
	docs()
	
	// Rename the generated folder to a temporary one
	docsDir.renameTo(tmpDocsDir)
	
	/*
	// Change to gh-pages branch
	executeGit("checkout gh-pages")
	*/
	
	// Copy docs to root folder
	FileUtils.copyDirectory(tmpDocsDir, new File("${basedir}/.."))
	
	// Remove temporary copy and project folder
	ant.delete(dir: tmpDocsDir.absolutePath)
	
	// Touch all docs
	executeGit("add ../* -f")
	
	// Commit to gh-pages
	executeGit(["commit", "-m", "Auto-publication of docs.", "-a"])
	
	// Push to repo
	executeGit("push")
	
	/*
	// Change to last used branch
	executeGit("checkout ${branch}")
	*/
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
