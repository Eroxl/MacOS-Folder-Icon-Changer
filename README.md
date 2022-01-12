## Mac OS File Icon Changer
### Description
A small and simple script to quickly change large amounts or a few files and folders icons to easily customize them. You can use this script as a backbone for creating much more customizable scripts to use on your folders. This is meant to help automating of customization which is already fairly limited on Mac.

### Instalation
Install Using The Automatic Script
```bash
./install-change-icon
```

#### Installation Description
The auto installation script auto installs the pip packages from requirements.txt and then copies change-icon into /usr/local/bin/ and then creates a reference to it in ~/.zshrc if you use a different shell just install it by yourself.


### Usage
```bash
icon IMAGE_PATH FOLDER_PATH <flags>
```

#### Parameter Descriptions
\* required parameters
* ##### * image-path: string
    The path to the image you want to set the icon to or path to folder of icons if you're using --randomize
* ##### * file-path: string
    The path to the file of the icon you want to change
* ##### --file_glob_pattern: string (default: '*')
    The file glob pattern to check when changing the files of sub folders using the --recursive flag
* ##### --recursive: boolean (default: false)
    Recursively change all sub folders icons as well based on the --file_glob_pattern provided