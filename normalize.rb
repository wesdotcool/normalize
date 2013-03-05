#!/usr/bin/env ruby

# This takes a string and splits it by the '/' and removes all
# occurances of a single '.'n
def remove_dots(input)
  input.split('/').select { |dir| dir != '.' }
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

input = $stdin.readline

puts normalize(input)
