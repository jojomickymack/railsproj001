require 'net/http'
require 'json'

module PagesHelper

	def get_contents()
		url = URI.parse('http://127.0.0.1:9292/contents')
		req = Net::HTTP::Get.new(url.to_s)
		res = Net::HTTP.get_response(url)
		JSON.parse(res.body)
	end

	def post_contents(title)
		puts 'doing request'

		post_body = { title: params['title'] }
		url = URI.parse('http://127.0.0.1:9292/contents')
		http = Net::HTTP.new(url.host, url.port)
		req = Net::HTTP::Post.new(url.request_uri)
		req.set_form_data(post_body)

		puts req.body
		res = http.request(req)
		
		puts res.body
		JSON.parse(res.body)
	end

	def parse_markdown(filename)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		markdown.render(File.read("public#{filename}")).html_safe
	end
end
