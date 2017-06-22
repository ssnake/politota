class CommentDatatable < AjaxDatatablesRails::Base
	def_delegators :@view, :link_to, :h, :mailto
	def view_columns
    @view_columns ||= {
      date: { source: "Comment.date" },
      domain_prefix: { source: "Comment.domain_prefix" },
      text: { source: "Comment.text"},
      text_size: { source: "Comment.text_size" }
    }
  end
  private

  def data
    records.map do |c| {
      
       date: I18n.l(c.date),
      	domain_prefix: c.domain_prefix,
      	text: link_to(c.text, c.url),
      	text_size: c.text_size,
      }
    end
  end

  def get_raw_records
  	 options[:troll].comments
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
