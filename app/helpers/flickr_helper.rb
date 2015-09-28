module FlickrHelper
	def user_photos(user_id)
		flickr = FlickRaw::Flickr.new
		id_array = []
		photo_array = flickr.photos.search(user_id: user_id).to_a[0..8]
		photo_array.each do |photo|
			id_array << photo.id
		end
		url_array = []
		id_array.each do |photo_id|
			url_array << info(photo_id)
		end
		return url_array
	end

	def info(photo_id)
		flickr.photos.getInfo(photo_id: photo_id)

	end

	# def photo_url(photo_id)
	# 	info = flickr.photos.getInfo(photo_id: photo_id) 
	# 	# FlickRaw.url_s(info)
	# 	# sFlickRaw.url_t(info)
	# 	# FlickRaw.url_photopage(info)
	# end

	def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
		
			photos = user_photos(user_id, photo_count)
			render :partial => '/flickr/sidebar_widget', locals: { photos: @photos }
	end
end			
