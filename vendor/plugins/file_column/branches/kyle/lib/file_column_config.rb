module FileColumn
 class PermanentUploadedFile
   def relative_path_prefix
     config = []
     
     #Make the storage path depend on the environment (recommended)
     config << RAILS_ENV
     
     #Make the storage path depend on the locale (Multilingual Rails)
     config << Locale.current rescue nil
     
     # Example of an alternate id, assumes the model belongs_to User. The 
     # alternate id should be unique.
     # config << @instance.user.user_name.to_s
     config << @instance.id.to_s
     
     File.join(config)
   end
 end
end