import os
import tkinter as tk
from tkinter import filedialog


if __name__ == "__main__":

    root = tk.Tk()
    root.withdraw()
    input_file_path = filedialog.askopenfilename(title="Select file",
                                                 filetypes=(("FuckEmoji files", "*.fe"), ("All files", "*.*")))

    if input_file_path:          
        os.system('lex fe.l')
        os.system('yacc -d fe.y')
        os.system('gcc y.tab.c lex.yy.c -ly -ll -o fe.out')
        os.system('./fe.out < ' + input_file_path + ' > c-code.c')
        os.system('gcc -O3 -march=native -funroll-loops -finline-functions -flto -fomit-frame-pointer '
                  '-fno-strict-aliasing c-code.c -o fe.out')
        print("File compiled successfully! 🎉")
        os.system('./fe.out')

        print('\n')
    else:
        print("No file selected. 😔")
