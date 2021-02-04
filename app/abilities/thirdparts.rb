Canard::Abilities.for(:Thirdpart) do

  cannot [:create, :read, :update, :destroy], Note
  
  cannot [:create, :read, :update, :destroy], Post

  can [:create, :read], Room

  can :update, Room, student_id: user.id

  can :destroy, Room, student_id: user.id

  can [:create, :read], Doc

  can :update, Doc, student_id: user.id

  can :destroy, Doc, student_id: user.id

  
end
