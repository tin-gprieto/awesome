Darkness Awesome theme
==========

Tema para awesome wm inspirado en Holo Awesome WM theme 3.0 (https://github.com/lcpz/awesome-copycats)

Libreria de widgets: https://github.com/streetturtle/awesome-wm-widgets

---------------------------------------------------------

## Screenshots

#### Escritorio

![](/screenshots/Darkness.png?raw=true)

---------------------------------------------------------

## Dependencias

- **Awesome WM** 

        sudo apt install awesome
 
- **ACPI modules**

        sudo apt-get install acpi

- **Spotify client** 

        git clone https://gist.github.com/fa6258f3ff7b17747ee3.git
        cd ./fa6258f3ff7b17747ee3 
        chmod +x sp
        sudo cp ./sp /usr/local/bin/

- **lxappearance (Gestor de gtk themes)** 

        sudo apt-get install -y lxappearance

## Instalación

    cd ~/.config
    git clone --recursive https://github.com/tin-gprieto/awesome

## Configuración para laptops

Para poder disponer del indicador de bateria (el cual brinda información de su carga), se debe ingresar a **Darkness/theme.lua**, y dentro de archivo, al final y en la sección **Add widgets to the top wibox** específicamente en **Right widgets**, y descomentar la linea **"--baterrywidget"**, es decir, quitarle "--".  

## Customización
 
- **Wallpaper** : Darkness/wallpapers/default.png (Se puede cambiar por otro que mantenga el mismo nombre)

- **Íconos** : Darkness/icons

- **Tema** : Darkness/theme.lua

- **Awesome** : rc.lua
---------------------------------------------------------
## Personalización propia
### Distribución
**Ubuntu**
### Terminal
#### ZSH
        $ sudo apt install zsh
        $ chsh -s $(which zsh)
        Reiniciar sesión, abrir terminal y seleccionar:
        (2)  Populate your ~/.zshrc with the configuration recommended by the system administrator and exit (you will need to edit the file by hand, if so desired).

#### ZSH Theme

- Ohmyzsh

        $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Archivo de configuración: ~/.zshrc

- Powerlevel10k

        $ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
        $ echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc
        Reiniciar terminal y configurar ($ p10k configure)

- MesloLGS Font

https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
(Setearla desde preferencias - GNOME Terminal)

- Autosuggestions

        $ cd ~/.oh-my-zsh/custom/plugins
        $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        $ nvim ~/.zshrc
        Add
        plugins=( 
                zsh-autosuggestions
        )
        Reiniciar terminal       

**Configuración personal**

- Prompt style: Classic
- Character Set: Unicode
- Prompt color: Darkens
- Show current time: 24-hour format
- Prompt Separators: Angled
- Prompt Head: Sharp
- Prompt Tails: Round
- Prompt Height: Two lines
- Prompt Connection: Dotted
- Prompt Frame: No frame
- Prompt Spacing: Sparse
- Icons: Many icons
- Prompt Flow: Concise 
- Enable Transient Prompt: Yes
- Instant Prompt Mode: Verbose

#### Plugins

- pip
        $ sudo apt install python3-pip
- htop
        $ sudo snap install htop
- neofetch
        $ sudo apt install neofetch
- Valgreen (reversión de valdrind)
        $ pip3 install valgreen
- Vim Plug
        $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
### GTK Theme
#### Qogir Theme
        $ sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf
        $ git clone https://github.com/vinceliuice/Qogir-theme.git
        $ cd Qogir-theme/
        $ ./install.sh -l ubuntu -t standard -c dark
#### Tela Icon Pack
        $ sudo snap install tela-icons

### GRUB
#### Grub Customizer
        $ sudo add-apt-repository ppa:danielrichter2007/grub-customizer
        $ sudo apt update
        $ sudo apt-get install grub-customizer
#### Grub Theme
        $ git clone https://github.com/vinceliuice/grub2-themes
        $ cd grub2-themes/
        $ sudo ./install.sh -b -t vimix -i white
#### Configuración

En Grub Customizer: 

- Resolución: 1366x768x8

### Programas (snap store)

- **Editor de texto**: Visual Studio Code
- **Browser**: Opera
- **Editores de imágen**: Gimp y Inkscape
- **Git**: GitKraken
- **Reproductor de media**: VLC
- **Gestor de archivos**: Nautilus
- **Gestor de temas**: Tweak Tools

---------------------------------------------------------

## Ideas

### Mejorar

- Modificar Menú Awesome (en contenido y en formato)

- Mezclador de volúmen

- Modificar wibox en general (bordes y fondo)

- Alinear e independizar Spotify widget

- Agregar información a widgets (Ventanas al pasar el mouse)

- Sincronizar widget calendario con Google Calendar (onclick)

### Agregar 

- Run shell widget (nuevo)

- Widget del porcentaje ocupado del disco (top wibox)

### Arreglar

- widget de temperatura del procesador

- widget battery



