Item
====

- <%= nanoc_api('Item#initialize') %>

  ~~~
  def initialize(raw_content_or_raw_filename,
                 attributes,
                 identifier,
                 params_or_mtime = nil)
  ~~~
  {:.ruby}

- `raw_content_or_raw_filename`
  - The uncompiled item content (if it is a textual item)
  - or the path to the filename containing the content (if it is a binary item)
- `params_or_mtime`: `:mtime`, `:binary`
  