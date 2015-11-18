# Set filenames

def set_constants
	data_folder = "data"
	@internal_filename = "#{data_folder}/best-bets-internal.txt"
	@external_filename = "#{data_folder}/best-bets-external.txt"
end

# Check if internal or external parameter has been specified and process according to parameter
def check_parameters
	if ARGV[0] == "internal" || ARGV[0] == "external"
		parameter = ARGV[0]
	else
		puts "Please specify internal or external"
	end
end


# Process internal or external best bets file
def process_file(type)
	set_constants
	if type == "internal"
		if File.exist?(@internal_filename)
			output_file("internal")
		else
			puts "Internal file does not exist"
		end
	end

	if type == "external"
		if File.exist?(@external_filename)
			output_file("external")
		else
			puts "External file does not exist"
		end
	end
end


def output_file(type)
	set_constants
	if type == "internal"
		File.open(@internal_filename).each do |line|
    		puts line.gsub("==","\n")
		end
	end

	if type == "external"
		File.open(@external_filename).each do |line|
    		puts line.split("==")
		end
	end
end


def get_response_code(address)
	require "net/http"
	require "uri"
	cleaned_address = address.strip
	encoded_url = URI.encode(cleaned_address)
	uri = URI.parse(encoded_url)
	begin
		response = Net::HTTP.get_response(uri)
		if response.code == 200
			return "#{response.message} (#{response.code})"
		else
			return "#{response.message} (#{response.code})"
		end
	rescue 
		return "Unknown"
	end
end
