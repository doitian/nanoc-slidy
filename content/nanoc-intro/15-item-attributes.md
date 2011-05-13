Item Attributes
===============

- Built-in: `filename`, `extension`

- Customizable

  ~~~~~
  ---
  title: Nanoc Intro
  theme: default
  ---
  ...
  ~~~~~
  {:.yaml}

- Access through `[]`

  ~~~
  item[:filename], item[:duration]
  ~~~
  {:.ruby}