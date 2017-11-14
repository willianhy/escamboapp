class Backoffice::DashboardController < BackofficeController
  def index
  	@categories_groups = Category.all.collect {|c| [c.description, c.ads.count]}
  end
end
