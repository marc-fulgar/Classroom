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
      can :manage, Lecture
      can :manage, Assignment
      can [:create, :show], ExamSchedule
      can [:lectures, :assignments, :exam_schedules], Subject
      can :manage, Comment
      can :update, Teacher, id: user.id
      can :read, Teacher
      can :read, Student
      can :read, Subject
      can :read, BlockClass
      can :read, Course
      can :manage, Exam, Exam.all.each do |exam|
        exam.exam_schedule.try(:subject).try(:teacher) == user
      end
      can :manage, Lecture, Lecture.all.each do |lecture|
        lecture.try(:subject).try(:teacher) == user
      end
      can :manage, Assignment, Assignment.all.each do |assignment|
        assignment.subject.try(:teacher) == user
      end
      can :exam_index, ExamSchedule, ExamSchedule.all.each do |exam_schedule|
        exam_schedule.subject.try(:teacher) == user
      end
      
    elsif user.type? 'Student'
      can :dashboard, User
      can :read, Teacher
      can :read, Subject
      can :read, BlockClass
      can :show, Comment
      can :create, Comment
      can :update, Student, id: user.id
      can :read, Student
      can :read, Course
      can [:lectures, :assignments, :exam_schedules], Subject
      can :show, Exam, Exam.all.each do |exam|
        exam.exam_schedule.subject.block_classes.include? user.block_class
      end
      can :show, Lecture, Lecture.all.each do |lecture|
        lecture.subject.block_classes.include? user.block_class
      end
      can :show, Assignment, Assignment.all.each do |assignment|
        assignment.subject.block_classes.include? user.block_class
      end
      can :show, ExamSchedule, ExamSchedule.all.each do |exam_schedule|
        exam_schedule.subject.block_classes.include? user.block_class
      end
      
    else
      can :dashboard, User
      can [:create, :read], Comment
      can :update, Comment, user_id: user.id
    end
  end
end
