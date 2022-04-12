class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        contains_item = self.freebies.filter{|freebie| freebie.item_name == item_name}
        if(contains_item.length > 0)
            true else false
        end 
    end

    def give_away(dev, freebie)
        if(freebie.dev_id == self.id)
           freebie.update(dev_id: dev.id)
        else puts "you can't give me away"
        end
    end
end
