module ApplicationHelper
  def read_upload(file_path)
    File.open(file_path, "r") do |f|
      f.flock(File::LOCK_SH)
      f.read
    end
  end
end
