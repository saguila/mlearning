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
		elsif self.div?
			return self.op1 / self.op2
		elsif self.mul?
			return 0 if self.op2 == 0
			return self.op1 * self.op2
		elsif self.sub?
			return self.op1 - self.op2
		end 
	end
	
	def total_time
		t1 - t0
	end

	def estimate
		#self.estimation = HTTP.get("http://localhost:5000/predict/#{op1.to_f}/").to_s
	end	
end
