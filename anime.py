#!/usr/bin/env python
ANIME = "[Judas] Beastars (Season 2) [1080p][HEVC x265 10bit][Eng-Subs]"
ANIMEDIRECTORY = "D:/Anime n Movies"
PARENTLOCATION = "D:/Anime n Movies"
SCRIPTLOCATION = "C:/Users/Stephen/CodeMonkey/dotfiles/clearPlaylist.lua"
THISSCRIPT = "C:/Users/Stephen/CodeMonkey/Python/anime.py"
# COPYLOCATION = "/home/stephen/Documents/copy.sh"

import os
from pathlib import Path
from typing import List
from os import listdir
from os.path import isfile, join
# import subprocess
# import sys
from subprocess import Popen, PIPE, STDOUT
from pathlib import Path


def get_immediate_subdirectories(a_dir: str) -> List[str]:
    return [
        name for name in os.listdir(a_dir) if os.path.isdir(os.path.join(a_dir, name))
    ]


def chooseAnime(searchLocation: str) -> None:
    global ANIME
    global ANIMEDIRECTORY

    directories = get_immediate_subdirectories(searchLocation)
    if len(directories) == 0:
        print("Can't find any folders...")
        exit(1)

    index = 1
    for directory in directories:
        print(index, ": " + directory, sep="")
        index += 1

    print("Enter an anime! ", end="")
    userInput = input()
    # userInput = "43"
    if not userInput.isdigit():
        print("Exiting...")
        exit(1)
    userInput = int(userInput)
    if not (0 < userInput < index):
        print("Out of range!")
        exit(1)

    ANIME = directories[userInput - 1]
    # print("Your anime is:", ANIME)
    # ANIME = newAnime

    fileList = [
        f
        for f in listdir(ANIMEDIRECTORY + "/" + ANIME)
        if isfile(join(ANIMEDIRECTORY + "/" + ANIME, f))
    ]
    if len(fileList) == 0:
        print("No anime...")
        ANIMEDIRECTORY += "/" + ANIME
        chooseAnime(ANIMEDIRECTORY)

    playlist = ""

    for file in fileList:
        filename, file_extension = os.path.splitext(file)
        if file_extension == ".mkv":
            playlist += file + "\n"

    # playlist += "\n"
    print(playlist)

    with open(ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt", "w") as file:
        file.writelines(playlist)

    with open(THISSCRIPT, "r") as file:
        data = file.readlines()
    data[1] = 'ANIME = "' + ANIME + '"\n'
    data[2] = 'ANIMEDIRECTORY = "' + ANIMEDIRECTORY + '"\n'
    with open(THISSCRIPT, "w") as file:
        file.writelines(data)
    watchAnime()


print("Current anime:", ANIME + "\n")
print(
    """[Enter]: Watch
[  1  ]: set
[  2  ]: rm
[  3  ]: purge
[  4  ]: copy
"""
)

os.chdir(ANIMEDIRECTORY + "/" + ANIME)

def watchAnime() -> None:
    global ANIMEDIRECTORY
    global ANIME
    
    # print(os.getcwd())

    # command = subprocess.run(
    #     [
    #         "mpv",
    #         "--script=" + SCRIPTLOCATION,
    #         "--pause",
    #         "--screen=1",
    #         "--playlist=" + ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt",
    #     ],
    #     capture_output=True,
    # )

    # print(command.stdout.decode("utf-8"))
    # print(command.stderr.decode("utf-8"))

    p = Popen(
        [
            "mpv",
            "--script=" + SCRIPTLOCATION,
            "--pause",
            "--screen=1",
            "--playlist=" + ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt",
        ],
        stdout=PIPE,
        stderr=STDOUT,
    )
    while True:
        line = p.stdout.readline()
        print(line.decode("utf-8").replace("\n", ""))
        if not line:
            break
    exit()


def setAnime():
    global ANIMEDIRECTORY
    global PARENTLOCATION

    ANIMEDIRECTORY = PARENTLOCATION
    chooseAnime(PARENTLOCATION)


def rmAnime():
    playlist = Path(ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt")
    if playlist.is_file():
        print("Removing " + ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt")
        os.remove(ANIMEDIRECTORY + "/" + ANIME + "/playlist.txt")
    else:
        print("Can't find playlist.txt")
    


def purgeAnime():
    os.chdir(PARENTLOCATION)
    # fileList = glob.glob("*.txt")
    print("Removing...")
    for path in Path(PARENTLOCATION).rglob('playlist.txt'):
        print(path)
        os.remove(path)
    # print(fileList)
    # print("p")


def copyAnime():
    # os.chdir(PARENTLOCATION)
    # for path in Path(PARENTLOCATION).rglob('*.jpg'):
        # print(path)
    print("Nothing to copy...")


userInput = input("Enter a number: ")
if not userInput.isdigit():
    watchAnime()

userInput = int(userInput)
options = {1: setAnime, 2: rmAnime, 3: purgeAnime, 4: copyAnime}
x = options.items()
# print(x.__contains__(1))
options.get(userInput, watchAnime)()

# import glob
# print(glob.glob(ANIMEDIRECTORY + '/' + ANIME + "*.mkv"))
