Smarter tab expansion for Vim
=============================

Let `_` be a space and `--->` be a tab.

Suppose you hit `<Tab>` here:

```
--->
    ^<Tab>
```

It doesn't make sense to insert spaces here, but if `'expandtab'` is on, then
spaces would get inserted anyway.

Suppose you hit `<Tab>` here:

```
____
    ^<Tab>
```

It doesn't make sense to insert a tab here, but if `'expandtab'` is off, then
a tab would get inserted anyway.

Using `'smarttab'` or `'softtabstop'` forces your `'expandtab'` behavior onto
the file, while using this plugin will respect whatever choice of indentation or
alignment that was already there.

Customization
=============

Use `g:smartexpandtab_map` to disable the default `<Tab>` mapping.
E.g.,
```
	let g:smartexpandtab_map = 0
```

Use `<Plug>SmartExpandTab` to define your own mapping.
E.g.,
```
	imap <Leader><Tab> <Plug>SmartExpandTab
```

Use `smartexpandtab#tab()` in `<expr>` mappings.
E.g.,
```
	imap <silent><expr><Leader><Tab> smartexpandtab#tab()
```

Caveats
=======

Vim does its own thing with tabs and spaces in these cases when
`'expandtab'` is off:

1. at the start of a line, `'smarttab'` is on, and `'shiftwidth'` is not
   a multiple of `'tabstop'`.
2. `'softtabstop'` is negative, and `'shiftwidth'` is not a multiple of
   `'tabstop'`.
3. `'softtabstop'` is set, and not a multiple of `'tabstop'`.

It doesn't make sense for the plugin to function in these cases, so it will
just do nothing.