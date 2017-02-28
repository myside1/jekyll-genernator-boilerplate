require 'redcarpet'
class LazyRetinaImg < Redcarpet::Render::HTML
  def image(link, title, alt_text)
    "<img 
    data-src='#{link}' 
    class='lazyload' 
    data-sizes='auto' 
    alt='#{alt_text}' 
    data-rjs='2' />"
  end
end
class Jekyll::Converters::Markdown::Lazyretina
  def initialize(config)
    @config = config
    @converter = Redcarpet::Markdown.new(LazyRetinaImg, extensions = {})
  end
  def convert(content)
    @converter.render(content)
  end
end