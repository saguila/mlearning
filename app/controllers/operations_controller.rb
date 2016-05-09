class OperationsController < ApplicationController	
	
	def index

	end

	def show

	end

	def index

	end

	def create

	end

	def new
		@operation = Operation.create
'''
msg = Operation.solve_operation
		@operation.op1 = rand(10)
		@operation.op2 = rand(10)
		i = rand(4)
		case i
		when 0
			@simbol = "+"
			@operation.op = :add
		when 1
			@simbol = "/"
			@operation.op = :div
		when 2
			@simbol = "*"
			@operation.op = :mul
		when 3
			@simbol = "-"
			@operation.op = :sub
		end	

		@operation.estimate
		@operation.t0 = Time.new
		@operation.save
		'''
		#redirect_to new_operation_path
	end

	def answer
		@operation = Operation.find(params[:id])
		if @operation.op1 - @operation.op2 = params[:resp].to_i
		@operation.t1 = Time.new
		@operation.save
		else
			render new
		end
	end
end
