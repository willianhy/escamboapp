class Site::SearchController < SiteController

  def ads
  	@categories = Category.order_by_description
    @ads = Ad.search(params[:q], params[:page])

    cookies[:search_term] = params[:q]
    cookies[:categories] = @categories.to_json

    puts ">>>>>>>>>>> #{cookies[:categories]}"
  end
end
