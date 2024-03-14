# Weather
The right way to check the weather.

**Weather** is based on [wttr.in](https://github.com/chubin/wttr.in) a weather client for the terminal.

```
$ bash weather.sh Skikda
Weather for City: Skikda, Algeria

     \   /     Clear
      .-.      10 – 11 °C
   ― (   ) ―   ↑ 11 km/h
      `-’      10 km
     /   \     0.0 mm
```

## Usage

To use the Weather script, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/haithamaouati/Weather.git
    ```

2. Navigate to the Weather directory:

    ```bash
    cd Weather
    ```

3. Run the script with a specified Location:

    ```bash
    ./weather.sh <Location>
    ```

   Replace `<Location>` with the actual location you want to checking.

   ```bash
   bash weather.sh Skikda
   ```
   
## Dependencies

The script requires the following dependencies:

- [figlet](http://www.figlet.org/): Program for making large letters out of ordinary text
- [curl](https://curl.se/): Command line tool for transferring data with URL syntax
- [pv](http://www.ivarch.com/programs/pv.shtml): Terminal-based tool for monitoring the progress of data through a pipeline

Make sure to install these dependencies before running the script.

## Author

- **Haitham Aouati**
  - GitHub: [github.com/haithamaouati](https://github.com/haithamaouati)
  - Telegram: [t.me/haithamaouati](t.me/haithamaouati)

## License

This Geolocate Bash script is open-source and available under the [MIT License](LICENSE).

Feel free to contribute or report issues on the [GitHub repository](https://github.com/haithamaouati/Weather).
