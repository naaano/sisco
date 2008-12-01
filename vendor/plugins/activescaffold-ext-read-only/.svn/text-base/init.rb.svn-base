## batch_create
Dir["#{File.dirname __FILE__}/lib/*.rb"].each { |file| require file }

# install files
unless File.exists?(RAILS_ROOT + '/public/javascripts/active_scaffold_ext/active_scaffold_ext.js')
  ['/public',
   '/public/javascripts/active_scaffold_ext',
   '/public/stylesheets/active_scaffold_ext',
   '/public/images/active_scaffold_ext'].each do |dir|
    source = File.join(directory,dir)
    dest = RAILS_ROOT + dir
    FileUtils.mkdir_p(dest)
    FileUtils.cp(Dir.glob(source+'/*.*'), dest)
  end
end
