def print_row(length, total_length):
    for i in range(total_length - length):
        print(" ", end="")
    for i in range(length):
        print("#", end="")
    print()


def main():
    while True:
        try:
            height = int(input("Height: "))
            if height > 0 and height <= 8:
                break
            elif height > 8:
                print("Height must be less than or equal to 8.")
            else:
                print("Height must be a positive integer.")
        except ValueError:
            print("Invalid input. Please enter a valid integer.")

    for i in range(height):
        print_row(i+1, height)


if __name__ == "__main__":
    main()
