class Fetcher < ThreadsPad::Job
	def initialize troll
		@login = troll.login
		@troll_id = troll.id
		
	end

	def work
		
		debug "Fetching comments for #{@login}"
		self.current = 0
		self.max = 1
		debug "Working..."
		while self.current < self.max do
			self.current += 1
			# debug "page #{self.current}"
			body = Net::HTTP.get URI("https://d3.ru/api/users/#{@login}/comments/?page=#{self.current}")

			@json = JSON body
			process @json['comments']
			break if self.terminated?
			self.max = @json['page_count']
		end
		debug "done"
			
	end
	def process comments
		comments.each do |c|
			break if self.terminated?
			Comment.find_or_create_by! comment_id: c['id'] do |record|
				record.comment_id = c['id']
				record.date = Time.at c['created']
				record.domain_prefix = c['domain']['prefix']
				record.url = "https://#{c['domain']['prefix']}.d3.ru/#{c['post']['url_slug']}-#{c['post']['id']}\##{c['id']}"
				record.text_size = c['body'].length
				record.text = c['body'][0, 20]
				record.troll_id = @troll_id

			end 
		end
	end
end