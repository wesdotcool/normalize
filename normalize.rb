#!/usr/bin/env ruby

# This takes a string and splits it by the '/' and removes all
# occurances of a single '.'n
def remove_dots(input)
  input.strip.split('/').select { |dir| dir != '.' }
end

# This will normalize the input string.
# It will treat multiple slashes 'foo//bar' as directories. As in:
# 'foo/baz/bar' is the same thing as 'foo//bar' but the middle directory's
# name is 'baz' in the first instance, and '' in the second. Therefore
# something like: 'foo//../bar' will normalize to 'foo/bar'
def normalize(input)
  no_dots = remove_dots(input)

  final = []
  while i = no_dots.index('..')
    if i == 0
      final << no_dots.shift
    else
      no_dots.delete_at(i-1)
      no_dots.delete_at(i-1)
    end
  end

  (final+no_dots).join('/')
end

# This prints a simple prompt for the user
def prompt_user
  puts "Please type in a path:"
end

# This prompts the user and returns 1 line of input without trailing
# newline character
def prompt_and_get_input_from_user
  prompt_user
  input = $stdin.readline.strip
end

# This runs everything in the file. It should be the only thing you
# need to call if you're running this from an irb process
def normalization_program
  puts normalize(prompt_and_get_input_from_user)
end

normalization_program
