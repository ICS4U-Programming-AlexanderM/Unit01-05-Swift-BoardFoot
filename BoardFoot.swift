import Foundation

// Enum for error checking
enum InputError: Error {
  case InvalidInput
}

// Input width in separate function for error checking
func inputWidth() throws -> Double {
  print("Enter the width in inches: ")
  let strData = readLine()!
  guard let widthInput = Double(strData.trimmingCharacters(in: CharacterSet.newlines)) else {
    throw InputError.InvalidInput
  }
  return widthInput
}

// Input height in separate function for error checking
func inputHeight() throws -> Double {
  print("Enter the height in inches: ")
  let strData = readLine()!
  guard let heightInput = Double(strData.trimmingCharacters(in: CharacterSet.newlines)) else {
    throw InputError.InvalidInput
  }
  return heightInput
}

// Function to calculate the length of board foot
func calculateBoardFoot(width: Double, height: Double) -> Double {
  // 1 board foot in cubic inches
  let volume = 144.0

  // Calculate the length
  let functionLength = volume / (width * height)

  return functionLength
}

// Main function to get user input and display results
func main() {
  // Declare variables
  var width: Double = 0
  var height: Double = 0
  var length: Double = 0

  do {
    // Prompt the user to enter the width and height
    width = try inputWidth()
    height = try inputHeight()

    // Check for negative inputs.
    if height <= 0 || width <= 0 {
      print("Input must be positive.")
    } else {
      // Calculate the length needed for 1 board foot
      length = calculateBoardFoot(width: width, height: height)
      // Output the result
      print("To make 1 board foot, the length is \(String(format: "%.2f", length)) inches.")
    }
  } catch InputError.InvalidInput {
    print("Error: Invalid input")
  } catch {
    // Extra catch because of this error that would exist otherwise:
    // Errors thrown from here are not handled because the enclosing catch is not exhaustive.
    print("Error: Invalid input")
  }
}

main()
