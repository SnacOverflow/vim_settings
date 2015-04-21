
" Java's version to open the accompanying test.
fu! OpenOther()
	let testSuffix = "Test.java"
	let nonTestSuffix = ".java"
	let mainDir = "/main/"
	let testDir = "/test/"

	" Files & paths
	let relPath = GetRelativeFilePath()
	let srcFile = expand('%:t')

	" Change path
	let targetPath = ""
	if (stridx(relPath, mainDir) > -1)
		let targetPath = substitute(relPath, mainDir, testDir, "")
	elseif (stridx( relPath, testDir) > -1)
		let targetPath = substitute(relPath, testDir, mainDir, "")
	endif

	" Change fileName
	let targetFile = ""
	if (stridx(srcFile, testSuffix) > -1)
		let targetFile = substitute(srcFile, testSuffix, nonTestSuffix, "")
	else
		let targetFile = substitute(srcFile, nonTestSuffix, testSuffix, "")
	endif

	call OpenFileAtPath(targetFile, targetPath)
endfu
