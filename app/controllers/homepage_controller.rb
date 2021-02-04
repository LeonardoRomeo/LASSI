class HomepagesController < ApplicationController

  
  def index
    @notes = Note.all
  end

  
end
