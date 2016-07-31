class StaticPagesController < ApplicationController
  def index
  
   if params[:site]=="Digg" then
   	flash[:success]="Returned results from Digg"
    @pages=Scrape.new("http://digg.com/search?q=welcome")
	@pages=@pages.get_page
	@form=@pages.form_with(:id=>"search-page-form")
	@form.fields.first.value=params[:search]
	@result=@form.click_button

	@titles=@result.search("h2 a")
   else
   	if params[:site]=="Reddit"
   	  flash[:success]="Returned results from Reddit"
   	 end
   	 @pages=Scrape.new("http://reddit.com")
  	 @pages=@pages.get_page
  	 @form=@pages.form_with(:action=> "https://www.reddit.com/search")
  	 @form.fields.first.value=params[:search]
  	 @result=@form.click_button
     @titles=@result.search(".search-result-link .search-title")
   end
  end

  def help
  end
end
