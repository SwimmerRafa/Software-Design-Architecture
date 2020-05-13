# Observer Pattern
# Date: 02-Mar-2020
# Authors:
#          A01379896 Erick Bautista Perez
#          A01378916 Rafael Moreno Cañas

# File name: table_generator.rb

# The source code contained in this file demonstrates how to
# implement the <em>observer pattern</em>.

# Observer that make notifications of all followers of every user
class Subject
    
    # An attribute of followers
    attr_reader :followers
    
    #A method that initialites all attributes
    def initialize
        @followers = []
    end
    
    #A method that add a observer into the array
    def add_follower(follower)
        follower.followers << self
        self    
    end
    
    #A method that notify every observer of a user followed
    def notify_observers(tweetInfo)
        @followers.each do |follower|
            follower.call(self, tweetInfo)
        end
    end
    
    #A method that print every tweet received from a user
    def call(follower, tweetInfo)
        puts(@user + " received a tweet from " + follower.user + ": " + tweetInfo + "\n")
    end
end

# A class that models attributes of a /twitter
class Twitter < Subject
    
    # An attribute with access to user and observer
    attr_accessor :user
    
    #A method that initialites all attributes
    def initialize(user)
        super()
        @user = user
    end
    
    #A method that follow a user
    def follow(follower)
        self.add_follower(follower)
    end
    
    #A method that create a tweet from a user
    def tweet(description)
        notify_observers(description)
    end
end