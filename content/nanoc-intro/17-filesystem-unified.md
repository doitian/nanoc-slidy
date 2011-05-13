Filesystem Unified
==================

- <%= nanoc_api('DataSources::FilesystemUnified') %>
- Load items from **content**, layouts from **layouts**
- Identifier rule:

  <pre>
  content/foo/bar.baz.html    → /foo/bar/ OR /foo/bar.baz/
  content/foo/bar/index.html  → /foo/bar/
  content/foo.bar/index.html  → /foo.bar/
  </pre>

  ~~~  
  data_sources:
    -
      type: filesystem_unified
      config:
        allow_periods_in_identifiers: true
  ~~~
  {:.yaml}
