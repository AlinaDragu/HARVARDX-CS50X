#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt the user for a credit card number
    long card_number;
    do
    {
        card_number = get_long("Number: ");
    }
    while (card_number <= 0);

    // Calculate checksum using Luhn's Algorithm
    int sum = 0;
    bool alternate = false;
    long temp = card_number;
    while (temp > 0)
    {
        int digit = temp % 10;
        if (alternate)
        {
            digit *= 2;
            if (digit > 9)
            {
                digit = (digit % 10) + 1;
            }
        }
        sum += digit;
        alternate = !alternate;
        temp /= 10;
    }

    // Check if the checksum is valid
    bool is_valid = (sum % 10 == 0);

    // Determine what type of credit card it is
    int length = 0;
    long num = card_number;
    while (num > 0)
    {
        num /= 10;
        length++;
    }

    // Select the first two digits of the card number
    long first_two_digits = card_number;
    while (first_two_digits >= 100)
    {
        first_two_digits /= 10;
    }

    // Check for credit card types based on length and starting digits
    if (is_valid && (length == 13 || length == 15 || length == 16))
    {
        if ((length == 13 || length == 16) && first_two_digits / 10 == 4)
        {
            printf("VISA\n");
        }
        else if ((length == 15 && (first_two_digits == 34 || first_two_digits == 37)))
        {
            printf("AMEX\n");
        }
        else if (length == 16 && (first_two_digits >= 51 && first_two_digits <= 55))
        {
            printf("MASTERCARD\n");
        }
        else
        {
            printf("INVALID\n");
        }
    }
    else
    {
        printf("INVALID\n");
    }

    return 0;
}
