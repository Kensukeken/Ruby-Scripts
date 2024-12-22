# Ruby is a dynamic, open source programming language with a focus on simplicity and productivity.
# It has an elegant syntax that is natural to read and easy to write.

# Here is a simple example of a Ruby program:

# Define a method to greet the user
puts "Hello, welcome to Ruby!"
  # This method performs a basic calculator operation between two numbers.
  # It prompts the user to enter two numbers and an operation to perform.
  # Supported operations are addition (+), subtraction (-), multiplication (*), and division (/).
  # The result of the operation is then printed to the console.
  # If an invalid operation is entered, an error message is displayed.
  #
  # Example usage:
  #   calculator
  #
  # User input:
  #   Enter the first number: 5
  #   Enter the second number: 3
  #   Enter the operation you want to perform: +
  #
  # Output:
  #   The sum of the numbers is 8
  def calculator
    puts "Enter the first number"
    num1 = gets.chomp.to_i
    puts "Enter the second number"
    num2 = gets.chomp.to_i
    puts "Enter the operation you want to perform"
    operation = gets.chomp
    if operation == "+"
      puts "The sum of the numbers is #{num1 + num2}"
    elsif operation == "-"
      puts "The difference of the numbers is #{num1 - num2}"
    elsif operation == "*"
      puts "The product of the numbers is #{num1 * num2}"
    elsif operation == "/"
      puts "The division of the numbers is #{num1 / num2}"
    else
      puts "Invalid operation"
    end
  end
  calculator
