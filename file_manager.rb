require 'json'

def write(file_name, obj)
  content = obj.map(&:args)
  File.write(file_name, JSON.generate(content))
end

def read(file_name)
  if !File.exist?(file_name) || (File.exist?(file_name) && File.empty?(file_name))
    []
  else
    JSON.parse(File.read(file_name))
  end
end
