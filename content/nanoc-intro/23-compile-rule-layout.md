Compile Rule - Layout
=====================

- layouts/default.html

  ~~~
  <head><title><%%= item[:title] %></title></head>
  <body><%%= yield %></body>
  ~~~
  {:.rhtml}

- Rules

  ~~~
  compile '*' do
    layout 'default' # <- Layout identifier
  end
  ~~~
  {:.ruby}
