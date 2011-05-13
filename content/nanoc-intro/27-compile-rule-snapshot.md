Compile Rule - Snapshot
=======================

- Take snapshot at any stage

  ~~~
  compile '*' do
    filter :kramdown
    snapshot :html_snippet
    filter :pygments
    snapshot :highlighted
  end
  ~~~
  {:.ruby}
  
- Auto snapshots
  - `raw`: loaded from data source
  - `last`: last compilation stage
  - `pre`: before applying first layout