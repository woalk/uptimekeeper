# uptimekeeper

A simple script to keep an automatic record of computer uptimes.

## Installation

Put the script `uptimekeeper.sh` into your autostart
with any parameters set as you want.

The script will keep running unintrusively in the background.
Once it receives a signal to quit (such as `SIGINT`, `SIGTERM`),
it will append the current system uptime to a specified file.

When shutting down your system,
the init system should leave this script enough time to write its uptime.
Therefore, you should not need to do anything else to make it work completely automatically.

A new uptime file is created every month.

## Script usage

```
USAGE: ./uptimekeeper.sh (-h|--help) [directory] [month-delimiter] [suffix]
OPTIONS:
  -h | --help      Display this usage message.
PARAMETERS:
  directory:       The directory to save the tracking files to.
                   DEFAULT: '$HOME/.uptimekeeper'
  month-delimiter: The delimiter between year and month.
                   Use '/' to create directories for each year.
                   DEFAULT: '-' (e.g. 2022-09.txt)
  suffix:          A suffix to append to every file name.
                   DEFAULT: '.txt'
```

## License

```
Copyright 2022 Alexander Köster

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

or in the file 'LICENSE' in this repository.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
