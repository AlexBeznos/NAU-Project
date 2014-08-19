module Additions
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user.category_id))
    else
      false
    end
  end

  def file_path(file)
  	session = GoogleDrive.login('nauproj@gmail.com', '7895123Boo')
  	name = file.original_filename
  	path = File.join("public", name)

  	File.open(path, "wb") { |f| f.write(file.read) }
	file = session.upload_from_file(path)

  	File.delete(path)
    self.doc_path = file.human_url
  end
end