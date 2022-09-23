from sys import stdin

def main():
    dictionary = {}
    
    for line in stdin:
        if line == "\n":
            break
    
        english, foreign = line.split()
        dictionary[foreign] = english
    
    for line in stdin:
        print(dictionary.get(line.strip(), "eh"))

if __name__ == "__main__":
    main()
