class Ability
  include CanCan::Ability

  def initialize
   
    user ||= Student.new
       
      if user.has_role? :admin

        can [:create,:read,:update,:destroy] , Room
        can [:create,:read,:update,:destroy] , Post
        can [:create,:read,:update,:destroy] , Doc
        can [:create,:read,:update,:destroy] , Note
        can [:create,:read,:update,:destroy] , Answer

      elsif user.has_role? :thirdpart

        can [:create,:read] , Room

        can :update, Room, :student_id => user.id

        can :destroy, Room , :student_id => user.id

        can [:create,:read] , Doc
   
        can :destroy, Doc, :student_id => user.id

        can :update, Doc, :student_id => user.id

      else  #student

        #POST AUTHORIZATION

        can [:create,:read] , Post

        can :update, Post, :student_id => user.id

        can :destroy, Post, :student_id => user.id

        #NOTE AUTHORIZATION

        can [:create,:read] , Note
   
        can :destroy, Note, :student_id => user.id     

        can :update, Note, :student_id => user.id 
          

        #ANSWER AUTHORIZATION

        can [:create,:read] , Answer

        can :update, Answer, :student_id => user.id

        can :destroy, Answer, :student_id => user.id
        

        #ROOM AUTHORIZATION

        can [:read,:update], Room 

         

      end
    
    
  end
end
