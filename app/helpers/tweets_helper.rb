module TweetsHelper
  def get_tagged(tweet)
    message_arr = tweet.message.split

    message_arr.each_with_index do |word, index|
      #if first character of the word is #
      if word[0] == '#'
        #create a tag or link to existing tag
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
          #or - tag = Tag.find_by_phrase(word)
        else
          tag = Tag.create(phrase: word)
        end
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
    end
    
    tweet.update(message: message_arr.join(" "))
    #or - tweet.message = message_arr.join ' '
    return tweet
  end
end
