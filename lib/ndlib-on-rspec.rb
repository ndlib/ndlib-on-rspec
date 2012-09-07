module NdlibOnRspec
end
pattern = File.join(File.dirname(__FILE__), 'ndlib-on-rspec/*.rb')
Dir.glob(pattern).each do |filename|
  require filename
end
