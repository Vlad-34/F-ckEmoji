import os

if __name__ == "__main__":
    try:
        files = ['lex.yy.c', 'y.tab.h', 'y.tab.c', 'fe.out']
        [os.remove(file) for file in files]
    except FileNotFoundError:
        print("Already clean! ✨")
