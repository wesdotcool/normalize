Normalize
=========

ApartmentList normalize interview challenge

To run this code simply download it, and run it with ruby. It will
prompt the user to type in a path and then it will print out the
corresponding normalized path

You could also run this code in your terminal:
```bash
git clone git://github.com/wesdotcool/normalize.git
cd normalize
chmod u+x normalize.rb
./normalize.rb
```

This code will treat multiple slashes 'foo//bar' as directories. As
in: 'foo/baz/bar' is the same thing as 'foo//bar' but the middle
directory's name is 'baz' in the first instance, and '' in the
second. Therefore something like: 'foo//../bar' will normalize to
'foo/bar'
