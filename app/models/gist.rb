class Gist < ActiveRecord::Base
	validates :snippet, presence: true,
	                    length: { minimum: 3 }
	validates :description, presence: true,
	                    length: { minimum: 1 }

    def self.search(search)
      if search
        find(:all, :conditions => ['snippet LIKE ?', "%#{search}%"])
      else
        limit(0)
      end
    end
end
