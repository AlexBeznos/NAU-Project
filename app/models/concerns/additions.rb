module Additions
  def able_to_download?(user)
    if user
      self.categories.include?(Category.find(user.category_id))
    else
      false
    end
  end

  def file_path(file)

  	name = file.original_filename
    disk = S3_BUCKET.objects[name]
	  disk.write(file)
    disk.acl = :public_read

    self.doc_path = disk.public_url.to_s
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

  def delete_attachment
    document = self.doc_path
    uri = URI.parse(document)
    S3_BUCKET.objects.delete(File.basename(uri.path))
  end
end