require 'net/http'
require 'net/https'
require 'rubygems'


# Download external best bets file and save to data folder
def download_external_best_bets
	unless ENV['FUNNELBACK_PASSWORD']
		abort('The FUNNELBACK_PASSWORD enviornment variable is not set')
	end
	begin
		http = Net::HTTP.new(ENV['FUNNELBACK_DOMAIN'],ENV['FUNNELBACK_PORT'])
		req = Net::HTTP::Get.new("/search/admin/download-conf.cgi?collection=website&f=best_bets.cfg&dir=profile-folder-_default_preview")
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		req.basic_auth ENV['FUNNELBACK_USERNAME'], ENV['FUNNELBACK_PASSWORD']
		response = http.request(req)
	rescue
  	erb :loaderror
  else
	 	open("data/best-bets-external.txt", "wb") { |file|
    	file.write(response.body)
  	}
  end
end

# Download internal best bets file and save to data folder
def download_internal_best_bets
	unless ENV['FUNNELBACK_PASSWORD']
		abort('The FUNNELBACK_PASSWORD enviornment variable is not set')
	end
	begin
	http = Net::HTTP.new(ENV['FUNNELBACK_DOMAIN'],ENV['FUNNELBACK_PORT'])
	req = Net::HTTP::Get.new("/search/admin/download-conf.cgi?collection=website&f=best_bets.cfg&dir=profile-folder-internal-preview")
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	req.basic_auth ENV['FUNNELBACK_USERNAME'], ENV['FUNNELBACK_PASSWORD']
	response = http.request(req)
rescue
  	erb :loaderror
  else
	
	open("data/best-bets-internal.txt", "wb") { |file|
		file.write(response.body)
  }
end
end
