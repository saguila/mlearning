class Operation
	include Mongoid::Document
	include Mongoid::Enum
	enum :op, [:add, :div, :mul, :sub]
	field :op1, type: Integer
	field :op2, type: Integer
	field :t0, type: Time
	field :t1, type: Time
	field :estimation, type: String

	def self.create
		@operation = Operation.new
		@operation.op1 = rand(10)
		@operation.op2 = rand(10)
		i = rand(4)
		case i
		when 0
			@operation.op = :add
		when 1
			@operation.op = :div
		when 2
			@operation.op = :mul
		when 3
			@operation.op = :sub
		end
		@operation.estimate
		@operation.t0 = Time.new
		@operation.save
		return @operation
	end

	def simbol
		if self.add?
			return '+'
		elsif self.div?
			return '/'
		elsif self.mul?
			return  '*'
		elsif self.sub?
			return  '-' 
		end 
	end
def self.to_csv
      CSV.generate do |csv|
      	csv << ["Operando 1","Operacion","Operando 2"]
      	all.each do |operation|
          csv << [operation.op1,operation.op,operation.op2]
  		end
      end
  	end

def export_to_csv       
    @ops = Operation.find(:all)
    csv_string = CSV.generate do |csv|
         csv << ["Id", "", "Email","Role"]
         @users.each do |user|
           csv << [ops.id,ops.op1,ops.op2,ops.op,ops.t0]
         end
    end         
  
   send_data csv_string,
	:type => 'text/csv; charset=iso-8859-1; header=present',
	:disposition => "attachment; filename=users.csv" 
end 

	def solve
		if self.add?
			return self.op1 + self.op2
		elsif self.mul?
			return self.op1 * self.op2
		elsif self.div?
			return 0 if self.op2 == 0
			return self.op1  self.op2
		elsif self.sub?
			return self.op1 - self.op2
		end 
	end
	
	def total_time
		t1 - t0
	end

	def estimate
		require 'net/http'
		paramns=self.op1.to_s+'/'+self.op2.to_s+'/'+self.op.to_s+'/'
		cadena='http://localhost:5000/predict/'
		self.estimation = Net::HTTP.get(URI.parse(cadena+paramns))
	end	
end
