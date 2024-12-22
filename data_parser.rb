require 'csv'

# Path to the CSV file
csv_file_path = 'path/to/your/file.csv'

# Read and process the CSV file
begin
  CSV.foreach(csv_file_path, headers: true) do |row|
    # Example: Print each row
    puts row.to_hash
  end
rescue Errno::ENOENT => e
  puts "Failed to read CSV file: #{e.message}"
end
