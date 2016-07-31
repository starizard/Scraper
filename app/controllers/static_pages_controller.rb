class StaticPagesController < ApplicationController
  def index
  	@pages=Scrape.new("http://reddit.com")
  	@pages=@pages.get_page
  	@form=@pages.form_with(:action=> "https://www.reddit.com/search")
  	@form.fields.first.value=params[:search]
  	@result=@form.click_button

  	@titles=@result.search(".search-result-link .search-title")
  
  end

  def help
  end
end
