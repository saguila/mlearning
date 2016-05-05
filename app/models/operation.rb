class Operation
	include Mongoid::Document
	include Mongoid::Enum
	enum :op, [:add, :div, :mul, :sub]
	field :op1, type: Integer
	field :op2, type: Integer
	field :t0, type: Time
	field :t1, type: Time
	field :estimation, type: String

	def total_time
		t1 - t0
	end
	def estimate
		#self.estimation = HTTP.get("http://localhost:3000/predict#{op1.to_f}").to_s
	end	
end
