class PygmentsFilter < Nanoc3::Filter

  def run(content, params={})
    require 'nokogiri'

    # Colorize
    doc = Nokogiri::HTML.fragment(content)
    doc.css('pre[class]').each do |element|
      language = element['class']
      unless language == 'latex'
        highlighted_code = pygmentize(element.inner_text, language, params)
        element.inner_html = '<code>'+highlighted_code+'</code>'
        element['class'] = "highlight language-#{language}"
      end
    end

    doc.to_html(:encoding => 'UTF-8')
  end

  private

  def pygmentize(code, language, params={})
    IO.popen("pygmentize -l #{language} -f html", "r+") do |io|
      io.write(code)
      io.close_write
      highlighted_code = io.read

      doc = Nokogiri::HTML.fragment(highlighted_code)
      return doc.xpath('./div[@class="highlight"]/pre').inner_html(:encoding => 'UTF-8')
    end
  end

end

Nanoc3::Filter.register 'PygmentsFilter', :pygments
