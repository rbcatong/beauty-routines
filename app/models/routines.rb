class Routine < ActiveRecord::Base

  belongs_to :user

  def slug
  if name
    [name.parameterize].join("-")
  end
end

def self.find_by_slug(slug)
  Routine.all.find do |routine|
  routine.slug == slug
  end
end

end
