require 'json'
require 'uri'
require 'fileutils'


# vivaldi speeddial reverse
# author:yellowsman


# target file path
source_path = ENV["USERPROFILE"] + "\\AppData\\Local\\Vivaldi\\User Data\\Default\\Bookmarks"

# chk input command line
if ARGV.nil?
	unless ARGV[0].empty?
		source_path = ARGV[0]
	end
end

# view target file path
puts "target file path:" + source_path

# backup
copy_path = source_path + ".copy"
FileUtils.copy(source_path,copy_path)

# read file to json
fread = open(source_path,mode_enc = "r:utf-8",perm = 0666)
bookmark = JSON.load(fread)

# "Speed Dial" dir reverse
bookmark['roots']['bookmark_bar']['children'][0]['children'].reverse!

fwrite = open(source_path,mode_enc = "w+:utf-8",perm = 0666)
fwrite.write(JSON.pretty_generate(bookmark))

puts "SpeedDial's inversion finished."
puts "Please stop Vivaldi if it do not inversion."
