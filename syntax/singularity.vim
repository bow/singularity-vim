" Vim syntax file for Singularity recipe files.
"
" Language: Singularity Recipe <http://singularity.lbl.gov>
" Maintainer: Wibowo Arindrarto <contact@arindrarto.dev>
" Latest Revision: 18 October 2017
"
" Copyright (c) 2015-2022 Wibowo Arindrarto <contact@arindrarto.dev>
" SPDX-License-Identifier: BSD-3-Clause

if exists("b:current_syntax")
    finish
endif

syntax include @sh syntax/sh.vim
try
  syntax include @sh after/syntax/sh.vim
catch
endtry

syntax region singularitySection
    \ matchgroup=singularitySectionName
    \ start=/^%\w\+/
    \ end=/^%\w\+/me=s-1
    \ contains=@sh
highlight default link singularitySectionName Function

" %(app)help sections has highlighting priority over other sections
syntax region singularityHelpSection
    \ matchgroup=singularitySectionName
    \ start=/^%\(app\)\?help\(\s\+\w\+\)\?/
    \ end=/^%\w\+/me=s-1
highlight default link singularityHelpSection String

syntax region singularityLabelSection
    \ matchgroup=singularitySectionName
    \ start=/^%\(app\)\?labels\(\s\+\w\+\)\?/
    \ end=/^%\w\+/me=s-1
highlight default link singularityLabelSection String

syntax match singularityComment
    \ "#.*$" display
highlight default link singularityComment Comment

syntax match singularityKeyword /\v^(Bootstrap|From|OSVersion|MirrorURL|Include)/
highlight default link singularityKeyword Keyword

let b:current_syntax = "singularity"
