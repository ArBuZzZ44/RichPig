class CapitalPolicy < ApplicationPolicy
	def index?
    user_present?
  end

	def completed?
		user_present?
	end

  def show?
    user.author?(record)
  end

  def create?
    user_present?
  end

  def update?
    false
  end

  def destroy?
    false
  end
end