module Additions
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user))
    else
      false
    end
  end
end