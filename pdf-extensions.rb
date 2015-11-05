require 'asciidoctor-pdf' unless defined? ::Asciidoctor::Pdf

module AsciidoctorPdfExtensions
  def convert_paragraph node
    # delegate to default implementation
    super
  end

  def layout_chapter_title node, title
    move_down 50
    super
  end
end

Asciidoctor::Pdf::Converter.prepend AsciidoctorPdfExtensions
