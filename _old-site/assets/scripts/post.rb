require 'json'
require_relative './utilities.rb'
require 'date'

class Post
  def initialize
    path = File.expand_path('')
    file = File.open(path).read()

    #class variable @data is a hash parsed from post-list.json
    @data = JSON.parse(file)
    @currentNumber = ensureFourDigits(@data["posts"].length + 1) #returns four digit string

    addToJson #adds new post to post-list.json
    addToIndex #adds new post to list in index.html
    newPostFile #adds new post html file to ./posts
  end


  #each json file is structured like {posts: {post0001, post0002, etc.}, 1:post0001, 2:post0002, etc.}
  def addToJson
    #add to "posts" array in post-list.json
    @data["posts"] << "post#{@currentNumber}"

    #convert data back to
    dataJson = JSON.generate(@data)
    File.write('../../posts/post-list.json', dataJson)
  end

  def addToIndex
    #open the index html file
    indexFile = File.open('../../index.html').read()

    #use regex to </ol> and replace with <li id='0001'></li></ol>
    indexFile = indexFile.gsub(
      /<\/ol>/,
      "<li id='#{@currentNumber}'></li></ol>"
    )

    #replace existing content of index.html with the new version
    File.write('../../index.html', indexFile)
  end

  def newPostFile
    #save instance of html template for posts
    templateFile = File.open('../../posts/_postTemplate.html').read()

    # use regex to replace instances of:
    # data-date="2000-01-31"
    templateFile = templateFile.gsub(
      /data-date=.{12}/,
      Date.today.strftime('%Y-%m-%d')
    )
    # data-order="0000"
    templateFile = templateFile.gsub(
      /data-order=.{6}/,
      "data-order=\"#{@currentNumber}\""
    )

    #create new post html file
    out_file = File.new("../../posts/post#{@currentNumber}.html", "w")
    out_file.puts(templateFile)
    out_file.close
  end
end
