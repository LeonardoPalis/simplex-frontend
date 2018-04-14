class Admin::HomeController < AdminController
	before_action :authenticate_admin_user!

	def index
		@work = Work.all.group(:product_id)
		@num_works = @work.count
		
	end


end
