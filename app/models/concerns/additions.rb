module Additions
  include Conf
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user.category_id))
    else
      false
    end
  end

  def file_path(file)
  	session = GoogleDrive.login(MAIL, PASS)
  	name = file.original_filename
  	path = File.join("public", name)

  	File.open(path, "wb") { |f| f.write(file.read) }
	file = session.upload_from_file(path)

  	File.delete(path)
    self.doc_path = file.human_url
  end


  def update_associations(ids)
  	ids = ids.split(',').map!(&:to_i)

  	self.categories.each do |category|
  		self.categories.delete(category) unless ids.include?(category.id)
  	end

  	ids.each do |id|
  		category = Category.find(id)
  		self.categories << category unless self.categories.include?(category)
  	end
  end
end