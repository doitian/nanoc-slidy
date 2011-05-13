Compile Rule - Pygments Filter
==============================

- [PygmentsFilter](https://github.com/doitian/iany.me/blob/master/lib/pygments_filter.rb)
- Use it in Rules

  ~~~
  compile '*' do
    filter :pygments
    layout 'default'
  end
  ~~~
  {:.ruby}

- <%= nanoc_api('Filters', 'Built-in filters') %>