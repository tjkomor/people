module ApplicationHelper
  def cc_html(options={}, &blk)
    attrs = options.map { |k, v| " #{h k}='#{h v}'" }.join('')
    [ "<!--[if lt IE 7 ]> <html#{attrs} class='ie lt-ie7 no-js'> <![endif]-->",
      "<!--[if IE 7 ]>    <html#{attrs} class='ie ie7 no-js'> <![endif]-->",
      "<!--[if IE 8 ]>    <html#{attrs} class='ie ie8 no-js'> <![endif]-->",
      "<!--[if IE 9 ]>    <html#{attrs} class='ie ie9 no-js'> <![endif]-->",
      "<!--[if (gt IE 9)|!(IE)]><!--> <html#{attrs} class='no-js'> <!--<![endif]-->",
      capture_haml(&blk).strip,
      "</html>"
    ].join("\n")
  end

  def h(str); Rack::Utils.escape_html(str); end

  def nav_active(page)
    #current_page.path == "#{page}.html" ? 'active' : nil
    false
  end

  def markdown_renderer
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end

  def markdown(content)
    if content
      markdown_renderer.render(content).html_safe
    end
  end

end
