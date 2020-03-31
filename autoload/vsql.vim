function! vsql#GetResultsFromQuery(command)
    let l:user = g:sqh_connections[g:sqh_connection]['user']
    let l:password = g:sqh_connections[g:sqh_connection]['password']
    let l:host = g:sqh_connections[g:sqh_connection]['host']
    let l:db = g:sqh_connections[g:sqh_connection]['database']

	let l:connection_details = 'vsql -w ' . l:password . ' -h ' . l:host . ' -d ' . l:db . ' --pset footer' . l:user
    let l:system_command = 'echo ' . shellescape(join(split(a:command, "\n"))) . ' | ' . l:connection_details
    let l:query_results = system(l:system_command)
    return l:query_results
endfunction


function! vsql#ShowDatabases()
    let db_query = 'iSHOW DATABASE DEFAULT ALL;'
    call sqhell#InsertResultsToNewBuffer('SQHDatabase', vsql#GetResultsFromQuery(db_query), 1)
endfunction

function! vsql#SortResults(sort_options)
    let cursor_pos = getpos('.')
    let line_until_cursor = getline('.')[:cursor_pos[2]]
    let sort_column = len(substitute(line_until_cursor, '[^|]', '', 'g')) + 1
    exec '3,$!sort -k ' . sort_column . ' -t \| ' . a:sort_options
    call setpos('.', cursor_pos)
endfunction

function! vsql#PostBufferFormat()
    keepjumps normal! ggdd
    keepjumps normal! Gdkgg
endfunction

