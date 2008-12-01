module Localize  
  attr_accessor :locale_code
  @@text_strings = {}
  
  def self._(string_to_localize, *args)
    text_string = @@text_strings[ActiveScaffold::Localization.lang][string_to_localize] unless @@text_strings[ActiveScaffold::Localization.lang].nil?
    text_string || ActiveScaffold::Localization._(string_to_localize, *args) || string_to_localize
  end

  def self.load_strings(locale_code = nil)
    locale_code = locale_code || ActiveScaffold::Localization.lang
    return unless @@text_strings[locale_code].nil?
    locale = Locale.find(:first, :conditions => ["locale_code = ?", locale_code])
    return if locale.nil?

    # This app's strings are in the DB. Cache them up.
    text_strings = StaticString.find(:all, :conditions => ["locale_id = ?", locale.id]) 
    @@text_strings[locale_code] = Hash[*text_strings.collect { |static|
          [static.string_key, static.string_text]
        }.flatten]
  end
  
  def self.to(locale_code = nil)
    ActiveScaffold::Localization.lang = locale_code || "en-us"
    self.load_strings
    ActiveScaffold::Localization.lang
  end
  
  def self.unload_strings(locale_code)
    @@text_strings[locale_code] = nil
  end
end

class Object
  def _(*args)
    Localize._(*args)
  end
  
  def as_(string_to_localize, *args)
    Localize._(string_to_localize, *args)
  end
end