module ApplicationHelper
  def error_messages_for(object)
    render("layouts/error",object: object)
  end
  def lesc(text)
    LatexToPdf.escape_latex(text)
  end

end
