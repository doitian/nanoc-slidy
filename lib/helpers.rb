include Nanoc3::Helpers::Capturing
include Nanoc3::Helpers::Filtering
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::HTMLEscape

require 'cgi'

module Nanoc3Helpers
  def slide_classes
    classes = ['slide']
    classes << item[:class]
    classes << item[:classes]

    classes.flatten.compact.collect(&:strip).reject(&:empty?).sort.uniq.join(' ')
  end

  def nanoc_api(name, title = nil)
    title ||= name
    url = 'http://nanoc.stoneship.org/docs/api/3.1/Nanoc3/'
    if name.include?('#')
      klass, instance_method = name.split('#')
    elsif name.include?('.')
      klass, class_method = name.split('.')
    else
      klass = name
      klass_parts = klass.split('::')
      if klass_parts.last =~ /^[A-Z0-9_]*$/
        constant = klass_parts.pop
      end
      klass = klass_parts.join('::')
    end

    url += klass.gsub('::', '/') + '.html'
    if instance_method
      url += '#' + CGI.escape(instance_method) + '-instance_method'
    elsif class_method
      url += '#' + CGI.escape(class_method) + '-class_method'
    elsif constant
      url += '#' + CGI.escape(constant) + '-constant'
    end

    %Q(<a href="#{url}">#{CGI.escape_html(title)}</a>)
  end
end
include Nanoc3Helpers
