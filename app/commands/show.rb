class Show
  prepend SimpleCommand

  def initialize(id)
    @id = id
  end

  def call
    project
  end

  private

  attr_accessor :id

  def project
    Project.find(id)
  end
end