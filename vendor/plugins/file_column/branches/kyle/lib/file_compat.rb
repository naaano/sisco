# This bit of code allows you to pass regular old files to file_column.  file_column depends on 
# a few extra methods that the CGI uploaded file class adds.  We will add the equivalent methods
# to the plain vanilla File class.
class File
	def original_filename
		File.basename(path)
	end

	def size
		File.size(path)
	end

	def local_path
		path
	end

	def content_type
		nil
	end
end