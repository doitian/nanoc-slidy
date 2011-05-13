Route Rule
==========

~~~
# default :rep is :default
route '/images/' do
  identifier.chop + '.' + item[:extension]
end

route '/images/', :rep => :thumbnail do
  filename = identifier.sub(%r{^/images/}, '\&thumbnails/'})
  filename.chop + '.' + item[:extension]
end

route '/posts/', :rep => :summary do
  # do not write to output dir
end
~~~
{:.ruby}

- Same pattern rule with **compile**
