Compile Rule - Filter (Cont.)
=============================

- Textual output: return content as result

  ~~~
  def run(content)
    content.gsub(/nanoc sucks/i, 'nanoc rocks')
  end
  ~~~
  {:.ruby}

- Binary output: write output file to output_filename

  ~~~
  def run(filename, params = {})
    dimension = params[:dimension] || '200x'
    system %(convert #{filename} -resize #{dimension} #{output_filename})
  end
  ~~~
  {:.ruby}
