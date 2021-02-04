Canard::Abilities.for(:Student) do

  can [:read], Doc
  cannot [:create, :update, :destroy], Doc

  can [:create, :read], Note
  
  can [:create, :read], Post

  can [:create, :read], Answer

  can :update, Post, :student_id => user.id 

  can :destroy, Post, :student_id => user.id

  can :update, Note, :student_id => user.id 

  can :destroy, Note, :student_id => user.id 

  can :update, Answer, :student_id => user.id

  can :destroy, Answer, :student_id => user.id
  
  can [:read, :update], Room
  cannot [:create,:destroy], Room

end
