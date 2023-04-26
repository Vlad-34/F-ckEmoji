import tkinter as tk
from tkinter import filedialog


if __name__ == "__main__":
    replacements = {
        '+': '➕',
        '-': '➖',
        '>': '▶️',
        '<': '◀️',
        '.': '💬',
        ',': '📨',
        '[': '⤵️',
        ']': '⤴️'
    }

    root = tk.Tk()
    root.withdraw()
    input_file_path = filedialog.askopenfilename(title="Select file",
                                                 filetypes=(("BrainFuck files", "*.bf *.b"), ("All files", "*.*")))

    if input_file_path:
        with open(input_file_path, 'r') as input_file:
            content = input_file.read()

        for old_char, new_char in replacements.items():
            content = content.replace(old_char, new_char)

        output_file_path = input_file_path.replace(".bf", ".fe")
        with open(output_file_path, 'w') as output_file:
            output_file.write(content)

        print("File converted successfully! 🎉")
    else:
        print("No file selected. 😔")
