class Plan < ApplicationRecord
  belongs_to :user

  def plan_set
    created_at.strftime("%y年%m月%d日")
  end

end
