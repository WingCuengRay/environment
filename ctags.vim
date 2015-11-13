function! AutoLoadCtags()
	let max=5
	let dir='./'
	let i=0
	while isdirectory(dir) && i<max
		if filereadable(dir . '.tags')
			execut 'set tags=' . dir . 'tags'
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf

function! RefreshCtags()
	let curdir=getcwd()
	while !filereadable("./tags")
		cd ..
		if getcwd() == "/"
			break
		endif
	endwhile
	if filewritable("./tags")
		!ctags -R --file-scope=yes --links=yes ./	
		TlistUpdate
	endif
	execute ":cd" . curdir
endf
