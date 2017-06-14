module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults 
    @page_title = "My Portfolio Blog"
    @seo_keywords = "Thai Nguyen portfolio" 
  end # @page_title and @seo_keywords are also 
end   # avaible in all controllers