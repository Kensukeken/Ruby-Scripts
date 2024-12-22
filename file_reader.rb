# Function to read and display the contents of a file
def read_file(file_path)
  if File.exist?(file_path)
    File.open(file_path, "r") do |file|
      file.each_line do |line|
        puts line
      end
    end
  else
    puts "File not found: #{file_path}"
  end
end

# Replace 'MyFile.txt' with the path to the file you want to read
file_path = 'MyFile.txt'
read_file(file_path)
