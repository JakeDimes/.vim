function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-peek-definition)
    nmap <buffer> gD <plug>(lsp-definition)
    nmap <buffer> \gd :vsp<cr><plug>(lsp-definition)
    nmap <buffer> -gd :sp<cr><plug>(lsp-definition)
    nmap <buffer> gg <plug>(lsp-peek-declaration)
    nmap <buffer> gG <plug>(lsp-declaration)
    nmap <buffer> \gg :vsp<cr><plug>(lsp-peek-declaration)
    nmap <buffer> -gg :sp<cr><plug>(lsp-declaration)
    nmap <buffer> gi <plug>(lsp-peek-implementation)
    nmap <buffer> gI <plug>(lsp-implementation)
    nmap <buffer> \gi :vsp<cr><plug>(lsp-implementation)
    nmap <buffer> -gi :sp<cr><plug>(lsp-implementation)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gm <plug>(lsp-peek-implementation)
    nmap <buffer> gM <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-peek-type-definition)
    nmap <buffer> gT <plug>(lsp-type-definition)
    nmap <buffer> \gt :vsp<cr><plug>(lsp-type-definition)
    nmap <buffer> -gt :sp<cr><plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> gh <plug>(lsp-call-hierarchy-incoming)
    nmap <buffer> gH <plug>(lsp-call-hierarchy-outgoing)
    "nnoremap <buffer> <expr><c-k> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-j> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_preview_float=1
let g:lsp_experimental_workspace_folders=0
let g:lsp_diagnostics_virtual_text_enabled=0
let g:lsp_diagnostics_float_cursor=1
let g:lsp_diagnostics_float_delay=500
