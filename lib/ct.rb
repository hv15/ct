=begin
 ct - count files and directories
 Copyright (C) 2013 Hans-Nikolai Viessmann
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

class Ct
	VERSION = '0.5.4'

	def initialize(path, opts)
		@opts = opts
		@path = path
	end

	def count
		if @opts.values_at(:files, :dirs, :syms).all? or @opts.values_at(:files, :dirs, :syms).all?{|opt| !opt}
			all_count(@path)
		elsif @opts[:files]
			fil_count(@path)
		elsif @opts[:dirs]
			dir_count(@path)
		elsif @opts[:syms]
			sym_count(@path)
		end
	end

	def all_count(path)
		list = Dir.entries(path) - [".",".."]
		puts "IN - #{path}", "---= #{list}" if @opts[:verbose]
		count = list.length
		return all_rec_count(path, list, count) if @opts[:recursive] and count > 0
		count
	end

	def all_rec_count(path, list, count)
		list.each{|obj|
			obj = File.absolute_path(obj, path)
			if File.directory?(obj) and not @opts[:syms] ? false : File.symlink?(obj)
				count += all_count(obj)
			end
		}
		count
	end

	def dir_count(path)
		list = (Dir.entries(path) - [".",".."]).select{|obj|
			obj = File.absolute_path(obj, path)
			File.directory?(obj) and not @opts[:syms] ? false : File.symlink?(obj)
		}
		puts "IN - #{path}", "---> #{list}" if @opts[:verbose]
		count = list.length
		return dir_rec_count(path, list, count) if @opts[:recursive] and count > 0
		count
	end

	def dir_rec_count(path, list, count)
		list.each{|dir|
			dir = File.absolute_path(dir, path)
			count += dir_count(dir)
		}
		count
	end

	def fil_count(path)
		list = (Dir.entries(path) - [".",".."]).select{|obj|
			obj = File.absolute_path(obj, path)
			File.file?(obj)
		}
		puts "IN - #{path}", "---> #{list}" if @opts[:verbose]
		list.length
	end

	def sym_count(path)
		list = (Dir.entries(path) - [".",".."]).select{|obj|
			obj = File.absolute_path(obj, path)
			File.symlink?(obj)
		}
		puts "IN - #{path}", "---> #{list}" if @opts[:verbose]
		count = list.length
	#	return sym_rec_count(path, list, count) if @opts[:recursive]
		count
	end

	def sym_rec_count(path, list, count)
		list.each{|obj|
			obj = File.absolute_path(obj, path)
			if File.directory?(obj)
				count += sym_count(path)
			end
		}
		count
	end
end
