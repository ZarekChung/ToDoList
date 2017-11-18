class Todolist < ApplicationRecord
  validates_presence_of :name, :expired_date
end
