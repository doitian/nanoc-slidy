Helpers
=======

- Helpers are exposed global methods
- Built-in <%= nanoc_api('Helpers') %>
- Sample `lib/helpers.rb`

  ~~~
  include Nanoc3::Helpers::HTMLEscape

  module MyHelpers
    def now
      Time.now
    end
  end
  include MyHelpers
  ~~~
  {:.ruby}