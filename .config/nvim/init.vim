"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
if !exists('g:vscode')
  source $HOME/.config/nvim/plug-config/polyglot.vim
endif
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim " Study this file for key mappings

if exists('g:vscode')
  " VS Code extension
  source $HOME/.config/nvim/vscode/settings.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/highlightyank.vim
else

  " Themes
  source $HOME/.config/nvim/themes/syntax.vim " CBR
  source $HOME/.config/nvim/themes/nvcode.vim " R

  " Plugin Configuration
  source $HOME/.config/nvim/keys/which-key.vim " R
  source $HOME/.config/nvim/plug-config/vim-commentary.vim " R
  source $HOME/.config/nvim/plug-config/rnvimr.vim " Not Sure Ranger Config can be removed
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  " source $HOME/.config/nvim/plug-config/fzf.vim " Configure Properly
  source $HOME/.config/nvim/plug-config/codi.vim " Simillar to quokka as of now Not Required
  luafile $HOME/.config/nvim/lua/nvcodeline.lua
  luafile $HOME/.config/nvim/lua/treesitter.lua
  source $HOME/.config/nvim/plug-config/coc/coc.vim " R
  source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim " Remove some extensions all not required
  source $HOME/.config/nvim/plug-config/easymotion.vim " Can be really helpful
  " source $HOME/.config/nvim/plug-config/goyo.vim
  source $HOME/.config/nvim/plug-config/vim-rooter.vim " R
  source $HOME/.config/nvim/plug-config/start-screen.vim " R
  source $HOME/.config/nvim/plug-config/gitgutter.vim " R
  source $HOME/.config/nvim/plug-config/git-messenger.vim " R
  source $HOME/.config/nvim/plug-config/closetags.vim " CBR
  source $HOME/.config/nvim/plug-config/floaterm.vim " Can be really helpful
  source $HOME/.config/nvim/plug-config/barbar.vim " R
  " source $HOME/.config/nvim/plug-config/far.vim " Can be really helpful
  " source $HOME/.config/nvim/plug-config/tagalong.vim
  " source $HOME/.config/nvim/plug-config/bracey.vim
  " source $HOME/.config/nvim/plug-config/asynctask.vim
  " source $HOME/.config/nvim/plug-config/window-swap.vim
  " source $HOME/.config/nvim/plug-config/markdown-preview.vim
  source $HOME/.config/nvim/plug-config/neovide.vim
  luafile $HOME/.config/nvim/lua/plug-colorizer.lua
  source $HOME/.config/nvim/plug-config/vimspector.vim " Not Sure About this
  " source $HOME/.config/nvim/plug-config/sneak.vim
  " source $HOME/.config/nvim/plug-config/rainbow.vim
  " source $HOME/.config/nvim/plug-config/illuminate.vim " Can be used later
  " source $HOME/.config/nvim/plug-config/vista.vim
  " source $HOME/.config/nvim/plug-config/xtabline.vim
  " source $HOME/.config/nvim/plug-config/ale.vim
endif
source $HOME/.config/nvim/plug-config/quickscope.vim

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif

" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
