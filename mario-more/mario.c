#include <cs50.h>
#include <stdio.h>

void print_row(int length, int total_length);
int main(void)
{
    // Prompt user for positive integer
    int height;
    do
    {
        height = get_int("Height: ");
    }
    while (height <= 0); // Keep prompting until a positive integer is entered

    for (int i = 0; i < height; i++)
    {
        print_row(i + 1, height);
    }
}

void print_row(int length, int total_length)
{
    // Print leading spaces
    for (int i = 0; i < total_length - length; i++)
    {
        printf(" ");
    }

    // Print left hashes
    for (int i = 0; i < length; i++)
    {
        printf("#");
    }

    // Print gap spaces
    printf("  ");

    // Print right hashes
    for (int i = 0; i < length; i++)
    {
        printf("#");
    }

    // No trailing spaces needed
    printf("\n");
}
