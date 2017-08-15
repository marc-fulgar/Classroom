class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      
    elsif user.type? 'Teacher'
      can :dashboard, User
      can :read, Lecture
      can :read, Assignment
      can :create, Lecture
      can :create, Assignment
      can [:lectures, :assignments, :exam_schedules], Subject
      can :manage, ExamSchedule
      can :manage, Comment
      can :update, Teacher, id: user.id
      can :read, Teacher
      can :read, Student
      can :read, Subject
      can :read, BlockClass
      can :manage, Exam, Exam.all.each do |exam|
        exam.exam_schedule.subject.teacher == user
      end
      can :edit, Lecture, Lecture.all.each do |exam|
        Lecture.subject.teacher == user
      end
      can :edit, Assignment, Assignment.all.each do |exam|
        Assignment.subject.teacher == user
      end
      
    elsif user.type? 'Student'
      can :dashboard, User
      can :update, Student, id: user.id
      can :read, Student
      can :read, Exam, Exam.all.each do |exam|
        exam.student == user
      end
      
    else
      can :dashboard, User
      can [:create, :read], Comment
      can :update, Comment, user_id: user.id
    end
  end
end
