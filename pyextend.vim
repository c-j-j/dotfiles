let s:py_path = join([expand('<sfile>:p:h:h'), 'dotfiles/python'], '/')
exec "python sys.path.append(r'" . s:py_path . "')"
exec 'pyfile ' . fnameescape(s:py_path . '/test.py')
