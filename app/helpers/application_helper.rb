module ApplicationHelper
  def nav_link (label, path, options=nil)
    result = "<li"
    if request.fullpath.rindex path
      result += " class 'active'";
    end
    result += ">"+link_to(label, path, options)+"</li>"

    return result.html_safe
  end

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)
    doc.css("pre[@lang]").each do |pre|
      options = {:encoding => 'utf-8'}
      begin
        pre.replace Pygments.highlight(pre.text.rstrip, lexer: pre[:lang], options: options)
      rescue
        pre.replace Pygments.highlight(pre.text.rstrip, options: options)
      end

    end
    style = Nokogiri::XML::Node.new("style", doc)
    style.content=Pygments.css('.highlight')
    doc.at_css("pre").children.first.add_previous_sibling(style)
    doc.to_html
  end
end

