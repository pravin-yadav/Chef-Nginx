# Chef-Nginx

Chef repository to install nginx package on client/server.

# Overview

Every Chef Infra installation needs a Chef Repository. This is the place where cookbooks, policyfiles, config files and other artifacts for managing systems with Chef Infra will live. We strongly recommend storing this repository in a version control system such as Git and treating it like source code.

## prerequisite

Download and install ChefDK

## Installation

To install chef work station, you can run:

##### UNIX, Linux, and macOS
On UNIX, Linux, and macOS systems, invoke the Chef Software Install script with:

curl -L https://omnitruck.chef.io/install.sh | sudo bash

##### Microsoft Windows
On Microsoft Windows systems, invoke the Chef Software Install script using Windows PowerShell:

. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install

## Usage

In the project directory, you can run:
    `sudo chef-client --local-mode chef-nginx/cookbooks/nginx/recipes/default.rb`

To verify the installation, you can run:
    `nginx -v`

# Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

# Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/knife.html

# Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.
