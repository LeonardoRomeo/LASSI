class Search < ApplicationRecord

    def search_room
        
        rooms = Room.all 
        if name.present?
          rooms = Room.where("name = :name AND wifi = :wifi AND prese = :prese and Riscaldamento = :riscaldamento"{:name => params[:name],:wifi => params[:wifi],:prese => params[:prese],:riscaldamento => params[:riscaldamento] })
        end 
        

        return rooms
    end



end
