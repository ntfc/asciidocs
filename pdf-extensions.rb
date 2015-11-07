require 'asciidoctor-pdf' unless defined? ::Asciidoctor::Pdf

module AsciidoctorPdfExtensions
  # to move a open block (--) to the bottom of the page
  def convert_open node
    # delegate to default implementation
    if node.role == "copyright"
      move_node_to_bottom node
    else
      super
    end
  end

  def layout_chapter_title node, title
    if node.sectname == "colophon" # the colophon page

    end
    super
  end

  def layout_running_content position, doc, opts = {}
    # remove the left part from colophon footer
    if position.to_s == "footer" && (doc.attr? 'colophon_no_left_footer')
      puts "Removing left footer from colophon page.."
      opts[:colophon_no_left_footer] = true
    end
    super
  end

  def move_node_to_bottom node
    move_down 415
    node.content
  end
end

Asciidoctor::Pdf::Converter.prepend AsciidoctorPdfExtensions
