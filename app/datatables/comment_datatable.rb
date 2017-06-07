class CommentDatatable < AjaxDatatablesRails::Base
	def_delegators :@view, :link_to, :h, :mailto
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Comment.id']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Comment.id']
  end

  private

  def data
    records.map do |c|
      [
        I18n.l(c.date),
      	c.domain_prefix,
      	link_to(c.text, c.url),
      	c.text_size,
      ]
    end
  end

  def get_raw_records
    Comment.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
