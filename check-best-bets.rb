require "./download-data"
require "./parse-file"

# check_parameters
download_external_best_bets
download_internal_best_bets
process_file(ARGV[0])
