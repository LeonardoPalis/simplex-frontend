class Admin::BaseController < ApplicationController
	before_action :authenticate_admin_user!

	layout "admin"

end
