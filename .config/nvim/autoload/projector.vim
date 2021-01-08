" Allows per-project configuration of keybindings.
" For example, '*.cpp <F5> make' will run make on F5 button push 
" if .cpp file was opened
let s:commandFormat="au BufReadPost,BufNewFile %s map %s :!%s<CR>"

" Files that plugin searches on startup (relative to pwd)
let s:allowedConfigPaths=[".vim/config", ".vim.conf", "vim.conf"]

function! s:createCommand(line)
    let line=split(a:line)
    return printf(s:commandFormat, line[0], line[1], join(line[2:]))
endfunction

function! s:parseFile(filename)
    let commands=[]
    for line in readfile(a:filename)
        let commands=commands + [s:createCommand(line)]
    endfor
    return commands
endfunction

function! s:getConfigs()
    let commands=[]
    for filename in s:allowedConfigPaths
        if filereadable(filename)
            let commands=commands + s:parseFile(filename)
        endif
    endfor
    return commands
endfunction

function! s:applyConfig(config)
    for line in a:config
        execute line
    endfor
endfunction

function! projector#init()
    let config=s:getConfigs()
    call s:applyConfig(config)
endfunction

