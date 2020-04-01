class PigLatinizer
    def text_to_array(text)
        text.split(" ")
    end

    def remove_punctuation(text)
        text.gsub(/[^A-z]/, "")
    end

    def extract_punctuation(word)
        ((word[-1] =~ (/[^A-z]/)) == 0) ? word[-1] : ""
    end

    def check_consonant(letter)
        letter =~ (/[^aeiouAEIOU]/)
    end

    def consonant_counter(word)
        letters = ""
        i = 0
        until check_consonant(word[i]) == nil
            letters += word[i]
            i += 1
        end
        letters
    end

    def manipulate_word(word)
        consonants = consonant_counter(word)
        if consonants.length == 0
            word + "way"
        else
            word[(consonants.length)..-1] + consonants + "ay"
        end
    end

    def piglatinize(text)
        sentence = text_to_array(text).map do |word| 
            ending = extract_punctuation(word)
            word = remove_punctuation(word)
            manipulate_word(word) + ending
        end
        sentence.join(" ")
    end
end