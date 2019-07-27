
# The collatz sequence


def collatz(nr):
    # check if number is even
    if nr%2==0:
        return nr // 2
    else:
        return nr*3+1


nr = input("Pick a number: ")

while nr != 1:
    try:
        nr = collatz(int(nr))
        print(nr)
    except ValueError:
        print("Pick an integer > 0")
        nr = input("Pick a number: ")
        continue
