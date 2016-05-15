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
	end

	def answer
		@operation = Operation.find(params[:id])
		@sol=params[:respuesta].to_i
		if @sol = params[:respuesta].to_i
			@operation.t1 = Time.new
			@operation.save
		else
			render 'new_operation_path'
		end
	end
	def downloadOperation
		@operation = Operation.all
   		respond_to do |format|
      	  format.html
          format.csv { send_data @operation.to_csv}
      end
	end
	def export_operations
	    @operation = Operation.all
	    operation_csv = CSV.generate({:col_sep => ";"}) do |csv|
		    csv << ["Operando1","Operacion","Operando2"]
			@operation.each do |operation|
				csv << [operation.op1,operation.op,operation.op2]
	    	end
	    end
	    send_data(operation_csv, :type => 'text/csv', :filename => 'all_operations.csv')
 	end

end
