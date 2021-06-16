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



