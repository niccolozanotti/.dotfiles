function update-notes()
{
   # Get the directory where the script is located
   CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

   echo "CURRENT_DIR: $(pwd)"
   TARGET_DIR="$HOME/Documents/GitHub/my-notes/"

   # Change to the target directory
   cd "$TARGET_DIR" || { echo "Failed to change directory to $TARGET_DIR"; exit 1; }

   # Run script from the root directory
   sh update-notes.sh
   # Go back to the original dir
   cd "$CURRENT_DIR"
}

function translate()
{
  # Initialize an empty string to hold the concatenated result
  input_string=""
 
  # Loop through all the arguments
  for arg in "$@"
  do
      #  empty input_string
      if [ -z "$input_string" ]; then
          input_string="$arg"
      else
          # %20 for url whitespace
          input_string="$input_string%20$arg"
      fi
  done
  
  # Looking the corresponding address on wordreference.com
  open "https://www.wordreference.com/enit/$input_string"
}

function traduci()
{
  # Initialize an empty string to hold the concatenated result
  input_string=""
  
  # Loop through all the arguments
  for arg in "$@"
  do
      # If input_string is empty, just assign the argument to it
      if [ -z "$input_string" ]; then
          input_string="$arg"
      else
          # %20 is the url word separator
          input_string="$input_string%20$arg"
      fi
  done
  
  # Lookup the corresponding address on wordreference.com
  open "https://www.wordreference.com/iten/$input_string"
}
