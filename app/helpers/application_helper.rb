module ApplicationHelper
  def read_upload(file_path)
    File.open(file_path, "r") do |f|
      f.flock(File::LOCK_SH)
      f.read
    end
  end
  
  def add_url(id)
    "#{request.host_with_port}/view/#{id}"
  end
end
