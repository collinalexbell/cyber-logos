def letter_to_num(word, start):
    # Convert word to lowercase to handle both upper and lower case letters
    word = word.lower()
    total = 0

    # Iterate through each character in the word
    for char in word:
        # Check if the character is a lowercase letter
        if char.isalpha():
            # Get the numerical equivalent of the letter and add it to the total
            num_value = ord(char) - ord('a') + start
            total += num_value

    return total

print(letter_to_num("collinalexanderbellcybernetician", 0))
print(letter_to_num("collinalexanderbellcyberneticist", 1))
print(letter_to_num("collinalexanderbellcybernetician", 0))
print(letter_to_num("collinalexanderbellcybernetician", 1))
print(letter_to_num("the singularity is near", 1))
