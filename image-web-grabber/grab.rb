require 'open-uri'
require 'nokogiri'

class Grab

	def self.generate_name(page_url, src, index)

		@absolute_url = URI.join(page_url, src).to_s
		@format = '.' + @absolute_url.split('.').last

		@name = 'image'+index.to_s+@format

	end

	def self.save(page_url, images, path_url)
		
		images.each do |src|

			@index = images.index(src)+1
			@name = self.generate_name(page_url, src, @index)
			@absolute_url = URI.join(page_url, src).to_s

			puts "Saving #{@name}..."

			open(path_url+'/'+@name, 'wb') do |file|
				file << open(@absolute_url).read
			end

		end

	end

	def self.grab_images(page_url, path_url)

		puts "Grabbing images from '#{page_url}' to '#{path_url}'..."

		@html = Nokogiri::HTML(open(page_url))

		@images = @html.xpath('//img/@src').to_a.uniq.compact

		self.save(page_url,@images, path_url)

		puts 'Grabbed!'
				
	end

end

Grab.grab_images(ARGV[0],ARGV[1])

