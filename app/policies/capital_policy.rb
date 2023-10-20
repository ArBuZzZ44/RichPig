class CapitalPolicy < ApplicationPolicy
	def index?
    !user.guest?
  end

	def completed?
		!user.guest?
	end

  def show?
    user.author?(record)
  end

  def create?
    !user.guest?
  end

  def update?
    user.admin_role? || user.moderator_role? || user.author?(record)
  end

  def destroy?
    user.admin_role? || user.moderator_role? || user.author?(record)
  end
end