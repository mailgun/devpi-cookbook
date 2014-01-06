#
# Cookbook Name:: devpi
# LWRP:: user
#
# Copyright 2013-2014, Dave Shawley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#

actions :create
default_action :create

attribute :name, :name_attribute => true, :kind_of => String, :required => true
