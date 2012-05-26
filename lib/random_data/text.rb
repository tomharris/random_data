module RandomData
  
  module Text

    # Methods to create random strings and paragraphs.
    
     # Returns a string of random upper- and lowercase alphanumeric characters.  Accepts a size parameters, defaults to 16 characters.
     #
     # >> Random.alphanumeric
     #
     # "Ke2jdknPYAI8uCXj"
     #
     # >> Random.alphanumeric(5)
     #
     # "7sj7i"

    def alphanumeric(size=16)
      s = ""
      size.times { s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
      s
    end

    # Returns a string of random alphabet characters. Accepts a size parameter, default 16 characters.
    # Also accepts a type parameter, of either :upper (for all upcase), :lower (for all lowercase), or :mixed.
    # Defaults to :lower.
    #
    # >> Random.alpha
    #
    # "anepalqnitpxlfri"
    #
    # >> Random.alpha(5, :upper)
    #
    # "EIBPL"

    def alpha(size=16, type = :lower)
      s = ''
      size.times do
        char = ('a'..'z').to_a.rand
        char.upcase! if (type == :mixed and Kernel.rand(2) == 1) or type == :upper
        s << char
      end
      s
    end
    
    # TODO make these more coherent #:nodoc:

    @@sentences = [
     "Lorem ipsum dolor sit amet  consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
     "Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
     "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
     "Excepteur sint occaecat cupidatat non proident  sunt in culpa qui officia deserunt mollit anim id est laborum",
     "There's a voice that keeps on calling me",
     "Down the road that's where I'll always be",
     "Every stop I make I make a new friend; Can't stay for long just turn around and I'm gone again",
     "Maybe tomorrow I'll want to settle down - until tomorrow I'll just keep moving on",
     "Hong Kong Phooey number one super guy, Hong Kong Phooey quicker than the human eye",
     "He's got style, a groovy style, and a car that just won't stop",
     "Hey there where ya goin, not exactly knowin'",
     "Who says you have to call just one place home?",
     "He's going everywhere, B.J. McKay and his best friend Bear",
     "He just keeps on movin' and ladies keep improvin'",
     "Every day is better than the last, with new dreams and better scenes and best of all I don't pay property tax",
     "Rolling  down to Dallas - who is providin' my palace?",
     "Off to New Orleans or who knows where",
     "Soaring through all the galaxies in search of Earth flying in to the night",
     "Ulysses, fighting evil and tyranny with all his power and with all of his might",
     "No-one else can do the things you do, like a bolt of thunder from the blue",
     "Always fighting all the evil forces bringing peace and justice to all",
     "I've gotten burned over Cheryl Tiegs and blown up for Raquel Welch, but when I end up in the hay it's only hay, hey hey",
     "I might jump an open drawbridge or Tarzan from a vine, beause I'm the unknown stuntman that makes Eastwood look so fine"] 

    # Returns a given number of paragraphs delimited by two newlines (defaults to two paragraphs), using a small pool of generic sentences.
    # >> Random.paragraphs  
    #
    # "I might jump an open drawbridge or Tarzan from a vine, beause I'm the unknown stuntman that makes Eastwood look so fine.\n\n \Always fighting all the evil forces bringing peace and justice to all. \n\n"
  
   def words(num = 2)
    text = ''
    sentence = @@sentences.sort_by { rand }.first
    words = sentence.split(/\s/).sort_by { rand }
    words[0..(num-1)].join(" ")
   end
  
   def paragraphs(num = 2)
     text = ''
 
     num.times do 
       (rand(5)+1).times do
         text += @@sentences.rand + '. '
       end
       text += "\n\n"
     end
 
     return text
 
   end

 end
end
