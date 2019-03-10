### Vim tutorial: 
*This is written in VIM*

## Vim Tutorial & cheatsheet:
- [Best tutorial: Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)
- [Cheat sheet](https://github.com/Charmarder/_TEMPLATES_/wiki/Vim-Commands-Cheat-Sheet)
- [Cheat sheet 2](http://www.jrm4.com/How_I_use_technology/Vim_-_my_personal_cheatsheet_and_other_cool_things.html)
- [Cheat sheet 3](https://www.fprintf.net/vimCheatSheet.html)
- [Short yet good tutorial](https://spin.atomicobject.com/2016/04/19/vim-commands-cheat-sheet/)
- [Good Tutorial site](https://alvinalexander.com/linux/vim-vi-mode-editor-command-insert-mode)
- [Good beginner tutorial](https://www.linux.com/learn/vim-101-beginners-guide-vim)
- [Search and replace](https://vim.fandom.com/wiki/Search_and_replace)
- [Noice to expert screencasts](http://derekwyatt.org/vim/tutorials/novice/)
- [Vim Casts](http://vimcasts.org/episodes/archive/)

## Setup and plugins:
- [Setup 1](http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-switched-to-textmate)
- [Setup 2](https://github.com/vsouza/.vimrc)

## Used plugins:
- https://github.com/tpope/vim-pathogen
- https://github.com/tpope/vim-fugitive

## Netrw: (Directory browser)
- Get help type :help netrw-quickmap
- [Move file](https://til.hashrocket.com/posts/31d2f81172-move-a-file-with-netrw)
- Open current file/folder in window/finder: Type x by placing cursor on the file/folder

## Youtube video reference:
- [Completely changed my understanding](https://www.youtube.com/watch?v=wlR5gYd6um0)
- [Completely changed my understanding 2](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118) 
- [Good tutorial of VIM features](https://www.youtube.com/watch?v=5r6yzFEXajQ)

## Common commands:
- View command history: q: (In normal mode just type, does have to do at esc colon)
- Top of the file: gg or [[
- End of the file: G or ]]
- Screen movement: H,M,L
- Indent using: =
- Entire file content: % E.g. delete entire file content: %d, Indent entire file: %= 
- Autocomplete: Ctrl+n
- Set buffer specific settings using: setlocal e.g. `setlocal number` shows numbers only in this buffer

__Tabs:__
- List all open tabs: tabs
- Switch between tables: gt (next tab) or :tabn, gT (previous tab) or :tabp, ngt (go to tab with number 1 e.g. 4gt takes to 4th tab)
- Close current tab: tabclose
- Close all other tabs: tabonly

__Code folding:__
- Using line numbers: l1,l2f0 i.e. *fo*ld from line 1 to line 2
- zo (open the fold), zc (close), za (toggle)
- Using markers/bookmarkers:
  Start marking with mx; x being any alphabet A-Z or a-z
  Go to the line till which one wants to fold
  Enter: zf'x (z: incdicating fold, f: find the marker block)

__Indentation:__
- = is used to indent
- == to indent a line
- =i{ indent inside paranthesis
- gg=G indent entire file
- \>i{ increase indentation inside paraenthesis; ignore backward slash markdown error without it
- \<i{ to decrease indentation

__File explorer:__
- Explore/Ex (Opens in Same tab replacing existing content), 
- Sexplore/Sex (Opens in horizaontal split),
- Vexplore/Vex (Vertical split),
- Texplore/Tex (Opens in a new tab)


__Markers/Bookmarkers:__
- Acts like a point to which one can jump to when the file is large; this is similar to eclipse or intellij bookmarker
- To add marker: m{lowercaseletter/uppercaseletter/number}
- To jump to a marker: \`markerletter; ignore backslash, added to avoid markdown error
- List all markers: marks
- Markers can also be used to jump between files (even files that are not currently open)

__Macros:__
- Macros are steps recorded into memory that can be applied/reused
- Start recording a macro with: qa (Macro will get recorded into a); can use any alphabets
- Do your activity for e.g. change word to something else with cw
- End recording with q
- Now to change another word like it is done during recording, put cursor at the word and do @a
- Want to run macro again for another word change we can just do @@

__Abbreviations:__
- Can be used to Replace abbreviations with its detailed text Or can be used for common spelling mistakes
- E.g.-1: _iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved_. Here, ccopy is auto replaced with the text next to it.
- E.g.-2: _iabbrev waht what`_
- Note, vim auto changes abbreviations there is no need to press any key

__Split size management:__
- [Stackoverflow link](https://vi.stackexchange.com/questions/514/how-do-i-change-the-current-splits-width-and-height)

__Autocommands:__
- Autocommands are commands thats run when a particular events happens; these are like listeners
- autocmd BufNewFile * :write


