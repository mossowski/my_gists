def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :conditions => ['snippet LIKE ?', search_condition])
end