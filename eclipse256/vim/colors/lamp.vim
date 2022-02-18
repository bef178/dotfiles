"   syntax scheme for vim lamp
"   using very basic colors
"   based on default palette
"
"   16 ansi in [0, 15]: 4 bits as (bright, b, g, r)
"

if v:version > 580

hi clear
syntax on
syntax reset
let g:colors_name = "lamp"

let s:skip = "skip"
let s:none = "none"

" in 8-color term, bold together with fg forms a brighter color for fg
" so, for example, in a true 8-color term, there's no white background shceme
" there do be some terminals supporting 16-color, but says itself 8-color
if &t_Co == 8 || &t_Co == 16
    let s:bold = "none"
else
    let s:bold = "bold"
endif

" the 8 ansi colors are low-light versions in 8-color term
" while, they - except black - are high-light versions in other terms
let s:black = "black"
let s:gray = "gray" "#c0c0c0
if &t_Co == 8
    let s:darkred = "red"
    let s:red = s:darkred . ";bright"
    let s:darkgreen = "green"
    let s:green = s:darkgreen . ";bright"
    let s:darkyellow = "yellow"
    let s:yellow = s:darkyellow . ";bright"
    let s:darkblue = "blue"
    let s:blue = s:darkblue . ";bright"
    let s:purple = "magenta"
    let s:magenta = s:purple . ";bright"
    let s:teal = "cyan"
    let s:cyan = s:teal . ";bright"
    let s:darkgray = s:black . ";bright" "#808080
    let s:white = s:gray . ";bright"
else
    let s:darkred = 1
    let s:red = "red"
    let s:darkgreen = 2
    let s:green = "green"
    let s:darkyellow = 3
    let s:yellow = "yellow"
    let s:darkblue = 4
    let s:blue = "blue"
    let s:purple = 5
    let s:magenta = "magenta"
    let s:teal = 6
    let s:cyan = "cyan"
    let s:darkgray = "darkgray"
    let s:white = "white"
endif

function! <SID>hiGroup(group, fg, bg, attr)
    let l:display = "cterm"
    let l:fg = a:fg
    let l:bg = a:bg
    let l:attr = a:attr
    if a:fg != s:skip
        let l:a = split(a:fg, ";")
        if len(l:a) > 1
            let l:fg = l:a[0]
            if a:attr != s:skip && l:a[1] == "bright"
                let l:attr = a:attr . ",bold"
            endif
        endif
        exec "hi! ".a:group." ".l:display."fg=".l:fg
    endif
    if a:bg != s:skip
        let l:a = split(a:bg, ";")
        if len(l:a) > 1
            let l:bg = l:a[0]
        endif
        exec "hi! ".a:group." ".l:display."bg=".l:bg
    endif
    if a:attr != s:skip
        exec "hi! ".a:group." ".l:display."=".l:attr
    endif
endfunction

function! <SID>hiPanel(fgHi, bgHi, fgInactive, bgInactive)
    call <SID>hiGroup("StatusLine", a:fgHi, a:bgHi, s:none)
    call <SID>hiGroup("StatusLineNC", a:fgInactive, a:bgInactive, s:none)
    call <SID>hiGroup("VertSplit", a:fgInactive, a:fgInactive, s:none)
    hi! link TabLineSel StatusLine
    hi! link TabLine StatusLineNC
    hi! link TabLineFill VertSplit
    hi! link LineNr StatusLineNC
    hi! link NonText LineNr
endfunction

function! <SID>hiPopup(fgHi, bgHi, fg, bg, scrollActive, scroll)
    call <SID>hiGroup("PmenuSel", a:fgHi, a:bgHi, s:none)
    call <SID>hiGroup("Pmenu", a:fg, a:bg, s:none)
    call <SID>hiGroup("PmenuThumb", s:skip, a:scrollActive, s:none)
    call <SID>hiGroup("PmenuSbar",  s:skip, a:scroll, s:none)
endfunction

function! <SID>hiSyntax()
    call <SID>hiGroup("Normal", s:black, s:white, s:none)

    call <SID>hiGroup("Constant", s:blue, s:skip, s:none)
    call <SID>hiGroup("SpecialChar", s:red, s:skip, s:none)

    call <SID>hiGroup("Statement", s:purple, s:skip, s:bold)
    hi! link Exception Statement
    hi! link PreProc Statement
    hi! link Type Statement

    call <SID>hiGroup("Error", s:white, s:darkred, s:none)

    "syntax match toTrim "\s\+$"
    "hi! link toTrim SpecialChar
    hi! link SpecialKey SpecialChar

    call <SID>hiGroup("Todo", s:darkblue, s:skip, s:bold)
    syntax keyword taskTag TODO XXX FIXME contained
    hi! link taskTag Todo

    call <SID>hiGroup("Comment", s:darkgreen, s:skip, s:none)
endfunction

function! <SID>hiSyntaxJava()
    syntax keyword javaKeyword if else
    syntax keyword javaKeyword for while do
    syntax keyword javaKeyword switch case default
    syntax keyword javaKeyword break continue goto return
    syntax keyword javaKeyword void char short int long float double boolean byte
    syntax keyword javaKeyword enum class interface
    syntax keyword javaKeyword extends implements this super
    syntax keyword javaKeyword instanceof new
    syntax keyword javaKeyword abstract static const final synchronized
    syntax keyword javaKeyword transient volatile strictfp native
    syntax keyword javaKeyword public private protected
    syntax keyword javaKeyword throw throws try catch finally assert
    syntax keyword javaKeyword package import
    call <SID>hiGroup("javaKeyword", s:purple, s:skip, s:bold)

    call <SID>hiGroup("javaAnnotation", s:darkgray, s:skip, s:skip)

    syntax region comment1 start="//" end="$" contains=taskTag
    hi! link comment1 Comment
    syntax region comment2 start="/\*[^*]" end="\*/" contains=taskTag
    hi! link comment2 Comment
    syntax region comment3 start="/\*\*" end="\s\+\*/" contains=taskTag
    call <SID>hiGroup("comment3", s:darkblue, s:skip, s:none)
    syntax match comment4 "/\*\*/"
    hi! link comment4 Comment
endfunction

function! <SID>hiAll()
    " ==== editor interface scheme
    call <SID>hiPanel(s:white, s:darkgray, s:darkgray, s:gray)
    call <SID>hiPopup(s:white, s:teal, s:black, s:darkyellow, s:teal, s:gray)

    call <SID>hiGroup("Cursor", s:white, s:black, s:none)
    call <SID>hiGroup("CursorLine", s:skip, s:gray, s:none)
    call <SID>hiGroup("CursorLineNr", s:darkgray, s:gray, s:none)
    call <SID>hiGroup("MatchParen", s:skip, s:yellow, s:none)
    " TODO see MatchParen to set function arguments and occurrence highlight

    call <SID>hiGroup("IncSearch", s:white, s:teal, s:none)
    call <SID>hiGroup("Search", s:white, s:purple, s:none)

    call <SID>hiGroup("Visual", s:white, s:darkblue, s:none)
    call <SID>hiGroup("VisualNOS", s:skip, s:darkblue, s:none)

    " ==== static syntax scheme
    call <SID>hiSyntax()

    if &filetype == "java"
        call <SID>hiSyntaxJava()
    endif
endfunction

call <SID>hiAll()

endif
