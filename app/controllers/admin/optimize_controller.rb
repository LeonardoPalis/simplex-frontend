class Admin::OptimizeController < AdminController
	before_action :authenticate_admin_user!
	before_action :create_send_products, only:[:index]

	def index
		
		@products = Product.all.joins(:works).group(:product_id)
		@work = Product.all.joins(:works).group(:product_id)
		
	end

	def create_send_products
    	@i = 1
		send_products = Product.joins(:works).distinct
		send_products.each do |product| 
			product.variable_name = "x#{@i}"
			product.save
			@i = @i + 1
		end

		@to_send_objective = ""
		send_products = Product.joins(:works).distinct
		@to_send_objective = "#{send_products.first.net_profit}#{send_products.first.variable_name}"
		send_products.each_with_index do |product,index| 
			if index > 0
				@to_send = "#{@to_send_objective}+#{product.net_profit}#{product.variable_name}"
			end
		end

		@resources = Resource.select(:name).distinct
		@a_resources = Array.new(@resources.count)

		@resources.each_with_index do |resource,index| 
			rec = Resource.where(name: resource.name)
			label_rec = "#{rec.first.quantity}#{Product.where(id: rec.first.product_id).first.variable_name}"
			
			rec.each_with_index do |r,index2|
				if index2 > 0
					label_rec = "#{label_rec}+#{r.quantity}#{Product.where(id: r.product_id).first.variable_name}"
				end
			end
			label_rec = "#{label_rec}<=#{TypeResource.where(name: resource.name).first.max_quantity}"
			@a_resources[index] = label_rec
		end

		@works = Work.select(:employee_id).distinct
		@a_employees = Array.new(@works.count)
		@works.each_with_index do |work,index|
			employee = Work.where(employee_id: work.employee_id)
			label_employee = "#{employee.first.hour_per_unit}#{Product.where(id: employee.first.product_id).first.variable_name}"
			employee.each_with_index do |w,index2|
				if index2 > 0
					label_employee = "#{label_employee}+#{w.hour_per_unit}#{Product.where(id: w.product_id).first.variable_name}"
				end
			end
			label_employee = "#{label_employee}<=#{Employee.where(id: work.employee_id).first.work_hours}"
			@a_employees[index] = label_employee
		end
		
    end


end
