require 'net/http'
require 'json'

url = URI.parse('http://127.0.0.1:9292/contents')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.get_response(url)
json = JSON.parse(res.body)

Rails.application.routes.draw do

	root :to => 'pages#index'

  	json.each { |obj|
  		get obj['url'] => "pages##{obj['content_type']}", title: obj['title']
	}

  #	get "/burp" => 'pages#crazy', title: 'slippers'
  # get "/game/:id" => 'pages#blog'

end
