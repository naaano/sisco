# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

Inflector.inflections do |inflect|
  inflect.plural /^(.*)([lrnd])$/i, '\1\2es'
  inflect.singular /^(.*)([lrnd])es$/i, '\1\2'
  inflect.irregular 'origen', 'origenes'
end