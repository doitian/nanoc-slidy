Access Snapshot
===============

- <%= nanoc_api('Item#compiled_content') %>
- `compiled_content(params = {})`
  - `:rep` representation name, default value `:default`
  - `:snapshot` snapshot name, default value `:pre || :last`
- **Auto** dependencies detection  