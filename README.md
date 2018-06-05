# Sample OpenMinder™ Dashboard

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

This is a sample dashboard for the OpenMinder™ that can be run on the Raspberry Pi in order to show live
readings from the API on a web interface.

It requires ruby and uses the great open source project [smashing](https://smashing.github.io/). The
preconfigured dashboard can be downloaded from it's [Github repo](https://github.com/autogrow/sample-openminder-dashboard).

## Installation

First install Ruby 2.2 or greater.  Currently Raspbian has the 2.3 version:

    sudo apt-get install ruby2.3 ruby2.3-dev
    sudo gem install bundler

Download the dashboard:

    git clone https://github.com/autogrow/sample-openminder-dashboard.git

Install the requirements:

    cd sample-openminder-dashboard
    bundle install --deployment

## Usage

Now you can run the dashboard with this command:

    bundle exec smashing start

Point your browser to http://<rpi-ip>:3030 to see the dashboard.
