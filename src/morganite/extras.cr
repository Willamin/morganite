module Morganite::Extras
  def title(title_text)
    title { title_text }
  end

  def stylesheet(href)
    link(rel: "stylesheet", href: href)
  end
end
