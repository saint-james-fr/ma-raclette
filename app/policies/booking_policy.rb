class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    update? || record.raclette.user == user
  end

  def destroy?
    record.user == user
  end

  def accepted?
    record.raclette.user == user
  end

  def canceled?
    record.user == user
  end

  def declined?
    record.raclette.user == user
  end


end
