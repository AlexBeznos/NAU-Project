module Additions
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user.category_id))
    else
      false
    end
  end
end