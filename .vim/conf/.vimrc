set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



" The following are examples of different formats supported.
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Add general set
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" " according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
"
"if has("autocmd")
" au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
" "for simplicity, "au BufReadPost * exe "normal! g`\"", is Okay.
"endif

"Add general set
set t_Co=256
set showcmd     " Show (partial) command in status line.
set showmatch       " Show matching brackets.
"set ignorecase     " Do case insensitive matching
""set smartcase      " Do smart case matching
"set incsearch      " Incremental search
""set autowrite      " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
set mouse=a        " Enable mouse usage (all modes)
"set cc=80   80提示线
"
set helplang=cn
"Tab = 4 char
set ts=2
set expandtab
set autoindent


" others set
syntax on
set nu
set hlsearch
"ctermbg=black ctermfg=white guibg=darkred guifg=white
"
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>
"
"
" colorscheme peachpuff
set cindent
set softtabstop=2
set shiftwidth=2
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\%=%{strftime('%Y-%m-%d\ %H:%M')}
hi statusline cterm=NONE
hi statusline  ctermbg=239 ctermfg=250
hi statuslinenc  ctermbg=250 ctermfg=235
hi statuslineterm  ctermbg=239 ctermfg=250
hi statuslinetermnc  ctermbg=235 ctermfg=250
set laststatus=2

set ruler


set cursorline
hi CursorLine cterm=NONE ctermbg=236
hi MatchParen ctermbg=24
highlight LineNr ctermbg=236
highlight LineNr ctermfg=249

hi PMenu cterm=NONE ctermbg=236 ctermfg=253
hi PMenuSel cterm=NONE ctermbg=245 ctermfg=253

hi search term=reverse ctermbg=24 guibg=Cyan

"文件保存与退出
nmap fw     :w<CR>
nmap fq     :q<CR>
nmap fwq    :wq<CR>
nmap fh     :sh<CR>
" map ESC
"imap jjj  :<Esc>

"split win 分割窗口
nmap <S-v> :split<CR>
nmap <S-h> :vsplit<CR>

"括号自动补全
"inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"inoremap " ""<Esc>i

""autocmd自动生成tags
""if exists()
""autocmd BufWritePost * call ststem ("ctags -R")

"Mac 删除键
set backspace=2



""autocmd c

""cscope
if executable("cscope")
  let cscope_ = "cscope -Rbq"
  silent exec !cscope_
else
  echohl Title
  echo "!!!Warning This systme is not install cscope! You may not be able to use cscope functions!"
  echohl None
endif
if filereadable("cscope.out")
  au BufReadPost exe "cscope add cscope.out" 
endif
"cscope conf
nmap<S-f>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <S-f>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <S-f>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <S-f>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <S-f>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <S-f>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <S-f>i :cs find i^ <C-R>=expand("<cfile>")<CR>$<CR>
nmap <S-f>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"cpplint
Plugin 'rsaraf/vim-advanced-lint'
"vim-autofamat
Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
let g:formatdef_my_cpp = '"astyle --mode=c --style=google -pcH".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_cpp = ['my_cpp']
if &filetype == 'c'
  au BufWrite * :Autoformat
endif
if &filetype == 'cc'
  au BufWrite * :Autoformat
endif
if &filetype == 'cpp'
  au BufWrite * :Autoformat
endif
if &filetype == 'h'
  au BufWrite * :Autoformat
endif
if &filetype == 'hpp'
  au BufWrite * :Autoformat
endif

"c/cpp syntax highlight
"***vim-cpp-enhanced-highlight.vim***
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1




"************** tagbar start ***********************************************
"chack ctags
if !executable("ctags")
  echo "Warning This systme is not install ctags! You may be not use ctags functions!"
endif
"plugin tagbar
Plugin 'majutsushi/tagbar'
nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
let g:tagbar_width=30                   "窗口宽度的设置
map <F7>  :Tagbar<CR>
let g:tagbar_autofocus = 1
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启
"************** targbar end ***********************************************

"********************************** NERDTree start *****************************************
Plugin 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F5> :NERDTreeToggle<CR>
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" " Open a NERDTree
" ********NERD Tree
"********************************** NERDTree end *****************************************


"********************************** syntastic start *****************************************
""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
""whether to show balloons
let g:syntastic_enable_balloons = 1
"********************************** syntastic  end *****************************************







"********************************** ctrlp set start *****************************************
"ctrlp
""<Leader>p搜索当前目录下文件
"let g:ctrlp_map = '<Leader>p'
"let g:ctrlp_cmd = 'CtrlP'
"<Leader>f搜索MRU文件
"nmap <Leader>f :CtrlPMRUFiles<CR>
""<Leader>b显示缓冲区文件，并可通过序号进行跳转
"nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
"let g:ctrlp_custom_ignore = {
" \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
" \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
" \ }
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
"let g:ctrlp_max_height = 15
"let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
"let g:ctrlp_mruf_max = 500
"let g:ctrlp_follow_symlinks = 1
"            "默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
"let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
"let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
"let g:ctrlp_line_prefix = '♪ '
"********************************** ctrlp set end *****************************************



"************************************** for YCM set start **********************************
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
hi SpellBad  term=reverse ctermbg=1 ctermfg=15 gui=undercurl guisp=Red
" open error win
nmap <F6> :YcmDiags<CR>
set splitbelow
".c .h jump
nmap <F4> :A<CR>
"jum fuction
nmap <F6>:YcmCompleter GoTo<CR>
let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt=longest,menu ""让Vim的补全菜单行为与一般IDE一致(參考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  "离开插入模式后自己主动关闭预览窗体
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都又一次生成匹配项
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

"跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf_cpp.py'
"highlight PMenu cterm=NONE ctermfg=50 ctermbg=242
"highlight PMenuSel cterm=NONE ctermfg=242 ctermbg=8

"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_key_invoke_completion = '<c-space>'

"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>
"let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_auto_trigger = 1
"let g:ycm_cache_omnifunc = 1
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_semantic_triggers =  {
" \   'c': ['->', '.'],
"\   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"\            're!\[.*\]\s'],
"\   'ocaml': ['.', '#'],
"\   'cpp,cuda,objcpp': ['->', '.', '::'],
"\   'perl': ['->'],
"\   'php': ['->', '::'],
"\   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
"\   'ruby,rust': ['.', '::'],
"\   'lua': ['.', ':'],
"\   'erlang': [':'],
"\ }

"************************************** for YCM set end **********************************
"
"
"
"
"################## for nerdcommenter set start###############################
"Plugin 'scrooloose/nerdcommenter'
"Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
"let g:NERDToggleCheckAllLines = 1

"############################### for echofunc set start####################
"Plugin 'vim-script/Echofunc'


"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cc,*.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#########################################################################")
    call append(line("."), "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: JayGuan")
    call append(line(".")+2, "\# mail:")
    call append(line(".")+3, "\# Created Time: ".strftime("%c"))
    call append(line(".")+4, "\#########################################################################")
    call append(line(".")+5, "\#!/bin/bash")
    call append(line(".")+6, "")
  else
    call setline(1, "/*************************************************************************")
    call append(line("."), "    > File Name: ".expand("%"))
    call append(line(".")+1, "    > Author: JayGuan")
    call append(line(".")+2, "    > Mail: ")
    call append(line(".")+3, "    > Created Time: ".strftime("%c"))
    call append(line(".")+4, " ************************************************************************/")
    call append(line(".")+5, "")
  endif
  if &filetype == 'cpp'
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "using namespace std;")
    call append(line(".")+8, "int main(int argc,char * argv[])")
    call append(line(".")+9, "{")
    call append(line(".")+10, "return 0;")
    call append(line(".")+11, "}")
    call append(line(".")+12, "")
  endif
  if &filetype == 'c'
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "int main(int argc,char * argv[])")
    call append(line(".")+8, "{")
    call append(line(".")+9, "return 0;")
    call append(line(".")+10, "}")
    call append(line(".")+11, "")
    call append(line(".")+12, "")
  endif
  endfunc
  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G

  """"显示当前行所在的函数名字“”“

  fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
  endfun
  map f :call ShowFuncName() <CR>


  "-----------------------美化标签栏-----------------------
  "定义颜色
  hi SelectTabLine term=Bold cterm=Bold gui=Bold ctermbg=None
  hi SelectPageNum cterm=None ctermfg=Red ctermbg=None
  hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=None

  hi NormalTabLine cterm=Underline ctermfg=Black ctermbg=LightGray
  hi NormalPageNum cterm=Underline ctermfg=DarkRed ctermbg=LightGray
  hi NormalWindowsNum cterm=Underline ctermfg=DarkMagenta ctermbg=LightGray

  function! MyTabLabel(n, select)
    let label = ''
    let buflist = tabpagebuflist(a:n)
    for bufnr in buflist
      if getbufvar(bufnr, "&modified")
        let label = '+'
        break
      endif
    endfor

    let winnr = tabpagewinnr(a:n)
    let name = bufname(buflist[winnr - 1])
    if name == ''
      "为没有名字的文档设置个名字
      if &buftype == 'quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    else
      "只取文件名
      let name = fnamemodify(name, ':t')
    endif

    let label .= name
    return label
  endfunction

  function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " 选择高亮
      let hlTab = ''
      let select = 0
      if i + 1 == tabpagenr()
        let hlTab = '%#SelectTabLine#'
        " 设置标签页号 (用于鼠标点击)
        let s .= hlTab . "[%#SelectPageNum#%T" . (i + 1) . hlTab
        let select = 1
      else
        let hlTab = '%#NormalTabLine#'
        " 设置标签页号 (用于鼠标点击)
        let s .= hlTab . "[%#NormalPageNum#%T" . (i + 1) . hlTab
      endif

      " MyTabLabel() 提供标签
      let s .= ' %<%{MyTabLabel(' . (i + 1) . ', ' . select . ')} '

      "追加窗口数量
      let wincount = tabpagewinnr(i + 1, '$')
      if wincount > 1
        if select == 1
          let s .= "%#SelectWindowsNum#" . wincount
        else
          let s .= "%#NormalWindowsNum#" . wincount
        endif
      endif
      let s .= hlTab . "]"
    endfor

    " 最后一个标签页之后用 TabLineFill 填充并复位标签页号
    let s .= '%#TabLineFill#%T'

    " 右对齐用于关闭当前标签页的标签
    if tabpagenr('$') > 1
      let s .= '%=%#TabLine#%999XX'
    endif

    return s
  endfunction
  set tabline=%!MyTabLine()

" lldb 调试器
Plugin 'gilligan/vim-lldb'
