#include <cs50.h>
#include <stdio.h>

// Function prototypes
int calculate_quarters(int cents);
int calculate_dimes(int cents);
int calculate_nickels(int cents);
int calculate_pennies(int cents);

int main(void)
{
    // Prompt the user for change owed, in cents
    int cents;
    do
    {
        cents = get_int("Change owed: ");
    }
    while (cents < 0);

    // Calculate how many quarters you should give customer
    int quarters = calculate_quarters(cents);

    // Subtract the value of those quarters from cents
    cents = cents - (quarters * 25);

    // Calculate how many dimes you should give customer
    int dimes = calculate_dimes(cents);

    // Subtract the value of those dimes from remaining cents
    cents = cents - (dimes * 10);

    // Calculate how many nickels you should give customer
    int nickels = calculate_nickels(cents);

    // Subtract the value of those nickels from remaining cents
    cents = cents - (nickels * 5);

    // Calculate how many pennies you should give customer
    int pennies = calculate_pennies(cents);

    // Sum the number of quarters, dimes, nickels, and pennies used
    int sum_coins = quarters + dimes + nickels + pennies;

    // Print the total number of coins used
    printf("Minimum coins needed: %d\n", sum_coins);

    return 0;
}

// Function to calculate the number of quarters
int calculate_quarters(int cents)
{
    int quarters = 0;
    while (cents >= 25)
    {
        quarters++;
        cents = cents - 25;
    }
    return quarters;
}

// Function to calculate the number of dimes
int calculate_dimes(int cents)
{
    int dimes = 0;
    while (cents >= 10)
    {
        dimes++;
        cents = cents - 10;
    }
    return dimes;
}

// Function to calculate the number of nickels
int calculate_nickels(int cents)
{
    int nickels = 0;
    while (cents >= 5)
    {
        nickels++;
        cents = cents - 5;
    }
    return nickels;
}

// Function to calculate the number of pennies
int calculate_pennies(int cents)
{
    return cents;
}