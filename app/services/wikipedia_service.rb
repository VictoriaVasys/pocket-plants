class WikipediaService
  
  attr_reader :conn

  def initialize
    @conn = Faraday.new("https://en.wikipedia.org")
  end
  
  def response(common_family_name)
    common_family_name_no_family_word = common_family_name.split(' ')[0]
    response = conn.get("/w/api.php?action=query&titles=#{common_family_name_no_family_word}%20family&prop=revisions&rvprop=content&format=json")
    JSON.parse(response.body, symbolize_names: :true)[:query][:pages]
  end

  def taxonomic_family_name(common_family_name)
    page_number = response(common_family_name).keys.first
    redirect = response(common_family_name)[page_number][:revisions].first[:*]
    redirect[/#{Regexp.escape('[[')}(.*?)#{Regexp.escape(']]')}/m, 1]
  end

end