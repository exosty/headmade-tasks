require "rspec"
require_relative "grab.rb"
require 'digest/md5'
require 'rmagick'

describe Grab do
	
	it "grabes all images from page according to path" do
		
		Grab.grab_images('https://www.wikipedia.org/', '/home/timur/Desktop/images')

		original_image_1 = Magick::Image.read("https://www.wikipedia.org/portal/wikipedia.org/assets/img/Wikipedia_wordmark.png").first
		downloaded_image_1 = Magick::Image.read("/home/timur/Desktop/images/image1.png").first

		original_image_2 = Magick::Image.read("https://www.wikipedia.org/portal/wikipedia.org/assets/img/Wikipedia-logo-v2.png").first
		downloaded_image_2 = Magick::Image.read("/home/timur/Desktop/images/image2.png").first


		Digest::MD5.hexdigest original_image_1.export_pixels.join
		Digest::MD5.hexdigest downloaded_image_1.export_pixels.join		

		Digest::MD5.hexdigest original_image_2.export_pixels.join
		Digest::MD5.hexdigest downloaded_image_2.export_pixels.join



		if original_image_1 == downloaded_image_1 && original_image_2 == downloaded_image_2
			images_equal = true
		else 
			images_equal = false
		end

		expect(images_equal).to eq(true)
		
	end

end