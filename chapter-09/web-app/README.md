# README

This is a sample web app to accompany chapter 9. It is a written in Python using Flask.

## Setup

1. Ensure you have the Remote-WSL extension installed: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack
2. Clone or copy this code to a WSL distro
3. Ensure you have Python 3 installed: https://wiki.python.org/moin/BeginnersGuide/Download
4. 


## Opening with Remote-WSL

If the bottom-left of the window shows `WSL:Ubuntu-20.04` or similar then you are running with Remote-WSL already.

If not, from the command palette (Ctrl + Shift + P) choose `Remote-WSL: New window` (or `Remote-WSL: New window using Distro...` if you want to choose your WSL distro)

## Running

1. Choose File/Open Folder and enter the path to this folder.
2. Choose `View: Toggle Integrated Terminal` to open the terminal
3. Run `pip3 install -r requirements.txt`
4. Open `app.py`, press F5, and choose Flask from the menu
5. In the integrated terminal, Ctrl+Click on the URL that is output to launch the page in your browser

To step through the code, add a breakpoint (F9) in `app.py` and refresh the page in the browser.