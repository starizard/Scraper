class Scrape < ActiveRecord::Base
   def initialize(url)
     @url=url
   end
   def get_page
  	 @page=Mechanize.new
	 @page.get(@url)
   end

    def get_search
      @page.forms.first
    end
end
