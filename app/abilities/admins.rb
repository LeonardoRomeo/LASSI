Canard::Abilities.for(:Admin) do
  can [:create, :read, :update, :destroy], Doc
  
  can [:create, :read, :update, :destroy], Note
  
  can [:create, :read, :update, :delete], Post
  
  can [:create, :read, :update, :destroy], Room
  
end
