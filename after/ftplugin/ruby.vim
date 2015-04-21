
map <Leader>ut <Plug>RubyTestRun
map <Leader>uc <Plug>RubyFileRun
map <Leader>ul <Plug>RubyTestRunLast

fu! OpenOther()
	let testPrefix = "tc_"

	" Files & paths
	let srcFile = expand('%:t')

	" Change fileName
	let targetFile = ""
	if (stridx(srcFile, testPrefix) > -1)
		let targetFile = substitute(srcFile, testPrefix, "", "")
	else
		let targetFile = testPrefix . srcFile
	endif

	call OpenFileAtPath(targetFile, GetRelativeFilePath())
endfu
