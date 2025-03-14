class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(dev_id:dev.id, item_name:item_name, value:value,company_id:self.id)
    end

    def self.oldest_company
       founding_years = self.all.sort{|a,b| a.founding_year <=> b.founding_year}
       founding_years[0]
    end
end
