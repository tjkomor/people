class Photo
  def self.all
    Dir.glob("app/assets/images/students/*.jpg").map do |path|
      path.split("/").last
    end
  end
end
