
class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    record.booking.user == user && record.booking.date < Date.today
  end

  def update?
    create?
  end
end
