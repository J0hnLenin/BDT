with open("data/my34.txt", "r") as file:
    with open("data/my34_clear.txt", "w") as file_clear:
        for line in file:
            file_clear.write(line.strip() + '\n')

