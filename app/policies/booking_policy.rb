class BookingPolicy < ApplicationPolicy

  def create?
    true
  end

  def index?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end
end
