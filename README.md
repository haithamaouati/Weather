# Weather
The right way to check the weather.

```
 __        __                 _     _                   
 \ \      / /   ___    __ _  | |_  | |__     ___   _ __ 
  \ \ /\ / /   / _ \  / _` | | __| | '_ \   / _ \ | '__|
   \ V  V /   |  __/ | (_| | | |_  | | | | |  __/ | |   
    \_/\_/     \___|  \__,_|  \__| |_| |_|  \___| |_|
```

## Install

To use the Weather script, follow these steps:

1. Clone the repository:

    ```
    git clone https://github.com/haithamaouati/Weather.git
    ```

2. Change to the Weather directory:

    ```
    cd Weather
    ```
    
3. Change the file modes
    ```
    chmod +x weather.sh
    ```
    
5. Run the script:

    ```
    ./weather.sh
    ```

## Usage
Usage: `./weather.sh -l <location>`

##### Options:

`-l`, `--location`   Set the location for the weather report

`-h`, `--help`    Show this help message

## Dependencies

The script requires the following dependencies:

- [figlet](http://www.figlet.org/): `pkg install figlet - y`
- [curl](https://curl.se/): `pkg install curl - y`

Make sure to install these dependencies before running the script.

## Author

Made with :coffee: by **Haitham Aouati**
  - GitHub: [github.com/haithamaouati](https://github.com/haithamaouati)

## License

Weather is licensed under [WTFPL license](LICENSE)
