# Set filenames

data_folder = "data"
@internal_filename = "#{data_folder}/best-bets-internal.txt"
@external_filename = "#{data_folder}/best-bets-external.txt"


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