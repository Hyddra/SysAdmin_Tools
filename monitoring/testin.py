# test while


ans = ''
def menu():
    print('opt 1')
    print('opt 2')

while ans != 'testing'.lower():
    menu()
    ans = input("choose: ")
    if ans == '1':
        print("hello world")
    elif ans == "2":
        print("testing...")
    else:
        print("bye")

