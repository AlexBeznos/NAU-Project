module Additions
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user.category_id))
    else
      false
    end
  end

  def file_path(param)
  	session = GoogleDrive.login('nauproj@gmail.com', '7895123Boo')
  	param[:document][:documentFile].original_filename
    self.doc_path = file.human_url
  end
end