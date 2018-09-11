class FreshCli::Review
  attr_accessor :score, :publication, :author, :summary

  def initialize(attribute_hash)
    @score = attribute_hash[:score]
    @publication = attribute_hash[:publication]
    @summary = attribute_hash[:summary]
    @author = attribute_hash[:author]
  end

end
