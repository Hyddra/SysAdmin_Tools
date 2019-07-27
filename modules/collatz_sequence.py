
# The collatz sequence


def collatz(nr):
    # check if number is even
    if nr%2==0:
        return nr // 2
    else:
        return nr*3+1


nr = int(input('pick a nr: '))
try:
    while nr != 1:
        nr = collatz(nr)
        print(nr)
except ValueError:
    print("ValueError: Enter an integer")
