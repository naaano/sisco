module FileColumn # :nodoc:
	class RealUploadedFile < BaseUploadedFile # :nodoc:

		def change_extension!(ext)
			mogrify("-format #{ext}")
    end

		def mogrify(cmd, path = nil)
			cmd = cmd.keys.inject(''){|buffer, key| buffer += "-#{key.to_s} \"#{cmd[key].to_s}\""} if cmd.is_a?Hash
			path ||= absolute_path
			message = IO.popen("mogrify #{cmd} \"#{path}\"").read
			return false unless message.strip.blank?
			unless (ext = cmd.scan(/-format[\s]+["]?([a-z0-9]+)/i).flatten.first).blank?
				if File.exist?(new_name = absolute_path.gsub(/[A-z0-9]+$/, ext))
					@instance[@attr] = @filename = File.basename(new_name)
					return true
				else
					return false
				end
			end
			return true
		end

		alias_method :old_url, :url
		def url(options={})
			if options[:magick].blank?
				return old_url
			else
				hash = options[:magick].hash.abs.to_s(36)
				path = insert_folder absolute_path, hash
				unless File.exists? path
					FileUtils.mkdir(File.dirname(path))
					FileUtils.copy(absolute_path, path)
					mogrify(options[:magick], path)
				end
			end
			insert_folder old_url, hash
		end

		def insert_folder(path, folder)
			File.join(File.dirname(path), folder, File.basename(path))
		end
	end
end