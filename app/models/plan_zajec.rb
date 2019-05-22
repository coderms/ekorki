class PlanZajec < ActiveRecord::Base
  self.table_name = "plan_zajecs"

  has_many :zajecies
end
