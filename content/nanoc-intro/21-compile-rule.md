Compile Rule
============

~~~
# default :rep is :default
compile '/bar/' do
  filter :erb
  filter :kramdown
  layout 'default'
end

compile '/bar/', :rep => :raw do
  # do nothing
end
~~~
{:.ruby}
