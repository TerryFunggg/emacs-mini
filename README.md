Requre Version:
 >= 28

## Branches:

| Name      | Desc                                                 |
|-----------|------------------------------------------------------|
| main      | heavily personal, using external packages            |
| short-gun | only use emacs build-in packages                     |
|           |                                                      |

## File Structure

```
.
├── init.el                     -- entry point
├── modules                     -- all my custom configs
│   ├── my-alias.el             -- some emacs command alias
│   ├── my-better-edit.el       -- better edit like C-a C-e, expand-region
│   ├── my-citre.el             -- ctags
│   ├── my-eglot.el             -- LSP server
│   ├── my-elfeed.el            -- RSS feed
│   ├── my-emacs-util.el        -- config some emacs buildin packages
│   ├── my-functions.el         -- custom functions
│   ├── my-keys.el              -- my key maps
│   ├── my-langs.el             -- program languages config
│   ├── my-lsp.el               -- LSP server 2 (choose eglot or this)
│   ├── my-macros.el            -- some fun macros
│   ├── my-org.el               -- my Org config
│   ├── my-template.el          -- function for insert template to buffer
│   └── my-utils.el             -- include some external package configs
├── snippets                    -- all the snippets store here
├── templates                   -- all template file store here call (my-func/insert-template)
└── README.md
```

