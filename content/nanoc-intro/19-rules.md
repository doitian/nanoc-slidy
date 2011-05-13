Rules
=====

~~~
# file Rules
compile '*' do # CompilerDSL
  filter :erb # RuleContext from here
  filter :kramdown
  layout 'default'
end
~~~
{:.ruby}

- <%= nanoc_api('CompilerDSL') %>
  - `compile`
  - `route`
  - `layout`

- <%= nanoc_api('RuleContext') %>
  - `filter`
  - `layout`
  - `snapshot`
  - attributes: `rep`, `item`, `site`, `config`, `items`, `layouts`
  ^
{:.hbox}