def print_row(length_left, length_right, total_length):
    for i in range(total_length - length_left):
        print(" ", end="")
    for i in range(length_left):
        print("#", end="")
    print("  ", end="")
    for i in range(length_right):
        print("#", end="")
    print()


def main():
    while True:
        try:
            height = int(input("Height: "))
            if 1 <= height <= 8:
                break
            else:
                print("Height must be a positive integer between 1 and 8.")
        except ValueError:
            print("Invalid input. Please enter a valid integer.")

    for i in range(1, height + 1):
        print_row(i, i, height)


if __name__ == "__main__":
    main()
