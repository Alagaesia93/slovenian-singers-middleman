# slovenian singers

This repo has two branches: main and gh-pages. Main has the Middleman (https://middlemanapp.com/) code that can be edited. Gh-pages hosts the static files that are served via Github Pages.

HOW TO

Clone this repo in a new computer
1. Make sure that Ruby 3.0.2p107 is installed --> https://www.ruby-lang.org/it/documentation/installation/
2. From here https://github.com/Alagaesia93/slovenian-singers-middleman click on "Code", "Open on GH desktop"
3. open VS Code and run bundle install
4. run middleman, visit http://localhost:4567/ and you have the development website

Edit some *translations*
(Translation is a static world in the website, like "Blog", or "About me")
1. Open en.yml / sl.yml / it.yml
2. Look for the text that you want to edit. Edit, save
3. Open website to see that it works

Edit some *content*
(Content is for example a recording, or the bio of a singer)
1. Open singers.yml or recording.yml (according to what you want to change)
2. Look for the text that you want to edit. Edit, save
3. Open website to see that it works

Add a new singer
1. Open singers.yml
2. Add a ',' after the last }
3. Copy an existing singer data (whatever is inside {})
4. Edit all the fields
5. Take care of the images (copy paste)
6. Open the website. Check that there is a new singer in the home page, and his page works both in english and slovenian

Add a new recording
1. Open recordins.yml
2. Add a ',' after the last }
3. Copy an existing recording data (whatever is inside {})
4. Edit all the fields
5. Take care of the images (copy paste)
6. Open the website. Check that there is a new recording in the home page, and filters work

Add a new blog page
1. find a short slug for the blog page. Example "juan". Inside source/blog, create two files. juan_en.html.erb and juan_sl.html.erb (and one for every other language you want)
2. Copy paste a previous blog article in the new created pages (pay attention to lang: sl in the first section)
3. Edit the text / layout
4. Open the website to see that it works (new blog post on top, new page for all the languages)

Add a new language
1. Open config.rb
2. add lang inside available_langs (for example it)
3. Create a new file it.yml inside locales. Copy paste an existing .yml file
4. replace the first line (from en to it)
5. translate all the file content
6. For each singer, for each field that ends in _en (example biograph_en), create a new field ending in _it (example biography_it) and add the content
7. For each recording, for each field that ends in _it (example title_en), create a new field ending in _it (exmample title_it), and add the content
8. Open website and every page and check that it works

Notes
There is gh-action that takes middleman files, builds them and writes to gh-pages
