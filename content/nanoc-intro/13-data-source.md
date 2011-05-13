Data Source
===========

~~~
data_sources:
  -
    type: filesystem_unified
    items_root: /
    layouts_root: /
~~~
{:.yaml}

- Inherit from <%= nanoc_api('DataSource') %>
- Implement <%= nanoc_api('DataSource#items') %> and/or <%= nanoc_api('DataSource#layouts') %>
- Built-in <%= nanoc_api('DataSources') %>