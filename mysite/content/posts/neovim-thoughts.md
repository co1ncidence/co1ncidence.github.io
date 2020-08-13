---
title: "Why I Use Neovim And Not A Normal Editor"
date: 2020-08-02T22:35:38-05:00
tags:
  - Productivity
  - Opinion
---

As someone who's always given a lot of importance to the concept of a streamlined workflow, I've always been on the lookout for the best possible tools for what I do. One of the most important tools someone like me can use is the **Text Editor**. There are many popular Editors and IDE's out there, and I have tried many of them. For the better part of the last year I have been "Editor Hopping" in search of something to replace what I used to use, which was Apache's NetBeans IDE. It was slow and inefficient and had far too much bloat and unnecessary features for me. I wanted something that did only what I needed it to and that could adapt to my workflow too. I came to the decision of using Neovim, here is a look at what my configuration looks like:

![img](https://i.imgur.com/PIsQIl0.png)

As you can see, it is perfectly optimized for everyday code editing. Neovim's modal editing capabilities and powerful ranges and motions also extend its functionality far over other editors right out of the box. I don't just use Neovim for code, however. Recently I have begun using it as my main editor for Markdown documents as well, and I believe it can replace my older choice, Typora, quite well: 

![img](https://i.imgur.com/HETwUSB.png)

Using plugins like [goyo](https://github.com/junegunn/goyo.vim) and [limelight](https://github.com/junegunn/limelight.vim) greatly help improve the visual potency of Neovim when editing in markdown, both also help improve visibility of the document and make focusing on the actual writing far easier. Other tools like [vim-pencil](https://github.com/reedes/vim-pencil) and [vim-markdown](https://github.com/plasticboy/vim-markdown) help out with the formatting and syntax control of the document. I also use a handful of other plugins in my configuration, for reference, here is my entire plugins block (I use the vim-plug plugin manager):

```vim
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim'
Plug 'reedes/vim-pencil'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentline'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'prettier/vim-prettier'

call plug#end()
```

Some might say that this is an absurd amount of plugins for what is intended to be a minimalist editor, but I have carefully picked and chosen only the plugins that integrate well with what I do. You may have noticed the inclusion of WebDev plugins like [emmet-vim]() and [vim-prettier]() in this list, this is mostly to help with the editing and formatting of HTML files, as I am still quite unused to the syntax of that markup. You may also notice [nerdtree](https://github.com/preservim/nerdtree) and [fzf](https://github.com/junegunn/fzf.vim) in the list, I consider these to be almost essential to every Vim/Neovim user, as they make hopping between files and mass editing so much easier and more efficient. 

**But you may be wondering,** why does having all of this stuff matter, don't other, more mainstream editors have similar, if not better plugins? This is where my second point comes in, Neovim is light, and I mean *light*, It barely comes in at around 10 megabytes with a loaded configuration like mine. It is also far faster than any other editor, being able to load up files that are more than 1000 lines long in under a second. Another aspect to consider is customization, the look and feel of Neovim is 100% under your control, down to even what text the status-bar displays.

Lastly, I would like to mention the ergonomically and intelligently designed keybindings of Neovim and any other Vi-based editor, the convenience of being able to navigate and do basic edits straight from the home row is something that you can never come back from, trust me, try it out and you will never regret it.

#### Thanks for staying with me through this little opinionated post, I hope you enjoyed it!
