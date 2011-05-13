Assets DataSource
=================

- <%= nanoc_api('DataSources::FilesystemUnified', 'FilesystemUnified') %> does
  not allow files with same name and only different extension
  - favicon.png, favicon.ico, favicon.svg
  - jquery.js, jquery.min.js

- Override identifier `DataSources::Filesystem#identifier_for_filename`
- Or implement one [FilesystemAssetsDataSource](https://github.com/doitian/iany.me/blob/31912fa8e48b08def1bcd28de2953247afe4c2d3/lib/filesystem_assets_data_source.rb)
