class Ability
  include CanCan::Ability

  def initialize(user)
    if user == nil
      user = User.new
      user.role = 'guest'
    end

    if user.role?("admin")
      can :manage, :all
    elsif user.role?("user")
      can :read, Post
      can :create, Post
    elsif user.role?("guest")
      can :read, Post
    end

  end

end